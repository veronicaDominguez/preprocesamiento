% *****                FILTRAR CURVAS                            *****
% --------------------------------------------------------------------
% -- Despliega una caja de dialogo y pide el archivo a abrir para   --
% -- filtrar curva, verificando que sea No Nulo                     --
% -- Llama a la función de llenado de datos e inicializa            --
% -- las opciones del menu, ventana y ajustes para Funcionalidad de --
% -- Filtrado de Curvas                                             --
% --------------------------------------------------------------------
function PFLoadarch(handles)
% handles    estructura con punteros a datos de la GUI
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  global IDEBUG;
  if IDEBUG; disp('PFLoadarch...'); end;
  % inicializa ventana, variables y menu
  GFinicia(handles,2);
  [FileName Path]=uigetfile({'*.EXP;*.exp;*.CUT;*.cut*.TMP;*.tmp'}, 'Archivo a Limpiar',DIR_TRAB);
  if (FileName ~=0)
      ACCION=1;
      % llenar datos
      [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS , PCURVAS , LTIME, HEADLIN , ACCION , handles , FileName , Path);
      if HAYCUR
          % Ajuste de Menu, ajuste y visualización de ejes
          GFEnmenu(3);
          GFAdjustaxis(handles,ACCION,LTIME);
          GFVeraxis(handles,0);
      else
          warndlg('No existen datos para la curva','Mensaje de Archivo');
          % inicializa ventana, variables y menu
          GFinicia(handles,2);
      end
  end
  if IDEBUG; disp('...PFLoadarch'); end;
end