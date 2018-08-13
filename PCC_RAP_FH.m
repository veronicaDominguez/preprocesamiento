function [PCC_FH rapH1] = PCC_RAP_FH(Upstroke_PosicionP,Upstroke_PosicionF,Minimo_PosicionP,Minimo_PosicionF,Maximo_PosicionP,Maximo_PosicionF,MeanP,MeanF,PSA,VFSC,freco)
disp('PCC_RAP_FH...');
    n = length(Upstroke_PosicionP)-1;       %cantidad de latidos
    negativosFH  = 0;        %indica la cantidad de negativos 
    PCC_FH=zeros(1,n);
    rapH1=zeros(1,n);
    
    warning off all
    
    for i=1:n
        
        latidoP =  PSA(Upstroke_PosicionP(i):Upstroke_PosicionP(i+1)-1);
        latidoF = VFSC(Upstroke_PosicionF(i):Upstroke_PosicionF(i+1)-1);
        
        meanLatidoP=MeanP(i);
        meanLatidoF=MeanF(i);
            
        MLlatido=max(length(latidoP),length(latidoF));
        t = freco:freco:MLlatido*freco;
        
%-------------------------------------------------------------------------%
% ***************Calculo del RAP mediante la primera armónica**************
        N = length(latidoP);
        f1 = fft(latidoP)/N;
        f2 = fft(latidoF)/N;
        ABP1 = abs(f1(2));
        CBFV1 = abs(f2(2));
        RAP_H1 = ABP1/CBFV1;
        rapH1(i)=RAP_H1;
        %PCC RL - RAP de la primera armónica
	PCC_H1=meanLatidoP - meanLatidoF*RAP_H1;
        PCC_FH(i)= PCC_H1;
% ------------------------------

        if PCC_FH(i) < 0
            negativosFH = negativosFH+1;
        end


    end
    
    [PCC_FH PCC_FH_sinOutlayer negativosFH nOutlayersFH posOutlayersFH] = sacaOutlyers(PCC_FH,negativosFH);

    
    warning on all
    disp('...PCC_RAP_FH');
end
