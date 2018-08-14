% *****                FILTRAR CURVAS                            *****
% --------------------------------------------------------------------
% -- Crea Archivo Temporal, con extensión .TMP                      --
% -- Se guarda archivo original con modificaiones manuales          --
% -- Valida si existen curvas a guardar                             --
% -- Despliega una caja de dialogo pidiendo el nombre del archivo   --
% --------------------------------------------------------------------
function PFSavearchTMP()
  global ACCION;
  global HEADLIN;
  global HCURVAS;
  global DIR_TRAB;
  global IDEBUG;
  if IDEBUG; disp('PFSavearchTMP...'); end;
  ok_save=1;
  if HCURVAS(1)+HCURVAS(2)+HCURVAS(3) < 1
      errordlg('No hay datos para guardar','Guardar Archivo Temporal');
      ok_save=0;
  end
  if ok_save     % condiciones para guardar archivo se cumple
      TFileName=char(HEADLIN(21,1));
      lnf=length(TFileName);
      FileName=strcat(DIR_TRAB,'\',TFileName(1:lnf-3),'TMP');
      [FileName Path]=uiputfile({'*.TMP;*.tmp'}, 'Archivo a Guardar',FileName);
      if (FileName ~=0)
          wfile=strcat(Path,FileName);
          GFWFile(wfile,ACCION,2);
      end
  end
  if IDEBUG; disp('...PFSavearchTMP'); end;
end