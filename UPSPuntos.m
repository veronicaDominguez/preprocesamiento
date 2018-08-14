function UPSPuntos(nven,modo,handles)
% modo = 1 : Mover Punto Maximo y Minimo
% modo = 4 : Marcar Punto Maximo y Minimo
% modo = 5 : Aceptar Punto
global HCURVAS;
global PCURVAS;
global VCFG;
global GCV;
global ACCION;
nc=str2double(char(VCFG(nven+10)));  % numero de curva en la ventana especificada
hnv=nven+10;
disp('punto...');
if ACCION ~= 5.1
    modo=0;
end
switch modo
    case 1  % mover punto
        GFBorra_Hand(GCV(nc,6),1); 
        GFBorra_Hand(GCV(nc,7),1);
        l=PCURVAS(GCV(nc,15),1);
        PCURVAS(GCV(nc,15),l+5)=0;
        [x,y] = ginput(1);  % Elegir y marcar el punto a mover
        if y>=HCURVAS(20) && y<=HCURVAS(21) && x>=HCURVAS(18) && x<=HCURVAS(19)
            xpos=floor(x);
            xval=floor(y);
            i=1;
            errmxg=HCURVAS(19)-HCURVAS(18);
            errmng=errmxg;
            iposmx=0;
            iposmn=0;

            while i <= l
                errmx=abs(PCURVAS(GCV(nc,16),i+1)-xpos);
                errmn=abs(PCURVAS(GCV(nc,18),i+1)-xpos);
                if errmx < errmxg
                    iposmx=i;
                    errmxg=errmx;
                end
                if errmn < errmng
                    iposmn=i;
                    errmng=errmn;
                end
                i=i+1;
            end
            errmx=abs(PCURVAS(GCV(nc,15),iposmx+1)-xval);
            errmn=abs(PCURVAS(GCV(nc,17),iposmn+1)-xval);
            if errmx < errmn
                PCURVAS(GCV(nc,15),l+10)=PCURVAS(GCV(nc,15),iposmx+1);  % valor max
                PCURVAS(GCV(nc,15),l+11)=PCURVAS(GCV(nc,17),iposmx+1);  % valor min
                PCURVAS(GCV(nc,15),l+12)=PCURVAS(GCV(nc,16),iposmx+1);  % posicion max
                PCURVAS(GCV(nc,15),l+13)=PCURVAS(GCV(nc,18),iposmx+1);  % posicion min
                PCURVAS(GCV(nc,15),l+14)=PCURVAS(GCV(nc,15),iposmx+1);  % valor
                PCURVAS(GCV(nc,15),l+15)=PCURVAS(GCV(nc,17),iposmx+1);  % valor
                PCURVAS(GCV(nc,15),l+16)=PCURVAS(GCV(nc,16),iposmx+1);  % posicion
                PCURVAS(GCV(nc,15),l+17)=PCURVAS(GCV(nc,18),iposmx+1);  % posicion
                PCURVAS(GCV(nc,15),l+18)=iposmx+1;
                PCURVAS(GCV(nc,15),l+20)=1;                     % maximo select
            else
                PCURVAS(GCV(nc,15),l+10)=PCURVAS(GCV(nc,17),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+11)=PCURVAS(GCV(nc,15),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+12)=PCURVAS(GCV(nc,18),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+13)=PCURVAS(GCV(nc,16),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+14)=PCURVAS(GCV(nc,17),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+15)=PCURVAS(GCV(nc,15),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+16)=PCURVAS(GCV(nc,18),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+17)=PCURVAS(GCV(nc,16),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+18)=iposmn+1;
                PCURVAS(GCV(nc,15),l+20)=0;                     % minimo select
            end
            hold(HCURVAS(hnv),'on');
            HCURVAS(GCV(nc,6))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+12),PCURVAS(GCV(nc,15),l+10),'ks','MarkerEdgeColor','k','MarkerFaceColor','r','visible','on');
            HCURVAS(GCV(nc,7))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+13),PCURVAS(GCV(nc,15),l+11),'ks','MarkerEdgeColor','k','MarkerFaceColor','w','visible','on');
            hold(HCURVAS(hnv),'off');
            
            borra_handle=false;
            [x,y] = ginput(1);  % marcar el lugar de destino del punto
            if y>=HCURVAS(20) && y<=HCURVAS(21) && x>=HCURVAS(18) && x<=HCURVAS(19)
                xpos=floor(x);
                xval=floor(y);
                [mnv mnp mxv mxp]=UPSGmaxmin(PCURVAS(GCV(nc,11),:),PCURVAS(1,:));
                i=1;
                errmxg=HCURVAS(19)-HCURVAS(18);
                errmng=errmxg;
                iposmx=0;
                iposmn=0;
            
                l=min(length(mxp),length(mnp));
                while i <= l
                    errmx=abs(mxp(i)-xpos);
                    errmn=abs(mnp(i)-xpos);
                    if errmx < errmxg
                        iposmx=i;
                        errmxg=errmx;
                    end
                    if errmn < errmng
                        iposmn=i;
                        errmng=errmn;
                    end
                    i=i+1;
                end
                errmx=abs(mxv(iposmx)-xval);
                errmn=abs(mnv(iposmn)-xval);
                l=PCURVAS(GCV(nc,15),1);
                if PCURVAS(GCV(nc,15),l+20)
                    if errmx < errmn
                        if (PCURVAS(GCV(nc,16),PCURVAS(GCV(nc,15),l+18)-1) < mxp(iposmx)) && (PCURVAS(GCV(nc,16),PCURVAS(GCV(nc,15),l+18)+1) > mxp(iposmx))
                            GFBorra_Hand(GCV(nc,6),1);
                            PCURVAS(GCV(nc,15),l+12)=mxp(iposmx);
                            PCURVAS(GCV(nc,15),l+10)=mxv(iposmx);
                            hold(HCURVAS(hnv),'on');
                            HCURVAS(GCV(nc,6))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+12),PCURVAS(GCV(nc,15),l+10),'ks','MarkerEdgeColor','k','MarkerFaceColor','r','visible','on');
                            hold(HCURVAS(hnv),'off');
                        
                            PCURVAS(GCV(nc,15),l+5)=1;
                        
                            if PCURVAS(GCV(nc,15),l+12) < PCURVAS(GCV(nc,15),l+13)
                                PCURVAS(GCV(nc,15),l+13)=mnp(iposmx-1);
                                PCURVAS(GCV(nc,15),l+11)=mnv(iposmx-1);
                                GFBorra_Hand(GCV(nc,7),1);
                                hold(HCURVAS(hnv),'on');
                                HCURVAS(GCV(nc,7))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+13),PCURVAS(GCV(nc,15),l+11),'ks','MarkerEdgeColor','k','MarkerFaceColor','w','visible','on');
                                hold(HCURVAS(hnv),'off');
                            end
                        else
                            errordlg('Punto elegido fuera de Rango','Mover Punto Máximo');
                            borra_handle=true;
                        end
                    else
                        errordlg('Punto elegido no es Máximo','Mover Punto Máximo');
                        borra_handle=true;
                    end
                else
                    if errmn < errmx
                        if (PCURVAS(GCV(nc,18),PCURVAS(GCV(nc,15),l+18)-1) < mnp(iposmn)) && (PCURVAS(GCV(nc,18),PCURVAS(GCV(nc,15),l+18)+1) > mnp(iposmn))
                            GFBorra_Hand(GCV(nc,6),1);
                            PCURVAS(GCV(nc,15),l+12)=mnp(iposmn);
                            PCURVAS(GCV(nc,15),l+10)=mnv(iposmn);
                            hold(HCURVAS(hnv),'on');
                            HCURVAS(GCV(nc,6))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+12),PCURVAS(GCV(nc,15),l+10),'ks','MarkerEdgeColor','k','MarkerFaceColor','r','visible','on');
                            hold(HCURVAS(hnv),'off');
                            
                            PCURVAS(GCV(nc,15),l+5)=1;

                            if PCURVAS(GCV(nc,15),l+12) > PCURVAS(GCV(nc,15),l+13)
                                PCURVAS(GCV(nc,15),l+13)=mxp(iposmn+1);
                                PCURVAS(GCV(nc,15),l+11)=mxv(iposmn+1);
                                GFBorra_Hand(GCV(nc,7),1);
                                hold(HCURVAS(hnv),'on');
                                HCURVAS(GCV(nc,7))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+13),PCURVAS(GCV(nc,15),l+11),'ks','MarkerEdgeColor','k','MarkerFaceColor','w','visible','on');
                                hold(HCURVAS(hnv),'off');
                            end

                        else
                            errordlg('Punto elegido fuera de Rango','Mover Punto Mínimo');
                            borra_handle=true;
                        end
                    else
                        errordlg('Punto elegido no es Mínimo','Mover Punto Mínimo');
                        borra_handle=true;
                    end
                end
                if PCURVAS(GCV(nc,15),l+5)
                    PCURVAS(GCV(nc,15),l+5)=0;
                    res=questdlg('¿Esta seguro de Mover el Punto?','Mover Punto','SI','NO','SI');
                    GFBorra_Hand(GCV(nc,6),1); 
                    GFBorra_Hand(GCV(nc,7),1);

                    if strcmp(res,'SI')
                        l=PCURVAS(GCV(nc,15),1);
                        lf=l+1;
                        if PCURVAS(GCV(nc,15),l+20)
                            pos=PCURVAS(GCV(nc,15),l+18);
                            PCURVAS(GCV(nc,15),pos)=PCURVAS(GCV(nc,15),l+10);
                            PCURVAS(GCV(nc,16),pos)=PCURVAS(GCV(nc,15),l+12);
                            PCURVAS(GCV(nc,17),pos)=PCURVAS(GCV(nc,15),l+11);
                            PCURVAS(GCV(nc,18),pos)=PCURVAS(GCV(nc,15),l+13);
                        else
                            pos=PCURVAS(GCV(nc,15),l+18);
                            PCURVAS(GCV(nc,15),pos)=PCURVAS(GCV(nc,15),l+11);
                            PCURVAS(GCV(nc,16),pos)=PCURVAS(GCV(nc,15),l+13);
                            PCURVAS(GCV(nc,17),pos)=PCURVAS(GCV(nc,15),l+10);
                            PCURVAS(GCV(nc,18),pos)=PCURVAS(GCV(nc,15),l+12);
                        end
                        GFBorra_Hand(GCV(nc,4),1);
                        GFBorra_Hand(GCV(nc,5),1);
                        hold(HCURVAS(hnv),'on');
                        HCURVAS(GCV(nc,4))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,16),2:lf),PCURVAS(GCV(nc,15),2:lf),'ws','visible','on');
                        HCURVAS(GCV(nc,5))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,18),2:lf),PCURVAS(GCV(nc,17),2:lf),'rs','visible','on');
                        hold(HCURVAS(hnv),'off');
                    end
                    
                end
            end
            if borra_handle
                GFBorra_Hand(GCV(nc,6),1);
                GFBorra_Hand(GCV(nc,7),1);
            end
        else
            errordlg('Punto elegido no esta en la ventana','Mover Punto');
        end
    case 2  % Insertar punto
        GFBorra_Hand(GCV(nc,6),1); 
        GFBorra_Hand(GCV(nc,7),1);
        l=PCURVAS(GCV(nc,15),1);
        PCURVAS(GCV(nc,15),l+5)=0;
        [x,y] = ginput(1);  % Elegir lugar a insertar el punto
        if y>=HCURVAS(20) && y<=HCURVAS(21) && x>=HCURVAS(18) && x<=HCURVAS(19)
            xpos=floor(x);
            xval=floor(y);
            [mnv mnp mxv mxp]=UPSGmaxmin(PCURVAS(GCV(nc,11),:),PCURVAS(1,:));
            i=1;
            errmxg=HCURVAS(19)-HCURVAS(18);
            errmng=errmxg;
            iposmx=0;
            iposmn=0;
            l=min(length(mxp),length(mnp));
            while i <= l
                    errmx=abs(mxp(i)-xpos);
                    errmn=abs(mnp(i)-xpos);
                    if errmx < errmxg
                        iposmx=i;
                        errmxg=errmx;
                    end
                    if errmn < errmng
                        iposmn=i;
                        errmng=errmn;
                    end
                    i=i+1;
            end
            errmx=abs(mxv(iposmx)-xval);
            errmn=abs(mnv(iposmn)-xval);
            l=PCURVAS(GCV(nc,15),1);
            if errmx < errmn
                iposmn=iposmx;
                if mxp(iposmx) < mnp(iposmn)
                    iposmn=iposmn-1;
                end
                PCURVAS(GCV(nc,15),l+20)=1;                     % maximo select
            else
                iposmx=iposmn;
                if mxp(iposmx) < mnp(iposmn)
                    iposmx=iposmx+1;
                end
                PCURVAS(GCV(nc,15),l+20)=0;                     % minimo select
            end
            PCURVAS(GCV(nc,15),l+10)=mxv(iposmx);  % valor max
            PCURVAS(GCV(nc,15),l+12)=mxp(iposmx);  % posicion max
            PCURVAS(GCV(nc,15),l+11)=mnv(iposmn);  % valor min
            PCURVAS(GCV(nc,15),l+13)=mnp(iposmn);  % posicion min
            PCURVAS(GCV(nc,15),l+18)=iposmx;
            PCURVAS(GCV(nc,15),l+19)=iposmn;
            pexiste=0;
            for i=2:l
                if PCURVAS(GCV(nc,15),l+12) == PCURVAS(GCV(nc,16),i+1)
                    pexiste=1;
                end
            end
            if pexiste
                errordlg('Punto elegido ya Existe','Insertar Punto');
            else
                hold(HCURVAS(hnv),'on');
                if PCURVAS(GCV(nc,15),l+20)
                    HCURVAS(GCV(nc,6))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+12),PCURVAS(GCV(nc,15),l+10),'ks','MarkerEdgeColor','k','MarkerFaceColor','r','visible','on');
                    HCURVAS(GCV(nc,7))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+13),PCURVAS(GCV(nc,15),l+11),'ks','MarkerEdgeColor','k','MarkerFaceColor','w','visible','on');
                else
                    HCURVAS(GCV(nc,6))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+12),PCURVAS(GCV(nc,15),l+10),'ks','MarkerEdgeColor','k','MarkerFaceColor','w','visible','on');
                    HCURVAS(GCV(nc,7))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+13),PCURVAS(GCV(nc,15),l+11),'ks','MarkerEdgeColor','k','MarkerFaceColor','r','visible','on');
                end
                hold(HCURVAS(hnv),'off');
                res=questdlg('¿Esta seguro de Insertar Punto?','Inserta Punto','SI','NO','SI');
                GFBorra_Hand(GCV(nc,6),1); 
                GFBorra_Hand(GCV(nc,7),1);
                pinser=0;
                if strcmp(res,'SI')
                    for i=1:l
                        if PCURVAS(GCV(nc,15),l+12) > PCURVAS(GCV(nc,16),i+1)
                            pinser=i+1;
                        end
                    end
                    if pinser > 0
                        n=length(PCURVAS(GCV(nc,11),:));
                        ol=PCURVAS(GCV(nc,15),1);
                        
                        v=[PCURVAS(GCV(nc,16),2:pinser) PCURVAS(GCV(nc,15),ol+12) PCURVAS(GCV(nc,16),pinser+1:ol+1)];
                        l=length(v);
                        PCURVAS(GCV(nc,16),:)=[l v zeros(1,n-(l+1))];
                        
                        v=[PCURVAS(GCV(nc,17),2:pinser) PCURVAS(GCV(nc,15),ol+11) PCURVAS(GCV(nc,17),pinser+1:ol+1)];
                        PCURVAS(GCV(nc,17),:)=[l v zeros(1,n-(l+1))];
                        
                        v=[PCURVAS(GCV(nc,18),2:pinser) PCURVAS(GCV(nc,15),ol+13) PCURVAS(GCV(nc,18),pinser+1:ol+1)];
                        PCURVAS(GCV(nc,18),:)=[l v zeros(1,n-(l+1))];
                        
                        v=[PCURVAS(GCV(nc,15),2:pinser) PCURVAS(GCV(nc,15),ol+10) PCURVAS(GCV(nc,15),pinser+1:ol+1)];
                        PCURVAS(GCV(nc,15),:)=[l v zeros(1,n-(l+1))];
                        
                        lfs=int2str(l);
                        GFBorra_Hand(GCV(nc,4),1);
                        GFBorra_Hand(GCV(nc,5),1);
                        switch nven
                            case 1
                                set(handles.TXADM31MA,'String',lfs);
                            case 2
                                set(handles.TXADM32MA,'String',lfs);
                            case 3
                                set(handles.TXADM33MA,'String',lfs);
                        end
                        lf=l+1;
                        hold(HCURVAS(hnv),'on');
                        HCURVAS(GCV(nc,4))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,16),2:lf),PCURVAS(GCV(nc,15),2:lf),'ws','visible','on');
                        HCURVAS(GCV(nc,5))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,18),2:lf),PCURVAS(GCV(nc,17),2:lf),'rs','visible','on');
                        hold(HCURVAS(hnv),'off');
                    end
                end
            end
        end
        
    case 4        
        disp('eliminar');
        GFBorra_Hand(GCV(nc,6),1); 
        GFBorra_Hand(GCV(nc,7),1);
        l=PCURVAS(GCV(nc,15),1);
        PCURVAS(GCV(nc,15),l+5)=0;
        [x,y] = ginput(1);  % Elegir y marcar el punto a mover
        if y>=HCURVAS(20) && y<=HCURVAS(21) && x>=HCURVAS(18) && x<=HCURVAS(19)
            xpos=floor(x);
            xval=floor(y);
            i=1;
            errmxg=HCURVAS(19)-HCURVAS(18);
            errmng=errmxg;
            iposmx=0;
            iposmn=0;

            while i <= l
                errmx=abs(PCURVAS(GCV(nc,16),i+1)-xpos);
                errmn=abs(PCURVAS(GCV(nc,18),i+1)-xpos);
                if errmx < errmxg
                    iposmx=i;
                    errmxg=errmx;
                end
                if errmn < errmng
                    iposmn=i;
                    errmng=errmn;
                end
                i=i+1;
            end
            errmx=abs(PCURVAS(GCV(nc,15),iposmx+1)-xval);
            errmn=abs(PCURVAS(GCV(nc,17),iposmn+1)-xval);
            if errmx < errmn
                PCURVAS(GCV(nc,15),l+10)=PCURVAS(GCV(nc,15),iposmx+1);  % valor max
                PCURVAS(GCV(nc,15),l+11)=PCURVAS(GCV(nc,17),iposmx+1);  % valor min
                PCURVAS(GCV(nc,15),l+12)=PCURVAS(GCV(nc,16),iposmx+1);  % posicion max
                PCURVAS(GCV(nc,15),l+13)=PCURVAS(GCV(nc,18),iposmx+1);  % posicion min
                PCURVAS(GCV(nc,15),l+14)=PCURVAS(GCV(nc,15),iposmx+1);  % valor
                PCURVAS(GCV(nc,15),l+15)=PCURVAS(GCV(nc,17),iposmx+1);  % valor
                PCURVAS(GCV(nc,15),l+16)=PCURVAS(GCV(nc,16),iposmx+1);  % posicion
                PCURVAS(GCV(nc,15),l+17)=PCURVAS(GCV(nc,18),iposmx+1);  % posicion
                PCURVAS(GCV(nc,15),l+18)=iposmx+1;
                PCURVAS(GCV(nc,15),l+20)=1;                     % maximo select
            else
                PCURVAS(GCV(nc,15),l+10)=PCURVAS(GCV(nc,17),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+11)=PCURVAS(GCV(nc,15),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+12)=PCURVAS(GCV(nc,18),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+13)=PCURVAS(GCV(nc,16),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+14)=PCURVAS(GCV(nc,17),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+15)=PCURVAS(GCV(nc,15),iposmn+1);  % valor
                PCURVAS(GCV(nc,15),l+16)=PCURVAS(GCV(nc,18),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+17)=PCURVAS(GCV(nc,16),iposmn+1);  % posicion
                PCURVAS(GCV(nc,15),l+18)=iposmn+1;
                PCURVAS(GCV(nc,15),l+20)=0;                     % minimo select
            end
            hold(HCURVAS(hnv),'on');
            HCURVAS(GCV(nc,6))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+12),PCURVAS(GCV(nc,15),l+10),'ks','MarkerEdgeColor','k','MarkerFaceColor','r','visible','on');
            HCURVAS(GCV(nc,7))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,15),l+13),PCURVAS(GCV(nc,15),l+11),'ks','MarkerEdgeColor','k','MarkerFaceColor','w','visible','on');
            hold(HCURVAS(hnv),'off');
            res=questdlg('¿Esta seguro de Borrar?','Borrar Punto','SI','NO','SI');
            GFBorra_Hand(GCV(nc,6),1); 
            GFBorra_Hand(GCV(nc,7),1);
            if strcmp(res,'SI')
                n=length(PCURVAS(GCV(nc,11),:));
                pos=PCURVAS(GCV(nc,15),l+18);
                ol=PCURVAS(GCV(nc,15),1);
                v=[PCURVAS(GCV(nc,15),2:pos-1) PCURVAS(GCV(nc,15),pos+1:ol+1)];
                l=length(v);
                lfs=int2str(l);
                PCURVAS(GCV(nc,15),:)=[l v zeros(1,n-(l+1))];
                PCURVAS(GCV(nc,15),l+5)=0; % no hay valores para aceptar
                    
                v=[PCURVAS(GCV(nc,16),2:pos-1) PCURVAS(GCV(nc,16),pos+1:ol+1)];
                PCURVAS(GCV(nc,16),:)=[l v zeros(1,n-(l+1))];
                    
                v=[PCURVAS(GCV(nc,17),2:pos-1) PCURVAS(GCV(nc,17),pos+1:ol+1)];
                PCURVAS(GCV(nc,17),:)=[l v zeros(1,n-(l+1))];
                    
                v=[PCURVAS(GCV(nc,18),2:pos-1) PCURVAS(GCV(nc,18),pos+1:ol+1)];
                PCURVAS(GCV(nc,18),:)=[l v zeros(1,n-(l+1))];
                
                GFBorra_Hand(GCV(nc,4),1);
                GFBorra_Hand(GCV(nc,5),1);
                switch nven
                    case 1
                        set(handles.TXADM31MA,'String',lfs);
                    case 2
                        set(handles.TXADM32MA,'String',lfs);
                    case 3
                        set(handles.TXADM33MA,'String',lfs);
                end
                lf=l+1;
                hold(HCURVAS(hnv),'on');
                HCURVAS(GCV(nc,4))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,16),2:lf),PCURVAS(GCV(nc,15),2:lf),'ws','visible','on');
                HCURVAS(GCV(nc,5))=plot(HCURVAS(hnv),PCURVAS(GCV(nc,18),2:lf),PCURVAS(GCV(nc,17),2:lf),'rs','visible','on');
                hold(HCURVAS(hnv),'off');
            end
        end
end
disp('...punto');
end