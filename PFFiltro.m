% *****                FILTRAR CURVAS                            *****
% --------------------------------------------------------------------
% -- Aplica un filtro específico a la curva identificada            --
% -- Los posibles filtros son Mediana, Butter y Spline automatico   --
% -- El filtro se visualiza en la ventana especificada              --
% --------------------------------------------------------------------
function PFFiltro(NFIL,handles,NVEN)
% NFIL       Tipo de Filtro a aplicar
%            1 : Filtro Mediana
%            2 : Filtro Butter
%            3 : Corrección de Spline
% handles    estructura con punteros a datos de la GUI
% NVEN       ventana donde se encuentra la curva
global HCURVAS;
global HEADLIN;
global VCFG;
global IDEBUG;
if IDEBUG; disp('PFFiltro...'); end;
switch NFIL
    case 1  % Filtro Mediana
        switch NVEN
            case 1
                if HCURVAS(1) % verifica curvas en PSA
                    w=str2double(char(VCFG(11)));  % nro de curva en la ventana 1
                    Fmed(w,11,handles.CBMED31,handles.OFMED31,handles.CBSPL31,handles.CBBUT31,handles.CB1,handles.CBV31_2);
                end            
            case 2
                if HCURVAS(2) % verifica curvas en ventana 2
                    w=str2double(char(VCFG(12)));  % nro de curva en la ventana 1
                    Fmed(w,12,handles.CBMED32,handles.OFMED32,handles.CBSPL32,handles.CBBUT32,handles.CB2,handles.CBV32_2);
                end 
            case 3
                if HCURVAS(3) % verifica curvas en ventana 3
                    w=str2double(char(VCFG(13)));  % nro de curva en la ventana 1
                    Fmed(w,13,handles.CBMED33,handles.OFMED33,handles.CBSPL33,handles.CBBUT33,handles.CB3,handles.CBV33_2);
                end 
            case 4
                if HCURVAS(4) % verifica curvas en ventana 4
                    w=str2double(char(VCFG(14)));  % nro de curva en la ventana 1
                    Fmed(w,14,handles.CBMED34,handles.OFMED34,handles.CBSPL34,handles.CBBUT34,handles.CB4,handles.CBV34_2);
                end 
        end
    case 2  % Filtro Butter
        sproc=char(HEADLIN(4,1));
        lsproc=length(sproc);
        fnum=0;
        for j=1:lsproc
            num=sproc(j)-48;
            if num >=0 && num <= 9
                fnum=fnum*10+num;
            end
        end
        T=1/fnum;
        switch NVEN
            case 1
                if HCURVAS(1)
                    w=str2double(char(VCFG(11)));  % nro de curva en la ventana 1
                    Fbut(w,11,T,handles.CBBUT31,handles.OFBUT31,handles.FCFBUT31,handles.CBMED31,handles.CBSPL31,handles.CB1,handles.CBV31_3);
                end            
            case 2
                if HCURVAS(2)
                    w=str2double(char(VCFG(12)));  % nro de curva en la ventana 2
                    Fbut(w,12,T,handles.CBBUT32,handles.OFBUT32,handles.FCFBUT32,handles.CBMED32,handles.CBSPL32,handles.CB2,handles.CBV32_3);
                end 
            case 3
                if HCURVAS(3)
                    w=str2double(char(VCFG(13)));  % nro de curva en la ventana 3
                    Fbut(w,13,T,handles.CBBUT33,handles.OFBUT33,handles.FCFBUT33,handles.CBMED33,handles.CBSPL33,handles.CB3,handles.CBV33_3);
                end 
        end
    case 3    % Filtro Spline autom
        switch NVEN
            case 1
                if HCURVAS(1)
                    w=str2double(char(VCFG(11)));
                    Fspl(w,11,handles.CBSPL31,handles.FNSPL31,handles.CBBUT31,handles.CBMED31,handles.CB1,handles.CBV31_4);
                end
            case 2
                if HCURVAS(2)
                    w=str2double(char(VCFG(12)));
                    Fspl(w,12,handles.CBSPL32,handles.FNSPL32,handles.CBBUT32,handles.CBMED32,handles.CB2,handles.CBV32_4);
                end
            case 3
                if HCURVAS(3)
                    w=str2double(char(VCFG(13)));
                    Fspl(w,13,handles.CBSPL33,handles.FNSPL33,handles.CBBUT33,handles.CBMED33,handles.CB3,handles.CBV33_4);
                end
        end
end
if IDEBUG; disp('...PFFiltro'); end;
end


% --------------------------------------------------------------------
% -- Borra curva, actualiza ventana de filtrado y limpia variable   --
% --------------------------------------------------------------------
function borra_cur(nc,hand1,str1)
% nc       posición de puntero a datos de curva
% hand1    Puntero a indicación en pantalla
% str1     variable a limpiar
  if GFBorra_Hand(nc,1)
      set(hand1,'Value',0);
      clear(str1);
  end;
end

% --------------------------------------------------------------------
% -- Aplicar Filtro de Mediana                                      --
% --------------------------------------------------------------------
function Fmed(nc,xw,h1,h2,h3,h4,h5,h6)
% nc   numero de curva
% xw   posición del puntero de la ventana
% h1   puntero a chekbox indicación del filtro mediana
% h2   puntero a grado del filtro
% h3   puntero a checbox indicación de filtro spline
% h4   puntero a checbox indicación de filtro butter
% h5   puntero a checbox indicación ventana activa
% h6   puntero a checbox indicación mostrar curva en ventana
global HCURVAS;
global PCURVAS;
global GCV;
w=xw-10;
    if get(h1,'Value')  % agregar filtro de mediana
        ofmed=str2double(get(h2,'String'));  %grado del filtro de mediana
        if get(h3,'Value')
            BUFAUX=PCURVAS(GCV(nc,14),:);
        else
            BUFAUX=PCURVAS(GCV(nc,11),:);
        end
        PCURVAS(GCV(nc,12),:)=medfilt1(BUFAUX,ofmed);
        str1=strcat('PCURVAS(',num2str(GCV(nc,13)),')');
        borra_cur(GCV(nc,5),h4,str1);
        hold(HCURVAS(xw),'on');
        if get(h5,'Value') && get(h6,'Value')
            HCURVAS(GCV(nc,4))=plot(HCURVAS(xw),PCURVAS(1,:),PCURVAS(GCV(nc,12),:),'g-','visible','on');
        else
            HCURVAS(GCV(nc,4))=plot(HCURVAS(xw),PCURVAS(1,:),PCURVAS(GCV(nc,12),:),'g-','visible','off');
        end
        hold(HCURVAS(xw),'off');
        HCURVAS(w)=bitor(HCURVAS(w),4);
    else
        str1=strcat('PCURVAS(',num2str(GCV(nc,12)),')');
        clear(str1);
        delete(HCURVAS(GCV(nc,4)));
        str1=strcat('PCURVAS(',num2str(GCV(nc,13)),')');
        borra_cur(GCV(nc,5),h4,str1);
        HCURVAS(w)=bitand(HCURVAS(w),3);
    end
end


% --------------------------------------------------------------------
% -- Aplicar Filtro Spline                                          --
% --------------------------------------------------------------------
function Fspl(nc,xw,h1,h2,h3,h4,h5,h6)
% nc   numero de curva
% xw   posición del puntero de la ventana
% h1   puntero a chekbox indicación del filtro mediana
% h2   puntero a grado del filtro
% h3   puntero a checbox indicación de filtro spline
% h4   puntero a checbox indicación de filtro butter
% h5   puntero a checbox indicación ventana activa
% h6   puntero a checbox indicación mostrar curva en ventana
global HCURVAS;
global PCURVAS;
global GCV;
w=xw-10;
    if get(h1,'Value')
        spllim=str2double(get(h2,'String'));
        PCURVAS(GCV(nc,14),:)=EliminarSpikeAutom(PCURVAS(GCV(nc,11),:),spllim);
        str1=strcat('PCURVAS(',num2str(GCV(nc,13)),')');
        borra_cur(GCV(nc,5),h3,str1);
        str1=strcat('PCURVAS(',num2str(GCV(nc,12)),')');
        borra_cur(GCV(nc,4),h4,str1);
        hold(HCURVAS(xw),'on');
        if get(h5,'Value') && get(h6,'Value')
            HCURVAS(GCV(nc,6))=plot(HCURVAS(xw),PCURVAS(1,:),PCURVAS(GCV(nc,14),:),'y-','visible','on');
        else
            HCURVAS(GCV(nc,6))=plot(HCURVAS(xw),PCURVAS(1,:),PCURVAS(GCV(nc,14),:),'y-','visible','off');
        end
        hold(HCURVAS(xw),'off');
        HCURVAS(w)=bitor(HCURVAS(w),2);
    else
        str1=strcat('PCURVAS(',num2str(GCV(nc,14)),')');
        clear(str1);
        delete(HCURVAS(GCV(nc,6)));
        str1=strcat('PCURVAS(',num2str(GCV(nc,13)),')');
        borra_cur(GCV(nc,5),h3,str1);
        str1=strcat('PCURVAS(',num2str(GCV(nc,12)),')');
        borra_cur(GCV(nc,4),h4,str1);
        HCURVAS(w)=bitand(HCURVAS(w),1);
    end
end

% --------------------------------------------------------------------
% -- Aplicar Filtro Butter                                          --
% --------------------------------------------------------------------
function Fbut(nc,xw,T,h1,h2,h3,h4,h5,h6,h7)
% nc   numero de curva
% xw   posición del puntero de la ventana
% T    frecuencia de muestreo
% h1   puntero a chekbox indicación del filtro mediana
% h2   puntero a grado del filtro
% h3   puntero a frecuencia de corte
% h4   puntero a checbox indicación de filtro spline
% h5   puntero a checbox indicación de filtro butter
% h6   puntero a checbox indicación ventana activa
% h7   puntero a checbox indicación mostrar curva en ventana
global HCURVAS;
global PCURVAS;
global GCV;
w=xw-10;
    if get(h1,'Value')
        ofbut=str2double(get(h2,'String'));
        FC=str2double(get(h3,'String'));
        N=ofbut/2;
        Wn=FC*T;
        [bw , aw] = butter(N,Wn);
        if get(h4,'Value')
            BUFAUX=PCURVAS(GCV(nc,12),:);
        else
            if get(h5,'Value')
                BUFAUX=PCURVAS(GCV(nc,14),:);
            else
                BUFAUX=PCURVAS(GCV(nc,11),:);
            end
        end
        xlen=length(BUFAUX);
        vini=BUFAUX(1);
        BUFINI=[vini vini vini vini vini vini vini vini vini vini vini vini vini vini vini vini vini vini vini vini];
        vfin=BUFAUX(xlen);
        BUFFIN=[vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin vfin];
        BUFAUX=[BUFINI BUFAUX BUFFIN];
        BUFAUX = filter(bw,aw,BUFAUX);
        BUFAUX = GFInvertir(BUFAUX);
        BUFAUX = filter(bw,aw,BUFAUX);
        BUFAUX = GFInvertir(BUFAUX);
        PCURVAS(GCV(nc,13),:)=BUFAUX(21:xlen+20);
        hold(HCURVAS(xw),'on');
        if get(h6,'Value') && get(h7,'Value')
            HCURVAS(GCV(nc,5))=plot(HCURVAS(xw),PCURVAS(1,:),PCURVAS(GCV(nc,13),:),'r-','visible','on');
        else
            HCURVAS(GCV(nc,5))=plot(HCURVAS(xw),PCURVAS(1,:),PCURVAS(GCV(nc,13),:),'r-','visible','off');
        end
        hold(HCURVAS(xw),'off');
        HCURVAS(w)=bitor(HCURVAS(w),8);
    else
        str1=strcat('PCURVAS(',num2str(GCV(nc,13)),')');
        clear(str1);
        delete(HCURVAS(GCV(nc,5)));
        HCURVAS(w)=bitand(HCURVAS(w),7);
    end
end

% --------------------------------------------------------------------
% -- Elimina spike en forma automatica aplicando spline             --
% --------------------------------------------------------------------
function [senal]=EliminarSpikeAutom(senal,maxceros)
% senal      puntos de la curva
% maxceros   numero maximo de ceros a eliminar
    n=length(senal);
    ceros=0;
    for i=1:n
        if(senal(i)==0)
            ceros=ceros+1;
        else
            if(ceros>2) && (ceros <= maxceros)
                txf=i;
                txi=i-ceros-1;
                if txi < 3; txi=3; end;
                if txf == n; txf=n-3; end;
                if (senal(txi-1)~=0)&&(senal(txi-2)~=0)%||(senal(txi-1)==0)&&(senal(txi-2)~=0)||(senal(txi-1)~=0)&&(senal(txi-2)==0) %se puede aplicar por la izquierda
                    if(senal(txf+1)~=0)&&(senal(txf+2)~=0)%||(senal(txf+1)==0)&&(senal(txf+2)~=0)||(senal(txf+1)~=0)&&(senal(txf+2)==0) %se puede aplicar por la derecha
                        xsp=[txi-2:txi , txf:txf+2];
                        ysp=[senal(txi-2:txi) , senal(txf:txf+2)];
                        xxsp=txi-2:txf+2;
                        yysp=interp1(xsp,ysp,xxsp,'spline');
                        a=xxsp(1);
                        b=length(xxsp);
                        for j=a:(a+b-1)
                            senal(j)=yysp(j-a+1);
                        end;
                    end;
                end;
            end;
            ceros=0;
        end;
    end;
end

% --------------------------------------------------------------------
% -- Invierte un arreglo                                            --
% --------------------------------------------------------------------
function [AUX] = GFInvertir(BUF)
% BUF        array a invertir
%
% AUX        array invertido
[A N]=size(BUF);
n=abs(N/2)+1;
for i=1:n
    AUX(i) = BUF(N-i+1);
    AUX(N-i+1) = BUF(i);
end
end