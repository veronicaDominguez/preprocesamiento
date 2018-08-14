function TOLoadUPS(handles)
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  disp('TOLoadUPS...');
  GFView(handles,0);
  GFClean();
  [FileNames Path]=uigetfile({'*.FIL;*.fil'}, 'Archivo a Calcular Upstroke Automático','MultiSelect','on',DIR_TRAB);
  nofiles=isequal(FileNames,0);
  if ~nofiles
      GFEnmenu(0);
      if iscellstr(FileNames)
          n=length(FileNames);
      else
          n=1;
          FileNames={FileNames};
      end;
      for q=1:n
          FileName=FileNames(q);
          FileName=char(FileName);
          ACCION=5;
          [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS , PCURVAS , LTIME, HEADLIN , ACCION , handles , FileName , Path);
          if HAYCUR
              GFAdjustaxis(handles,ACCION,LTIME);
              GFVeraxis(handles,0);
              UPSCalcula(handles);
              UPSCStroke(handles);
              if ACCION==5.2
                  tFileName=FileName(1:length(FileName)-3);
                  wfile=strcat(Path,tFileName,'UPS');
                  GFWFile(wfile,ACCION,3);
              else
                  GFWlog('Process.log',strcat('Problemas Procesando :',FileName));
              end
          else
              warndlg('No existen datos para la curva','Mensaje de Archivo');
              GFinicia(handles,2);
          end
          GFView(handles,0);
          GFClean();
      end
      GFEnmenu(2);
  end
  disp('...TOLoadUPS');
end