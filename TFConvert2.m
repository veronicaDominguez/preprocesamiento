function TFConvert2()
global DIR_TRAB;
% Abriendo el archivo de datos y Filtrando
%fid = fopen(archivo);
disp('TFConvert2...');

[FileNames Path]=uigetfile({'*.DAG;*.dag'}, 'Archivo a Convertir','MultiSelect','on',DIR_TRAB);
nofiles=isequal(FileNames,0);
if ~nofiles
    GFEnmenu(0);
    if iscellstr(FileNames)
        n=length(FileNames);
    else
        n=1;
        FileNames={FileNames};
    end;
    for q=1:n
    FileName=FileNames(q);
    FileName=char(FileName);
    % Fnamer: Nombre de archivo a leer
    Fnamer=strcat(Path,FileName);
    % Fnamew: Nombre de archivo a escribir
    lst=length(char(FileName));
    Fnamew=strcat(Path,'N',FileName(1:lst-3),'EXP');
    [fid,messager] = fopen(Fnamer, 'r') ;
    if fid ~=-1
        [fiw,messagew] = fopen(Fnamew, 'w') ;
        if fiw ~=-1
          hbar = waitbar(0,'Por Favor Espere...');
    %       DEFAULT PARAMETERS

            ISELREGR=2;  % REGRESSION SELECTION FOR RAP AND CrCP
            NCHASET=2;   % DEFAULT NUMBER OF CHANNELS ---> Numero de Canales por defecto
            ISOURCE=2;   % SOURCE OF HR MARKING ( B.PRESS)
            ISPECAS=0;   % SPECIAL CASE OF LPF+RESAMPLING
            NCHAN_DISP=4;  % DEFAULT FOR DISPLAY
            IADAPT=1;      % FIXED OR ADAPTIVE TIME DELAY (IF = 1)
            IVELCH=3;      % 1 OR 2 IF OTHER CHANNEL MISSING
            IVSWAP=0;      % DOES NOT SWAP VELOCITY CHANNELS CH1 --> RIGHT SIDE
            XLAGS=0.50;    % CROSSCORRELATION LAPS DIVIDER
            SCREEN_CO=0;   % SCREEN CATCHER COUNTER
            ICO2_EST=1;    %  CO2 IS ESTIMATED ( = 0 NOT)
            FHECG=5.0;     %  DCG HIGH PASS CUTOFF
            IBEGMIN=1;
            IBEG=1;
            RTHRES=0.65;   %  FOR SUBR. MARKX4
            FRATE=200.0;   % SAMPLING RATE
            IPOS_TINA=5;   % ANALOG CHANNEL POSITION FOR TINA - 1
            ISEL_RAP=1;    % SELECTS RAP/CrCP ESTIMATION SUBROUTINE
            IRAPLEG=0;     % IF =1  INTERPOLATES RAP/CrCP WITH LEGENDRE POLYNOMIALS
            NWINL=10;      % DEFAULT WINDOW WIDTH FOR LEGENDRE INTERPOLATION OF RAP
            NWMED=5;       % MEDIAN FILTER WINDOW WIDTH
            NHRATE=0;      % ALLOWS SIMULATION OF HEART RATE EFFECT - NUMBER OF SAMPLES

            ISWSEL = zeros(1,15);       %  SELECTION SWITCHES

            
    % Leyendo datos
    % precision indica el tipo de dato que se esta leyendo
    % size indica la cantidad de datos del tipo precision

    size = 1;
    precision = 'float32';
    TRES    = fread(fid,size,precision);    % TIME RESOLUTION ---> Resolucion del tiempo
    DFREQ12 = fread(fid,size,precision);    % DOPPLER FREQ  - BOTH CHANNELS ---> Frecuencia Doppler - Ambos Canales
    ANGLE12 = fread(fid,size,precision);    % DOPPLER ANGLE - BOTH CHANNELS ---> Angulo Doppler - Ambos Canales
    FRANGE  = fread(fid,size,precision);    % FREQ RANGE ---> Rango de Frecuencia
    FHETERO = fread(fid,size,precision);    % HETERODYNE FREQUENCY ---> Frecuencia Heterodyne

    precision = 'int32';
    NDATA = fread(fid,size,precision);    % DATA LENGTH ---> Largo de los Datos

    precision = 'uchar';
    YES1  = fread(fid,size,precision);    % SIGNAL IN REVERSE CHANNEL ?   ---> Senal en canal inverso?
    YES2  = fread(fid,size,precision);    % LIMITED RANGE PROCESSING ?    ---> Rango Limitado de procesamiento?
    YES3  = fread(fid,size,precision);    % COUNTER-ALIASING PROCESSING ? ---> Contador-Aliasing de procesamiento?
    YES1  = char(YES1);
    YES2  = char(YES2);
    YES3  = char(YES3);

    precision = 'int16';%¡Le ha dado un codazo Anolio!
    IHFCUT    = fread(fid,size,precision);    % HF CUTOFF
    IPRF      = fread(fid,size,precision);    % PRF USED
    ICORANGE  = fread(fid,size,precision);    % COUNTER ALIASING RANGE
    ITHRSPIK  = fread(fid,size,precision);    % SPIKE REJECTION THRESHOLD ---> Umbral de rechazo de Spike

    precision = 'uchar';
    YES4  = fread(fid,size,precision);    % SPIKE REJECTION USED ? ---> Rechazo de Spike usado??
    YES4  = char(YES4);

    precision = 'int16';
    IFNOT   = fread(fid,size,precision);    % ANALOG SAMPLING RATE ---> Taza de Muestreo Analogo
    IANALOG = fread(fid,size,precision);    % NUMBER OF ANALOG ---> Numero de analogo
    IRANGE1 = fread(fid,size,precision);    % RANGE OF ANALOG CHANNEL 1 ---> Rango del canal analogo 1
    IRANGE2 = fread(fid,size,precision);    % RANGE OF ANALOG CHANNEL 2 ---> Rango del canal analogo 2
    IRANGE3 = fread(fid,size,precision);    % RANGE OF ANALOG CHANNEL 3 ---> Rango del canal analogo 3
    IRANGE4 = fread(fid,size,precision);    % RANGE OF ANALOG CHANNEL 4 ---> Rango del canal analogo 4

    precision = 'uchar';
    size = 9;
    TIME1   = fread(fid,size,precision);    % TIME RECORD STARTS
    TIME2   = fread(fid,size,precision);    % DATA RECORD STARTS
    TIME3   = fread(fid,size,precision);    % TIME RECORD ENDS
    TIME4   = fread(fid,size,precision);    % DATE RECORD ENDS
    TIME1   = char(TIME1');     % HORA INICIO
    TIME2   = char(TIME2');     % FECHA INICIO
    TIME3   = char(TIME3');     % HORA TERMINO
    TIME4   = char(TIME4');     % FECHA TERMINO

    
    
    precision = 'int16';
    size = 2;
    MYCODE  = fread(fid,size,precision);    % usado para codificar el filtrado paso bajo para re-escritura a disco
    
    precision = 'uchar';
    size = 60;
    EMPTY   = fread(fid,size,precision);    % READ  4 TIMES  60 BYTES  ????
    EMPTY   = char(EMPTY');
    p1=findstr(EMPTY(41:55),' ');
    nombre=EMPTY(41:(39+p1(1)));
    EMPTY   = fread(fid,size,precision);    %
    EMPTY   = fread(fid,size,precision);    % 
    EMPTY   = fread(fid,size,precision);    %
    EMPTY   = char(EMPTY');

    IDFREQ1=double(int32(10.0*DFREQ12));    % Real a entero IFIX(10.0*DFREQ12)
    
    DFREQ1=IDFREQ1/100;                     % MHz
    DFREQ2=100.0*(DFREQ12-10.0*DFREQ1);
   
    IANGLE1=int32(ANGLE12);                 %IANGLE1=IFIX(ANGLE12)
    ANGLE1=double(IANGLE1);
    ANGLE2=100.0*(ANGLE12-100.0*ANGLE1);
    if ANGLE1 == 0.0  ANGLE1=0.001; end        
    if ANGLE2 == 0.0  ANGLE2=0.001; end        
    ANGLE1=cos(ANGLE1*3.14159/180.0);
    ANGLE2=cos(ANGLE2*3.14159/180.0);

    %       READ DATA PORTION

    IC=0;                                   % Contador Principal
    % if NDATA >50000; NDATA=50000; end      (OJOJOJOJO)
     % if NDATA >180000  NDATA=180000; end    

                                                        %       READ  COMPLETE DATA - CALIBRATE HERE
                                                        %       SYS_TYPE IS THE SYSTEM TYPE        
                                                        %       001 - CEATRIAL
                                                        %       002 - STROKE PROJECT/JFP (Penny)
                                                        %       003 - OH PROJECT (Brian Carey) 
                                                        %       004 - Arterial Tonometer
    SCAL = zeros(1,4);
    SYS_TYPE = 1;
    CO2CAL=1.0;                  % FOR CEATRIAL PROJECT - IN  kPascals
    TINACAL=1.0;
    if SYS_TYPE == 3
      CO2CAL=1.91;              % WAS 37.0/17.0 in  mmHg - OH PROJECT/Brian
      TINACAL=42.0/22.0;        % IN mmHg - OH PROJECT/Brian/Penny  
    end;        
    if SYS_TYPE == 4
      CO2CAL=20.0;              % FOR TONOMETER
    end;        
    if SYS_TYPE == 2
      TINACAL=48.0/25.1;              % PENNY'S CALIBRATION
    end           
     SCAL(1)=IRANGE1/(10.0*32767.0);   % ABP
     SCAL(3)=IRANGE3/(100.0*32767.0);  % ECG  - NOTE CHANGE - WAS 1000.0

    %       CHANNELS 2 AND 4 DEPEND ON SYSTEM TYPE

    if SYS_TYPE == 2
        SCAL(4)=IRANGE4/(1000.0*32767.0);               % RESPIRATION or TRANSD.   
        SCAL(2)=TINACAL*IRANGE2/(100.0*32767.0);        % TINA ON DIFFERENT CHANNEL
        ISUBCO2=20000;                                  % TEMPORARY - SUBTRACTS TO INCREASE   CO2  DYNAMIC RANGE
    else
        SCAL(2)=CO2CAL*IRANGE2/(100.0*32767.0);         % CO2 cal.   
        SCAL(4)=TINACAL*IRANGE4/(100.0*32767.0);
        ISUBCO2=20000;        
        if SYS_TYPE == 4
            ISUBCO2=0;  % NO SHIFT FOR TONOMETER
        end
    end

    XSUBCO2=ISUBCO2;          %XSUBCO2=FLOAT(ISUBCO2)

    %       GET MULTIPLEXED DATA
    beep;
    CA=0;
    
    % nline: numero de lineas leidas
    tline=strcat('Patient Name:',nombre);
    fprintf(fiw,'%s\r\n',char(tline));  
             
    tline=strcat('birthday:','1:1:0001');
    fprintf(fiw,'%s\r\n',char(tline));
    agno=(TIME2(7:7)-48)*10+(TIME2(8:8)-48);
    mes=(TIME2(4:4)-48)*10+(TIME2(5:5)-48);
    dia=(TIME2(1:1)-48)*10+(TIME2(2:2)-48);
    if agno > 50
        agno=1900+agno;
    else
        agno=2000+agno;
    end
    TIME2=sprintf('%d:%d:%d',dia,mes,agno);
    tline=sprintf('%s%s %s','Examination:',TIME2,TIME1);
    fprintf(fiw,'%s\r\n',char(tline)); 
             
    tline=sprintf('%s %d%s','Sampling Rate:',DFREQ1*100,'Hz');
    fprintf(fiw,'%s\r\n',char(tline));
    fprintf(fiw,'%s\r\n','Time	Sample	VFSCI	VFSCD	PSA	CO2	ECG	ADIC');
    fprintf(fiw,'%s\r\n','HH:mm:ss:ms	N	cm/s	cm/s	mmHg	mmHg	ecg	unid');
    A=sscanf(TIME1,'%d:%d:%d');
    hora=A(1);
    min=A(2);
    seg=A(3);
    mseg=0;
    pmseg=1/DFREQ1;
      for i=1:NDATA,      
        lbar=i/NDATA;
        if lbar > 1; lbar=1; end;
        waitbar(lbar);
        size = 1;
        precision = 'int16';
        MAXFBA  = fread(fid,size,precision);    % MAXIMUM FREQUENCY BIN CHAN. A
        IMWFA   = fread(fid,size,precision);    % IMFW  CHAN. A
        MAXFBB  = fread(fid,size,precision);    % MAXIMUM FREQ. BIN CHA. B
        IMWFB   = fread(fid,size,precision);    % IMFW  CHAN. B

        precision = 'float32';    
        FMOMA   = fread(fid,size,precision);    % FIRST MOMENT CHAN. A ---> primer instante canal A
        SIGPOWA = fread(fid,size,precision);    % SIGNAL POWER CHAN. A ---> intensidad de senal canal A
        FMOMB   = fread(fid,size,precision);    % FIRST MOMENT CHANNEL B ---> primer instante canal B
        SIGPOWB = fread(fid,size,precision);    % SIGNAL POWER CHAN. B ---> intensidad de senal canal B

        precision = 'int16';    
        ADOUT1  = fread(fid,size,precision);    % ANALOG CHANNEL 1 ---> Canal Analogo 1
        ADOUT2  = fread(fid,size,precision);    % ANALOG CHANNEL 2 ---> Canal Analogo 2
        ADOUT3  = fread(fid,size,precision);    % ANALOG CHANNEL 3 ---> Canal Analogo 3
        ADOUT4  = fread(fid,size,precision);    % ANALOG CHANNEL 4 ---> Canal Analogo 4

        IC=IC+1;
        CA=CA+1;
        if IC < 1079995
            IBUFX(CA)=i;
            
            BINUMB=MAXFBA/128.0;
            XVL1=100.0*79.0*(FRANGE*BINUMB)/(DFREQ1*ANGLE1);
            IBUF1(CA)=double(int32(XVL1));                                  % VFSA 1
            IC=IC+1;
            IBUF2(CA)=double(int32(100.0*SCAL(1)*ADOUT1));                  % Presion Sanguinea Arterial
            IC=IC+1;                                                        % Nota - PSA mantenida como segundo canal
            BINUMB2=MAXFBB/128.0;
            XVL2=100.0*79.0*(FRANGE*BINUMB2)/(DFREQ2*ANGLE2);
            IBUF3(CA)=double(int32(XVL2));                                  % VFSA 2
            IC=IC+1;
            IBUF4(CA)=double(int32(100.0*SCAL(2)*ADOUT2-XSUBCO2));          % Canal CO2
            if IANALOG >= 3                                                 % else solo 4 canales
                IC=IC+1;
                IBUF5(CA)=double(int32(100.0*SCAL(3)*ADOUT3));              % Electrocardiograma ECG
                if IANALOG >= 4                                             % else solo 5 canales
                    IC=IC+1;
                    IBUF6(CA)=double(int32(100.0*SCAL(4)*ADOUT4-XSUBCO2));  % ALSO FOR TINA/CO2 ---> tambien para TINA/CO2
                end
            end
            tiempox=sprintf('%0.2d:%0.2d:%0.2d:%0.2d',hora,min,seg,int32(mseg));
            % IBUF2 es para PSA, IBUF4 es para CO2
            fprintf(fiw,'%s\t%lu\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\t%0.3f\r\n',tiempox,(i-1),int32((IBUF1(CA)/100)),int32((IBUF3(CA)/100)),(IBUF2(CA)/100),(IBUF4(CA)/100),0,0);
            % fprintf(fiw,'%s\t%lu\t%u\t%u\t%0.1f\r\n',tiempox,(i-1),int32((IBUF1(CA)/100)),int32((IBUF3(CA)/100)),(IBUF4(CA)/100));
            mseg=mseg+pmseg;
            if mseg>99; mseg=0; seg=seg+1; end;
            if seg>60; seg=0; min=min+1; end;
            if min>60; min=0; hora=hora+1; end;
            if hora>24; hora=0 ; end;
        end
      end

    NCHAN=2+IANALOG;    % numero de canales internos
    if IC > 1080000 IC=1080000; end
    NSAMP=IC/NCHAN;     % numero de muestreos temporales


    % IBUF contiene 2 canales doppler y el valor de la variable ianalog de canales analogos que seran calibrados despues
    % IBUF1 Primer  canal doppler - VFSC 1
    % IBUF3 Segundo canal doppler - VFSC 2
    % IBUF2 Primer  canal analogo - PSA
    % IBUF4 Segundo canal analogo - CO2
    % IBUF5 Tercer  canal analogo
    % IBUF6 Cuarto  canal analogo


    %       SIGNALS TO BE LPF AND SPIKES REMOVED FROM CBFV   
     FC=20.0;                                   % Hz
     T=0.005;                                   % intervalo de muestreo - 200 muestras por segundo
    MYCODE(1)=999;
    if MYCODE(1) ~= 999                         % Evadir filtrado
        [bw,aw] = butter(2,FC*T);               % CALL SETBUWO(T,FC,AW,BW);
        FC=3.0;                                 % FOR CO2
         if SYS_TYPE == 4 FC=20.0; end;         % FOR TONOMETER---> para el tonometro
        [bw2,aw2] = butter(2,FC*T);             % CALL SETBUWO(T,FC,AW2,BW2);
        IBUF1 = filtro(IBUF1,20.0,0.005,100,1);   % Filtrado de VFSC
    %         %       CBFV FILTERING MODIFIED - DONE AT EDIT MODE NOW
        IBUF2 = filtro(IBUF2,20.0,0.005,100,2);   % Filtrado de PSA
        if NCHAN >= 4
            IBUF4 = filtro(IBUF4,20,0.005,100,4); % NOTE  - TEMPORARY LOWER CUTOFF % GAIN ALSO INCREASED --- ganancia tambien incrementada
            if NCHAN >= 5
                IBUF5 = filter(bw,aw,IBUF5);
                if NCHAN >= 6
                    IBUF6 = filter(bw,aw,IBUF6);
    %               NOW FILTER ECG - HIGH PASS ---> ahora Filtro ECG paso-alto
                end;
    %             if FHECG >= 0.01              % Evadir filtrado
    %                CALL SETBUWO(T,FHECG,AW2,BW2);
    %       %        WRITE(*,*) ' High-pass filter ECG'		% ---> Filtro paso-alto ECG Electrocardiograma
    %                 CALL TRANSFER(IBUF,XDAT,NCHAN,NSAMP,5,100.0);
    %                 CALL BUTWO(XDAT,NSAMP,AW2,BW2);
    % 
    %               for K=1:NSAMP
    %                 L=NCHAN*(K-1)+5;          % Canal ECG
    %                 XHIGH=0.01*FLOAT(IBUF(L))-XDAT(K);
    %                 IBUF(L)=IFIX(100.0*XHIGH);
    %               end; 
    %             end;
            end;
        end;
    end;                                        %Fin Filtrado

     IBEGMIN= 1;   % THIS WILL BE USED TO CUT/EDIT
     IFREAD = 1;  % INDICATES IF A FILE HAS BEEN READ


    % %    save Presion.txt IBUF21 -ASCII;
    % %    save PresionPromedio.txt IBUFAUX -ASCII;    

    % texto = [salida,'.txt'];
    % fid1 = fopen(texto,'rt');                   %fid1 = fopen('TJCO2000.txt');
    % a = fscanf(fid1,'%g %g',[2 inf]);           % It has two rows now.
    % F = a(1,:);
    % P = a(2,:);
    % fclose(fid1);
    % 
    % largo1 = length(IBUF1);
    % largo2 = length(F);
    % n1 = [1:1:largo1];
    % n2 = [1:1:largo2];
    % axis([1 largo1 0 140]);
    % plot(n1,IBUF1(1:largo1),'b',n1,IBUF2(1:largo1),'r',n2,F,'y',n2,P,'g');
    % xlabel('Tiempo(seg) ');
    % ylabel('PSA');
    % Titulo=['Presion Sanguinea Arterial y Flujo Sanguineo Cerebral (',archivo,')'];
    % title(Titulo);
    % Frase=['Grafico Presion-Flujo vs Tiempo - ',salida];
    % saveas(figure(1),Frase,'jpg');

    
%    save(salida,'VFSC','PSA','CO2')  grabado de variables
    % save(salida,'IBUF1','IBUF2','IBUF3','IBUF4','IANALOG','NCHAN','NSAMP','MYCODE','T','FC')

    % if IANALOG >= 3 
    %     save(salida,'IBUF5'); 
    % end
    % if IANALOG >= 4 
    %     save(salida,'IBUF6'); 
    % end

            close(hbar);
            fclose(fiw);
            msgbox('Archivo se convirtió exitosamente','Convertir Archivo');
        else
            warndlg(strcat('Error de apertura ',messagew),'Archivo de Destino');
        end
        fclose(fid);
    else
        warndlg(strcat('Error de apertura ',messager),'Archivo de Origen');
    end
    end
    GFEnmenu(2);
end
disp('...TFConvert2');
