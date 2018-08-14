function UPSCalcula(handles)
global PCURVAS;
global HCURVAS;
global ACCION;
global GCV;

ACCION=5.1;
set(handles.UIP1,'Visible','off');
nmet=get(handles.RB1,'Value')+get(handles.RB2,'Value')*2+get(handles.RB3,'Value')*3;
  for j=1:3
      if HCURVAS(GCV(j,1)) % datos en la curva
          GFView(handles,ACCION,j,'on');
          switch nmet
              case 1
                  [v1 p1 v2 p2]=UPSGElimina(GCV(j,11));
                  % v1 : valores máximos
                  % p1 : posiciones máximos
                  % v2 : valores mínimos
                  % p2 : posiciones mínimos
              case 2
              case 3
          end
          n=length(PCURVAS(GCV(j,11),:));
          l=length(v1);
          lf=int2str(l);
          PCURVAS(GCV(j,15),:)=[l v1 zeros(1,n-(l+1))]; % valores maximos
          PCURVAS(GCV(j,15),l+5)=0; % no hay valores para aceptar
          PCURVAS(GCV(j,16),:)=[l p1 zeros(1,n-(l+1))]; % posiciones maximos
          
          PCURVAS(GCV(j,17),:)=[l v2 zeros(1,n-(l+1))]; % valores minimos
          PCURVAS(GCV(j,18),:)=[l p2 zeros(1,n-(l+1))]; % posiciones minimos
          
          PCURVAS(GCV(j,20),:)=[0 zeros(1,n-1)]; % valores upstroke
          PCURVAS(GCV(j,21),:)=[0 zeros(1,n-1)]; % posiciones upstroke
          
          GFBorra_Hand(GCV(j,3),1);
          GFBorra_Hand(GCV(j,4),1);
          GFBorra_Hand(GCV(j,5),1);
          hold(HCURVAS(10+j),'on');
          HCURVAS(GCV(j,4))=plot(HCURVAS(10+j),p1,v1,'ws','visible','on');
          HCURVAS(GCV(j,5))=plot(HCURVAS(10+j),p2,v2,'rs','visible','on');
          hold(HCURVAS(10+j),'off');
          switch j
              case 1
                  set(handles.TXADM31MA,'String',lf);
              case 2
                  set(handles.TXADM32MA,'String',lf);
              case 3
                  set(handles.TXADM33MA,'String',lf);
          end
      end
  end
end