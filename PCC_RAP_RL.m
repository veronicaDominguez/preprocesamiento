function [PCC_RL rapRL] = PCC_RAP_RL(Upstroke_PosicionP,Upstroke_PosicionF,Minimo_PosicionP,Minimo_PosicionF,Maximo_PosicionP,Maximo_PosicionF,MeanP,MeanF,PSA,VFSC,freco)
disp('PCC_RAP_RL...');
    n = length(Upstroke_PosicionP)-1;       %cantidad de latidos
    negativosRL  = 0;        %indica la cantidad de negativos de la regresión lineal
    PCC_RL=zeros(1,n);
    rapRL=zeros(1,n);
    
    warning off all
    
    for i=1:n
        latidoP =  PSA(Upstroke_PosicionP(i):Upstroke_PosicionP(i+1)-1);
        latidoF = VFSC(Upstroke_PosicionF(i):Upstroke_PosicionF(i+1)-1);
                
        MLlatido=max(length(latidoP),length(latidoF));
        t = freco:freco:MLlatido*freco;
        
%-------------------------------------------------------------------------%
        % % % % % % % % % % % % % % % % % % % % % % %
        % % % Regresión Latidos % % %
        % % % % % % % % % % % % % % % % % % % % % % %
        %------------------------------------------------------------------------
%------------------------------------------------------------------------
%------------------------------------------------------------------------
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% ***************Calculo del RAP mediante la primera armónica************
        N = length(latidoP);
        % Regresión bajada de PSA
        lineal = polyfit(latidoP,latidoF,1);
        aL = lineal(1);
        bL = lineal(2);
         % PCC para la RL
        PCC_RL(i) = -(bL/aL);

        if PCC_RL(i) < 0
            negativosRL = negativosRL+1;
        end

        % ------------------------------
        meanLatidoP=MeanP(i);
        meanLatidoF=MeanF(i);

        RAP_RL = (meanLatidoP-PCC_RL)/meanLatidoF;

        rapRL(i)=RAP_RL;
    end
    
    [PCC_RL PCC_RL_sinOutlayer negativosRL nOutlayersRL posOutlayersRL] = sacaOutlyers(PCC_RL,negativosRL);
    
    warning on all
    disp('...PCC_RAP_RL');
end
