% *****                  USO GENERAL                             *****
% --------------------------------------------------------------------
% -- Inicializa variables con valores por defecto                   --
% --------------------------------------------------------------------
function [HCURVAS VCFG GCV]=GFInicializa(handles)
% handles    estructura con punteros a datos de la GUI
  HCURVAS(1)=0;
  HCURVAS(2)=0;
  HCURVAS(3)=0;
  HCURVAS(4)=0;
  HCURVAS(5)=0;
  HCURVAS(6)=0;
  HCURVAS(7)=0;
  HCURVAS(8)=0;
  HCURVAS(9)=0;
  HCURVAS(10)=0;
  HCURVAS(71)=0;
  HCURVAS(11)=handles.AX31;
  HCURVAS(12)=handles.AX32;
  HCURVAS(13)=handles.AX33;
  HCURVAS(14)=handles.AX34;
  
  VCFG(1)=cellstr('b-');
  VCFG(2)=cellstr('r-');
  VCFG(3)=cellstr('g-');
  VCFG(4)=cellstr('w-');
  VCFG(5)=cellstr('bk-');
  VCFG(6)=cellstr('g-');
  
  VCFG(11)=cellstr('0');
  VCFG(12)=cellstr('0');
  VCFG(13)=cellstr('0');
  VCFG(14)=cellstr('0');
  
  GCV=zeros(6,60);
  
  GCV(1,1)=1;  % hay datos señal PSA - HCURVAS
  GCV(2,1)=2;  % hay datos señal VFSCI - HCURVAS
  GCV(3,1)=3;  % hay datos señal VFSCD - HCURVAS
  GCV(4,1)=71;  % hay datos señal CO2 - HCURVAS
  GCV(5,1)=72;  % hay datos señal ECG - HCURVAS
  GCV(6,1)=73;  % hay datos señal ADIC - HCURVAS
  
  GCV(1,2)=22;  % hadle plot señal inicial PSA - HCURVAS
  GCV(2,2)=32;  % hadle plot señal inicial VFSCI - HCURVAS
  GCV(3,2)=42;
  GCV(4,2)=92;
  GCV(5,2)=102;
  GCV(6,2)=112;
  
  GCV(1,3)=23;  % hadle plot señal PSA corregir manual o Upstroke Calculados Upstroke- HCURVAS
  GCV(2,3)=33;
  GCV(3,3)=43;
  GCV(4,3)=93;
  GCV(5,3)=103;
  GCV(6,3)=113;
  
  GCV(1,4)=24;  % hadle plot señal PSA filtro mediana o Maximos Upstroke - HCURVAS
  GCV(2,4)=34;
  GCV(3,4)=44;
  GCV(4,4)=94;
  GCV(5,4)=104;
  GCV(6,4)=114;
  
  GCV(1,5)=25;  % hadle plot señal PSA filtro butter o Minimos Upstroke - HCURVAS
  GCV(2,5)=35;
  GCV(3,5)=45;
  GCV(4,5)=95;
  GCV(5,5)=105;
  GCV(6,5)=115;
  
  GCV(1,6)=26;  % hadle plot señal PSA filtro spline automatico o Marca Upstroke - HCURVAS
  GCV(2,6)=36;
  GCV(3,6)=46;
  GCV(4,6)=96;
  GCV(5,6)=106;
  GCV(6,6)=116;
  
  GCV(1,7)=27;  % hadle plot señal PSA filtro spline automatico o Marca Upstroke - HCURVAS
  GCV(2,7)=37;
  GCV(3,7)=47;
  GCV(4,7)=97;
  GCV(5,7)=107;
  GCV(6,7)=117;
  
  GCV(1,11)=3;  % datos señal original PSA - PCURVAS
  GCV(2,11)=4;
  GCV(3,11)=5;
  GCV(4,11)=51;
  GCV(5,11)=52;
  GCV(6,11)=53;
  
  GCV(1,12)=6;  % datos señal filtro mediana PSA - PCURVAS
  GCV(2,12)=7;
  GCV(3,12)=8;
  GCV(4,12)=54;
  GCV(5,12)=55;
  GCV(6,12)=56;
  
  GCV(1,13)=10;  % datos señal filtro butter PSA - PCURVAS
  GCV(2,13)=11;
  GCV(3,13)=12;
  GCV(4,13)=61;
  GCV(5,13)=58;
  GCV(6,13)=59;
  
  GCV(1,14)=15;  % datos señal filtro spline auto PSA - PCURVAS
  GCV(2,14)=16;
  GCV(3,14)=17;
  GCV(4,14)=60;
  GCV(5,14)=61;
  GCV(6,14)=62;
  
  GCV(1,15)=20;  % valores maximos curva 1 - PCURVAS
  GCV(2,15)=30;
  GCV(3,15)=40;
  GCV(4,15)=0;
  GCV(5,15)=0;
  GCV(6,15)=0;
  
  GCV(1,16)=21;  % posiciones maximos curva 1 - PCURVAS
  GCV(2,16)=31;
  GCV(3,16)=41;
  GCV(4,16)=0;
  GCV(5,16)=0;
  GCV(6,16)=0;
  
  GCV(1,17)=22;  % valores minimos curva 1 - PCURVAS
  GCV(2,17)=32;
  GCV(3,17)=42;
  GCV(4,17)=0;
  GCV(5,17)=0;
  GCV(6,17)=0;
  
  GCV(1,18)=23;  % posiciones minimos curva 1 - PCURVAS
  GCV(2,18)=33;
  GCV(3,18)=43;
  GCV(4,18)=0;
  GCV(5,18)=0;
  GCV(6,18)=0;
  
  GCV(1,19)=1;  % posicion del color de PSA - PCURVAS
  GCV(2,19)=2;
  GCV(3,19)=3;
  GCV(4,19)=4;
  GCV(5,19)=5;
  GCV(6,19)=6;
  
  GCV(1,20)=24;  % valores upstroke curva 1 - PCURVAS
  GCV(2,20)=34;
  GCV(3,20)=44;
  GCV(4,20)=0;
  GCV(5,20)=0;
  GCV(6,20)=0;
  
  GCV(1,21)=25;  % posiciones upstroke curva 1 - PCURVAS
  GCV(2,21)=35;
  GCV(3,21)=45;
  GCV(4,21)=0;
  GCV(5,21)=0;
  GCV(6,21)=0;
  
  GCV(1,40)=1;  % posiciones  de valores medios PSA
  GCV(2,40)=2;
  GCV(3,40)=3;
  
  GCV(1,41)=7;  % valores medios PSA
  GCV(2,41)=8;  % valores medios
  GCV(3,41)=9;  % valores medios
  GCV(4,41)=10;  % valores medios
  GCV(5,41)=11;  % valores medios
  GCV(6,41)=12;  % valores medios
  
  GCV(1,42)=13;  % posiciones  de valores medios remuestreados PSA
  GCV(2,42)=14;  % posiciones  de valores medios remuestreados
  GCV(3,42)=15;  % posiciones  de valores medios remuestreados
  GCV(4,42)=16;  % posiciones  de valores medios remuestreados
  GCV(5,42)=17;  % posiciones  de valores medios remuestreados
  GCV(6,42)=18;  % posiciones  de valores medios remuestreados
  
  GCV(1,43)=19;  % valores medios remuestreados PSA
  GCV(2,43)=20;  % valores medios remuestreados
  GCV(3,43)=21;  % valores medios remuestreados
  
  GCV(1,44)=25;  % valores PCC
  GCV(1,45)=26;  % valores RAP
  
  GCV(2,44)=27;  % valores remuestreados PCC
  GCV(2,45)=28;  % valores remuestreados RAP
  
end
