function [max_val_f pos_max_f min_val_f pos_min_f]=UPSGElimina(ncur)
global PCURVAS;
[min_val pos_min max_val pos_max]=UPSGmaxmin(PCURVAS(ncur,:),PCURVAS(1,:));
l=length(min_val);
if l > 10
    [mxt mnt]=Inic(pos_max,pos_min);
    % Elimina los Minimos y Maximos muy pequeños
%    rmxvt=max_val;rmxpt=pos_max;rmnvt=min_val;rmnpt=pos_min;
    [rmxv,rmxp,rmnv,rmnp]=Elim_mini_upst(max_val,pos_max,min_val,pos_min,mxt,mnt);
    
%    rmxvt=rmxv;rmxpt=rmxp;rmnvt=rmnv;rmnpt=rmnp;
    
    % Saca la distancia promedio de los latidos y elimina todo lo que este
    % en el medio
    
    [rmxvt,rmxpt,rmnvt,rmnpt]=dist_med(rmxv,rmxp,rmnv,rmnp);
    [rmxvt rmxpt rmnvt rmnpt]=elige_best(rmxv,rmxp,rmnv,rmnp,rmxvt,rmxpt,rmnvt,rmnpt);
    max_val_f=rmxvt;
    pos_max_f=rmxpt;
    min_val_f=rmnvt;
    pos_min_f=rmnpt;
end
end

% en uso
function [mxt mnt]=Inic(pos_max,pos_min)
    mnt=1;
    mxt=1;
    % tiene el minimo en 1 y busca el maximo siguiente
    while pos_max(mxt) < pos_min(mnt)
        mxt=mxt+1;
    end
end


function [rmxv,rmxp,rmnv,rmnp]=Elim_mini_upst(mxv,mxp,mnv,mnp,mx1,mn1)
    disp('Primer Filtro : Elim_mini_upst...');
    l=length(mxv);
    min_t=mn1;
    max_t=mx1;
    pos_t=0;
    % busca todas las diferencias entre maximos y minimos
    while max_t <= l
        pos_t=pos_t+1;
        dif_l(pos_t)=mxv(max_t)-mnv(min_t);
        min_t=min_t+1;
        max_t=max_t+1;
    end
    [N VE]=hist(dif_l,10);    
    fhigh=((VE(3)-VE(2))/2+VE(2));
    min_t=mn1;
    max_t=mx1;
    pos_t=0;
    while max_t <= l
        dif=mxv(max_t)-mnv(min_t);
        if dif > fhigh
            pos_t=pos_t+1;
            rmxv(pos_t)=mxv(max_t);
            rmxp(pos_t)=mxp(max_t);
            rmnv(pos_t)=mnv(min_t);
            rmnp(pos_t)=mnp(min_t);
        end
        min_t=min_t+1;
        max_t=max_t+1;
    end
    disp('...Primer Filtro : Elim_mini_upst');
end

% Calculo de distancia media
function [rmxv rmxp rmnv rmnp]=dist_med(rmxv,rmxp,rmnv,rmnp)
    disp('Segundo Filtro : dist_med...');
    l=length(rmxp);
    lsup=0.1;
    i=bestini(rmxp,lsup,l);
    if (i > 2) && (i < (l-2))
        [rmxv rmxp rmnv rmnp]=rep_der(rmxv,rmxp,rmnv,rmnp,i,l,lsup);
        l=length(rmxp);
        [rmxv rmxp rmnv rmnp]=rep_izq(rmxv,rmxp,rmnv,rmnp,i,l,lsup);
    end
    disp('...Segundo Filtro : dist_med');
end

function posr=bestini(rmxp,lsup,l)
    xpos=0;
    xrep=0;
    max_rep=0;
    pos_ini=0;
    pos_inif=0;
    for i=2:(l-1)
        dif1=rmxp(i)-rmxp(i-1);
        dif2=rmxp(i+1)-rmxp(i);
        cuoc=abs(1-dif2/dif1);
        if cuoc < lsup
            if i==xpos
                xpos=xpos+1;
                xrep=xrep+1;
            else
                if xrep > max_rep
                    max_rep=xrep;
                    pos_inif=pos_ini;
                end
                xrep=0;
                xpos=i+1;
                pos_ini=i;
            end
        end
    end
    posr=pos_inif+round(max_rep/2);
    disp('best ini');
    disp([posr  max_rep  pos_inif l ]);
end

function [rmxv rmxp rmnv rmnp]=rep_der(rmxv,rmxp,rmnv,rmnp,i,l,lsup)
% reparacion a la derecha
    nprom=10;
    dtlist=[];
    uplist=[];
    mxlist=[];
    mnlist=[];
    kvprom=rmxp(i)-rmxp(i-1);
    upprom=rmxv(i)-rmnv(i);
    mxprom=rmxv(i);
    mnprom=rmnv(i);
    while i <= (l-1)
        dif2=rmxp(i+1)-rmxp(i);
        cuoc=1 - dif2/kvprom;
        if cuoc > lsup
            errp=abs(1 - dif2/kvprom);
            errm=errp;
            errm2=errm;
            k=i;
            posf=i;
            posf2=posf;
            modif=0;
            duda1=0;
            while errp<=errm && k<l
                k=k+1;
                dif2=rmxp(k)-rmxp(i);
                errp=abs(1 - dif2/kvprom);
                if errp<errm % error encontrado menor al error anterior
                    errm2=errm;
                    errm=errp;
                    posf2=posf;
                    posf=k;
                    modif=1;
                else
                    if errp < errm2 % guarda error anterior para verificar si se parecen mucho
                        errm2=errp;
                        posf2=k;
                    end
                end
            end
            if abs(posf2-posf)==1 % verifica si las posiciones son consecutivas
                if errm > 0 && errm2 > 0 
                    if errm/errm2<5 && errm2/errm<5 % verifica que los errores estan correlacionados (están muy cerca)
                        duda1=posf;
                        duda2=posf2;
                    end
                end
            end
            if duda1 > 0 % si se plantea una duda por distancias cercanas se evalua
                dif2=rmxp(duda1)-rmxp(i);
                err11=abs(1 - dif2/kvprom);                     % error de la distancia media
                err21=abs(1-(rmxv(duda1)-rmnv(duda1))/upprom);  % error por la diferencia max-min
                err31=abs(1-(rmxv(duda1))/mxprom);              % error 
                err41=abs(1-(rmnv(duda1))/mnprom);
                    
                dif2=rmxp(duda2)-rmxp(i);
                err12=abs(1 - dif2/kvprom);
                err22=abs(1-(rmxv(duda2)-rmnv(duda2))/upprom);
                err32=abs(1-rmxv(duda2)/mxprom);
                err42=abs(1-rmnv(duda2)/mnprom);
                peso1=err11*0.5+err21*0.2+err31*0.15+err41*0.15;
                peso2=err12*0.5+err22*0.2+err32*0.15+err42*0.15;
                if peso1 < peso2
                    posf=duda1;
                else
                    posf=duda2;
                end
            end
            if modif
                rmxp=[rmxp(1:i) rmxp(posf:l)];
                rmxv=[rmxv(1:i) rmxv(posf:l)];
                rmnp=[rmnp(1:i) rmnp(posf:l)];
                rmnv=[rmnv(1:i) rmnv(posf:l)];
                l=length(rmxp);
            end
        end
        [dtlist kvprom]=averagek(dtlist,rmxp(i)-rmxp(i-1),nprom);
        [uplist upprom]=averagek(uplist,rmxv(i)-rmnv(i),nprom);
        [mxlist mxprom]=averagek(mxlist,rmxv(i),nprom);
        [mnlist mnprom]=averagek(mnlist,rmnv(i),nprom);         
        i=i+1;
    end
end

function [rmxv rmxp rmnv rmnp]=rep_izq(rmxv,rmxp,rmnv,rmnp,i,l,lsup)
%reparacion a la izquierda
    nprom=10;
    dtlist=[];
    uplist=[];
    mxlist=[];
    mnlist=[];
    kvprom=rmxp(i+1)-rmxp(i);
    upprom=rmxv(i)-rmnv(i);
    mxprom=rmxv(i);
    mnprom=rmnv(i);
    seguir=1;
    while i > 1  && seguir
        dif2=rmxp(i)-rmxp(i-1);
        cuoc=1 - dif2/kvprom;
        if cuoc > lsup
            errp=abs(1 - dif2/kvprom);
            errm=errp;
            errm2=errm;
            k=i;
            posf=i;
            posf2=posf;
            modif=0;
            duda1=0;
            while errp<=errm && k>1
                k=k-1;
                dif2=rmxp(i)-rmxp(k);
                errp=abs(1 - dif2/kvprom);
                if errp<errm 
                    errm2=errm;
                    errm=errp;
                    posf2=posf;
                    posf=k;
                    modif=1;
                else
                    if errp<errm2
                        errm2=errp;
                        posf2=k;
                    end
                end
            end
            if abs(posf2-posf)==1
                if errm > 0 && errm2 > 0
                    if errm/errm2<5 && errm2/errm<5
                        duda1=posf;
                        duda2=posf2;
                    end
                end
            end            
            if duda1 > 0
                dif2=rmxp(i)-rmxp(duda1);
                err11=abs(1 - dif2/kvprom);
                err21=abs(1-(rmxv(duda1)-rmnv(duda1))/upprom);
                err31=abs(1-(rmxv(duda1))/mxprom);
                err41=abs(1-(rmnv(duda1))/mnprom);
                    
                dif2=rmxp(i)-rmxp(duda2);
                err12=abs(1 - dif2/kvprom);
                err22=abs(1-(rmxv(duda2)-rmnv(duda2))/upprom);
                err32=abs(1-rmxv(duda2)/mxprom);
                err42=abs(1-rmnv(duda2)/mnprom);

                peso1=err11*0.5+err21*0.2+err31*0.15+err41*0.15;
                peso2=err12*0.5+err22*0.2+err32*0.15+err42*0.15;
                if peso1 < peso2
                    posf=duda1;
                else
                    posf=duda2;
                end
            end
            if modif
                rmxp=[rmxp(1:posf) rmxp(i:l)];
                rmxv=[rmxv(1:posf) rmxv(i:l)];
                rmnp=[rmnp(1:posf) rmnp(i:l)];
                rmnv=[rmnv(1:posf) rmnv(i:l)];
                i=posf+1;
                l=length(rmxp);
            end
        end
        [dtlist kvprom]=averagek(dtlist,rmxp(i+1)-rmxp(i),nprom);
        [uplist upprom]=averagek(uplist,rmxv(i)-rmnv(i),nprom);
        [mxlist mxprom]=averagek(mxlist,rmxv(i),nprom);
        [mnlist mnprom]=averagek(mnlist,rmnv(i),nprom);
        i=i-1;
    end
end


function [rmxvt rmxpt rmnvt rmnpt]=elige_best(rmxv,rmxp,rmnv,rmnp,rmxvt,rmxpt,rmnvt,rmnpt)
    disp('Tercer Filtro: Elige Best...');
    l=length(rmxpt);
    lsup=0.1;
    istart=bestini(rmxpt,lsup,l);
    i=istart;
    
    if (i > 2) && (i < (l-2))
        
% inspeccion a la derecha de i
        nprom=10;
        dtlist=[];
        uplist=[];
        mxlist=[];
        mnlist=[];
        kvprom=rmxpt(i)-rmxpt(i-1);
        upprom=rmxvt(i)-rmnvt(i);
        mxprom=rmxvt(i);
        mnprom=rmnvt(i);
        while i < l
        j=find(rmxpt(i)==rmxp);
        liminf=rmxpt(i)-kvprom/2;
        limsup=rmxpt(i)+kvprom/2;
        if rmxpt(i+1) < limsup
            ups1=rmxvt(i)-rmnvt(i);
            ups2=rmxvt(i+1)-rmnvt(i+1);
            if ups1 > ups2
                rmxpt=[rmxpt(1:i) rmxpt(i+2:l)];
                rmxvt=[rmxvt(1:i) rmxvt(i+2:l)];
                rmnpt=[rmnpt(1:i) rmnpt(i+2:l)];
                rmnvt=[rmnvt(1:i) rmnvt(i+2:l)];
            else
                rmxpt=[rmxpt(1:i-1) rmxpt(i+1:l)];
                rmxvt=[rmxvt(1:i-1) rmxvt(i+1:l)];
                rmnpt=[rmnpt(1:i-1) rmnpt(i+1:l)];
                rmnvt=[rmnvt(1:i-1) rmnvt(i+1:l)];
            end
            l=length(rmxpt);
            i=i-1;
        else
            [dtlist kvprom]=averagek(dtlist,rmxpt(i)-rmxpt(i-1),nprom);
            [uplist upprom]=averagek(uplist,rmxvt(i)-rmnvt(i),nprom);
            [mxlist mxprom]=averagek(mxlist,rmxvt(i),nprom);
            [mnlist mnprom]=averagek(mnlist,rmnvt(i),nprom);
            if rmxp(j-1) > liminf && rmxv(j-1) > rmxvt(i)
                if (rmxv(j-1)-rmnv(j-1)) > (rmxvt(i)-rmnvt(i))
                    rmxpt(i)=rmxp(j-1);
                    rmxvt(i)=rmxv(j-1);
                    rmnpt(i)=rmnp(j-1);
                    rmnvt(i)=rmnv(j-1);
                end
            end
            if rmxp(j+1) < limsup && rmxv(j+1) > rmxvt(i)
                if (rmxv(j+1)-rmnv(j+1)) > (rmxvt(i)-rmnvt(i))
                    rmxpt(i)=rmxp(j+1);
                    rmxvt(i)=rmxv(j+1);
                    rmnpt(i)=rmnp(j+1);
                    rmnvt(i)=rmnv(j+1);
                end
            end
            i=i+1;
        end
        end
    
 % inspeccion a la izquierda de i
        i=istart;
        nprom=10;
        dtlist=[];
        uplist=[];
        mxlist=[];
        mnlist=[];
        kvprom=rmxpt(i+1)-rmxpt(i);
        upprom=rmxvt(i)-rmnvt(i);
        mxprom=rmxvt(i);
        mnprom=rmnvt(i);
        while i > 1
        j=find(rmxpt(i)==rmxp);
        liminf=rmxpt(i)-kvprom/2;
        limsup=rmxpt(i)+kvprom/2;
        if rmxpt(i-1) > liminf
            ups1=rmxvt(i)-rmnvt(i);
            ups2=rmxvt(i-1)-rmnvt(i-1);
            if ups1 > ups2
                rmxpt=[rmxpt(1:i-2) rmxpt(i:l)];
                rmxvt=[rmxvt(1:i-2) rmxvt(i:l)];
                rmnpt=[rmnpt(1:i-2) rmnpt(i:l)];
                rmnvt=[rmnvt(1:i-2) rmnvt(i:l)];
            else
                rmxpt=[rmxpt(1:i-1) rmxpt(i+1:l)];
                rmxvt=[rmxvt(1:i-1) rmxvt(i+1:l)];
                rmnpt=[rmnpt(1:i-1) rmnpt(i+1:l)];
                rmnvt=[rmnvt(1:i-1) rmnvt(i+1:l)];
            end
            l=length(rmxpt);
            i=i+1;
        else
            [dtlist kvprom]=averagek(dtlist,rmxpt(i+1)-rmxpt(i),nprom);
            [uplist upprom]=averagek(uplist,rmxvt(i)-rmnvt(i),nprom);
            [mxlist mxprom]=averagek(mxlist,rmxvt(i),nprom);
            [mnlist mnprom]=averagek(mnlist,rmnvt(i),nprom);

            if rmxp(j-1) > liminf && rmxv(j-1) > rmxvt(i)
                if (rmxv(j-1)-rmnv(j-1)) > (rmxvt(i)-rmnvt(i))
                    rmxpt(i)=rmxp(j-1);
                    rmxvt(i)=rmxv(j-1);
                    rmnpt(i)=rmnp(j-1);
                    rmnvt(i)=rmnv(j-1);
                end
            end
            if rmxp(j+1) < limsup && rmxv(j+1) > rmxvt(i)
                if (rmxv(j+1)-rmnv(j+1)) > (rmxvt(i)-rmnvt(i))
                    rmxpt(i)=rmxp(j+1);
                    rmxvt(i)=rmxv(j+1);
                    rmnpt(i)=rmnp(j+1);
                    rmnvt(i)=rmnv(j+1);
                end
            end
            i=i-1;
        end
        end
    end
    disp('...Tercer Filtro: Elige Best');
end


function [arr_val prom]=averagek(arr_val,new_val,k)
  l=length(arr_val);
  if l < k
      arr_val=[new_val arr_val];
  else
      arr_val=[new_val arr_val(1:k-1)];
  end
  prom=mean(arr_val);
end