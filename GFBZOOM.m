% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Ejecuta la lectura del teclado y procesa la combinacion de     --
% -- teclas convirtiendola en un codigo para modificar la           --
% -- apariencia o posición de la curva en la ventana,               --
% -- acercarla o alejarla, avanzar o retrocedar                     --
% --------------------------------------------------------------------
function GFBZOOM(hObject, eventdata, handles)
% hObject    puntero al propio objeto
% eventdata  reservado
% handles    estructura con punteros a datos de la GUI
global LTIME;
global ACCION;
global IDEBUG;
if IDEBUG; disp('GFBZOOM...'); end;
mode = 0;
if strcmp(eventdata.Modifier,'control')
  switch eventdata.Character
    case 29
         mode = 5; % avanzar 50%
    case 28
         mode = 6; % retroceder 50%
  end  
else
  switch eventdata.Character
    case 30
        mode = 1; % acercar
    case 31
        mode = 2; % alejar
    case 29
        mode = 3; % avanzar 10%
    case 28
        mode = 4; % retroceder 10%
  end
end

if mode > 0
    GFZoomw(mode);
    GFAdjustaxis(handles,ACCION,LTIME);
end
if IDEBUG; disp('...GFBZOOM'); end;

% --------------------------------------------------------------------
% -- Ejecuta la accion pedida de la curva sobre la ventana          --
% --------------------------------------------------------------------
function GFZoomw(mode)
% handles    estructura con punteros a datos de la GUI
% mode = 1 ACERCAR
%      = 2 ALEJAR
%      = 3 AVANZAR 10% DE LA VENTANA
%      = 4 RETROCEDER 10% DE LA VENTANA
%      = 5 AVANZAR 50% DE LA VENTANA
%      = 6 RETROCEDER 50% DE LA VENTANA
%      = 7 IR AL COMIENZO
%      = 8 IR AL FINAL
global HCURVAS;
switch mode
    case 1
        if (HCURVAS(18)+1<HCURVAS(19))
            dif=round((HCURVAS(19)-HCURVAS(18))/2);
            HCURVAS(18)=round(HCURVAS(18)+dif/2);
            HCURVAS(19)=HCURVAS(18)+dif;
            if HCURVAS(18)>=HCURVAS(19); HCURVAS(19)=HCURVAS(18)+1; end;
        end
    case 2
        dif=round((HCURVAS(19)-HCURVAS(18)));
        HCURVAS(18)=round(HCURVAS(18)-dif/2);
        if HCURVAS(18)<HCURVAS(16); HCURVAS(18)=HCURVAS(16); end;
        HCURVAS(19)=round(HCURVAS(19)+dif/2);
        if HCURVAS(19)>HCURVAS(17); HCURVAS(19)=HCURVAS(17); end;        
    case 3
        dif=HCURVAS(19)-HCURVAS(18);
        paso=round(dif/10);
        HCURVAS(19)=HCURVAS(19)+paso;
        if HCURVAS(19)>HCURVAS(17); HCURVAS(19)=HCURVAS(17); end;
        HCURVAS(18)=HCURVAS(19)-dif;
        if HCURVAS(18)<HCURVAS(16); HCURVAS(18)=HCURVAS(16); end;
    case 4
        dif=HCURVAS(19)-HCURVAS(18);
        paso=round(dif/10);
        HCURVAS(18)=HCURVAS(18)-paso;
        if HCURVAS(18)<HCURVAS(16); HCURVAS(18)=HCURVAS(16); end;
        HCURVAS(19)=HCURVAS(18)+dif;
        if HCURVAS(19)>HCURVAS(17); HCURVAS(19)=HCURVAS(17); end;
    case 5
        dif=HCURVAS(19)-HCURVAS(18);
        paso=round(dif/2);
        HCURVAS(19)=HCURVAS(19)+paso;
        if HCURVAS(19)>HCURVAS(17); HCURVAS(19)=HCURVAS(17); end;
        HCURVAS(18)=HCURVAS(19)-dif;
        if HCURVAS(18)<HCURVAS(16); HCURVAS(18)=HCURVAS(16); end;
    case 6
        dif=HCURVAS(19)-HCURVAS(18);
        paso=round(dif/2);
        HCURVAS(18)=HCURVAS(18)-paso;
        if HCURVAS(18)<HCURVAS(16); HCURVAS(18)=HCURVAS(16); end;
        HCURVAS(19)=HCURVAS(18)+dif;
        if HCURVAS(19)>HCURVAS(17); HCURVAS(19)=HCURVAS(17); end;
    case 7
        dif=HCURVAS(19)-HCURVAS(18);
        HCURVAS(18)=HCURVAS(16);
        HCURVAS(19)=HCURVAS(18)+dif;
        if HCURVAS(19)>HCURVAS(17); HCURVAS(19)=HCURVAS(17); end;
    case 8
        dif=HCURVAS(19)-HCURVAS(18);
        HCURVAS(19)=HCURVAS(17);
        HCURVAS(18)=HCURVAS(19)-dif;
        if HCURVAS(18)<HCURVAS(16); HCURVAS(18)=HCURVAS(16); end;
end