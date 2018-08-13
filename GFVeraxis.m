% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- oculta, visualiza y posiciona las ventanas según la cantidad   --
% -- seleccionada y los parámetros entregados                       --
% --------------------------------------------------------------------
function GFVeraxis(handles,NPOS)
% handles    estructura con punteros a datos de la GUI
% NPOS       posición del ticket donde la ventana 3 puede visualizar otras
%            curvas
global GCV;
global VCFG;
global PCURVAS;
global HCURVAS;
global ACCION;
global IDEBUG;
if IDEBUG; disp('GFVeraxis...'); end;
switch ACCION
    case 4  % cortar curvas
          GFView(handles,ACCION,1,'on');
          for w=1:6
              if HCURVAS(GCV(w,1))
                  set(HCURVAS(GCV(w,2)),'Visible','on');
              end
          end
    otherwise
          cbv1=get(handles.CB1,'Value');
          cbv2=get(handles.CB2,'Value');
          cbv3=get(handles.CB3,'Value');
          cbv4=get(handles.CB4,'Value');
          cbvt=cbv1+cbv2+cbv3+cbv4;
          procven=true;
          switch NPOS  % valida cantidad de ventanas a visualizar
              case 1
                  if ACCION==6.1
                      set(handles.CB1,'Value',~cbv1);
                      procven=false;
                  end
                  if (cbv1 && cbvt > 3) || (HCURVAS(GCV(1,1))==0)
                      set(handles.CB1,'Value',0);
                      cbv1=0;
                      procven=false;
                  end
              case 2
                  if ACCION==6.1
                      set(handles.CB2,'Value',~cbv2);
                      procven=false;
                  end
                  if (cbv2 && cbvt > 3) || (HCURVAS(GCV(2,1))==0)
                      set(handles.CB2,'Value',0);
                      cbv2=0;
                      procven=false;
                  end
              case 3
                  if ACCION==6.1
                      set(handles.CB3,'Value',~cbv3);
                      procven=false;
                  end
                  if (cbv3 && cbvt > 3) || (HCURVAS(GCV(3,1))==0)
                      set(handles.CB3,'Value',0);
                      cbv3=0;
                      procven=false;
                  end
              case 4
                  if ACCION==6.1
                      set(handles.CB4,'Value',~cbv4);
                      procven=false;
                  end
                  if (cbv4 && cbvt > 3) || (HCURVAS(GCV(4,1))==0)
                      set(handles.CB4,'Value',0);
                      cbv4=0;
                      procven=false;
                  end
              case 10
          end
          switch ACCION
              case 6
                  GFView(handles,ACCION,11,'on');
                  if cbvt == 1
                      %CBTFC1A para comparar señales
                      GFView(handles,ACCION,10,'on');
                      if get(handles.CBTFC1A,'Value') == 0
                          ACCION=6.1;
                          if cbv1 == 1
                              hold(HCURVAS(11),'on');
                              GFBorra_Hand( GCV(1,2) ,1);
                              GFBorra_Hand( GCV(1,5) ,1);
                              HCURVAS(GCV(1,2))=plot(HCURVAS(11),PCURVAS(1,:),PCURVAS(GCV(1,11),:),'b-','visible','off');
                              hold(HCURVAS(11),'off');
                              hold(HCURVAS(12),'on');
                              GFBorra_Hand( GCV(2,2) ,1);
                              GFBorra_Hand( GCV(2,5) ,1);
                              HCURVAS(GCV(2,2))=plot(HCURVAS(12),PCURVAS(1,:),PCURVAS(GCV(1,13),:),'r-','visible','off');
                              hold(HCURVAS(12),'off');
                              cbv2=1;
                          else
                              if cbv2 == 1
                                  hold(HCURVAS(11),'on');
                                  GFBorra_Hand( GCV(1,2) ,1);
                                  GFBorra_Hand( GCV(1,5) ,1);
                                  HCURVAS(GCV(1,2))=plot(HCURVAS(11),PCURVAS(1,:),PCURVAS(GCV(2,11),:),'b-','visible','off');
                                  hold(HCURVAS(11),'off');
                                  hold(HCURVAS(12),'on');
                                  GFBorra_Hand( GCV(2,2) ,1);
                                  GFBorra_Hand( GCV(2,5) ,1);
                                  HCURVAS(GCV(2,2))=plot(HCURVAS(12),PCURVAS(1,:),PCURVAS(GCV(2,13),:),'r-','visible','off');
                                  hold(HCURVAS(12),'off');
                                  cbv1=1;
                              end
                          end
                      end
                  else
                      GFView(handles,ACCION,10,'off');
                      set(handles.CBTFC1A,'Value',1);
                  end
              case 6.1
                  if get(handles.CBTFC1A,'Value') == 1
                      if cbv1 == 1 || cbv2 == 1
                          hold(HCURVAS(11),'on');
                          delete( HCURVAS(GCV(1,2)) );
                          HCURVAS(GCV(1,2))=plot(HCURVAS(11),PCURVAS(1,:),PCURVAS(GCV(1,11),:),'b-','visible','off');
                          HCURVAS(GCV(1,5))=plot(HCURVAS(11),PCURVAS(1,:),PCURVAS(GCV(1,13),:),'r-','visible','off');
                          hold(HCURVAS(11),'off');
                          hold(HCURVAS(12),'on');
                          delete( HCURVAS(GCV(2,2)) );
                          HCURVAS(GCV(2,2))=plot(HCURVAS(12),PCURVAS(1,:),PCURVAS(GCV(2,11),:),'b-','visible','off');
                          HCURVAS(GCV(2,5))=plot(HCURVAS(12),PCURVAS(1,:),PCURVAS(GCV(2,13),:),'r-','visible','off');
                          hold(HCURVAS(12),'off');
                      end
                      ACCION=6;
                  end
          end

          if procven      % oculta y visualiza ventanas según selección
              GFView(handles,ACCION,1,'off');
              GFView(handles,ACCION,2,'off');
              GFView(handles,ACCION,3,'off'); 
              GFView(handles,ACCION,4,'off'); 
              xwin31=cbv1;
              xwin32=cbv2;
              %xwin33=cbv3+cbv4;
              xwin33=cbv3;
              xwin34=cbv4;
              
              nc3=str2double(VCFG(13));
%               if NPOS > 2  && NPOS < 10
%                   if xwin33
%                       HCURVAS(8)=1;
%                   else
%                       HCURVAS(8)=0;
%                   end
%                   if nc3~=NPOS
%                       hold(HCURVAS(13),'on');
%                       lsup=max(PCURVAS(GCV(NPOS,11),:));
%                       linf=min(PCURVAS(GCV(NPOS,11),:));
%                       set(handles.AX33YMX,'string',num2str(lsup))
%                       set(handles.AX33YMN,'string',num2str(linf))
%                       HCURVAS(40)=linf;
%                       HCURVAS(41)=lsup;
%                       hold(HCURVAS(13),'off');
%                       VCFG(13)=cellstr(num2str(NPOS));
%                       set(HCURVAS(13),'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
%                       set(HCURVAS(13),'YLim',[HCURVAS(40) HCURVAS(41)]); % limites del eje Y
%                       switch NPOS
%                           case 3
%                               ylabel(HCURVAS(13),'VFSCD');
%                           case 4
%                               %ylabel(HCURVAS(13),'CO2');
%                           case 5
%                               ylabel(HCURVAS(13),'ECG');
%                           case 6
%                               ylabel(HCURVAS(13),'ADIC');
%                       end
%                   end
%               end
              

          
              nc1=str2double(VCFG(11));
              nc2=str2double(VCFG(12));
              nc3=str2double(VCFG(13));
          
          nwin=xwin31+xwin32+xwin33;

%          switch nwin
%              case 1
%                  if xwin31 == 1
%                      set(handles.AX31,'Position',[79 34 808 592]);  % 1 ventana
%                      set(handles.AX31YMX,'Position',[887 606 51 20]);
%                      set(handles.AX31YMN,'Position',[887 34 51 20]);
%                      Pos_botwin(handles,1,294);
%                  end
%                  if xwin32 == 1
%                      set(handles.AX32,'Position',[79 34 808 592]);  % 1 ventana
%
%                      set(handles.AX32YMX,'Position',[887 606 51 20]);
%                      set(handles.AX32YMN,'Position',[887 34 51 20]);
%                      Pos_botwin(handles,2,294);
%                  end
%                  if xwin33 == 1
%                      set(handles.AX33,'Position',[79 34 808 592]);  % 1 ventana
%                      set(handles.AX33YMX,'Position',[887 606 51 20]);
%                      set(handles.AX33YMN,'Position',[887 34 51 20]);
%                      Pos_botwin(handles,3,294);
%                  end          
%              case 2
%                  if xwin31 == 1 && xwin32 == 1
%                     set(handles.AX31,'Position',[79 349 808 277]);  % 2 ventanas, ventana superior
%                      set(handles.AX32,'Position',[79 34 808 277]);  % 2 ventanas, ventana inferior
%                      set(handles.AX31YMX,'Position',[887 606 51 20]);
%                      set(handles.AX31YMN,'Position',[887 348 51 20]);
%                      set(handles.AX32YMX,'Position',[887 291 51 20]);
%                      set(handles.AX32YMN,'Position',[887 34 51 20]);                      
%                      Pos_botwin(handles,1,449);
%                      Pos_botwin(handles,2,135);
%                  end
%                  if xwin31 == 1 && xwin33 == 1
%                      set(handles.AX31,'Position',[79 349 808 277]);  % 2 ventanas, ventana superior
%                      set(handles.AX33,'Position',[79 34 808 277]);  % 2 ventanas, ventana inferior
%                      set(handles.AX31YMX,'Position',[887 606 51 20]);
%                      set(handles.AX31YMN,'Position',[887 348 51 20]);
%                      set(handles.AX33YMX,'Position',[887 291 51 20]);
%                      set(handles.AX33YMN,'Position',[887 34 51 20]);                      
%                      Pos_botwin(handles,1,449);
%                      Pos_botwin(handles,3,135);
%                  end          
%                  if xwin32 == 1 && xwin33 == 1
%                      set(handles.AX32,'Position',[79 349 808 277]);  % 2 ventanas, ventana superior
%                      set(handles.AX33,'Position',[79 34 808 277]);  % 2 ventanas, ventana inferior
%                      set(handles.AX32YMX,'Position',[887 606 51 20]);
%                      set(handles.AX32YMN,'Position',[887 348 51 20]);
%                      set(handles.AX33YMX,'Position',[887 291 51 20]);
%                      set(handles.AX33YMN,'Position',[887 34 51 20]);                      
%                      Pos_botwin(handles,2,449);
%                      Pos_botwin(handles,3,135);
%                  end
%              case 3
%                  set(handles.AX31,'Position',[79 448 808 178]);  % 3 ventanas, ventana superior
%                  set(handles.AX32,'Position',[79 239 808 178]);  % 3 ventanas, ventana medio
%                  set(handles.AX33,'Position',[79 34 808 178]);  % 3 ventanas, ventana inferior
%             
%                  set(handles.AX31YMX,'Position',[887 606 51 20]);
%                  set(handles.AX31YMN,'Position',[887 447 51 20]);
%                  set(handles.AX32YMX,'Position',[887 397 51 20]);
%                  set(handles.AX32YMN,'Position',[887 238 51 20]);
%                  set(handles.AX33YMX,'Position',[887 192 51 20]);
%                  set(handles.AX33YMN,'Position',[887 33 51 20]);
%                  Pos_botwin(handles,1,499);
%                  Pos_botwin(handles,2,290);
%                  Pos_botwin(handles,3,85);
%          end
              if xwin31
                  GFView(handles,ACCION,1,'on');
              end
              if xwin32
                  GFView(handles,ACCION,2,'on');
              end
              if xwin33
                  GFView(handles,ACCION,3,'on');
              end
              if xwin34
                  GFView(handles,ACCION,4,'on');
              end
          if ACCION == 5
              set(handles.MINMAX,'Visible','on');
              set(handles.UIP1,'Visible','on');
              set(handles.RB1,'Value',1);
              set(handles.RB2,'Value',0);
              set(handles.RB3,'Value',0);
          end
          end

end
if IDEBUG; disp('...GFVeraxis'); end;
end
  

% --------------------------------------------------------------------
% -- posiciona botones en la ventana principal dependiendo del      --
% -- número de ventanas con curvas que se encuentra visible         --
% --------------------------------------------------------------------
function Pos_botwin(handles,nwin,pos)
    switch nwin
        case 1
            set(handles.ELIMSPK31,'Position',[ 887 pos+0  78 25]); % pos
            set(handles.CBMED31  ,'Position',[ 976 pos+30 65 20]); % pos+30
            set(handles.OFMED31  ,'Position',[1043 pos+30 20 18]); % pos+30
            set(handles.CBBUT31  ,'Position',[ 976 pos+12 65 20]); % pos+12
            set(handles.OFBUT31  ,'Position',[1043 pos+12 20 18]); % pos+12
            set(handles.TE1BUT31 ,'Position',[1064 pos+12 20 15]); % pos+12
            set(handles.FCFBUT31 ,'Position',[1084 pos+12 25 18]); % pos+12
            set(handles.CBV31_1  ,'Position',[ 887 pos+89 93 15]); % pos+89
            set(handles.CBV31_2  ,'Position',[ 887 pos+75 93 15]); % pos+75
            set(handles.CBV31_3  ,'Position',[ 887 pos+61 93 15]); % pos+61
            set(handles.CBV31_4  ,'Position',[ 887 pos+47 93 15]); % pos+61
            
            set(handles.CBSPL31  ,'Position',[ 976 pos-8 75 20]);  % filtro - texto apl fil but v1
            set(handles.FNSPL31  ,'Position',[1047 pos-7 16 18]);  % filtro - grad fil but v1
            %set(handles.TE1SPL31 ,'Position',[1064 pos-11 20 20]); % filtro - texto FC fil but v1
            
            set(handles.PBADM31MA ,'Position',[985  pos+57 76 20]); % Upstrk - Bot marcar pto  V1
            set(handles.PBADM31ME ,'Position',[985  pos+38 76 20]); % Upstrk - Bot elim pto V1
            set(handles.PBADM31MO ,'Position',[985  pos+19 76 20]); % Upstrk - Bot aceptar V1
            set(handles.TXADM31MA ,'Position',[920  pos+38 46 20]); % Upstrk - Caja nro latidos
            set(handles.TXTADM31MA ,'Position',[920  pos+55 46 20]); % Upstrk - Caja nro latidos
        case 2
            set(handles.ELIMSPK32,'Position',[ 887 pos+0  78 25]); % pos
            set(handles.CBMED32  ,'Position',[ 976 pos+30 65 20]); % pos+30
            set(handles.OFMED32  ,'Position',[1043 pos+30 20 18]); % pos+30
            set(handles.CBBUT32  ,'Position',[ 976 pos+12 65 20]); % pos+12
            set(handles.OFBUT32  ,'Position',[1043 pos+12 20 18]); % pos+12
            set(handles.TE1BUT32 ,'Position',[1064 pos+12 20 15]); % pos+12
            set(handles.FCFBUT32 ,'Position',[1084 pos+12 25 20]); % pos+12
            set(handles.CBV32_1  ,'Position',[ 887 pos+89 93 15]); % pos+89
            set(handles.CBV32_2  ,'Position',[ 887 pos+75 93 15]); % pos+75
            set(handles.CBV32_3  ,'Position',[ 887 pos+61 93 15]); % pos+61
            set(handles.CBV32_4  ,'Position',[ 887 pos+47 93 15]); % pos+61
            
            set(handles.CBSPL32  ,'Position',[ 976 pos-8 75 20]);  % filtro - texto apl fil but v1
            set(handles.FNSPL32  ,'Position',[1047 pos-7 16 18]);  % filtro - grad fil but v1
            %set(handles.TE1SPL32 ,'Position',[1064 pos-11 20 20]); % filtro - texto FC fil but v1
            
            set(handles.PBADM32MA ,'Position',[985  pos+57 76 20]); % Upstrk - Bot marcar pto  V1
            set(handles.PBADM32ME ,'Position',[985  pos+38 76 20]); % Upstrk - Bot elim pto V1
            set(handles.PBADM32MO ,'Position',[985  pos+19 76 20]); % Upstrk - Bot aceptar V1
            set(handles.TXADM32MA ,'Position',[920  pos+38 46 20]); % Upstrk - 
            set(handles.TXTADM32MA ,'Position',[920  pos+55 46 20]); % Upstrk - 
        case 3
            set(handles.ELIMSPK33,'Position',[ 887 pos+0  78 25]); % pos
            set(handles.CBMED33  ,'Position',[ 976 pos+30 65 20]); % pos+30
            set(handles.OFMED33  ,'Position',[1043 pos+30 20 18]); % pos+30
            set(handles.CBBUT33  ,'Position',[ 976 pos+12 65 20]); % pos+12
            set(handles.OFBUT33  ,'Position',[1043 pos+12 20 18]); % pos+12
            set(handles.TE1BUT33 ,'Position',[1064 pos+12 20 15]); % pos+12
            set(handles.FCFBUT33 ,'Position',[1084 pos+12 25 20]); % pos+12
            set(handles.CBV33_1  ,'Position',[ 887 pos+89 93 15]); % pos+89
            set(handles.CBV33_2  ,'Position',[ 887 pos+75 93 15]); % pos+75
            set(handles.CBV33_3  ,'Position',[ 887 pos+61 93 15]); % pos+61
            set(handles.CBV33_4  ,'Position',[ 887 pos+47 93 15]); % pos+61
            
            set(handles.CBSPL33  ,'Position',[ 976 pos-8 75 20]);  % filtro - texto apl fil but v1
            set(handles.FNSPL33  ,'Position',[1047 pos-7 16 18]);  % filtro - grad fil but v1
            %set(handles.TE1SPL33 ,'Position',[1064 pos-11 20 20]); % filtro - texto FC fil but v1
            
            set(handles.PBADM33MA ,'Position',[985  pos+57 76 20]); % Upstrk - Bot marcar pto  V1
            set(handles.PBADM33ME ,'Position',[985  pos+38 76 20]); % Upstrk - Bot elim pto V1
            set(handles.PBADM33MO ,'Position',[985  pos+19 76 20]); % Upstrk - Bot aceptar V1
            set(handles.TXADM33MA ,'Position',[920  pos+38 46 20]); % Upstrk - 
            set(handles.TXTADM33MA ,'Position',[920  pos+55 46 20]); % Upstrk -
    end
end