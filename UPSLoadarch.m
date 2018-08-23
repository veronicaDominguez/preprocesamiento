function UPSLoadarch(handles)
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  disp('UPSLoadarch...');
  GFView(handles,5);
  GFClean();
  [FileName Path]=uigetfile({'*.FIL;*.fil'}, 'Archivo a Procesar',DIR_TRAB);
  if (FileName ~=0)
      ACCION=5;
      [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS , PCURVAS , LTIME, HEADLIN , ACCION , handles , FileName , Path);
      if HAYCUR
          GFEnmenu(4);
          GFAdjustaxis(handles,ACCION,LTIME);
          GFVeraxis(handles,0);
      else
          warndlg('No existen datos para la curva','Mensaje de Archivo');
          GFinicia(handles,2);
      end
  end
  disp('...UPSLoadarch');
end