% *****                CORTAR CURVAS                             *****
% --------------------------------------------------------------------
% -- Crea Archivo Cortado, con extensión .CUT                       --
% -- Despliega una caja de dialogo y pide los datos del archivo a   --
% -- guardar, se debe especificar:                                  --
% -- Numero de Proyecto  4 caracteres                               --
% -- Nombre del sujeto   4 caracteres                               --
% -- Fecha de Maniobra   8 caracteres                               --
% -- Nombre de Maniobra  4 caracteres                               --
% -- Numero de Maniobra  4 caracteres                               --
% -- Se validan los largos de los datos pedidos y se genera el      --
% -- nuevo archivo con el tiempo de inicio y fin especificado       --
% -- Se reordenan los datos en el archivo para conservar            --
% -- consistencia                                                   --
% --------------------------------------------------------------------
function CFSavearch()
global HWIN;
global HEADLIN;
global DAT_EXP;
global IDEBUG;
if IDEBUG; disp('CFSavearch...'); end;
[dia b]=strtok(HEADLIN(3,1),':');
[mes b]=strtok(b,':');
[a b]=strtok(b,':');
[an b]=strtok(a,' ');
DAT_EXP=importdata('DEF_COD_EXP.dat');
fec=sprintf('%0.4d%0.2d%0.2d',str2double(char(an)),str2double(char(mes)),str2double(char(dia)));
HWIN(1) = figure('Visible','off','Name','Guardar Maniobra','Position',[50,50,600,285]);
set(HWIN(1),'NumberTitle','off');
set(HWIN(1),'MenuBar','none');
set(HWIN(1),'WindowStyle','normal');
set(HWIN(1),'Resize','off');
set(HWIN(1),'CloseRequestFcn',@CFW_Close);
HWIN(10) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','Numero Proyecto :','Position',[10 260 100 18],'HorizontalAlignment','left');
HWIN(11) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','Nombre Sujeto   :','Position',[10 240 100 18],'HorizontalAlignment','left');
HWIN(12) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','Fecha Maniobra  :','Position',[10 220 100 18],'HorizontalAlignment','left');
HWIN(13) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','Nombre Maniobra :','Position',[10 200 100 18],'HorizontalAlignment','left');
HWIN(14) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','Numero Maniobra :','Position',[180 200 100 18],'HorizontalAlignment','left');

HWIN(20) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','ej: P001','Position',[160 260 100 18],'HorizontalAlignment','left');
HWIN(21) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','ej: VC01','Position',[160 240 100 18],'HorizontalAlignment','left');
HWIN(22) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','ej: AAAAMMDD','Position',[180 220 100 18],'HorizontalAlignment','left');
HWIN(23) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','ej: 01','Position',[322 200 100 18],'HorizontalAlignment','left');

HWIN(30) = uicontrol(HWIN(1),'Style','Edit','Units','pixels','String','','Position',[112 260 36 18],'BackgroundColor',[1 1 1]);
HWIN(31) = uicontrol(HWIN(1),'Style','Edit','Units','pixels','String','','Position',[112 240 36 18],'BackgroundColor',[1 1 1]);
HWIN(32) = uicontrol(HWIN(1),'Style','Edit','Units','pixels','String',fec,'Position',[112 220 60 18],'BackgroundColor',[1 1 1]);
HWIN(33) = uicontrol(HWIN(1),'Style','Pushbutton','Units','pixels','String','','Position',[112 200 50 18],'BackgroundColor',[1 1 1],'Callback',@CFTB01);
HWIN(34) = uicontrol(HWIN(1),'Style','Edit','Units','pixels','String','','Position',[282 200 36 18],'BackgroundColor',[1 1 1]);
HWIN(35) = uicontrol(HWIN(1),'Style','pushbutton','Units','pixels','String','Grabar','Position',[10 100 100 18],'HorizontalAlignment','center','Callback',@CFPB01);

HWIN(36) = uicontrol(HWIN(1),'Style','Text','Units','pixels','String','','Position',[10 140 400 18],'BackgroundColor',[1 1 1]);
HWIN(37) = uicontrol(HWIN(1),'Style','pushbutton','Units','pixels','String','Salir','Position',[120 100 100 18],'HorizontalAlignment','center','Callback',@CFW_Close);
set(HWIN(1),'Visible','on');
if IDEBUG; disp('...CFSavearch'); end;
end


% --------------------------------------------------------------------
% -- Valida los datos ingresados en la caja de dialogo, si están    --
% -- correctos genera el archivo                                    --
% --------------------------------------------------------------------
function CFPB01(hObject, eventdata, handles)
% hObject    puntero a CFPB01
% eventdata  reservado
% handles    estructura con punteros a datos de la GUI
  global HWIN;
  global HEADLIN;
  global ACCION;
  global IDEBUG;
  if IDEBUG; disp('CFSavearch_CFPB01...'); end;
  np=get(HWIN(30),'String');
  ns=get(HWIN(31),'String');
  fe=get(HWIN(32),'String');
  nm=get(HWIN(34),'String');
  nn=get(HWIN(33),'String');
  if length(np) == 4
      if length(ns) == 4
          if length(fe) == 8
              if length(char(nn)) == 4
                  if length(nm) == 2
                      nfile=strcat(np,ns,fe,nn,nm);
                      filew=strcat(HEADLIN(22),nfile,'.CUT');
                      set(HWIN(36),'String',filew);
                      dlen=length(char(filew));
                      mult=dlen/60;
                      multi=floor(mult);
                      if mult > multi
                          nlin=(multi+1)*18;
                          set(HWIN(36),'Position',[10 140 400 nlin]);
                      end
                      res=GFWFile(filew,ACCION,0);
                      if res
                          CFW_Close();
                      end
                  else
                      errordlg('numero de la maniobra con largo distinto de 2','Guardar Archivo Cortado');
                  end
              else
                  errordlg('Largo de la maniobra distinto de 4','Guardar Archivo Cortado');
              end
          else
              errordlg('Largo de la fecha distinto de 8','Guardar Archivo Cortado');
          end
      else
          errordlg('Largo del nombre del sujeto distinto de 4','Guardar Archivo Cortado');
      end
  else
      errordlg('Largo del nombre de proyecto distinto de 4','Guardar Archivo Cortado');
  end
   if IDEBUG; disp('...CFSavearch_CFPB01'); end;
end

% --------------------------------------------------------------------
% -- Cierra caja de dialogo donde se piden datos al usuario         --
% --------------------------------------------------------------------
function CFW_Close(hObject, eventdata, handles)
% hObject    puntero a CFW_Close
% eventdata  reservado
% handles    estructura con punteros a datos de la GUI
  global HWIN;
  hObj=HWIN(1);
  clear HWIN;
  delete(hObj);
end

% --------------------------------------------------------------------
% -- Se activa boton que despliega lista de Maniobras validas       --
% -- Las maniobras validas se obtienen de DEF_COD_EXP.DAT           --
% --------------------------------------------------------------------
function CFTB01(hObject, eventdata, handles)
% hObject    puntero a CFTB01
% eventdata  reservado
% handles    estructura con punteros a datos de la GUI
  global HWIN;
  global DAT_EXP;
  global IDEBUG;
  if IDEBUG; disp('Elige Maniobra CFTB01...'); end;
  lmax=0;
  for k=1:length(DAT_EXP)
      lar=length(char(DAT_EXP(k)));
      if (lar>lmax); lmax=lar; end;
  end
  if (lmax>35); lmax=35; end;
  HWIN(38)=uicontrol(HWIN(1),'Style','listbox','Units','pixels','String',DAT_EXP,'Position',[112 166 lmax*7 54],'BackgroundColor',[1 1 1],'Callback',@CFTB02);
  if IDEBUG; disp('...Elige Maniobra CFTB01'); end;
end

% --------------------------------------------------------------------
% -- Obtiene los 4 caracteres de la maniobra seleccionada           --
% --------------------------------------------------------------------
function CFTB02(hObject, eventdata, handles)
% hObject    puntero a CFTB02
% eventdata  reservado
% handles    estructura con punteros a datos de la GUI
  global HWIN;
  global DAT_EXP;
  pos=get(HWIN(38),'Value');
  strp=char(DAT_EXP(pos));
  set(HWIN(33),'String',strp(1:4));
  delete(HWIN(38));
end