function OK=CPCrearPAR(nfile,ACCION,MOD)
  global PCURVA2;
  global HCURVAS;
  global GCV;
  global MHANDLE;
  OK=0;

  [fiw,messagew] = fopen(char(nfile), 'w');
  if fiw ~=-1
      hbar = waitbar(0,'Por Favor Espere...');
      lrfrec=str2double(get(MHANDLE.CP_EDVREMUES,'String'));
      rfrec=1/lrfrec;
      frecw=0.0;
      cdesp=max(PCURVA2(GCV(1,42),2),PCURVA2(GCV(2,42),2));
      Pdes=0;
      while PCURVA2(GCV(1,42),2+Pdes) < cdesp
          Pdes=Pdes+1;
      end
      Fdes=0;
      while PCURVA2(GCV(2,42),2+Fdes) < cdesp
          Fdes=Fdes+1;
      end
      n=min(PCURVA2(GCV(1,42),1),PCURVA2(GCV(2,42),1));
      %fprintf(fiw,'%s\r\n','  TIEMPO VFSC   PAMn   PAMi   ETCO2  PCC     RAP   FC     PSn     PDn     IP    OTRA1   OTRA2 OTRA1 OTRA2  OTRA1   OTRA2  OTRA1  OTRA2 OTRA1');
      %            fprintf('12345671234567123456712345671234567123456712345671234567123456712345671234567123456712345671234567123456712345671234567123456712345671234567');
      fprintf(fiw,'%s\r\n',' TIEMPO   VFSC  VFSCd  VFSCi   PAMn   PAMi    PIC  ETCO2     FC   EEG1   EEG2    PCC    RAP     IP    PDn    PDi    PSn    PSi  OTRA1  OTRA2');
      for i=1:n
          if HCURVAS(GCV(2,1)) && HCURVAS(GCV(3,1))
              vfscm=0.0;
              vfsci=PCURVA2(GCV(2,43),i+1+Fdes);
              vfscd=PCURVA2(GCV(3,43),i+1+Fdes);
          else
              if HCURVAS(GCV(2,1))
                  vfscm=PCURVA2(GCV(2,43),i+1+Fdes);
                  vfsci=0.0;
                  vfscd=0.0;
              else
                  if HCURVAS(GCV(3,1))
                      vfscm=PCURVA2(GCV(3,43),i+1+Fdes);
                      vfsci=0.0;
                      vfscd=0.0;
                  else
                      vfscm=0.0;
                      vfsci=0.0;
                      vfscd=0.0;
                  end
              end
          end
          pamn  = PCURVA2(GCV(1,43),i+1+Pdes);
          pami  = 0.0;
          pic   = 0.0;
          etco2 = PCURVA2(GCV(4,43),i+1+Fdes);
          fc    = 0.0;
          eeg1  = 0.0;
          eeg2  = 0.0;
          ip    = 0.0;
          pdn   = 0.0;
          pdi   = 0.0;
          psn   = 0.0;
          psi   = 0.0;
          otra1 = 0.0;
          otra2 = 0.0;
          pcc=PCURVA2(GCV(2,44),i+1+Pdes);
          rap=PCURVA2(GCV(2,45),i+1+Pdes);
          lbar=i/n;
          if lbar>1 ;lbar=1; end
          waitbar(lbar);
          frecw=frecw+rfrec;
          fprintf(fiw,'%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f%7.2f\r\n',frecw,vfscm,vfscd,vfsci,pamn,pami,pic,etco2,fc,eeg1,eeg2,pcc,rap,ip,pdn,pdi,psn,psi,otra1,otra2);
      end
      close(hbar)
      fclose(fiw);
      msgbox('Archivo se guardó exitosamente','Guardar Archivo');
      OK=1;
  else
      warndlg(strcat('Error de apertura ',messagew),'Guardar Archivo');
  end
end