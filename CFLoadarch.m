% *****                CORTAR CURVAS                             *****
% --------------------------------------------------------------------
% -- Despliega una caja de dialogo y pide el archivo a abrir para   --
% -- cortar curva, verificando que sea No Nulo                      --
% -- Llama a la función de llenado de datos e inicializa            --
% -- las opciones del menu, ventana y ajustes para Funcionalidad de --
% -- Cortar Curvas                                                  --
% --------------------------------------------------------------------
function CFLoadarch(handles)
% handles    estructura con punteros a datos de la GUI
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  global IDEBUG;
  if IDEBUG; disp('CFLoadarch...'); end;
  % inicializa ventana, variables y menu
  GFinicia(handles,2);
  [FileName Path]=uigetfile({'*.EXP;*.exp'}, 'Archivo a Cortar',DIR_TRAB);
  if (FileName ~=0)
      ACCION=4;
      % llenar datos
      [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS,PCURVAS,LTIME,HEADLIN,ACCION,handles,FileName,Path);
      if HAYCUR
          % Ajuste de Menu, ajuste y visualización de ejes
          GFEnmenu(0);
          %HCURVAS(50)=1;
          GFAdjustaxis(handles,ACCION,LTIME);
          CFSetejes(handles,1);
          GFVeraxis(handles,0);
      else
          warndlg('No existen datos para la curva','Mensaje de Archivo');
          % inicializa ventana, variables y menu
          GFinicia(handles,2);
      end
  end
  if IDEBUG; disp('...CFLoadarch'); end;
end