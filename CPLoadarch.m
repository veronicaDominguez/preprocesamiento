% *****                PROCESAR CURVAS                           *****
% --------------------------------------------------------------------
% -- Despliega una caja de dialogo y pide el archivo a abrir para   --
% -- procesar curva, verificando que sea No Nulo                    --
% -- Llama a la función de llenado de datos e inicializa            --
% -- las opciones del menu, ventana y ajustes para Funcionalidad de --
% -- Procesar curvas                                                --
% --------------------------------------------------------------------
function CPLoadarch(handles)
% handles    estructura con punteros a datos de la GUI
  global ACCION;
  global HCURVAS;
  global PCURVAS;
  global LTIME;
  global HEADLIN;
  global DIR_TRAB;
  global HCURVA2;
  global PCURVA2;
  global IDEBUG;
  if IDEBUG; disp('CPLoadarch...'); end;
  % inicializa ventana, variables y menu
  GFinicia(handles,2);
  [FileName Path]=uigetfile({'*.UPS;*.ups'}, 'Archivo a Procesar',DIR_TRAB);
  if (FileName ~=0)
      ACCION=7;
      [HCURVAS PCURVAS LTIME HEADLIN HAYCUR]=GFFillData(HCURVAS,PCURVAS,LTIME,HEADLIN,ACCION,handles,FileName,Path);
      if HAYCUR
          GFEnmenu(5);
          GFAdjustaxis(handles,ACCION,LTIME);
          CFSetejes(handles,1);
          GFVeraxis(handles,0);

          PCURVA2=zeros(30,length(PCURVAS(1,:)));
          HCURVA2=zeros(30);
          

      else
          warndlg('No existen datos para la curva','Mensaje de Archivo');
          GFinicia(handles,2);
      end
  end
  if IDEBUG; disp('...CPLoadarch'); end;
end