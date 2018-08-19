% *****                CORTAR CURVAS                             *****
% --------------------------------------------------------------------
% -- Opciones de la funcionalidad de Cortar Curvas                  --
% -- Mover hora inicio y termino para seleccionar el pedazo de      --
% -- curva que se desea procesar                                    --
% --------------------------------------------------------------------
function CFSetejes(handles,modo)
% handles    estructura con punteros a datos de la GUI
% modo       numero de opción seleccionada
global HCURVAS;
global LTIME;
global IDEBUG;
if IDEBUG; disp('CFSetejes...'); end;
inic=0;
fini=0;
if HCURVAS(1)+HCURVAS(2)+HCURVAS(3)+HCURVAS(71) > 0
  switch modo
      case 1
         % escribe solo las horas 
         set(handles.CF_EDMHINICIO,'String',LTIME(HCURVAS(62)) );
         set(handles.CF_EDMHFINAL,'String',LTIME(HCURVAS(63)) );
      case 2
         % selecciona la hora sobre el grafico, linea lado izquierdo
         [r,s]=ginput(1); % toma un puntos con el mouse
         ti=round(r(1));
         HCURVAS(62)=ti;
         inic=1;
      case 3
         % selecciona la hora sobre el grafico, linea lado derecho
         [r,s]=ginput(1);
         ti=round(r(1));
         HCURVAS(63)=ti;
         fini=1;
      case 4
         % resta 1 a la linea lado izquierdo
         HCURVAS(62)=HCURVAS(62)-1;
         if HCURVAS(62) < HCURVAS(16)
            HCURVAS(62)=HCURVAS(16);
         end
         inic=1;
      case 5
         % suma 1 a la linea lado izquierdo
         HCURVAS(62)=HCURVAS(62)+1;
         if HCURVAS(62) >= HCURVAS(63)
            HCURVAS(62)=HCURVAS(63)-1;
         end
         inic=1;
      case 6
         % resta 1 a la linea lado derecho
         HCURVAS(63)=HCURVAS(63)-1;
         if HCURVAS(63) <= HCURVAS(62)
            HCURVAS(63)=HCURVAS(62)+1;
         end
         fini=1;
      case 7
         % suma 1 a la linea lado derecho
         HCURVAS(63)=HCURVAS(63)+1;
         if HCURVAS(63) > HCURVAS(17)
            HCURVAS(63)=HCURVAS(17);
         end
         fini=1;
      case 10
          % ajusto hora inicio sobre el texto
          hini=get(handles.CF_EDMHINICIO,'String');
          l=length(LTIME);
          k=1;
          pos=0;
          while k<=l && pos==0
              if strcmp(LTIME(k),hini)
                  pos=k;
              end;
              k=k+1;
          end
          if pos > 0
              HCURVAS(62)=pos;
              inic=1;
          end
      case 11
          % ajusto hora final sobre el texto
          hfin=get(handles.CF_EDMHFINAL,'String');
          l=length(LTIME);
          k=1;
          pos=0;
          while k<=l && pos==0
              if strcmp(LTIME(k),hfin)
                  pos=k;
              end;
              k=k+1;
          end
          if pos > 0
              HCURVAS(63)=pos;
              fini=1;
          end
  end
  % Verifica si se movió hora de inicio y ajusta los datos
  if inic == 1
     set(handles.CF_EDMHINICIO,'String',LTIME(HCURVAS(62)) );
     hold(HCURVAS(15),'on');
     delete(HCURVAS(60));
     HCURVAS(60)=plot(HCURVAS(15),[HCURVAS(62) HCURVAS(62)],[HCURVAS(20) HCURVAS(21)],'y-');
     hold(HCURVAS(15),'off');
  end
  % Verifica si se movió hora final y ajusta los datos
  if fini == 1
     set(handles.CF_EDMHFINAL,'String',LTIME(HCURVAS(63)) );
     hold(HCURVAS(15),'on');
     delete(HCURVAS(61));
     HCURVAS(61)=plot(HCURVAS(15),[HCURVAS(63) HCURVAS(63)],[HCURVAS(20) HCURVAS(21)],'y-');
     hold(HCURVAS(15),'off');
  end
end
if IDEBUG; disp('...CFSetejes');  end;