function TOLoadFil(handles)
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  disp('TOLoadFil...');
  GFView(handles,0);
  GFClean();
  [FileNames Path]=uigetfile({'*.EXP;*.exp;*.CUT;*.cut*.TMP;*.tmp'}, 'Archivo a Filtrar Automático','MultiSelect','on',DIR_TRAB);
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
          ACCION=1;
          [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS , PCURVAS , LTIME, HEADLIN , ACCION , handles , FileName , Path);
          if HAYCUR
              GFAdjustaxis(handles,ACCION,LTIME);
              GFVeraxis(handles,0);
              for i=1:3
                  if HCURVAS(i)
                      switch i
                          case 1
                              set(handles.CBSPL31,'Value',1);
                              GFFiltro(3,handles,i);
                              set(handles.CBMED31,'Value',1);
                              GFFiltro(1,handles,i);
                              set(handles.CBBUT31,'Value',1);
                              GFFiltro(2,handles,i);
                          case 2
                              set(handles.CBSPL32,'Value',1);
                              GFFiltro(3,handles,i);
                              set(handles.CBMED32,'Value',1);
                              GFFiltro(1,handles,i);
                              set(handles.CBBUT32,'Value',1);
                              GFFiltro(2,handles,i);
                          case 3
                              set(handles.CBSPL33,'Value',1);
                              GFFiltro(3,handles,i);
                              set(handles.CBMED33,'Value',1);
                              GFFiltro(1,handles,i);
                              set(handles.CBBUT33,'Value',1);
                              GFFiltro(2,handles,i);
                      end
                  end
              end
              tFileName=FileName(1:length(FileName)-3);
              wfile=strcat(Path,tFileName,'FIL');
              GFWFile(wfile,ACCION,1);
          else
              warndlg('No existen datos para la curva','Mensaje de Archivo');
              GFinicia(handles,2);
          end
          GFView(handles,0);
          GFClean();
      end
      GFEnmenu(2);
  end
  disp('...TOLoadFil');
end