% *****                FILTRAR CURVAS                            *****
% --------------------------------------------------------------------
% -- Crea Archivo filtadro, con extensión .FIL                      --
% -- Valida si existen curvas a guardar y valida si los filtros     --
% -- fueron aplicados                                               --
% -- Despliega una caja de dialogo pidiendo el nombre del archivo   --
% --------------------------------------------------------------------
function PFSavearch(handles)
% handles    estructura con punteros a datos de la GUI
global ACCION;
global HEADLIN;
global HCURVAS;
global DIR_TRAB;
global IDEBUG;
if IDEBUG; disp('PFSavearch...'); end;
ok_save=1;
  if HCURVAS(1)+HCURVAS(2)+HCURVAS(3) < 1
      errordlg('No hay datos para guardar','Guardar Archivo Filtrado');
      ok_save=0;
  end
  if HCURVAS(1) && ok_save
      if get(handles.CBBUT31,'value')==0
          errordlg('PSA sin Filtro Butter','Guardar Archivo Filtrado');
          ok_save=0;
      end
  end
  if HCURVAS(2) && ok_save
      if get(handles.CBBUT32,'value')==0
          errordlg('VFSCI sin Filtro Butter','Guardar Archivo Filtrado');
          ok_save=0;
      end
  end
  if HCURVAS(3) && ok_save
      if get(handles.CBBUT33,'value')==0
          errordlg('VFSCD sin Filtro Butter','Guardar Archivo Filtrado');
          ok_save=0;
      end
  end
  if HCURVAS(4) && ok_save
      if get(handles.CBBUT34,'value')==0
          errordlg('CO2 sin Filtro Butter','Guardar Archivo Filtrado');
          ok_save=0;
      end
  end
  if ok_save      % condiciones para guardar archivo se cumple
      TFileName=char(HEADLIN(21,1));
      lnf=length(TFileName);
      FileName=strcat(DIR_TRAB,'\',TFileName(1:lnf-3),'FIL');
      [FileName Path]=uiputfile({'*.FIL;*.fil'}, 'Archivo a Guardar',FileName);
      if (FileName ~=0)
          wfile=strcat(Path,FileName);
          GFWFile(wfile,ACCION,1);
      end
  end
if IDEBUG; disp('...PFSavearch'); end;
end