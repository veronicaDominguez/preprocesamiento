% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Lee archivo de texto con los datos y los transfiere a array    --
% -- para ser procesados por las diferentes funcionalidades         --
% --------------------------------------------------------------------
function [DTCM DTCT DTCA DTCB DTCC DTCD DTCE DTCF TITCOL FILEX MMUP]=GFLeefile5c(archivo,verm,ncolumnas)
% archivo    nombre de archivo a leer con los datos de las curvas
% verm       indicación si muestra ventana con mensaje de falla o no
% ncolumnas  numero de columnas de datos que se van a leer
%
% DTCM       Array con los puntos de las muestras
% DTCT       Array con el tiempo en modo texto
% DTCA       Array de curva A (VFSCI)
% DTCB       Array de curva B (VFSCD)
% DTCC       Array de curva C (PSA)
% DTCD       Array de curva D (CO2)
% DTCE       Array de curva E (ECG)
% DTCF       Array de curva F (ADIC)
% TITCOL     Array con los nombres de las columnas
% FILEX      0 = no se encuentra archivo para leer
% MMUP       Array con el tipo de punto (min, max, ups)
global IDEBUG;
if IDEBUG; disp('GFLeefile5c...'); end;
TITCOL={[] []};
FILEX=1;
[fid,message] = fopen(archivo, 'r');
if fid ~=-1      % archivo existe para leer
    linhd=0;     % contar lineas de encabezado
    NCOL=0;
    hbar = waitbar(0,'Por Favor Espere...');
    while linhd < 7 && ~feof(fid)  % lee encabezado
        linhd = linhd + 1;
        tline=fgetl(fid);
        switch linhd
                case 1
                    [a b]=strtok(tline,':');
                    [ts a]=strtok(b,':');
                    pname=cellstr(ts);
                case 2
                    [a b]=strtok(tline,':');
                    [a c]=strtok(b,':');
                    ts=strcat(a,c);
                    pbird=cellstr(ts);
                case 3
                    [a b]=strtok(tline,':');
                    [a c]=strtok(b,':');
                    ts=strcat(a,c);
                    pfech=cellstr(ts);
                case 4
                    [a b]=strtok(tline,':');
                    [ts a]=strtok(b,':');
                    prate=cellstr(ts);
                case 5
                    k=4;
                    while findstr(char(9),tline)>0;
                      k=k+1;
                      [a b]=strtok(tline,char(9));
                      ts=cellstr(a);
                      TITCOL(k,1)=ts;
                      TITCOL(k,2)=cellstr('x');
                      tline=b;
                    end
                    NCOL=k;
                case 6
                    for k=5:NCOL
                      [a b]=strtok(tline,char(9));
                      ts=cellstr(a);
                      TITCOL(k,2)=ts;
                      tline=b;
                    end              
        end
        lbar=linhd/12;
        waitbar(lbar);
    end
    fclose(fid);
    numcol=NCOL-5;
    A=importdata(archivo,'\t',6);   % lee archivo
    [ft ct]=size(A.textdata);
    [fd cd]=size(A.data);
    txcd=ncolumnas;
    if (ft-fd)==6 && numcol==7 && cd == txcd && linhd==7
        % procesa archivo leido
        TITCOL(1,1)=pname;
        TITCOL(2,1)=pbird;
        TITCOL(3,1)=pfech;
        TITCOL(4,1)=prate;

        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);
  
        DTCM=A.data(:,1)' +1;
        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);
    
        l=length(DTCM)+6;
        DTCT=A.textdata( 7:l ,1)';
        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);    

        DTCA=A.data(:,2)';
        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);
    
        DTCB=A.data(:,3)';
        %DTCB=A.data(:,5)';
        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);
    
        DTCC=A.data(:,4)';
        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);
        
        DTCD=A.data(:,5)'; %editado, se añaden las 3 lineas de abajo
        linhd = linhd + 1;
        lbar=linhd/12;
        waitbar(lbar);
        
        DTCE=A.data(:,6)';
        
        DTCF=A.data(:,7)';
    
        if txcd==8
            MMUP=A.data(:,8)';
        else
            MMUP=[0];
        end
        clear A;    
        close(hbar);
    else
        DTCM=[0];
        DTCT={'00:00:00:00'};
        DTCA=[0];
        DTCB=[0];
        DTCC=[0];
        DTCD=[0];
        DTCE=[0];
        DTCF=[0];
        MMUP=[0];
        TITCOL(1,1)=cellstr(' ');
        TITCOL(2,1)=cellstr(' ');
        TITCOL(3,1)=cellstr(' ');
        TITCOL(4,1)=cellstr(' ');
        if verm
            warndlg('Formato no Corresponde','Mensaje de Archivo');
        end
        close(hbar);
        FILEX=0;
    end
else
    DTCM=[0];
    DTCT={'00:00:00:00'};
    DTCA=[0];
    DTCB=[0];
    DTCC=[0];
    DTCD=[0];
    DTCE=[0];
    DTCF=[0];
    MMUP=[0];
    TITCOL(1,1)=cellstr(' ');
    TITCOL(2,1)=cellstr(' ');
    TITCOL(3,1)=cellstr(' ');
    TITCOL(4,1)=cellstr(' ');
    if verm
        warndlg(strcat('Error de apertura -',message),'Mensaje de Archivo');
    end
    FILEX=0;
end
if IDEBUG; disp('...GFLeefile5c'); end;
end
