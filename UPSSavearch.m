function UPSSavearch(handles)
global ACCION;
global HEADLIN;
global DIR_TRAB;
    disp('UPSSavearch...');
    if ACCION == 5.2
        TFileName=char(HEADLIN(21,1));
        lnf=length(TFileName);
        FileName=strcat(DIR_TRAB,'\',TFileName(1:lnf-3),'UPS');
        [FileName Path]=uiputfile({'*.UPS;*.ups'}, 'Archivo a Guardar',FileName);
        if (FileName ~=0)
            wfile=strcat(Path,FileName);
            GFWFile(wfile,ACCION,3);
            GFinicia(handles,2)
        end;
    else
        errordlg('Faltan condiciones para guardar archivo','Guardar Max. Min. Ups.');
    end
    disp('...UPSSavearch');
end