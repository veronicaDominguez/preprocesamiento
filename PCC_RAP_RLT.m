function [PCC_RLT rapRLT] = PCC_RAP_RLT(Upstroke_PosicionP,Upstroke_PosicionF,Minimo_PosicionP,Minimo_PosicionF,Maximo_PosicionP,Maximo_PosicionF,MeanP,MeanF,PSA,VFSC,freco)
disp('PCC_RAP_RLT...');
    n = length(Upstroke_PosicionP)-1;       %cantidad de latidos
    negativosRLT  = 0;        %indica la cantidad de negativos de la regresión lineal
    PCC_RLT=zeros(1,n);
    rapRLT=zeros(1,n);
    
    warning off all
    
    for i=1:n
        
        latidoP =  PSA(Upstroke_PosicionP(i):Upstroke_PosicionP(i+1)-1);
        latidoF = VFSC(Upstroke_PosicionF(i):Upstroke_PosicionF(i+1)-1);
        
        bajadaPt0 =  PSA(Maximo_PosicionP(i):Minimo_PosicionP(i+1)-1);
        bajadaFt0 = VFSC(Maximo_PosicionF(i):Minimo_PosicionF(i+1)-1);
            
        meanLatidoP=MeanP(i);
        meanLatidoF=MeanF(i);
            
        MLlatido=max(length(latidoP),length(latidoF));
        t = freco:freco:MLlatido*freco;
        
        Lbajada=length(bajadaFt0);
        dif1 = Maximo_PosicionF(i)-Upstroke_PosicionF(i)+1;
        tF=t(dif1:Lbajada+dif1-1);
        
        Lbajada=length(bajadaPt0);
        dif1 = Maximo_PosicionP(i)-Upstroke_PosicionP(i)+1;
        tP=t(dif1:Lbajada+dif1-1);
        
    
        %-------------------------------------------------------------------------%
        % % % % % % % % % % % % % % % % % % % % % % %
        % % % Regresión Latidos % % %
        % % % % % % % % % % % % % % % % % % % % % % %
        % -------------------------------------------------------------------------
       
        % Regresión bajada de VFSC
        linealBajadaF = polyfit(tF,bajadaFt0,1);
        aLF = linealBajadaF(1);
        bLF = linealBajadaF(2);
        
        % Regresión bajada de PSA
        linealBajadaP = polyfit(tP,bajadaPt0,1);
        aLP = linealBajadaP(1);
        bLP = linealBajadaP(2);
        
        % -------------------------------------------------------------------------
% -------------------------------------------------------------------------
        % -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        % --------
      
        xBFCero = -(bLF/aLF);
               
% ***************Calculo del RAP mediante la primera armónica**************
         % PCC para la RL
        PCC_RLT(i) = (aLP*xBFCero)+bLP;

        if PCC_RLT(i) < 0
            GFWlog('Process.log',strcat('Posicion UPStroke :',sprintf('%ld',Upstroke_PosicionP(i))));
            negativosRLT = negativosRLT+1;
        end

        %PCC RL - RAP de la regresión
        RAP_RLT = aLP/aLF;
        rapRLT(i)=RAP_RLT;
    end
    
    [PCC_RLT PCC_RLT_sinOutlayer negativosRLT nOutlayersRLT posOutlayersRLT] = sacaOutlyers(PCC_RLT,negativosRLT);
    
    warning on all
    disp('...PCC_RAP_RLT');
end
