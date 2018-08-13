function TFCompara1(handles)
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  disp('TFCompara1...');
  GFView(handles,0);
  GFClean();
  [FileName Path]=uigetfile({'*.FIL;*.fil'}, 'Archivo a Examinar',DIR_TRAB);
  if (FileName ~=0)
      ACCION=6;
      [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS , PCURVAS , LTIME, HEADLIN , ACCION , handles , FileName , Path);
      if HAYCUR
          GFEnmenu(0);
          GFAdjustaxis(handles,ACCION,LTIME);
          GFVeraxis(handles,0);
      else
          warndlg('No existen datos para la curva','Mensaje de Archivo');
          GFinicia(handles,2);
      end
  end
  disp('...TFCompara1');
end