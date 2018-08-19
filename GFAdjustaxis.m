% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- verifica los limites de la ventana y el total de puntos        --
% -- si la curva esta completa en la ventana elimina la barra de    --
% -- desplazamineto, si hay menos que 30 puntos, los resalta con    --
% -- un cuadrado                                                    --
% --------------------------------------------------------------------
function GFAdjustaxis(handles,ACCION,LTIME)
% handles    estructura con punteros a datos de la GUI
% ACCION     numero de funcionalidad que se está ejecutando
% LTIME      array que contiene el tiempo de la muestra como texto
global GCV;
global HCURVAS;
global VCFG;
global IDEBUG;
if IDEBUG; disp('GFAdjustaxis...'); end;
% verifica si hay curvas que procesar
if HCURVAS(1)+HCURVAS(2)+HCURVAS(3) > 0
    MON=HCURVAS(50);
    redraw=0;
    % verifica si visualización es completa
    if HCURVAS(16)==HCURVAS(18) && HCURVAS(17)==HCURVAS(19)
        set(handles.SLH1,'Visible','off')
    else
        set(handles.SLH1,'Visible','on');
        ltot=HCURVAS(17) - HCURVAS(16);
        lpar=HCURVAS(19) - HCURVAS(18);
        slda=(lpar/ltot)*2;
        if slda < 0.01; slda=0.01; end;
        set(handles.SLH1,'SliderStep',[1.0 slda]);
        sldp=HCURVAS(18)/HCURVAS(17);
        sdlpm=1-lpar/ltot;
        if sdlpm > 0; sldpr=(sldp/sdlpm)*100; end;
        if (sldpr>100); sldpr=100; end;
        if (sldpr<0); sldpr=0; end;
        set(handles.SLH1,'Value',sldpr);
    end
    % verifica si hay que destacar los puntos
    if (HCURVAS(19)-HCURVAS(18)) >= 30
        disp('dentro del if');
        if MON==1; disp('dentro del if mon 1'); redraw=1; MON=0; marca='none'; end;
    else
        if MON==0; redraw=1; MON=1; marca='s'; end;
    end
    disp('valor de redraw'); disp(redraw);
    HCURVAS(50)=MON;
    set(handles.HORAIAX31,'String',LTIME(HCURVAS(18)) );
    set(handles.HORAFAX31,'String',LTIME(HCURVAS(19)) );
    switch ACCION
        case 4 % Ajustar Curva A,B,C en ventana 1
            %if HCURVAS(1) && HCURVAS(6) ==1            
            if HCURVAS(1)|| HCURVAS(2)|| HCURVAS(3) || HCURVAS(71) && HCURVAS(10) ==1
                set(handles.AX35,'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
                set(handles.AX35,'YLim',[HCURVAS(20) HCURVAS(21)]); % limites del eje Y
                if redraw==1
                    for w=1:6
                        if HCURVAS(GCV(w,1))
                            disp('tratando de dibujar curvas');
                            set(HCURVAS(GCV(w,2)),'Marker',marca);
                        end
                    end
                end
            end
        otherwise
            % Ajustar Curva A en ventana 1
            if HCURVAS(1) && HCURVAS(6)==1
                set(HCURVAS(11),'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
                set(HCURVAS(11),'YLim',[HCURVAS(20) HCURVAS(21)]); % limites del eje Y
                if redraw==1; set(HCURVAS(22),'Marker',marca); end;
                ylabel(HCURVAS(11),'PSA');
            end
            % Ajustar Curva B en ventana 2
            if HCURVAS(2) && HCURVAS(7)==1
                if redraw==1; set(HCURVAS(32),'Marker',marca); end;
                set(HCURVAS(12),'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
                set(HCURVAS(12),'YLim',[HCURVAS(30) HCURVAS(31)]); % limites del eje Y
                ylabel(HCURVAS(12),'VFSCI');
            end
            % Ajustar Curva C en ventana 3
            nc3=str2double(VCFG(13));
            %if nc3 && HCURVAS(8)==1
            if HCURVAS(3) && HCURVAS(8)==1
                if redraw==1; set(HCURVAS(42),'Marker',marca); end;
                set(HCURVAS(13),'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
                set(HCURVAS(13),'YLim',[HCURVAS(40) HCURVAS(41)]); % limites del eje Y
                switch nc3
                    case 3
                        ylabel(HCURVAS(13),'VFSCD');
%                     case 4
%                         ylabel(HCURVAS(13),'CO2');
                    case 5
                        ylabel(HCURVAS(13),'ECG');
                    case 6
                        ylabel(HCURVAS(13),'ADIC');
                end
            end
            % Ajustar Curva D en ventana 4 CO2
%             disp('antes de la curva CO2, HCURVAS 71'); disp(HCURVAS(71));
%             disp('antes de la curva CO2, HCURVAS 71'); disp(HCURVAS(9));
            if HCURVAS(71) && HCURVAS(9)==1
%                 disp('entrando a la curva CO2');
                set(HCURVAS(14),'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
                set(HCURVAS(14),'YLim',[HCURVAS(74) HCURVAS(75)]); % limites del eje Y
                if redraw==1; set(HCURVAS(92),'Marker',marca); end;
                ylabel(HCURVAS(14),'CO2');
            end
    end
end
if IDEBUG; disp('...GFAdjustaxis'); end;
end