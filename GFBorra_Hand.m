% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Borra un puntero utilizado para guardar datos durante la       --
% -- ejecución de la aplicación, se comprueba si el puntero         --
% -- existe antes de eliminarlo                                     --
% --------------------------------------------------------------------
function borra=GFBorra_Hand(handl,modo)
% handl = posición del puntero a eliminar
% modo  = 1: puntero de HCURVAS
%         2: puntero de HCURVA2
%
% borra = true si se borró el manejador, false si no se puede.
global HCURVAS;
global HCURVA2;
global IDEBUG;
if IDEBUG; disp('GFBorra_Hand...'); end;
borra=false;
if modo==1
    ncurvas=length(HCURVAS);
    if ncurvas >= handl
        if ishandle(HCURVAS(handl))
            if HCURVAS(handl) > 0
                delete(HCURVAS(handl));
                borra=true;
            end
        end
    end
end

if modo==2
    ncurvas=length(HCURVA2);
    if ncurvas >= handl
        if ishandle(HCURVA2(handl))
            if HCURVA2(handl) > 0
                delete(HCURVA2(handl));
                borra=true;
            end
        end
    end
end
if IDEBUG; disp('...GFBorra_Hand'); end;