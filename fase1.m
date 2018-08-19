% HCURVAS(1)= FLAG curva 1; 1=datos deplegar 0=sin datos
% HCURVAS(2)= FLAG curva 2; 1=datos deplegar 0=sin datos
% HCURVAS(3)= FLAG curva 3; 1=datos deplegar 0=sin datos
% HCURVAS(4)= 
% HCURVAS(5)= 

% HCURVAS(6)= FLAG  ventana 1; 1=visible 0=invisible
% HCURVAS(7)= FLAG  ventana 2; 1=visible 0=invisible
% HCURVAS(8)= FLAG  ventana 3; 1=visible 0=invisible
% HCURVAS(9)= FLAG  ventana 4; 1=visible 0=invisible
% HCURVAS(10)= FLAG  ventana 5; 1=visible 0=invisible

% HCURVAS(11)= handles ventana AX31
% HCURVAS(12)= handles ventana AX32
% HCURVAS(13)= handles ventana AX33
% HCURVAS(14)= handles ventana AX34
% HCURVAS(15)= handles ventana AX35

% HCURVAS(16)= Limite minimo global en eje X
% HCURVAS(17)= Limite maximo global en eje X
% HCURVAS(18)= Limite minimo global en eje X para visualizar
% HCURVAS(19)= Limite maximo global en eje X para visualizar

%PLOT CURVA 1 PSA
% HCURVAS(20)= Limite inferior eje Y curva 1
% HCURVAS(21)= Limite superior eje Y curva 1
% HCURVAS(22)= Manejador del plot de la ventana 1 parte 1
% HCURVAS(23)= Manejador del plot de la ventana 1 para Marcar zona de corr
% HCURVAS(24)= Manejador del plot de la ventana 1 para Filtro Mediana /
%              Maneja Plot de ventana 1 para Maximos en Min_Max
% HCURVAS(25)= Manejador del plot de la ventana 1 para Filtro Butter
%              Maneja Plot de ventana 1 para Minimos en Min_Max
% HCURVAS(26)= Manejador Spline automatico PSA

%PLOT CURVA 2 VFSCI
% HCURVAS(30)= Limite inferior eje Y curva 2
% HCURVAS(31)= Limite superior eje Y curva 2
% HCURVAS(32)= Manejador del plot de la ventana 2 parte 1
% HCURVAS(33)= Manejador del plot de la ventana 2 para Marcar zona de corr
% HCURVAS(34)= Manejador del plot de la ventana 2 para Filtro Mediana
% HCURVAS(35)= Manejador del plot de la ventana 2 para Filtro Butter
% HCURVAS(36)= Manejador Spline automatico VFSCI

%PLOT CURVA 3 VFSCD
% HCURVAS(40)= Limite inferior eje Y curva 3
% HCURVAS(41)= Limite superior eje Y curva 3
% HCURVAS(42)= Manejador del plot de la ventana 3 parte 1
% HCURVAS(43)= Manejador del plot de la ventana 3 para Marcar zona de corr
% HCURVAS(44)= Manejador del plot de la ventana 3 para Filtro Mediana
% HCURVAS(45)= Manejador del plot de la ventana 3 para Filtro Butter
% HCURVAS(36)= Manejador Spline automatico VFSCD


% HCURVAS(50)= FLAG Mostrar Marcas en curvas; 1=Mostrar 0=No Mostrar
% HCURVAS(60)= Handle linea Izquierda para cortar Curvas
% HCURVAS(61)= Handle linea Derecha para cortar Curvas
% HCURVAS(62)= Posiciòn Curva Izquierda para corte
% HCURVAS(63)= Posiciòn Curva Derecha para corte
% HCURVAS(70)= 0

% OTRAS CURVAS
% HCURVAS(71)= FLAG curva 4; 1=datos deplegar 0=sin datos
% HCURVAS(72)= FLAG curva 5; 1=datos deplegar 0=sin datos
% HCURVAS(73)= FLAG curva 6; 1=datos deplegar 0=sin datos
% HCURVAS(92)= Manejador del plot de la curva 4
% HCURVAS(102)= Manejador del plot de la curva 5
% HCURVAS(112)= Manejador del plot de la curva 6

% PLOT CURVA 4 CO2
% HCURVAS(74)= Limite inferior eje Y curva 4
% HCURVAS(75)= Limite superior eje Y curva 4
% HCURVAS(93)= Manejador del plot de la ventana 4 para Marcar zona de corr
% HCURVAS(94)= Manejador del plot de la ventana 4 para Filtro Mediana
% HCURVAS(95)= Manejador del plot de la ventana 4 para Filtro Butter
% HCURVAS(96)= Manejador Spline automatico CO2


% PCURVAS (1,:)= Array con el numero de muestra
% PCURVAS (3,:)= Array con el valor de PSA
% PCURVAS (4,:)= Array con el valor de VFSCI
% PCURVAS (5,:)= Array con el valor de VFSCD

% PCURVAS (6,:)= Array con el valor de PSA con Filtro Mediana
% PCURVAS (7,:)= Array con el valor de VFSCI con Filtro Mediana
% PCURVAS (8,:)= Array con el valor de VFSCD con Filtro Mediana
% PCURVAS (60,:)= Array con el valor de CO2 con Filtro Mediana

% PCURVAS (10,:)= Array con el valor de PSA con Filtro Butter
% PCURVAS (11,:)= Array con el valor de VFSCI con Filtro Butter
% PCURVAS (12,:)= Array con el valor de VFSCD con Filtro Butter
% PCURVAS (61,:)= Array con el valor de CO2 con Filtro Butter

% PCURVAS (15,:)= Array con el valor de PSA con Filtro Spline Auto
% PCURVAS (16,:)= Array con el valor de VFSCI con Filtro Spline Auto
% PCURVAS (17,:)= Array con el valor de VFSCID con Filtro Spline Auto
% PCURVAS (62,:)= Array con el valor de CO2 con Filtro Spline auto

% PCURVAS (20,:)= Array con los Valores Maximos PSA        V1
% PCURVAS (21,:)= Array con las Posiciones Maximos PSA     V1
% PCURVAS (22,:)= Array con los Valores Minimos PSA        V1
% PCURVAS (23,:)= Array con las Posiciones Minimos PSA     V1
% PCURVAS (24,:)= Array con los Valores UpStroke PSA       V1
% PCURVAS (25,:)= Array con las Posiciones UpStroke PSA    V1

% PCURVAS (30,:)= Array con los Valores Maximos VFSCI      V2
% PCURVAS (31,:)= Array con las Posiciones Maximos VFSCI   V2
% PCURVAS (32,:)= Array con los Valores Minimos VFSCI      V2
% PCURVAS (33,:)= Array con las Posiciones Minimos VFSCI   V2
% PCURVAS (34,:)= Array con los Valores UpStroke VFSCI     V2
% PCURVAS (35,:)= Array con las Posiciones UpStroke VFSCI  V2

% PCURVAS (40,:)= Array con los Valores Maximos VFSCD
% PCURVAS (41,:)= Array con las Posiciones Maximos VFSCD
% PCURVAS (42,:)= Array con los Valores Minimos VFSCD
% PCURVAS (43,:)= Array con las Posiciones Minimos VFSCD
% PCURVAS (44,:)= Array con los Valores UpStroke VFSCD
% PCURVAS (45,:)= Array con las Posiciones UpStroke VFSCD

% PCURVAS (51,:)= Array con el valor de CO2
% PCURVAS (52,:)= Array con el valor de ECG
% PCURVAS (53,:)= Array con el valor de ADIC

%PCURVAS PARA CO2
% PCURVAS (54,:)= Array con los Valores Maximos CO2
% PCURVAS (55,:)= Array con las Posiciones Maximos CO2
% PCURVAS (56,:)= Array con los Valores Minimos CO2
% PCURVAS (57,:)= Array con las Posiciones Minimos CO2
% PCURVAS (58,:)= Array con los Valores UpStroke CO2
% PCURVAS (59,:)= Array con las Posiciones UpStroke CO2


% PCURVA2(1:  = Array posiciones valores medios de PSA
% PCURVA2(2:  = Array datos valores medios de PSA

% LTIME = Array linea de tiempo

% GCV : Array con las posiciones de las diferentes posiciones para
%           manejo de curvas

% VCFG : contiene informacion de configuracion general
% VCFG(1) = color PSA
% VCFG(2) = color VFSCI
% VCFG(3) = color VFSCD
% VCFG(4) = color CO2
% VCFG(5) = color ECG
% VCFG(6) = color ADIC

% VCFG(11) = Numero de Curva en ventana 1
% VCFG(12) = Numero de Curva en ventana 2
% VCFG(13) = Numero de Curva en ventana 3

% HEADLIN(21)= Nombre de Archivo en proceso
% HEADLIN(22)= Camino de Archivo en proceso
% DIR_TRAB = Directorio de Trabajo Elegido por usuario

% HCURVA2
% PCURVA2

% ACCION = modo de trabajo
%        = 1 ; Procesar Archivo
%        = 2 ; Convertir Archivos de Ronney a Nuevo Formato Santiago (NF)
%        = 3 ; Convertir Archivos de texto Santiago a Nuevo Formato Santiago (NF)
%        = 4 ; Cortar Archivos (CF)
%        = 5 ; Calcular Minimos, Maximos y Upstroke


function varargout = fase1(varargin)
% FASE1 M-file for fase1.fig
%      FASE1, by itself, creates a new FASE1 or raises the existing
%      singleton*.
%
%      H = FASE1 returns the handle to a new FASE1 or the handle to
%      the existing singleton*.
%
%      FASE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FASE1.M with the given input arguments.
%
%      FASE1('Property','Value',...) creates a new FASE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fase1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fase1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fase1

% Last Modified by GUIDE v2.5 31-Jul-2018 15:15:11

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fase1_OpeningFcn, ...
                   'gui_OutputFcn',  @fase1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before fase1 is made visible.
function fase1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fase1 (see VARARGIN)

% Choose default command line output for fase1
global TITCOL NCOL;
global DATACOLT;
global HCURVAS;
global DIR_TRAB;
global GCV;
global ACCION;
global VCFG;
global MHANDLE;
global IDEBUG;
disp('inicialmente...');

ACCION=0;
TITCOL={' ' ' '};
DATACOLT={' '};
NCOL=0;
IDEBUG=1;
MHANDLE=handles;
handles.output = hObject;
[HCURVAS VCFG GCV]=GFInicializa(handles);
DIR_TRAB='C:\';
set(0,'UserData',[0 1 2 3 4 5]);
GFEnmenu(1);
GFView(handles,0);
% Update handles structure
guidata(hObject, handles);

disp('...inicialmente');


% --- Outputs from this function are returned to the command line.
function varargout = fase1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%          FUNCIONALIDADES INICIALES          %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Elegir directorio de trabajo donde se encuentran los datos     --
% -- Llamado desde menu interfaz gráfica                           --
% -- Archivo --> Directorio de Datos                                --
% --------------------------------------------------------------------
function Ddatos_Callback(hObject, eventdata, handles)
% hObject    handle to Ddatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DIR_TRAB;
global IDEBUG;
if IDEBUG; disp('Ddatos_Callback...'); end;
dirt=uigetdir(DIR_TRAB);
if dirt ~= 0
    DIR_TRAB=dirt;
    GFEnmenu(2);
end
if IDEBUG; disp('...Ddatos_Callback'); end;


% --------------------------------------------------------------------
% -- Inicializar Menu, reinicia pantalla y variables                --
% -- Llamado desde menu interfaz gráfica                            --
% -- Archivo --> Iniciar Nuevo                                      --
% --------------------------------------------------------------------
function IniMenu(hObject, eventdata, handles, nmenu)
% hObject    handle to FinMMU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDAT
% nmenu      numero de menu a desplegar
disp(nmenu);
switch nmenu
    case 1
        res=questdlg('¿Esta seguro que desea inicializar Espacio?','Inicializar','SI','NO','NO');
        if strcmp(res,'SI')
            GFinicia(handles,nmenu);
        end
    otherwise
        res=questdlg('¿Esta seguro que desea Terminar?','Terminar','SI','NO','NO');
        if strcmp(res,'SI')
            GFinicia(handles,nmenu);
        end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                FILTRAR ARCHIVOS             %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Cagar archivo para reparado y filtrado,                        --
% -- Extensión .EXP, .CUT y .TMP                                    --
% -- Llamado desde menu interfaz gráfica                            --
% -- Pre Procesamiento --> Abrir Archivo a Filtrar                  --
% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PFLoadarch(handles);

% --------------------------------------------------------------------
% -- Guardar archivo temporal extensión .TMP,                       --
% -- Guarda datos reparados pero no filtrados                       --
% -- Llamado desde menu interfaz gráfica                            --
% -- Pre Procesamiento --> Abrir Archivo a Filtrar                  --
% --------------------------------------------------------------------
function Savetmp_Callback(hObject, eventdata, handles)
% hObject    handle to Savetmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PFSavearchTMP();

% --------------------------------------------------------------------
% -- Guardar archivo reparado y filtrado extensión .FIL             --
% -- Llamado desde menu interfaz gráfica                            --
% -- Pre Procesamiento --> Abrir Archivo a Filtrar                  --
% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PFSavearch(handles);

% --------------------------------------------------------------------
% -- Aplicar Filtro indicado a curva especificada                   --
% -- Llamado cuando se realiza funcionalidad de filtrado            --
% -- Pantalla de Filtrado, CheckBox                                 --
% --------------------------------------------------------------------
function CBFILT32_Callback(hObject, eventdata, handles, NFIL, NVEN)
% hObject    handle to CB5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CB5
% NFIL :     1 Filtro Mediana grado n, 2 Filtro Butter, 3 Filtro Spline
% NVEN :     Numero de ventana 1 = AX31, 2 = AX32, 3 = AX33
PFFiltro(NFIL,handles,NVEN);
uicontrol(handles.TRICK)

% --------------------------------------------------------------------
% -- Eliminar Spikes en la curva seleccionada, reconstruyendo curva --
% -- Llamado cuando se realiza funcionalidad de filtrado            --
% -- Pantalla de Filtrado, Botón Elimina Spikes                     --
% --------------------------------------------------------------------
function ELIMSPK_Callback(hObject, eventdata, handles, WX)
% hObject    handle to ELIMSPK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% WX         Numero de Ventana a Eliminar Spike
PFElimSpk_POP0(handles,WX);

% --------------------------------------------------------------------
% -- Muestra y Oculta curva de una ventana cuando se filtra señal   --
% -- Llamado cuando se realiza funcionalidad de filtrado            --
% -- Pantalla de Filtrado, CheckBox                                 --
% --------------------------------------------------------------------
function CBVPLT_Callback(hObject, eventdata, handles,handl)
% hObject    handle to CBV32_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBV32_1
% handl: la posición del manijador del plot
PFDisplPlot(hObject,handl);
uicontrol(handles.TRICK);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                 CORTAR ARCHIVOS             %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Cagar archivo para cortar datos utiles, extension .EXP         --
% -- Llamado desde menu interfaz gráfica                            --
% -- Pre Procesamiento --> Cortar Archivos                          --
% --------------------------------------------------------------------
function Cutfile_Callback(hObject, eventdata, handles)
% hObject    handle to Cutfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CFLoadarch(handles);


% --------------------------------------------------------------------
% -- Guardar archivo cortado entre los limites indicados,           --
% -- Archivo generado es con extensión .CUT                         --
% -- Se llama desde Boton 'Guardar Seleccion' en pantalla de corte  --
% --------------------------------------------------------------------
function CF_PBWRTSEL_Callback(hObject, eventdata, handles)
% hObject    handle to CF_PBWRTSEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CFSavearch();

% --------------------------------------------------------------------
% -- Cambiar posicion de Linea de inicio y final de seleccion       --
% -- Se llama desde los botones o textos en la pantalla de corte    --
% --                                                                --
% --------------------------------------------------------------------
function CFPBEjes_Callback(hObject, eventdata, handles,modo)
% hObject    handle to CF_PBMINICIO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% modo       1 : escribe las horas de inicio y fin corte
%            2 : selecciona hora inicio sobre el grafico
%            3 : selecciona hora final sobre el grafico
%            4 : resta 1 a la posicion linea inicio
%            5 : suma 1 a la posicion linea inicio
%            6 : resta 1 a la posicion linea final
%            7 : suma 1 a la posicion linea final
%            10: toma hora inicio y posiciona linea inicio
%            11: toma hora final y posiciona linea final
CFSetejes(handles,modo);
uicontrol(handles.TRICK);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%       CALCULAR UPSTROKE ARCHIVOS            %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Cagar archivo para calcular upstroke, extension .FIL           --
% -- Llamado desde menu interfaz gráfica                            --
% -- Pre Procesamiento --> Minimos Maximos y Upstroke               --
% --------------------------------------------------------------------
function Maxmin_Callback(hObject, eventdata, handles)
% hObject    handle to Maxmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UPSLoadarch(handles);

% --------------------------------------------------------------------
% -- Guardar archivo con minimos y maximos detectados y             --
% -- upstroke calculado, se genera con extensión .UPS               --
% -- Llamado desde menu interfaz gráfica                            --
% -- Pre Procesamiento --> Guardar Max. Min. UpStroke               --
% --------------------------------------------------------------------
function SaveMMU_Callback(hObject, eventdata, handles)
% hObject    handle to SaveMMU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UPSSavearch(handles);

% --------------------------------------------------------------------
% -- Selecciona metodo para obtener maximos y minimos               --
% -- 3 opciones solo 1 implementada                                 --
% --                                                                --
% --------------------------------------------------------------------
function RBG_Callback(hObject, eventdata, handles, rb1 , rb2 , rb3)
% hObject    handle to RB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RB1
% rb1        1 = metodo seleccionado, 0 = no seleccionado
% rb2        1 = metodo seleccionado, 0 = no seleccionado
% rb3        1 = metodo seleccionado, 0 = no seleccionado
set(handles.RB1,'Value',rb1);
set(handles.RB2,'Value',rb2);
set(handles.RB3,'Value',rb3);
uicontrol(handles.TRICK);

% --------------------------------------------------------------------
% -- Encontrar maximos y minimos dentro de las curvas               --
% -- Se llama desde Boton desde pantalla de UpStroke                --
% --                                                                --
% --------------------------------------------------------------------
function MINMAX_Callback(hObject, eventdata, handles)
% hObject    handle to MINMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UPSCalcula(handles);
uicontrol(handles.TRICK);

% --------------------------------------------------------------------
% -- Calcular puntos upstroke dentro de las curvas                  --
% -- Se llama desde Boton desde pantalla de UpStroke                --
% --                                                                --
% --------------------------------------------------------------------
function UPSTRK_Callback(hObject, eventdata, handles)
% hObject    handle to UPSTRK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UPSCStroke(handles);
uicontrol(handles.TRICK);

% --------------------------------------------------------------------
% -- Funciones especifica sobre puntos maximos y minimos encontrados--
% -- Se llama desde Botones desde pantalla de UpStroke              --
% --                                                                --
% --------------------------------------------------------------------
function PBADMP_Callback(hObject, eventdata, handles, nven, modo)
% hObject    handle to PBADM31MA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% nven       Numero de ventana a procesar
% modo       1 : mover punto minimo o maximo
%            2 : insertar punto minimo y maximo
%            4 : eliminar punto minimo y maximo
UPSPuntos(nven,modo,handles);
uicontrol(handles.TRICK);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%   HERRAMIENTAS DE CONVERSION Y COMPARACION    %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Convertir archivo desde .EXP a .EXP en formato adecuado        --
% -- para ser procesado con las diferentes funcionalidades          --
% -- Llamado desde menu interfaz gráfica                            --
% -- Herramientas --> Convertir Arch. Stgo.                         --
% --------------------------------------------------------------------
function Convert1_Callback(hObject, eventdata, handles)
% hObject    handle to Convert1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TFConvert1();

% --------------------------------------------------------------------
% -- Convertir archivo desde .DAG a .EXP en formato adecuado        --
% -- para ser procesado con las diferentes funcionalidades          --
% -- Llamado desde menu interfaz gráfica                            --
% -- Herramientas --> Convertir Arch. Ronney                        --
% --------------------------------------------------------------------
function Convert2_Callback(hObject, eventdata, handles)
% hObject    handle to Convert1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TFConvert2();

% --------------------------------------------------------------------
% -- Comparar archivo .EXP y .FIL para revisar el pre-procesamiento --
% -- Llamado desde menu interfaz gráfica                            --
% -- Herramientas --> Compara Arch. Filtrado                        --
% --------------------------------------------------------------------
function Compare1_Callback(hObject, eventdata, handles)
% hObject    handle to Compare1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TFCompara1(handles);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%         PROCESAMIENTO DE SEÑALES              %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Cagar archivo para procesar, extension .UPS                    --
% -- Llamado desde menu interfaz gráfica                            --
% -- Procesos --> Cargar Curva Procesar                             --
% --------------------------------------------------------------------
function CP_Load_Callback(hObject, eventdata, handles)
% hObject    handle to CP_Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CPLoadarch(handles);

% --------------------------------------------------------------------
% -- Graba archivo procesado, extension .PAR                        --
% -- Llamado desde menu interfaz gráfica                            --
% -- Procesos --> Crear Archivo PAR                                 --
% --------------------------------------------------------------------
function CP_WPAR_Callback(hObject, eventdata, handles)
% hObject    handle to CP_WPAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CPSavearch(handles);

% --------------------------------------------------------------------
% -- Funciones de procesamiento sobre curva pre-procesada           --
% -- Llamada de botones de pantalla de procesamiento                --
% --                                                                --
% --------------------------------------------------------------------
function CP_CBREMUES_Callback(hObject, eventdata, handles, MODO)
% hObject    handle to CP_CBREMUES (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CP_CBREMUES
% MODO       1 : Calcular valores medios
%            2 : Remuestreo de curvas para que sean comparables
%            3 : Determinar PCC y RAP.
CPRemuestreo(get(hObject,'Value'),MODO);
uicontrol(handles.TRICK);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                     EXTRAS                    %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Realiza proceso batch de las funcionalidades existente         --
% -- Genera un archivo log en casos puntuales                       --
% -- Llamado desde menu interfaz gráfica                            --
% -- Extras --> Filtrar Automatico                                  --
% --        --> UPS Automatico                                      --
% --        --> PAR Automatico                                      --
% --------------------------------------------------------------------
function EXT_COMP_Callback(hObject, eventdata, handles, modo)
% hObject    handle to EXT_COMP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% modo       1 : Filtrar archivos automaticamente
%            2 : Determinar Upstroke automaticamente
%            3 : Generar archivo PAR automaticamente
switch modo
    case 1
        TOLoadFil(handles);
    case 2
        TOLoadUPS(handles);
    case 3
        TOLoadPAR(handles);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                    GENERALES                  %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------------------------------------------
% -- Mostrar y Ocultar ventana de curva                             --
% -- Llamado desde cualquier modo donde existen ventanas            --
% --                                                                --
% --------------------------------------------------------------------
function CBG1_Callback(hObject, eventdata, handles, NPOS)
% hObject    handle to CB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of CB1
GFVeraxis(handles,NPOS);
uicontrol(handles.TRICK);

% --------------------------------------------------------------------
% -- Se ejecuta zoom al presionar teclas específicas                --
% -- Llamado desde cualquier modo donde existen ventanas            --
% -- UP = Zoom in                                                   --
% -- DOWN = Zoom Out                                                --
% -- LEFT = desplezar izq. 10%                                      --
% -- RIGHT = desplezar der. 10%                                     --
% -- CTRL LEFT = desplezar izq. 50%                                 --
% -- CTRL RIGHT = desplezar der. 50%                                --
% --------------------------------------------------------------------
% --- Executes on key press with focus on PP and none of its controls.
function PP_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to PP (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
GFBZOOM(hObject, eventdata, handles);

% --------------------------------------------------------------------
% -- Cambiar Limite Superior e Inferior de las curvas               --
% -- Llamado desde cualquier modo donde existen ventanas            --
% --                                                                --
% --------------------------------------------------------------------
function AX_Callback(hObject, eventdata, handles, SEL , N1 , MN , MX)
% hObject    handle to AX31YMX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% SEL        Numero de ventana a modificar
% N1         Posición de variable a ajustar
% MN         Posicion de Ajuste Mínimo
% MX         Posicion de Ajuste Maximo
global HCURVAS;
global LTIME;
global ACCION;
HCURVAS(N1) = str2double(get(hObject,'string'));
switch SEL
    case 31
        set(handles.AX31,'YLim',[HCURVAS(MN) HCURVAS(MX)]); % limites del eje Y
    case 32
        set(handles.AX32,'YLim',[HCURVAS(MN) HCURVAS(MX)]); % limites del eje Y
    case 33
        set(handles.AX33,'YLim',[HCURVAS(MN) HCURVAS(MX)]); % limites del eje Y
    case 34
        set(handles.AX34,'YLim',[HCURVAS(MN) HCURVAS(MX)]); % limites del eje Y
end
GFAdjustaxis(handles,ACCION,LTIME);
uicontrol(handles.TRICK);

% --------------------------------------------------------------------
% -- Desplazar la curva utilizando la barra de posicion             --
% -- Llamado desde cualquier modo donde existen ventanas            --
% --                                                                --
% --------------------------------------------------------------------
function SLH1_Callback(hObject, eventdata, handles)
% hObject    handle to SLH1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global HCURVAS;
global LTIME;
global ACCION;

ltot=HCURVAS(17) - HCURVAS(16);
lpar=HCURVAS(19) - HCURVAS(18);
sdlpm=1-lpar/ltot;
sdlpr=get(hObject,'Value');
xpos=int32((sdlpr/100)*sdlpm*HCURVAS(17));
if (xpos<HCURVAS(16)); xpos=HCURVAS(16); end;
xpos2=int32(xpos+lpar);
if (xpos2>HCURVAS(17)); xpos=HCURVAS(17); end;
HCURVAS(18)=xpos;
HCURVAS(19)=xpos2;
GFAdjustaxis(handles,ACCION,LTIME);
uicontrol(handles.TRICK);

% --------------------------------------------------------------------
% -- Cerrar pantalla principal, se llama en cualquier momento       --
% --                                                                --
% --------------------------------------------------------------------
function PP_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to PP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
delete(hObject);



function GF_EDFNAME_Callback(hObject, eventdata, handles)
% hObject    handle to GF_EDFNAME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GF_EDFNAME as text
%        str2double(get(hObject,'String')) returns contents of GF_EDFNAME as a double


% --- Executes during object creation, after setting all properties.
function GF_EDFNAME_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GF_EDFNAME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GF_EDFMUES_Callback(hObject, eventdata, handles)
% hObject    handle to GF_EDFMUES (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GF_EDFMUES as text
%        str2double(get(hObject,'String')) returns contents of GF_EDFMUES as a double


% --- Executes during object creation, after setting all properties.
function GF_EDFMUES_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GF_EDFMUES (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GF_EDTMUES_Callback(hObject, eventdata, handles)
% hObject    handle to GF_EDTMUES (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GF_EDTMUES as text
%        str2double(get(hObject,'String')) returns contents of GF_EDTMUES as a double


% --- Executes during object creation, after setting all properties.
function GF_EDTMUES_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GF_EDTMUES (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when PanelSignal is resized.

% hObject    handle to PanelSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in PBADM34MA.
function PBADM34MA_Callback(hObject, eventdata, handles)
% hObject    handle to PBADM34MA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PBADM34ME.
function PBADM34ME_Callback(hObject, eventdata, handles)
% hObject    handle to PBADM34ME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PBADM34MO.
function PBADM34MO_Callback(hObject, eventdata, handles)
% hObject    handle to PBADM34MO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ELIMSPK34.
function ELIMSPK34_Callback(hObject, eventdata, handles)
% hObject    handle to ELIMSPK34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in CBV34_1.
function CBV34_1_Callback(hObject, eventdata, handles)
% hObject    handle to CBV34_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBV34_1


% --- Executes on button press in CBV34_2.
function CBV34_2_Callback(hObject, eventdata, handles)
% hObject    handle to CBV34_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBV34_2


% --- Executes on button press in CBV34_3.
function CBV34_3_Callback(hObject, eventdata, handles)
% hObject    handle to CBV34_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBV34_3


% --- Executes on button press in CBV34_4.
function CBV34_4_Callback(hObject, eventdata, handles)
% hObject    handle to CBV34_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBV34_4


% --- Executes on button press in CBBUT34.
function CBBUT34_Callback(hObject, eventdata, handles)
% hObject    handle to CBBUT34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBBUT34


% --- Executes on button press in CBMED34.
function CBMED34_Callback(hObject, eventdata, handles)
% hObject    handle to CBMED34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBMED34



function OFMED34_Callback(hObject, eventdata, handles)
% hObject    handle to OFMED34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OFMED34 as text
%        str2double(get(hObject,'String')) returns contents of OFMED34 as a double


% --- Executes during object creation, after setting all properties.
function OFMED34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OFMED34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OFBUT34_Callback(hObject, eventdata, handles)
% hObject    handle to OFBUT34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OFBUT34 as text
%        str2double(get(hObject,'String')) returns contents of OFBUT34 as a double


% --- Executes during object creation, after setting all properties.
function OFBUT34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OFBUT34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FCFBUT34_Callback(hObject, eventdata, handles)
% hObject    handle to FCFBUT34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FCFBUT34 as text
%        str2double(get(hObject,'String')) returns contents of FCFBUT34 as a double


% --- Executes during object creation, after setting all properties.
function FCFBUT34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FCFBUT34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CBSPL34.
function CBSPL34_Callback(hObject, eventdata, handles)
% hObject    handle to CBSPL34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CBSPL34



function FNSPL34_Callback(hObject, eventdata, handles)
% hObject    handle to FNSPL34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FNSPL34 as text
%        str2double(get(hObject,'String')) returns contents of FNSPL34 as a double


% --- Executes during object creation, after setting all properties.
function FNSPL34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FNSPL34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AX34YMX_Callback(hObject, eventdata, handles)
% hObject    handle to AX34YMX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AX34YMX as text
%        str2double(get(hObject,'String')) returns contents of AX34YMX as a double


% --- Executes during object creation, after setting all properties.
function AX34YMX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AX34YMX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AX34YMN_Callback(hObject, eventdata, handles)
% hObject    handle to AX34YMN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AX34YMN as text
%        str2double(get(hObject,'String')) returns contents of AX34YMN as a double


% --- Executes during object creation, after setting all properties.
function AX34YMN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AX34YMN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
