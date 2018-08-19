% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Toma los datos leidos desde el archivo a inicializa  las       --
% -- Variables globales, generando los punteros a las diferentes    --
% -- curvas.  Inicializa condiciones para el de manejo de los datos --
% --------------------------------------------------------------------
function [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS,PCURVAS,LTIME,HEADLIN,ACCION,handles,FileName,Path)
% HCURVAS    array que contiene valores y punteros para el manejo de
%            ventanas y despliegues
% PCURVAS    array que contiene los datos de las curvas
% LTIME      array que contiene el tiempo de la muestra como texto
% HEADLIN    contiene datos de cabecera de archivo
% ACCION     numero de funcionalidad que se está ejecutando
% handles    estructura con punteros a datos de la GUI
% FileName   nombre de archivo a leer
% Path       camino del direcctorio de trabajo
global VCFG;
global GCV;
global IDEBUG;
if IDEBUG; disp('GFFillData...'); end;
% borra variables
  clear PCURVAS;
  clear LTIME;
  clear HEADLIN;
  switch ACCION  % lee archivo desde disco y llena variables
      case 6
          lnarch=length(FileName);
          FileName2=FileName;
          FileNameo1=strcat(FileName(1:lnarch-3),'EXP');
          FileNameo2=strcat(FileName(1:lnarch-3),'CUT');
          nfile=strcat(Path,FileNameo1);
          set(handles.GF_EDFNAME,'String',nfile); 
          [MUES LTIME VFSCI VFSCD PSA CO2 ECG ADIC HEADLIN FILEX]=GFLeefile5c(nfile,0,7);
          if ~FILEX
              nfile=strcat(Path,FileNameo2);
              set(handles.GF_EDFNAME,'String',nfile); 
              [MUES LTIME VFSCI VFSCD PSA CO2 ECG ADIC HEADLIN FILEX]=GFLeefile5c(nfile,0,7);
          end
      case 7
          nfile=strcat(Path,FileName);
          set(handles.GF_EDFNAME,'String',nfile); 
          [MUES LTIME VFSCI VFSCD PSA CO2 ECG ADIC HEADLIN FILEX MMUP]=GFLeefile5c(nfile,1,8);
      otherwise
          nfile=strcat(Path,FileName);
          set(handles.GF_EDFNAME,'String',nfile); 
          [MUES LTIME VFSCI VFSCD PSA CO2 ECG ADIC HEADLIN FILEX]=GFLeefile5c(nfile,1,7);
  end

  HEADLIN(21,1)=cellstr(FileName);
  HEADLIN(22,1)=cellstr(Path);
  
  set(handles.GF_EDSNAME,'String',HEADLIN(1,1));
  set(handles.GF_EDFMUES,'String',HEADLIN(3,1));
  set(handles.GF_EDTMUES,'String',HEADLIN(4,1));
  
  PCURVAS(1,:)=MUES;          % numero de la muestra
  PCURVAS(GCV(1,11),:)=PSA;   % Presión sangúinea arterial
  PCURVAS(GCV(2,11),:)=VFSCI; % velocidad flujo sanguineo cerebral izq.
  PCURVAS(GCV(3,11),:)=VFSCD; % velocidad flujo sanguineo cerebral derecho
  %PCURVAS(GCV(4,11),:)=CO2;   % CO2
  PCURVAS(51,:)=CO2;   % CO2
  PCURVAS(GCV(5,11),:)=ECG;   % Electrocardiograma
  PCURVAS(GCV(6,11),:)=ADIC;  % Adicional
  
  switch ACCION
      case 6
          if FILEX
              nfile2=strcat(Path,FileName2);
              [MUES2 LTIME2 VFSCI2 VFSCD2 PSA2 CO22 ECG2 ADIC2 HEADLIN2 FILEX]=GFLeefile5c(nfile2,1,7);
              %insidca los arrays con los valores de la variable con filtro butter              
              PCURVAS(GCV(1,13),:)=PSA2;    % Presión sangúinea arterial GCV(1,13)=10
              PCURVAS(GCV(2,13),:)=VFSCI2;  % velocidad flujo sanguineo cerebral izquierdo GCV(2,13)=11
              PCURVAS(GCV(3,13),:)=VFSCD2;  % velocidad flujo sanguineo cerebral derecho GCV(3,13)=12
              %PCURVAS(GCV(4,13),:)=CO22;   % CO2 GCV(4,13)=57, MALO porque debe ser 61
              PCURVAS(61,:)=CO22;           %CO2 
              PCURVAS(GCV(5,13),:)=ECG2;   % Electrocardiograma
              PCURVAS(GCV(6,13),:)=ADIC2;  % Adicional
          end
      case 7
          %PAra maximo minimo y upstroke
          ndatos=length(MMUP);
          for nco=1:3
              PCURVAS(GCV(nco,15),1)=0;
              PCURVAS(GCV(nco,16),1)=0;
              PCURVAS(GCV(nco,17),1)=0;
              PCURVAS(GCV(nco,18),1)=0;
              PCURVAS(GCV(nco,20),1)=0;
              PCURVAS(GCV(nco,21),1)=0;
          end
          for i=1:ndatos
              if MMUP(i) > 0
                  c3=floor(MMUP(i)/16);
                  c2=floor((MMUP(i)-c3*16)/4);
                  c1=floor(MMUP(i)-c3*16-c2*4);
                  switch c1
                      %valores y posiciciones de PSA
                      case 1
                          PCURVAS(GCV(1,17),1)=PCURVAS(GCV(1,17),1)+1;
                          PCURVAS(GCV(1,17),PCURVAS(GCV(1,17),1)+1)=PCURVAS(GCV(1,11),i);
                          PCURVAS(GCV(1,18),PCURVAS(GCV(1,17),1)+1)=i;
                      case 2
                          PCURVAS(GCV(1,15),1)=PCURVAS(GCV(1,15),1)+1;
                          PCURVAS(GCV(1,15),PCURVAS(GCV(1,15),1)+1)=PCURVAS(GCV(1,11),i);
                          PCURVAS(GCV(1,16),PCURVAS(GCV(1,15),1)+1)=i;
                      case 3
                          PCURVAS(GCV(1,20),1)=PCURVAS(GCV(1,20),1)+1;
                          PCURVAS(GCV(1,20),PCURVAS(GCV(1,20),1)+1)=PCURVAS(GCV(1,11),i);
                          PCURVAS(GCV(1,21),PCURVAS(GCV(1,20),1)+1)=i;
                  end
                  switch c2
                      %valores y posiciciones de VFSC I
                      case 1
                          PCURVAS(GCV(2,17),1)=PCURVAS(GCV(2,17),1)+1;
                          PCURVAS(GCV(2,17),PCURVAS(GCV(2,17),1)+1)=PCURVAS(GCV(2,11),i);
                          PCURVAS(GCV(2,18),PCURVAS(GCV(2,17),1)+1)=i;
                      case 2
                          PCURVAS(GCV(2,15),1)=PCURVAS(GCV(2,15),1)+1;
                          PCURVAS(GCV(2,15),PCURVAS(GCV(2,15),1)+1)=PCURVAS(GCV(2,11),i);
                          PCURVAS(GCV(2,16),PCURVAS(GCV(2,15),1)+1)=i;
                      case 3
                          PCURVAS(GCV(2,20),1)=PCURVAS(GCV(2,20),1)+1;
                          PCURVAS(GCV(2,20),PCURVAS(GCV(2,20),1)+1)=PCURVAS(GCV(2,11),i);
                          PCURVAS(GCV(2,21),PCURVAS(GCV(2,20),1)+1)=i;
                  end
                  switch c3
                      %valores y posiciciones de VFSC D
                      case 1
                          PCURVAS(GCV(3,17),1)=PCURVAS(GCV(3,17),1)+1;
                          PCURVAS(GCV(3,17),PCURVAS(GCV(3,17),1)+1)=PCURVAS(GCV(3,11),i);
                          PCURVAS(GCV(3,18),PCURVAS(GCV(3,17),1)+1)=i;
                      case 2
                          PCURVAS(GCV(3,15),1)=PCURVAS(GCV(3,15),1)+1;
                          PCURVAS(GCV(3,15),PCURVAS(GCV(3,15),1)+1)=PCURVAS(GCV(3,11),i);
                          PCURVAS(GCV(3,16),PCURVAS(GCV(3,15),1)+1)=i;
                      case 3
                          PCURVAS(GCV(3,20),1)=PCURVAS(GCV(3,20),1)+1;
                          PCURVAS(GCV(3,20),PCURVAS(GCV(3,20),1)+1)=PCURVAS(GCV(3,11),i);
                          PCURVAS(GCV(3,21),PCURVAS(GCV(3,20),1)+1)=i;
                  end
              end
          end
          for nco=1:3
              PCURVAS(GCV(nco,16),1)=PCURVAS(GCV(nco,15),1);
              PCURVAS(GCV(nco,18),1)=PCURVAS(GCV(nco,17),1);
              PCURVAS(GCV(nco,21),1)=PCURVAS(GCV(nco,20),1);
          end
  end
  
  %Extremos para el eje X
  [HCURVAS(16) HCURVAS(17) HCURVAS(18) HCURVAS(19)]=GFSetaxisini(MUES);
  HCURVAS(62)=HCURVAS(16);
  HCURVAS(63)=HCURVAS(17);
  
  %Revisa si se debe desplegar la curva
  if min(PSA)==0 && max(PSA)==0     % curva 1 tiene datos para 1=desplegar 0=sin datos
      HCURVAS(GCV(1,1))=0;
  else
      HCURVAS(GCV(1,1))=1;
  end
  if min(VFSCI)==0 && max(VFSCI)==0 % curva 2 tiene datos para 1=desplegar 0=sin datos
      HCURVAS(GCV(2,1))=0;
  else
      HCURVAS(GCV(2,1))=1;
  end
  if min(VFSCD)==0 && max(VFSCD)==0 % curva 3 tiene datos para 1=desplegar 0=sin datos
      HCURVAS(GCV(3,1))=0;
  else
      HCURVAS(GCV(3,1))=1;
  end
  %disp('GCV: '); disp(GCV(4,1));
  if min(CO2)==0 && max(CO2)==0     % curva 4 tiene datos para 1=desplegar 0=sin datos
      HCURVAS(71)=0;
      %HCURVAS(GCV(4,1))=0;
  else
      HCURVAS(71)=1;
      %HCURVAS(GCV(4,1))=1;
  end
  if min(ECG)==0 && max(ECG)==0     % curva 5 tiene datos para 1=desplegar 0=sin datos
      HCURVAS(GCV(5,1))=0;
  else
      HCURVAS(GCV(5,1))=1;
  end
  if min(ADIC)==0 && max(ADIC)==0   % curva 6 tiene datos para 1=desplegar 0=sin datos
      HCURVAS(GCV(6,1))=0;
  else
      HCURVAS(GCV(6,1))=1;
  end
  
  HAYCUR=(HCURVAS(GCV(1,1))+HCURVAS(GCV(2,1))+HCURVAS(GCV(3,1))+HCURVAS(71)+HCURVAS(GCV(5,1))+HCURVAS(GCV(6,1))) ~= 0;

  switch ACCION
      case 4
          if HAYCUR
              HCURVAS(20)=str2double(get(handles.AX31YMN,'string')); % Limite inferior eje Y curva 1
              HCURVAS(21)=str2double(get(handles.AX31YMX,'string')); % Limite superior eje Y curva 1
              HCURVAS(50)=0;          
              hold(HCURVAS(15),'on');
              for l=1:6
                  if HCURVAS(GCV(l,1))==1
                      HCURVAS(GCV(l,2))=plot(HCURVAS(15),PCURVAS(1,:),PCURVAS(GCV(l,11),:),char(VCFG(l)),'visible','off');
                      HCURVAS(10)=1;
                  end
              end
              
              HCURVAS(60)=plot(HCURVAS(15),[PCURVAS(1,HCURVAS(16)) PCURVAS(1,HCURVAS(16))],[HCURVAS(20) HCURVAS(21)],'y-','visible','off');
              HCURVAS(61)=plot(HCURVAS(15),[PCURVAS(1,HCURVAS(17)) PCURVAS(1,HCURVAS(17))],[HCURVAS(20) HCURVAS(21)],'y-','visible','off');
              VCFG(15)=cellstr('1');
          else
              HCURVAS(6)=0;
              VCFG(15)=cellstr('0');
          end
      otherwise
          HCURVAS(20)=str2double(get(handles.AX31YMN,'string')); % Limite inferior eje Y curva 1
          HCURVAS(21)=str2double(get(handles.AX31YMX,'string')); % Limite superior eje Y curva 1
          HCURVAS(30)=str2double(get(handles.AX32YMN,'string')); % Limite inferior eje Y curva 2
          HCURVAS(31)=str2double(get(handles.AX32YMX,'string')); % Limite superior eje Y curva 2
          HCURVAS(40)=str2double(get(handles.AX33YMN,'string')); % Limite inferior eje Y curva 3
          HCURVAS(41)=str2double(get(handles.AX33YMX,'string')); % Limite superior eje Y curva 3
          %edit
          HCURVAS(74)=str2double(get(handles.AX34YMN,'string')); % Limite inferior eje Y curva 4
          HCURVAS(75)=str2double(get(handles.AX34YMX,'string')); % Limite superior eje Y curva 4
          
          HCURVAS(50)=0;
          %PSA flag marcado
          if HCURVAS(GCV(1,1))==1
              hold(HCURVAS(11),'on');
              HCURVAS(GCV(1,2))=plot(HCURVAS(11),PCURVAS(1,:),PCURVAS(GCV(1,11),:),'b-','visible','off');
              switch ACCION
                  case 6
                      HCURVAS(GCV(1,5))=plot(HCURVAS(11),PCURVAS(1,:),PCURVAS(GCV(1,13),:),'r-','visible','off');
              end
              hold(HCURVAS(11),'off');
              set(handles.CB1,'Value',1);
              HCURVAS(6)=1;
              VCFG(11)=cellstr('1');
          else
              VCFG(11)=cellstr('0');
              set(handles.CB1,'Value',0);
              HCURVAS(6)=0;    
          end
          %VFSC I flag marcado
          if HCURVAS(GCV(2,1))==1
              hold(HCURVAS(12),'on');
              HCURVAS(GCV(2,2))=plot(HCURVAS(12),PCURVAS(1,:),PCURVAS(GCV(2,11),:),'b-','visible','off');
              switch ACCION
                  case 6
                      HCURVAS(GCV(2,5))=plot(HCURVAS(12),PCURVAS(1,:),PCURVAS(GCV(2,13),:),'r-','visible','off');
              end
              hold(HCURVAS(12),'off');
              set(handles.CB2,'Value',1);
              HCURVAS(7)=1;
              VCFG(12)=cellstr('2');
          else
              VCFG(12)=cellstr('0');
              set(handles.CB2,'Value',0);
              HCURVAS(7)=0;
          end
          %VFSC D flag marcado
          if HCURVAS(GCV(3,1))==1
              hold(HCURVAS(13),'on');
              HCURVAS(GCV(3,2))=plot(HCURVAS(13),PCURVAS(1,:),PCURVAS(GCV(3,11),:),'b-','visible','off');
              switch ACCION
                  case 6
                      HCURVAS(GCV(3,5))=plot(HCURVAS(13),PCURVAS(1,:),PCURVAS(GCV(3,13),:),'r-','visible','off');
              end
              hold(HCURVAS(13),'off');
              set(handles.CB3,'Value',1);
              HCURVAS(8)=1;
              VCFG(13)=cellstr('3');
          else
              VCFG(13)=cellstr('0');
              set(handles.CB3,'Value',0);
              HCURVAS(8)=0;    
          end
% %           CO2 flag marcado
%           disp('HCURVAS(13): '); disp(HCURVAS(13));
%           disp('HCURVAS(14): '); disp(HCURVAS(14)); 
          if HCURVAS(71)==1
              hold(HCURVAS(14),'on');
              HCURVAS(92)=plot(HCURVAS(14),PCURVAS(1,:),PCURVAS(51,:),'b-','visible','off');
              %disp(PCURVAS(51,:));
              switch ACCION
                  case 6
                      HCURVAS(59)=plot(HCURVAS(14),PCURVAS(1,:),PCURVAS(60,:),'r-','visible','off');
              end
              hold(HCURVAS(14),'off');
              set(handles.CB4,'Value',1);
              HCURVAS(9)=1;
              VCFG(14)=cellstr('1');
          else
              VCFG(14)=cellstr('0');
              set(handles.CB4,'Value',0);
              HCURVAS(9)=0;    
          end
          %Otros flag marcado
          if HCURVAS(GCV(5,1))==1
              hold(HCURVAS(13),'on');
              HCURVAS(GCV(5,2))=plot(HCURVAS(13),PCURVAS(1,:),PCURVAS(GCV(5,11),:),'b-','visible','off');
              switch ACCION
                  case 6
                      HCURVAS(GCV(5,5))=plot(HCURVAS(13),PCURVAS(1,:),PCURVAS(GCV(5,13),:),'r-','visible','off');
              end
              hold(HCURVAS(13),'off');
          end
          if HCURVAS(GCV(6,1))==1
              hold(HCURVAS(13),'on');
              HCURVAS(GCV(6,2))=plot(HCURVAS(13),PCURVAS(1,:),PCURVAS(GCV(6,11),:),'b-','visible','off');
              switch ACCION
                  case 6
                      HCURVAS(GCV(6,5))=plot(HCURVAS(13),PCURVAS(1,:),PCURVAS(GCV(6,13),:),'r-','visible','off');
              end
              hold(HCURVAS(13),'off');
          end
          if ACCION == 7
              for j=1:3
                  if HCURVAS(GCV(j,1)) == 1
                      GFBorra_Hand(GCV(j,3),1);
                      GFBorra_Hand(GCV(j,4),1);
                      GFBorra_Hand(GCV(j,5),1);
                      hold(HCURVAS(10+j),'on');
                      l=PCURVAS(GCV(j,15),1)+1;
                      HCURVAS(GCV(j,4))=plot(HCURVAS(10+j),PCURVAS(GCV(j,16),2:l),PCURVAS(GCV(j,15),2:l),'ws','visible','on');
                      HCURVAS(GCV(j,5))=plot(HCURVAS(10+j),PCURVAS(GCV(j,18),2:l),PCURVAS(GCV(j,17),2:l),'rs','visible','on');
                      HCURVAS(GCV(j,3))=plot(HCURVAS(10+j),PCURVAS(GCV(j,21),2:l),PCURVAS(GCV(j,20),2:l),'ko','visible','on');
                      hold(HCURVAS(10+j),'off');
                  end
             end
          end
  end
  if IDEBUG; disp('...GFFillData'); end;
end

function [MN1 MX1 MN2 MX2]=GFSetaxisini(ANXA)
MN1=min(ANXA);
MX1=max(ANXA);
if MN1 < 1 ; MN1=1; end;
MN2=MN1;
MX2=MX1;
end