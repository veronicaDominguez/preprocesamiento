% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Vuelve visible la curva especificada en la ventana             --
% -- Verifica si la curva existe antes de ponerla visible           --
% --------------------------------------------------------------------
function PFDisplPlot(hObject,handl)
% hObject    puntero al propio objeto
% handl      posición del puntero de la curva
global HCURVAS;
global IDEBUG;
if IDEBUG; disp('GFDisplPlot...'); end;
ncurvas=length(HCURVAS);
if ncurvas > handl
    if ishandle(HCURVAS(handl))
        if HCURVAS(handl) > 0
            if get(hObject,'value')
                set(HCURVAS(handl),'visible','on');
            else
                set(HCURVAS(handl),'visible','off');
            end
        end
    end
end
if IDEBUG; disp('...GFDisplPlot'); end;
end