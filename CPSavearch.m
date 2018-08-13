% *****                PROCESAR CURVAS                           *****
% --------------------------------------------------------------------
% -- Crea Archivo de trabajo y salida final, con extensión .PAR     --
% -- Valida si se hicieron los procesos de calculo de los datos     --
% -- Despliega una caja de dialogo pidiendo el nombre del archivo   --
% -- donde el nombre inicial es acompañado por el metodo utilizado  --
% --------------------------------------------------------------------
function CPSavearch(handles)
% handles    estructura con punteros a datos de la GUI
global ACCION;
global HEADLIN;
global DIR_TRAB;
global NMETODO;
global IDEBUG;
if IDEBUG; disp('CPSavearch...'); end;
    if ACCION == 7.3
        TFileName=char(HEADLIN(21,1));
        lnf=length(TFileName);
        switch NMETODO
            case 1
                snmet='_(RL)';
            case 2
                snmet='_(PCA)';
            case 3
                snmet='_(RLd)';
            case 4
                snmet='_(PCAd)';
            case 5
                snmet='_(H1)';
            case 6
                snmet='_(2Ps)';
            case 7
                snmet='_(2Pm)';
            case 8
                snmet='_(LRt)';
        end
        FileName=strcat(DIR_TRAB,'\',TFileName(1:lnf-4),snmet,'.PAR');
        [FileName Path]=uiputfile({'*.PAR;*.par'}, 'Archivo a Guardar',FileName);
        if (FileName ~=0)
            wfile=strcat(Path,FileName);
            CPCrearPAR(wfile,ACCION,3);
            GFinicia(handles,2)
        end;
    else
        errordlg('Faltan condiciones para guardar archivo','Crear Archivo PAR');
    end
if IDEBUG; disp('...CPSavearch'); end;
end