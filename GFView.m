% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Oculta o visualiza elementos de la pantalla segun los          --
% -- parametros de ACCION, NVEN y MODO                              --
% --------------------------------------------------------------------
function GFView(handles,ACCION,NVEN,MODO)
% handles    estructura con punteros a datos de la GUI
% ACCION = modo de trabajo
%        = 0 ; desaparecer todo de la ventana
%        = 1 ; Procesar Archivo
%        = 2 ; Convertir Archivos de Ronney a Nuevo Formato Santiago (NF)
%        = 3 ; Convertir Archivos de texto Santiago a Nuevo Formato Santiago (NF)
%        = 4 ; Cortar Archivos
%        = 5 ; Calcular Minimos, Maximos y Upstroke
% NVEN       numero de ventana para realizar accion
% MODO       on = visualizar ; off = ocultar 
global IDEBUG;
if IDEBUG; disp('GFView...'); end;

set(handles.PanelSujeto,'Visible', 'on');

switch ACCION
    case 0  % inicializar ventana ocultando elementos
        set(handles.GF_EDFNAME,'String','');
        set(handles.GF_EDSNAME,'String','');
        set(handles.GF_EDTMUES,'String','');
        set(handles.GF_EDFMUES,'String','');
        
        %Paneles
        set(handles.PanelSignal,'Visible','off');
        set(handles.PanelData,'Visible','off');
        set(handles.PanelCalcMMU,'Visible','off');
        set(handles.TCC_PICOMP,'Visible','off');
        set(handles.PanelCutSignal,'Visible','off');
        set(handles.PanelPCCRAP,'Visible','off');
        
        ver_bot_cut(handles,'off');
    
        ver_ven_gen(handles,1,'off');
        ver_bot_fil(handles,1,'off');
        set(handles.CBMED31,'Value',0);         % filtro - aplic fil med v1
        set(handles.CBBUT31,'Value',0);         % filtro - aplic fil but v1
        set(handles.CBSPL31,'Value',0);         % filtro - aplic fil spli v1
        set(handles.CBV31_1,'Value',1);         % filtro - ver señal orig v1
        set(handles.CBV31_2,'Value',1);         % filtro - ver señal f med v1
        set(handles.CBV31_3,'Value',1);         % filtro - ver señal f but v1
        set(handles.CBV31_4,'Value',1);         % filtro - ver señal f but v1

        ver_ven_gen(handles,2,'off');
        ver_bot_fil(handles,2,'off');
        set(handles.CBMED32,'Value',0);         % filtro - aplic fil med v2
        set(handles.CBBUT32,'Value',0);         % filtro - aplic fil but v2
        set(handles.CBSPL32,'Value',0);         % filtro - aplic fil spli v2
        set(handles.CBV32_1,'Value',1);         % filtro - ver señal orig v2
        set(handles.CBV32_2,'Value',1);         % filtro - ver señal f med v2
        set(handles.CBV32_3,'Value',1);         % filtro - ver señal f but v2
        set(handles.CBV32_4,'Value',1); 

        ver_ven_gen(handles,3,'off');
        ver_bot_fil(handles,3,'off')
        set(handles.CBMED33,'Value',0);         % filtro - aplic fil med v3
        set(handles.CBBUT33,'Value',0);         % filtro - aplic fil but v3
        set(handles.CBSPL33,'Value',0);         % filtro - aplic fil spli v3
        set(handles.CBV33_1,'Value',1);         % filtro - ver señal orig v3
        set(handles.CBV33_2,'Value',1);         % filtro - ver señal f med v3
        set(handles.CBV33_3,'Value',1);         % filtro - ver señal f but v3
        set(handles.CBV33_4,'Value',1);
        
        %ver_ven_gen(handles,4,'off');
        ver_bot_fil(handles,4,'off')
        set(handles.CBMED34,'Value',0);         % filtro - aplic fil med v3
        set(handles.CBBUT34,'Value',0);         % filtro - aplic fil but v3
        set(handles.CBSPL34,'Value',0);         % filtro - aplic fil spli v3
        set(handles.CBV34_1,'Value',1);         % filtro - ver señal orig v3
        set(handles.CBV34_2,'Value',1);         % filtro - ver señal f med v3
        set(handles.CBV34_3,'Value',1);         % filtro - ver señal f but v3
        set(handles.CBV34_4,'Value',1);
               
        %set(handles.MINMAX,'Visible','off');    % Upstrk - Obtener min/max
        %set(handles.UPSTRK,'Visible','off');    % Upstrk - Obtener upstroke
        %set(handles.UIP1,'Visible','off');    % Upstrk - Metodos min/max
        
        %set(handles.CBTFC1A,'Visible','off');   % ventana1 -
        ver_ven_gen(handles,11,'off');
        
        ver_bot_mm(handles,1,'off');
        ver_bot_mm(handles,2,'off');
        ver_bot_mm(handles,3,'off');
        ver_bot_mm(handles,4,'off');
        
        set(handles.PanelCO2Filtro,'Visible','off');
        ver_bot_proc1(handles,0,'off');
    case 4          
        ver_bot_cut(handles,'on');
        ver_ven_gen(handles,1,MODO);
        
    case 5
        set(handles.PanelCalcMMU,'Visible','on');
        set(handles.PanelCO2Filtro,'Visible','off');
    otherwise
        
        %Paneles
        set(handles.PanelSujeto,'Visible','on');
        set(handles.PanelSignal,'Visible','on');
        set(handles.PanelData,'Visible','on');
        
        
        %panel datos
        set(handles.CB1,'Visible','on');
        set(handles.CB2,'Visible','on');
        set(handles.CB3,'Visible','on');
        set(handles.CB4,'Visible','on');   
        
        %set(handles.HORAIAX31,'Position',[8 631 72 20]);
        %set(handles.HORAFAX31,'Position',[888 631 72 20]);
        set(handles.HORAIAX31,'Visible','on');
        set(handles.HORAFAX31,'Visible','on');
        
        ver_ven_gen(handles,NVEN,MODO);
        switch ACCION
            case 1
                ver_bot_fil(handles,NVEN,MODO)
            case 5.1
                ver_bot_mm(handles,NVEN,MODO)
            case 7
                ver_bot_proc1(handles,1,MODO);
        end

end
if IDEBUG; disp('...GFView'); end;
end

% --------------------------------------------------------------------
% -- Oculta o visualiza curvas dentro de la ventana                 --
% --------------------------------------------------------------------
function VerCurvas(ncur,modo)
% ncur       numero de curva a ocultar o visualizar
% modo       on = visualizar ; off = ocultar 
global HCURVAS;
ncurvas=length(HCURVAS);
  if ncurvas >= ncur
      if ishandle(HCURVAS(ncur))
          if HCURVAS(ncur) > 0
              set(HCURVAS(ncur),'Visible',modo);
          end
      end
  end
end

% --------------------------------------------------------------------
% -- Oculta o visualiza curvas y ventanas                           --
% --------------------------------------------------------------------
function ver_ven_gen(handles,nven,modo)
% handles    estructura con punteros a datos de la GUI
% nven       numero de ventana para realizar accion
% modo       on = visualizar ; off = ocultar 
 global GCV;
 global HCURVAS;
 global VCFG;
 if nven < 10
     nc=str2double(VCFG(10+nven));
     if nc>0
         VerCurvas(GCV(nc,2),modo)
         VerCurvas(GCV(nc,3),modo)
         VerCurvas(GCV(nc,4),modo)
         VerCurvas(GCV(nc,5),modo)
         VerCurvas(GCV(nc,6),modo)
     end
 end
switch nven
    case 1
        %Para ver la ventana 1 PSA
        set(handles.AX31   ,'Visible',modo);   % ventana1 -
        set(handles.AX31YMX,'Visible',modo);   % ventana1 -
        set(handles.AX31YMN,'Visible',modo);   % ventana1 -
        if strcmp(modo,'on')
            set(handles.AX31,'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
        end
    case 2
        %Para ver la ventana 2 VFSCI
        set(handles.AX32,'Visible'   ,modo);   % ventana2 -
        set(handles.AX32YMX,'Visible',modo);   % ventana2 -
        set(handles.AX32YMN,'Visible',modo);   % ventana2 -
        if strcmp(modo,'on')
            set(handles.AX32,'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
        end
    case 3
        %Para ver la ventana 3 VFSCD
        set(handles.AX33,'Visible'   ,modo);   % ventana3 -
        set(handles.AX33YMX,'Visible',modo);   % ventana3 -
        set(handles.AX33YMN,'Visible',modo);   % ventana3 -
        if strcmp(modo,'on')
            set(handles.AX33,'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
        end
        if strcmp(modo,'off')
            set(handles.AX33,'Visible',modo);
        end
    case 4
        %Para ver la ventana 4 CO2
        set(handles.AX34,'Visible',modo);   % ventana4 -
        set(handles.AX34YMX,'Visible',modo);   % ventana4 -
        set(handles.AX34YMN,'Visible',modo);   % ventana4 -
        if strcmp(modo,'on')
            set(handles.AX34,'XLim',[HCURVAS(18) HCURVAS(19)]); % limites del eje X
            set(HCURVAS(92),'Visible','on');
        end
        if strcmp(modo,'off')
            set(handles.AX34,'Visible',modo);
            set(HCURVAS(92),'Visible','off');
        end
    case 10
        set(handles.CBTFC1A,'Visible',modo);   % ventana1 -
    case 11
        set(handles.TCC_PICOMP,'Visible',modo);   % ventana1 -
        set(handles.TCC_PBEND,'Visible',modo);   % ventana1 -
end
end

% --------------------------------------------------------------------
% -- Oculta o visualiza botones en modo filtar                      --
% --------------------------------------------------------------------
function ver_bot_fil(handles,nven,modo)
% handles    estructura con punteros a datos de la GUI
% nven       numero de ventana para realizar accion
% modo       on = visualizar ; off = ocultar 
global VCFG;
set(handles.PanelPSAMMU,'Visible','off');
set(handles.PanelVFSCIMMU,'Visible','off');
set(handles.PanelVFSCDMMU,'Visible','off');
set(handles.PanelCO2MMU,'Visible','off');
switch nven
    case 1
        set(handles.PanelPSAFiltro,'Visible',modo); % filtro - panel PSA Filtro
    case 2
        set(handles.PanelVFSCIFiltro,'Visible',modo); % filtro - panel VFSC I Filtro
    case 3
%         nc=str2double(VCFG(13));
%         if nc ~= 3
%             modo='off';
%         end
        if get(handles.CB3,'Value')==1
            set(handles.PanelCO2Filtro,'Visible','off'); % filtro - panel CO2 Filtro
            set(handles.CB4,'Value',0); % filtro - panel CO2 Filtro
            set(handles.AX34,'Visible','off'); % filtro - panel CO2 Filtro
            
            set(handles.PanelVFSCDFiltro,'Visible','on'); % filtro - panel VFSC D Filtro
        end
        if get(handles.CB3,'Value')==0
            set(handles.PanelVFSCDFiltro,'Visible','off'); % filtro - panel VFSC D Filtro
        end
    case 4
        if get(handles.CB4,'Value')==1 
            set(handles.PanelCO2Filtro,'Visible','on'); % filtro - panel CO2 Filtro
        end
        if get(handles.CB4,'Value')==0
            set(handles.PanelVFSCDFiltro,'Visible','off'); % filtro - panel VFSC D Filtro
        end
end
end

% --------------------------------------------------------------------
% -- Oculta o visualiza botones en modo cortar curvas               --
% --------------------------------------------------------------------
function ver_bot_cut(handles,modo)
% handles    estructura con punteros a datos de la GUI
% modo       on = visualizar ; off = ocultar 
    set(handles.PanelCutSignal,'Visible',modo);
    set(handles.PanelData,'Visible','off');
        
    set(handles.AX35,'Visible',modo); 
    
    set(handles.CF_PBMINICIO ,'Visible',modo);
    set(handles.CF_PBMFINAL  ,'Visible',modo);
    set(handles.CF_EDMHINICIO,'Visible',modo);
    set(handles.CF_EDMHFINAL ,'Visible',modo);
            
    set(handles.CF_PBBMINICIO,'Visible',modo);
    set(handles.CF_PBFMINICIO,'Visible',modo);
    set(handles.CF_PBBMFINAL ,'Visible',modo);
    set(handles.CF_PBFMFINAL ,'Visible',modo);
    set(handles.CF_PBWRTSEL  ,'Visible',modo);
    set(handles.CF_PBEND     ,'Visible',modo);
end

% --------------------------------------------------------------------
% -- Oculta o visualiza botones en modo calculo de upstroke         --
% --------------------------------------------------------------------
function ver_bot_mm(handles,nven,modo)
% handles    estructura con punteros a datos de la GUI
% nven       numero de ventana para realizar accion
% modo       on = visualizar ; off = ocultar 
set(handles.PanelData,'Visible','off');
set(handles.AX34,'Visible','off');
set(handles.AX34YMX,'Visible','off');
set(handles.AX34YMN,'Visible','off');
switch nven
    case 1
        set(handles.PanelPSAMMU,'Visible',modo);
        set(handles.PBADM31MA,'Visible',modo); % Upstrk - Bot marcar pto V1
        set(handles.PBADM31ME,'Visible',modo); % Upstrk - Bot elim pto V1
        set(handles.PBADM31MO,'Visible',modo); % Upstrk - Bot aceptar V1
        set(handles.TXADM31MA,'Visible',modo); % Upstrk - Caja nro latidos V1
        set(handles.TXTADM31MA,'Visible',modo); % Upstrk - Caja nro latidos V1
    case 2
        set(handles.PanelVFSCIMMU,'Visible',modo);
        set(handles.PBADM32MA,'Visible',modo); % Upstrk - Bot marcar pto V2
        set(handles.PBADM32ME,'Visible',modo); % Upstrk - Bot elim pto V2
        set(handles.PBADM32MO,'Visible',modo); % Upstrk - Bot aceptar V2
        set(handles.TXADM32MA,'Visible',modo); % Upstrk - Caja nro latidos V2
        set(handles.TXTADM32MA,'Visible',modo); % Upstrk - Caja nro latidos V2
    case 3
        set(handles.PanelVFSCDMMU,'Visible',modo);
        set(handles.PBADM33MA,'Visible',modo); % Upstrk - Bot marcar pto V3
        set(handles.PBADM33ME,'Visible',modo); % Upstrk - Bot elim pto V3
        set(handles.PBADM33MO,'Visible',modo); % Upstrk - Bot aceptar V3
        set(handles.TXADM33MA,'Visible',modo); % Upstrk - Caja nro latidos V3
        set(handles.TXTADM33MA,'Visible',modo); % Upstrk - Caja nro latidos V3
end
end

% --------------------------------------------------------------------
% -- Oculta o visualiza botones en modo PAR              --
% --------------------------------------------------------------------
function ver_bot_proc1(handles,nm,modo)
% handles    estructura con punteros a datos de la GUI
% nm         numero de procedimiento en ejecucion
% modo       on = visualizar ; off = ocultar 
    set(handles.PanelPCCRAP,'Visible',modo);    
    set(handles.CP_CBREMUES ,'Visible',modo);
    set(handles.CP_CBPCC1RAP1 ,'Visible',modo);
    set(handles.CP_CBVMED   ,'Visible',modo);
    set(handles.CP_EDVREMUES,'Visible',modo);
    if nm==0
        set(handles.CP_CBVMED ,'Value',0);
        set(handles.CP_CBREMUES   ,'Value',0);
        set(handles.CP_CBPCC1RAP1,'Value',0);
    end
end