function [PCC_RL PCC_RL_sinOutlayers negativosRL nOutlayers posOutlyers] = sacaOutlyers(PCC_RL,negativosRL)

%calcular los límites en que debe estar la PCC
DE2 = 2*std(PCC_RL);
media = mean(PCC_RL);
limInf = media-DE2;
limSup = media+DE2;

%obtiene un vector con las posiciones de los outlayers
posOutlyers_inf = find(PCC_RL<=limInf);
posOutlyers_sup = find(PCC_RL>=limSup);
posOutlyers = [posOutlyers_inf,posOutlyers_sup];
posOutlyers = sort(posOutlyers);

nOutlayers = length(posOutlyers);
i = 1;
outLinicio = 1;
valoresIniciales = 0;
while i <= nOutlayers
    if posOutlyers(i) == i && outLinicio %en caso de que haya outlayers al inicio, los cuenta
        outLinicio = 1;
        valoresIniciales = valoresIniciales+1;
    else
        outLinicio = 0;
    end
    if outLinicio == 0
        if valoresIniciales == 0 % en caso de que no hayan outlyers al inicio
            if PCC_RL(posOutlyers(i)) < 0
                negativosRL = negativosRL-1;
            end
            PCC_RL(posOutlyers(i)) = PCC_RL(posOutlyers(i)-1);
        else %en caso de que se encontraran outlyers al inicio, se reemplazan por el primer valor dentro del rango
            j = 1;
            while j <= valoresIniciales
                if PCC_RL(j) < 0
                    negativosRL = negativosRL-1;
                end
                PCC_RL(j) = PCC_RL(i);
                j = j+1;
            end
        end
    end
    i = i+1;
end

i = nOutlayers;
n = 1;
PCC_RL_sinOutlayers = PCC_RL;
while i >= n 
    pos = posOutlyers(i);
    mitad1 = PCC_RL_sinOutlayers(1:pos-1);
    mitad2 = PCC_RL_sinOutlayers((pos+1):end);
    PCC_RL_sinOutlayers = [mitad1 mitad2];
    i = i-1;
end