function TOLoadPAR(handles)
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  global HCURVA2;
  global PCURVA2;
  disp('TOLoadPAR...');
  GFView(handles,0);
  GFClean();
  [FileNames Path]=uigetfile({'*.UPS;*.ups'}, 'Archivo Generar PAR Automático','MultiSelect','on',DIR_TRAB);
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
          ACCION=7;
          [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS , PCURVAS , LTIME, HEADLIN , ACCION , handles , FileName , Path);
          if HAYCUR
              GFAdjustaxis(handles,ACCION,LTIME);
              CFSetejes(handles,HCURVAS,LTIME,1);
              GFVeraxis(handles,0);

              PCURVA2=zeros(30,length(PCURVAS(1,:)));
              HCURVA2=zeros(30);
              
              set(handles.CP_CBVMED ,'Value',1);
              CPRemuestreo(1,1);
              GFWlog('Process.log',strcat('Inicio Calculo PCC :',FileName));
              set(handles.CP_CBPCC1RAP1 ,'Value',1);
              CPRemuestreo(1,4);
              GFWlog('Process.log',strcat('Fin Calculo PCC :',FileName));
              set(handles.CP_CBREMUES ,'Value',1);
              CPRemuestreo(1,2);
              
              
              if ACCION == 7.3
                  tFileName=FileName(1:length(FileName)-3);
                  wfile=strcat(Path,tFileName,'PAR');
                  CPCrearPAR(wfile,ACCION,3);
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
  disp('...TOLoadPAR');
end