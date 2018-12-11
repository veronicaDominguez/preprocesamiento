function CPRemuestreo(modo,NPOS)
  global GCV;
  global HCURVA2;
  global PCURVA2;
  global HCURVAS;
  global PCURVAS;
  global MHANDLE;
  global ACCION;
  global NMETODO;
  global IDEBUG;
  if IDEBUG; disp('CPRemuestreo...'); end;
  if modo
      switch NPOS
          case 1
              if IDEBUG; disp('Valores medios...'); end;
              NMETODO=0;
              j=1;
              %valores medios para CO2
              if HCURVAS(GCV(j,1))
                  L=PCURVAS(GCV(j,15),1)+1;
                  [p3 v3]=CPMediaXL(PCURVAS(51,:),PCURVAS(GCV(j,21),2:L));  % posicion de latidos solo con respecto a PSA
                  n=length(PCURVA2(4,:));
                  n2=length(p3);
                  PCURVA2(GCV(4,40),:)=[n2 p3 PCURVA2(4,1:(n-n2-1))];  % posiciones  de valores medios GCV(4,40)=4
                  PCURVA2(GCV(4,41),:)=[n2 v3 PCURVA2(10,1:(n-n2-1))];  % valores medios GCV(4,41)=10

                  hold(HCURVAS(14),'on');
                  HCURVA2(4)=plot(HCURVAS(14),PCURVA2(4,2:PCURVA2(4,1)+1),PCURVA2(10,2:PCURVA2(10,1)+1),'ko','visible','on');
                  hold(HCURVAS(14),'off');
                  %disp(v3);
              end
              
              %valores medios para PSA VFSCI VFSCD
              for j=1:3
                  if HCURVAS(GCV(j,1))
                      l=PCURVAS(GCV(j,15),1)+1;
                      [p3 v3]=CPMediaXL(PCURVAS(GCV(j,11),:),PCURVAS(GCV(j,21),2:l));  % posicion de latidos solo con respecto a PSA
                      n=length(PCURVA2(GCV(j,40),:));
                      n2=length(p3);
                      PCURVA2(GCV(j,40),:)=[n2 p3 PCURVA2(GCV(j,40),1:(n-n2-1))];  % posiciones  de valores medios
                      PCURVA2(GCV(j,41),:)=[n2 v3 PCURVA2(GCV(j,41),1:(n-n2-1))];  % valores medios
              
                      hold(HCURVAS(10+j),'on');
                      HCURVA2(GCV(j,40))=plot(HCURVAS(10+j),PCURVA2(GCV(j,40),2:PCURVA2(GCV(j,40),1)+1),PCURVA2(GCV(j,41),2:PCURVA2(GCV(j,41),1)+1),'ko','visible','on');
                      hold(HCURVAS(10+j),'off');
                  end
              end
              
              set(MHANDLE.CP_CBREMUES ,'Value',0);
              set(MHANDLE.CP_CBPCC1RAP1 ,'Value',0);
              for j=1:5
                  GFBorra_Hand(GCV(j,41),2);
              end
              for j=1:3
                  GFBorra_Hand(GCV(j,42),2);
              end
              ACCION=7.1;
              if IDEBUG; disp('...Valores medios'); end;
          case 2
              if ACCION==7.2
                  if IDEBUG; disp('Remuestreo...'); end;
                  frec=ReadFmues();
                  nfrec=1/frec;
                  lrfrec=str2double(get(MHANDLE.CP_EDVREMUES,'String'));
                  rfrec=1/lrfrec;
                  for j=1:4
                      if HCURVAS(GCV(j,1))
                          [p1 v1]=Remuestreo(rfrec,nfrec,PCURVA2(GCV(j,40),2:(PCURVA2(GCV(j,40),1)+1)),PCURVA2(GCV(j,41),2:(PCURVA2(GCV(j,41),1)+1)),PCURVAS(GCV(j,11),:),PCURVAS(GCV(j,21),2:PCURVAS(GCV(j,21),1)+1));
                          
                          n=length(PCURVA2(GCV(j,42),:));
                          n2=length(p1);
                          PCURVA2(GCV(j,42),:)=[n2 p1 PCURVA2(GCV(j,42),1:(n-n2-1))];  % posiciones  de valores medios remuestreados
                          PCURVA2(GCV(j,43),:)=[n2 v1 PCURVA2(GCV(j,43),1:(n-n2-1))];  % valores medios remuestreados
                          if j==1
                              [p1 v1]=Remuestreo(rfrec,nfrec,PCURVA2(GCV(1,40),2:(PCURVA2(GCV(1,40),1)+1)),PCURVA2(GCV(1,44),2:(PCURVA2(GCV(1,44),1)+1)),PCURVAS(GCV(1,11),:),PCURVAS(GCV(1,21),2:PCURVAS(GCV(1,21),1)+1));
                              n=length(PCURVA2(GCV(2,44),:));
                              n2=length(p1);
                              PCURVA2(GCV(2,44),:)=[n2 v1 PCURVA2(GCV(2,44),1:(n-n2-1))];  % valores PCC remuestreados
                          
                              [p1 v1]=Remuestreo(rfrec,nfrec,PCURVA2(GCV(1,40),2:(PCURVA2(GCV(1,40),1)+1)),PCURVA2(GCV(1,45),2:(PCURVA2(GCV(1,45),1)+1)),PCURVAS(GCV(1,11),:),PCURVAS(GCV(1,21),2:PCURVAS(GCV(1,21),1)+1));
                              n=length(PCURVA2(GCV(2,45),:));
                              n2=length(p1);
                              PCURVA2(GCV(2,45),:)=[n2 v1 PCURVA2(GCV(2,45),1:(n-n2-1))];  % valores PCC remuestreados
                          end
                      
                          hold(HCURVAS(10+j),'on');
                          HCURVA2(GCV(j,41))=plot(HCURVAS(10+j),PCURVA2(GCV(j,42),2:PCURVA2(GCV(j,42),1)+1),PCURVA2(GCV(j,43),2:PCURVA2(GCV(j,43),1)+1),'ro-','visible','on');
                          if j==1
                              HCURVA2(GCV(4,41))=plot(HCURVAS(10+j),PCURVA2(GCV(1,42),2:PCURVA2(GCV(1,42),1)+1),PCURVA2(GCV(2,44),2:PCURVA2(GCV(2,44),1)+1),'ro','visible','on');
                              HCURVA2(GCV(5,41))=plot(HCURVAS(10+j),PCURVA2(GCV(1,42),2:PCURVA2(GCV(1,42),1)+1),PCURVA2(GCV(2,45),2:PCURVA2(GCV(2,45),1)+1),'ro','visible','on');
                          end
                          hold(HCURVAS(10+j),'off');
                      end
                  end
                  ACCION=7.3;
                  if IDEBUG; disp('...Remuestreo'); end
              else
                  errordlg('No se han Calculado PCC ó RAP','Remuestreo');
                  set(MHANDLE.CP_CBREMUES ,'Value',0);
              end
          case 3
              if IDEBUG; disp('Metodo PCC y RAP...'); end;
              if ACCION==7.1
                  CPDEligeCalc()
                  set(MHANDLE.CP_CBPCC1RAP1 ,'Value',0);
              else
                  errordlg('No se han Calculado Valores Medios','Calculo PCC y RAP');
                  set(MHANDLE.CP_CBPCC1RAP1 ,'Value',0);
              end;
              if IDEBUG; disp('...Metodo PCC y RAP'); end;
          case 4
              if ACCION==7.1
                  CPDclaudio(8);
              end
      end
  else
      switch NPOS
          case 1
              for j=1:3
                  GFBorra_Hand(GCV(j,40),2);
              end
              for j=1:3
                  GFBorra_Hand(GCV(j,42),2);
              end

              for j=1:5
                  GFBorra_Hand(GCV(j,41),2);
              end
              
              set(MHANDLE.CP_CBREMUES ,'Value',0);
              set(MHANDLE.CP_CBPCC1RAP1 ,'Value',0);
              ACCION=7;
          case 2
              for j=1:5
                  GFBorra_Hand(GCV(j,41),2);
              end
              ACCION=7.2;
          case 3
              for j=1:3
                  GFBorra_Hand(GCV(j,42),2);
              end
              for j=1:5
                  GFBorra_Hand(GCV(j,41),2);
              end
             
              set(MHANDLE.CP_CBREMUES ,'Value',0);
              ACCION=7.1;
      end
  end
  if IDEBUG; disp('...CPRemuestreo'); end;
end

function CPDclaudio(nmet)
global PCURVAS;
global HCURVAS;
global GCV;
global PCURVA2;
global HCURVA2;
global ACCION;
global MHANDLE;
global NMETODO;

    procok=0;
    PSA  =PCURVAS(GCV(1,11),:);
    VFSCI=PCURVAS(GCV(2,11),:);
    VFSCD=PCURVAS(GCV(3,11),:);
    
    l=PCURVAS(GCV(1,15),1)+1;
    Upstroke_PosicionP = PCURVAS(GCV(1,21),2:l);
    Upstroke_ValorP    = PCURVAS(GCV(1,20),2:l);
    Minimo_PosicionP   = PCURVAS(GCV(1,18),2:l);
    Minimo_ValorP      = PCURVAS(GCV(1,17),2:l);
    Maximo_PosicionP   = PCURVAS(GCV(1,16),2:l);
    Maximo_ValorP      = PCURVAS(GCV(1,15),2:l);
    
    l=PCURVAS(GCV(2,15),1)+1;
    Upstroke_PosicionFI = PCURVAS(GCV(2,21),2:l);
    Upstroke_ValorFI    = PCURVAS(GCV(2,20),2:l);
    Minimo_PosicionFI   = PCURVAS(GCV(2,18),2:l);
    Minimo_ValorFI      = PCURVAS(GCV(2,17),2:l);
    Maximo_PosicionFI   = PCURVAS(GCV(2,16),2:l);
    Maximo_ValorFI      = PCURVAS(GCV(2,15),2:l);
    
    MeanP=PCURVA2(GCV(1,41),2:PCURVA2(GCV(1,41),1)+1);
    MeanF=PCURVA2(GCV(2,41),2:PCURVA2(GCV(2,41),1)+1);
    
    freco=ReadFmues();
    switch nmet
        case 1
            [PCC RAP] = PCC_RAP_RL(Upstroke_PosicionP,Upstroke_PosicionFI,Minimo_PosicionP,Minimo_PosicionFI,Maximo_PosicionP,Maximo_PosicionFI,MeanP,MeanF,PSA,VFSCI,freco);
            NMETODO=1;
            procok=1;
        case 2
            NMETODO=2;
            procok=1;
        case 3
            NMETODO=3;
            procok=1;
        case 4
            NMETODO=4;
            procok=1;
        case 5
            [PCC RAP] = PCC_RAP_FH(Upstroke_PosicionP,Upstroke_PosicionFI,Minimo_PosicionP,Minimo_PosicionFI,Maximo_PosicionP,Maximo_PosicionFI,MeanP,MeanF,PSA,VFSCI,freco);
            NMETODO=5;
            procok=1;
        case 6
            NMETODO=6;
            procok=1;
        case 7
            NMETODO=7;
            procok=1;
        case 8
            [PCC RAP] = PCC_RAP_RLT(Upstroke_PosicionP,Upstroke_PosicionFI,Minimo_PosicionP,Minimo_PosicionFI,Maximo_PosicionP,Maximo_PosicionFI,MeanP,MeanF,PSA,VFSCI,freco);
            NMETODO=8;
            procok=1;               
    end
    
    if procok
        n=length(PCURVA2(GCV(1,44),:));
        n2=length(PCC);
        PCURVA2(GCV(1,44),:)=[n2 PCC PCURVA2(GCV(1,44),1:(n-n2-1))];
    
        n=length(PCURVA2(GCV(1,45),:));
        n2=length(RAP);
        PCURVA2(GCV(1,45),:)=[n2 RAP PCURVA2(GCV(1,45),1:(n-n2-1))];
    

        hold(HCURVAS(11),'on');
        HCURVA2(GCV(1,42))=plot(HCURVAS(11),PCURVA2(GCV(1,40),2:PCURVA2(GCV(1,40),1)+1),PCURVA2(GCV(1,44),2:PCURVA2(GCV(1,44),1)+1),'ko','visible','on');
        HCURVA2(GCV(2,42))=plot(HCURVAS(11),PCURVA2(GCV(1,40),2:PCURVA2(GCV(1,40),1)+1),PCURVA2(GCV(1,45),2:PCURVA2(GCV(1,45),1)+1),'ko','visible','on');
        hold(HCURVAS(11),'off');
        set(MHANDLE.CP_CBPCC1RAP1 ,'Value',1);
        ACCION=7.2;
    end
end

function [p1 v1]=CPMediaXL(Vcur,Pmin)
    n=length(Pmin)-1;
    v1=1:1:n;
    p1=1:1:n;
    for i=1:n
        v1(i)=mean(Vcur(Pmin(i):(Pmin(i+1)-1)));
        p1(i)=round(((Pmin(i+1)-Pmin(i))/2)+Pmin(i));
    end
end



function [nbufp nbufv]=Remuestreo(fr,fo,BUFP,BUFV,Cpos,Pups)
% fr = frecuencia de remuestro
% fo = frecuencia original
% BUFP = posición datos a remuestrear
% BUFV = valores datos a remuestrear
% Pmin = Margen de remuestreo

    npuntos=floor(fr/fo);
    nzeros=round(length(Cpos)/npuntos);
    pmues=zeros(1,nzeros);
    vmues=zeros(1,nzeros);
    
    n=length(BUFP)-2;
    for i=1:n
        ini =floor(BUFP(i)/npuntos)*npuntos;
        fini=floor(BUFP(i+2)/npuntos)*npuntos;
        if i==1
            ini=floor(Pups(i)/npuntos)*npuntos;
            gini=round(ini/npuntos);
        end
        if i==n
            fini=round(Pups(length(Pups))/npuntos)*npuntos;
            gfini=floor(fini/npuntos);
        end
        X=BUFP(i:i+2);
        Y=BUFV(i:i+2);
        xi=ini:npuntos:fini;
        if ini==0
            xi=xi(2:length(xi)-1);
            gini=round(xi(1)/npuntos);
        end
        yi=interp1(X,Y,xi,'spline');
        n2=length(yi);
        for j=1:n2
            % disp([i xi(j) npuntos]);
            jpos=round(xi(j)/npuntos);
            pmues(jpos)=xi(j);
            vmues(jpos)=yi(j);
        end
        clear xi;
        clear yi;
    end
    nbufp=pmues(gini:gfini);
    nbufv=vmues(gini:gfini);
end

function frec=ReadFmues()
global MHANDLE;
    frect=get(MHANDLE.GF_EDTMUES,'String');
    cfrect=char(frect);
    l=length(cfrect);
    frec=0;
    for i=1:l
        num=str2double(cfrect(i));
        if ~isnan(num)
            frec=frec*10+num;
        end
    end
end

function CPDEligeCalc()
  global HCONV2;
    HCONV2(1) = figure('Visible','on','Name','Seleccionar Metodo de Estimación de PCC y RAP','Position',[50,350,700,335],'Color',[0.925 0.914 0.847],'NumberTitle','off','MenuBar','none');
    set(HCONV2(1),'WindowStyle','normal');
    set(HCONV2(1),'Resize','off');
    set(HCONV2(1),'CloseRequestFcn',@CPDEli1_POP0_Cl);
    
    HCONV2(10) = uicontrol(HCONV2(1),'Style','Text','Units','pixels','String','Métodos de Estimación de PCC y RAP','Position',[10 300 400 18],'HorizontalAlignment','left');
    HCONV2(11) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(LR) Regresión Lineal','Position',[10 270 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB01);
    HCONV2(12) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(PCA) Analisis de Componentes Principales','Position',[10 250 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB02);
    HCONV2(13) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(LRd) Regresión Lineal solo de valores diastolicos','Position',[10 230 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB03);
    HCONV2(14) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(PCAd) Analisis de Componentes Principales solo de valores diastolicos','Position',[10 210 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB04);
    HCONV2(15) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(H1) Primera Armónica','Position',[10 190 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB05);
    HCONV2(16) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(2Ps) Estimación segundo punto con valores sistolicos/diastolicos','Position',[10 170 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB06);
    HCONV2(17) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(2Pm) Estimación segundo punto con valores medios/diastolicos','Position',[10 150 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB07);
    HCONV2(18) = uicontrol(HCONV2(1),'Style','Checkbox','Units','pixels','String','(LRt) Regresión Lineal en el Tiempo','Position',[10 130 400 18],'BackgroundColor',[0.925 0.914 0.847],'Callback',@CPDEli1CB08);
    
    HCONV2(30) = uicontrol(HCONV2(1),'Style','PushButton','Units','Pixels','String','Aceptar','Position',[30  10 80 20],'Callback',@CPDEli1_POP0_B1);
    HCONV2(31) = uicontrol(HCONV2(1),'Style','PushButton','Units','Pixels','String','Cancelar','Position',[130 10 80 20],'Callback',@CPDEli1_POP0_Cl);
    
    set(0,'CurrentFigure',HCONV2(1))
    set(HCONV2(1),'Visible','on');
    GFEnmenu(0);
end

% funcion que se llama al cerrar ventana popup de manejo de curvas 1
function CPDEli1_POP0_Cl(hObject, eventdata, handles)
  global HCONV2;
    disp('PDEli1_POP0_Cl...');
    delete(HCONV2(1));
    clear('HCONV2');
    GFEnmenu(5);
    disp('...PDEli1_POP0_Cl');
end

function CPDEli1CB01(hObject, eventdata, handles)
  CPDEli00(11);
end

function CPDEli1CB02(hObject, eventdata, handles)
  CPDEli00(12);
end

function CPDEli1CB03(hObject, eventdata, handles)
  CPDEli00(13);
end

function CPDEli1CB04(hObject, eventdata, handles)
  CPDEli00(14);
end

function CPDEli1CB05(hObject, eventdata, handles)
  CPDEli00(15);
end

function CPDEli1CB06(hObject, eventdata, handles)
  CPDEli00(16);
end

function CPDEli1CB07(hObject, eventdata, handles)
  CPDEli00(17);
end

function CPDEli1CB08(hObject, eventdata, handles)
  CPDEli00(18);
end

function CPDEli00(pos)
  global HCONV2;
  for i=11:18
      set(HCONV2(i),'Value',0);
  end
  set(HCONV2(pos),'Value',1);
end

function CPDEli1_POP0_B1(hObject, eventdata, handles)
  global HCONV2;
  nmet=0;
  for i=11:18
      if (get(HCONV2(i),'Value'))
          nmet=i-10;
      end
  end
  CPDEli1_POP0_Cl();
  if nmet > 0
      CPDclaudio(nmet);
  end
end