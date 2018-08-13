function UPSCStroke(handles)
global PCURVAS;
global HCURVAS;
global ACCION;
global GCV;
global VCFG;
puntosok=false;
disp('UPSCStroke...');
l1=PCURVAS(GCV(1,15),1);
l2=PCURVAS(GCV(2,15),1);
l3=PCURVAS(GCV(3,15),1);
if HCURVAS(GCV(1,1))
    if HCURVAS(GCV(2,1))
        if HCURVAS(GCV(3,1))
            puntosok=(l1==l2) && (l2==l3);
        else
            puntosok=(l1==l2);
        end
    else
        if HCURVAS(GCV(3,1))
            puntosok=(l1==l3);
        else
            puntosok=true;
        end
    end
else
    if HCURVAS(GCV(2,1))
        if HCURVAS(GCV(3,1))
            puntosok=(l2==l3);
        else
            puntosok=true;
        end
    else
        if HCURVAS(GCV(3,1))
            puntosok=true;
        end
    end
end
if puntosok && ACCION >= 5.1
    ACCION=5.2;
    for j=1:3
        ncu=str2double(char(VCFG(j+10)));  % numero de curva en la ventana especificada
        if HCURVAS(GCV(j,1)) % datos en la curva
            l=PCURVAS(GCV(j,15),1)+1;
            PCURVAS(GCV(j,20),1)=l;
            PCURVAS(GCV(j,21),1)=l;
            for k=2:l
                Tpuntos=PCURVAS(GCV(j,11),PCURVAS(GCV(j,18),k):PCURVAS(GCV(j,16),k));
                dTpuntos = diff(Tpuntos);
                Pinflex=1;
                Vinflex=dTpuntos(Pinflex);
                for m=1:length(dTpuntos)
                    if dTpuntos(m) > Vinflex
                        Vinflex=dTpuntos(m);
                        Pinflex=m;
                    end
                end
                
                PCURVAS(GCV(j,20),k)=(Tpuntos(Pinflex)-Tpuntos(1))*0.9 + Tpuntos(1);

                for i=PCURVAS(GCV(j,18),k):PCURVAS(GCV(j,16),k)
                    if PCURVAS(GCV(j,20),k)>=PCURVAS(GCV(j,11),i)
                        PCURVAS(GCV(j,21),k)=i;
                    end
                end
                if PCURVAS(GCV(j,21),k) > 0
                    PCURVAS(GCV(j,20),k)=PCURVAS(GCV(j,11), PCURVAS(GCV(j,21),k));
                else
                    errordlg('No se pudo encontrar UpStroke','Calculo UpStroke');
                    ACCION=5.1;
                end
            end
            GFBorra_Hand(GCV(j,3),1);
            hold(HCURVAS(10+j),'on');
            HCURVAS(GCV(j,3))=plot(HCURVAS(10+j),PCURVAS(GCV(j,21),2:l),PCURVAS(GCV(j,20),2:l),'ko','visible','on');
            hold(HCURVAS(10+j),'off');
        end
    end
else
    errordlg('Cantidad de Minimos y Maximos diferentes en curvas','Calculo UpStroke');
end
disp('...UPSCStroke');
end