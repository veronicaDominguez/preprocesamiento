% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Graba archivo de texto con los datos de la curva               --
% --------------------------------------------------------------------
function OK=GFWFile(nfile,ACCION,MOD)
% nfile      nombre de archivo a grabar con los datos de las curvas
% ACCION     numero de funcionalidad que se está ejecutando
% MOD        modo de archivar datos
%
% OK         estado del archivo grabado 1=bien; 0=falla.
global HEADLIN;
global PCURVAS;
global LTIME;
global HCURVAS;
global GCV;
global IDEBUG;
if IDEBUG; disp('GFWFile...'); end;
  OK=0;
  [fiw,messagew] = fopen(char(nfile), 'w');
  if fiw ~=-1
      nline=0;
      hbar = waitbar(0,'Por Favor Espere...');
      while nline < 6     % composicion de la cabecera
          nline=nline+1;
          switch (nline)
              case 1
                tline=strcat('Patient Name:',HEADLIN(1,1));
              case 2
                tline=strcat('birthday:',HEADLIN(2,1));
              case 3
                  switch ACCION
                      case 4
                          dd=char(HEADLIN(3,1));
                          [fe b]=strtok(dd,' ');
                          ti=char(LTIME(HCURVAS(62)));
                          tif=ti(1:8);
                          xst=sprintf('%s %s',fe,tif);
                          tline=strcat('Examination:',cellstr(xst));
                      otherwise
                          tline=strcat('Examination:',HEADLIN(3,1));
                  end
              case 4
                tline=strcat('Sampling Rate:',HEADLIN(4,1));
              case 5
                tline=sprintf('%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s','Time','Sample','VFSCI','VFSCD','PSA','CO2','ECG','ADIC');
              case 6
                tline=sprintf('%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s','HH:mm:ss:ms','N','cm/s','cm/s','mmHg','mmHg','ecg','unid');
          end
          fprintf(fiw,'%s\r\n',char(tline));
      end
      nm=0;
      switch ACCION
          case 4  % archivo cortado
              totlin=HCURVAS(63)-HCURVAS(62)+6;
              for k=HCURVAS(62):HCURVAS(63)
                  lbar=(nm+6)/totlin;
                  if lbar>1 ;lbar=1; end
                  waitbar(lbar);
                  fprintf(fiw,'%s\t%lu\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\r\n',char(LTIME(k)),nm,PCURVAS(GCV(2,11),k),PCURVAS(GCV(3,11),k),PCURVAS(GCV(1,11),k),PCURVAS(GCV(4,11),k),PCURVAS(GCV(5,11),k),PCURVAS(GCV(6,11),k));
                  nm=nm+1;
              end
          otherwise      % guardar archivos con filtro aplicado u original dependiendo del modo MOD
              switch MOD
                  case 1   % archivo filtrado
                      nc1=GCV(1,13);
                      nc2=GCV(2,13);
                      nc3=GCV(3,13);
                      % para los archivos de abajo aún no hay filtro bien
                      % definido se guarda curva original
                      nc4=GCV(4,11);
                      nc5=GCV(5,11);
                      nc6=GCV(6,11);
                  case 2   % archivo original temporal
                      nc1=GCV(1,11);
                      nc2=GCV(2,11);
                      nc3=GCV(3,11);
                      nc4=GCV(4,11);
                      nc5=GCV(5,11);
                      nc6=GCV(6,11);
                  case 3   % archivo  UPS
                      nc1=GCV(1,11);
                      nc2=GCV(2,11);
                      nc3=GCV(3,11);
                      nc4=GCV(4,11);
                      nc5=GCV(5,11);
                      nc6=GCV(6,11);
                      if HCURVAS(GCV(1,1))
                          idp=zeros(1,length(PCURVAS(nc1,:)));
                      else
                          if HCURVAS(GCV(2,1))
                              idp=zeros(1,length(PCURVAS(nc2,:)));
                          end
                      end
                      lshift=1;
                      for j=1:3
                          if HCURVAS(GCV(j,1))
                              totlin=PCURVAS(GCV(j,15),1)+1;
                              for k=2:totlin
                                  idp(PCURVAS(GCV(j,18),k))=idp(PCURVAS(GCV(j,18),k)) + 1*lshift;  % minimo
                                  idp(PCURVAS(GCV(j,16),k))=idp(PCURVAS(GCV(j,16),k)) + 2*lshift;  % maximo
                                  idp(PCURVAS(GCV(j,21),k))=idp(PCURVAS(GCV(j,21),k)) + 3*lshift;  % upstroke
                              end
                          end
                          lshift=lshift*4;
                      end

              end
              totlin=HCURVAS(17)-HCURVAS(16)+6;
              for k=HCURVAS(16):HCURVAS(17)
                  lbar=(nm+6)/totlin;
                  if lbar>1 ;lbar=1; end
                  waitbar(lbar);
                  if HCURVAS(GCV(1,1)); xpsi=PCURVAS(nc1,k);  else xpsi=0.0;  end;
                  if HCURVAS(GCV(2,1)); xvfci=PCURVAS(nc2,k); else xvfci=0.0; end;
                  if HCURVAS(GCV(3,1)); xvfcd=PCURVAS(nc3,k); else xvfcd=0.0; end;
                  if HCURVAS(GCV(4,1)); co2=PCURVAS(nc4,k);   else co2=0.0;   end;
                  if HCURVAS(GCV(5,1)); ecg=PCURVAS(nc5,k);   else ecg=0.0;   end;
                  if HCURVAS(GCV(6,1)); adic=PCURVAS(nc6,k);  else adic=0.0;  end;
                  switch MOD
                      case 3
                          fprintf(fiw,'%s\t%lu\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%d\r\n',char(LTIME(k)),nm,xvfci,xvfcd,xpsi,co2,ecg,adic,idp(k));
                      otherwise
                          fprintf(fiw,'%s\t%lu\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\r\n',char(LTIME(k)),nm,xvfci,xvfcd,xpsi,co2,ecg,adic);
                  end
                  nm=nm+1;
              end
      end
      close(hbar);
      fclose(fiw);
      msgbox('Archivo se guardó exitosamente','Guardar Archivo');
      OK=1;
  else
      warndlg(strcat('Error de apertura ',messagew),'Guardar Archivo');
  end
if IDEBUG; disp('...GFWFile'); end;
end