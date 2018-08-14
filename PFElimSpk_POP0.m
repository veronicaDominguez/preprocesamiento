function PFElimSpk_POP0(handles,nci)
% hObject    handle to ELIMSPK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% out = dialog('WindowStyle', 'normal', 'Name', 'My Dialog');

global HCURVAS;
global HSCU;
global PCURVAS;
global PSCU;
disp('ElimSpk_POP0...');

% posicion = (punto-inicial+1)

[r,s]=ginput(1); % toma dos puntos con el mouse
rmin=round(r) - HCURVAS(16) + 1;
rmax=rmin+100;
if rmax > HCURVAS(17); rmax=HCURVAS(17); end;

% HSCU(1) : handle de la figura
% HSCU(2) : handle de los ejes
% HSCU(3) : 
% HSCU(4) : rmin = punto minimo de inicio de la curva
% HSCU(5) : rmax = punto maximo de inicio de la curva
% HSCU(6) : 
% HSCU(7) : numero curvas para undo
% HSCU(8) : 
% HSCU(9) : 
% HSCU(10) : handle del plot original
% HSCU(11) : handle del plot modificado
% HSCU(15) : handle para boton Spline
% HSCU(16) : handle para boton Lineal
% HSCU(17) : handle para boton Deshacer
% HSCU(18) : handle para boton Procesar
% HSCU(19) : handle para boton Guardar y Salir
% HSCU(20) : handle para boton Salir
% HSCU(30) : numero del plot a procesar
% HSCU(31) : handle de la ventana a procesar
% HSCU(32) : numero del set de datos a procesar
% HSCU(33) : handle elim spikes CO2

HSCU(27)=handles.ELIMSPK31;
HSCU(28)=handles.ELIMSPK32;
HSCU(29)=handles.ELIMSPK33;
HSCU(33)=handles.ELIMSPK34;


HSCU(30)=nci;
switch nci
    case 22  % Manejador del plot curva PSA
       HSCU(31)=11;
       HSCU(32)=3;
    case 32  % VFCD
       HSCU(31)=12;
       HSCU(32)=4;
    case 42  % VFCI
       HSCU(31)=13;
       HSCU(32)=5;
    case 92  % manejador del plot curva CO2 HCURVA(92)
       HSCU(31)=14; %HCURVA 6 del handle del co2
       HSCU(32)=6; %columna 6 del archivo
end

nhcurvas=length(HCURVAS);
if nhcurvas >= (HSCU(30)+1)
      if ishandle(HCURVAS(HSCU(30)+1))
          if HCURVAS(HSCU(30)+1) > 0
              delete(HCURVAS(HSCU(30)+1));
          end
      end
end

disp('HSCU(31): ');
disp(HSCU(31));
hold(HCURVAS(HSCU(31)),'on');

%plotea curvas
HCURVAS(HSCU(30)+1)=plot(HCURVAS(HSCU(31)),PCURVAS(1,rmin:rmax),PCURVAS(HSCU(32),rmin:rmax),'r-');
hold(HCURVAS(HSCU(31)),'off');

set(handles.ELIMSPK31,'enable','off');
set(handles.ELIMSPK32,'enable','off');
set(handles.ELIMSPK33,'enable','off');
set(handles.ELIMSPK34,'enable','off');

HSCU(4)=rmin;
HSCU(5)=rmax;
HSCU(7)=0;

PSCU(1,:)=PCURVAS(1,rmin:rmax);
PSCU(2,:)=PCURVAS(HSCU(32),rmin:rmax);
PSCU(3,:)=PCURVAS(HSCU(32),rmin:rmax);
PSCU(4,:)=PCURVAS(HSCU(32),rmin:rmax);
PSCU(5,:)=PCURVAS(HSCU(32),rmin:rmax);

HSCU(1) = figure('Visible','off','Name','VFSCI Eliminar Spikes','Position',[50,200,900,485],'NumberTitle','off','MenuBar','none');
%HSCU(1) = figure('Visible','off','Name','VFSCI Eliminar Spikes','Position',[50,400,900,285],'NumberTitle','off','MenuBar','none');
set(HSCU(1),'WindowStyle','normal');
set(HSCU(1),'Resize','on');
set(HSCU(1),'ResizeFcn',@ElimSpk_POP0_Rz);
set(HSCU(1),'CloseRequestFcn',@ElimSpk_POP0_Cl);
HSCU(2) = axes('Units','Pixels','Position',[40,60,840,420],'Xlim',[rmin rmax],'YLim',[HCURVAS(HSCU(30)-2) HCURVAS(HSCU(30)-1)]);
% HSCU(2) = axes('Units','Pixels','Position',[50,60,808,178],'Xlim',[rmin rmax],'YLim',[HCURVAS(HSCU(30)-2) HCURVAS(HSCU(30)-1)]);
HSCU(15) = uicontrol(HSCU(1),'Style','PushButton','Units','Pixels','String','Spline Cub'     ,'Position',[30 10 80 20]  ,'Callback',@ElimSpk_POP0_B1A);
HSCU(16) = uicontrol(HSCU(1),'Style','PushButton','Units','Pixels','String','Lineal'         ,'Position',[120 10 80 20] ,'Callback',@ElimSpk_POP0_B1B);
HSCU(17) = uicontrol(HSCU(1),'Style','PushButton','Units','Pixels','String','Deshacer'       ,'Position',[210 10 80 20] ,'Enable','off','Callback',@ElimSpk_POP0_B2);
HSCU(18) = uicontrol(HSCU(1),'Style','PushButton','Units','Pixels','String','Procesar'       ,'Position',[300 10 80 20] ,'Callback',@ElimSpk_POP0_B3);
HSCU(19) = uicontrol(HSCU(1),'Style','PushButton','Units','Pixels','String','Guardar y Salir','Position',[390 10 100 20],'Callback',@ElimSpk_POP0_B4);
HSCU(20) = uicontrol(HSCU(1),'Style','PushButton','Units','Pixels','String','Salir'          ,'Position',[500 10 80 20] ,'Callback',@ElimSpk_POP0_Cl);

set(HSCU(1),'Visible','on');
hold(HSCU(2),'on');
HSCU(10)=plot(HSCU(2),PSCU(1,:),PSCU(2,:),'rs-');
HSCU(11)=plot(HSCU(2),PSCU(1,:),PSCU(3,:),'bs-');
hold(HSCU(2),'off');
disp('...ElimSpk_POP0');
end


function ElimSpk_POP0_B1A(hObject, eventdata, handles)
global HSCU;
global PSCU;
disp('ElimSpk_POP0_B1A...');
[r,s]=ginput(2); % toma dos puntos con el mouse
ti=round(r(1))+1;
tf=round(r(2)+1);

txi =ti-HSCU(4);
if txi < 3; txi=3; end;
txf =tf-HSCU(4);
if tf > HSCU(5); tf=HSCU(5); end;

xsp=[PSCU(1,txi-2:txi) , PSCU(1,txf:txf+2)];
ysp=[PSCU(2,txi-2:txi) , PSCU(2,txf:txf+2)];
xxsp=PSCU(1,txi-2:txf+2);
yysp=interp1(xsp,ysp,xxsp,'spline');

i=1;
PSCU(5,:)=PSCU(4,:);
PSCU(4,:)=PSCU(3,:);
HSCU(7)=HSCU(7)+1;
if HSCU(7) > 2; HSCU(7)=2; end;
set(HSCU(17),'Enable','on');

for j=txi-2:txf+2
  PSCU(3,j)=round(yysp(i));
  i=i+1;
end
delete(HSCU(11));
hold(HSCU(2),'on');
HSCU(11)=plot(HSCU(2),PSCU(1,:),PSCU(3,:),'bs-');
hold(HSCU(2),'off');
disp('...ElimSpk_POP0_B1A');
end



function ElimSpk_POP0_B1B(hObject, eventdata, handles)
global HSCU;
global PSCU;
disp('ElimSpk_POP0_B1B...');
[r,s]=ginput(2); % toma dos puntos con el mouse
ti=round(r(1))+1;
tf=round(r(2)+1);

txi =ti-HSCU(4);
if txi < 3; txi=3; end;
txf =tf-HSCU(4);
if tf > HSCU(5); tf=HSCU(5); end;

xsp=[PSCU(1,txi) , PSCU(1,txf)];
ysp=[PSCU(2,txi) , PSCU(2,txf)];
xxsp=PSCU(1,txi:txf);
yysp=interp1(xsp,ysp,xxsp,'linear');

i=1;
PSCU(5,:)=PSCU(4,:);
PSCU(4,:)=PSCU(3,:);
HSCU(7)=HSCU(7)+1;
if HSCU(7) > 2; HSCU(7)=2; end;
set(HSCU(17),'Enable','on');

for j=txi:txf
  PSCU(3,j)=round(yysp(i));
  i=i+1;
end
delete(HSCU(11));
hold(HSCU(2),'on');
HSCU(11)=plot(HSCU(2),PSCU(1,:),PSCU(3,:),'bs-');
hold(HSCU(2),'off');
disp('...ElimSpk_POP0_B1B');
end


function ElimSpk_POP0_B2(hObject, eventdata, handles)
global HSCU;
global PSCU;
disp('ElimSpk_POP0_B2...');
if HSCU(7) > 0;
    HSCU(7)=HSCU(7)-1;
    PSCU(3,:)=PSCU(4,:);
    PSCU(4,:)=PSCU(5,:);
    if HSCU(7)== 0
        set(HSCU(17),'Enable','off');
    end
end
delete(HSCU(11));
hold(HSCU(2),'on');
HSCU(11)=plot(HSCU(2),PSCU(1,:),PSCU(3,:),'bs-');
hold(HSCU(2),'off');
disp('...ElimSpk_POP0_B2');
end


function ElimSpk_POP0_B3(hObject, eventdata, handles)
global HSCU;
global PSCU;
global HCURVAS;
global PCURVAS;

disp('ElimSpk_POP0_B3...');

if HSCU(20)==32; cp=4; else cp=5; end;
PSCU(2,:)=PSCU(3,:);
delete(HSCU(10));
delete(HSCU(11));
HSCU(7)=0;
set(HSCU(17),'Enable','off');

hold(HSCU(2),'on');
HSCU(10)=plot(HSCU(2),PSCU(1,:),PSCU(2,:),'rs-');
HSCU(11)=plot(HSCU(2),PSCU(1,:),PSCU(3,:),'bs-');
hold(HSCU(2),'off');

nhcurvas=length(HCURVAS);
if nhcurvas >= (HSCU(30)+1)
      if ishandle(HCURVAS(HSCU(30)+1))
          if HCURVAS(HSCU(30)+1) > 0
              delete(HCURVAS(HSCU(30)+1));
          end
      end
end
hold(HCURVAS(HSCU(31)),'on');
HCURVAS(HSCU(30)+1)=plot(HCURVAS(HSCU(31)),PCURVAS(1,HSCU(4):HSCU(5)),PSCU(3,:),'r-');
hold(HCURVAS(HSCU(31)),'off');
disp('...ElimSpk_POP0_B3');
end


function ElimSpk_POP0_B4(hObject, eventdata, handles)
global HSCU;
global PSCU;
global PCURVAS;
disp('ElimSpk_POP0_B4...');
PCURVAS(HSCU(32),HSCU(4):HSCU(5))=PSCU(3,1:HSCU(5)-HSCU(4)+1);
ElimSpk_POP0_Cl(hObject, eventdata, HSCU(1) );
disp('...ElimSpk_POP0_B4');
end


function ElimSpk_POP0_Rz(hObject, eventdata, handles)
global HSCU;
disp('ElimSpk_POP0_Rz...');
dwin=get(HSCU(1),'Position');
daxs=get(HSCU(2),'Position');
if dwin(4) < 100
    dwin(4)=100;
end
if dwin(3) < 100
    dwin(3)=100;
end
daxs(4)=dwin(4)-70;
daxs(3)=dwin(3)-60;
set(HSCU(2),'Position',daxs);
disp('...ElimSpk_POP0_Rz');
end


% funcion que se llama al cerrar ventana popup de manejo de curvas 1
function ElimSpk_POP0_Cl(hObject, eventdata, handles)
global HCURVAS;
global PCURVAS;
global PSCU;
global HSCU;
disp('ElimSpk_POP0_Cl...');
  nhcurvas=length(HCURVAS);
  if nhcurvas >= HSCU(30)
      if ishandle(HCURVAS(HSCU(30)+0));
          if HCURVAS(HSCU(30)+0) > 0
              delete(HCURVAS(HSCU(30)+0));
          end
      end;
  end
  if nhcurvas >= (HSCU(30)+1)
      if ishandle(HCURVAS(HSCU(30)+1));
          if HCURVAS(HSCU(30)+1) > 0
              delete(HCURVAS(HSCU(30)+1)); 
          end
      end;
  end

  set(HSCU(27),'enable','on');
  set(HSCU(28),'enable','on');
  set(HSCU(29),'enable','on');
  hold(HCURVAS(HSCU(31)),'on');
  HCURVAS(HSCU(30))=plot(HCURVAS(HSCU(31)),PCURVAS(1,:),PCURVAS(HSCU(32),:),'b-');
  hold(HCURVAS(HSCU(31)),'off');  
delete(HSCU(1));
clear('PSCU','HSCU');
disp('...ElimSpk_POP0_Cl');
end