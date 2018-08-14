function [mnval mnpos mxval mxpos]=UPSGmaxmin(valores,posic)
nelem=length(valores);
j=0;
k=0;
XMIN=0;
if nelem>2
    nvalor=valores(1);
    for i=2:nelem
        if XMIN
            if valores(i) < nvalor
                nvalor=valores(i);
            else
                k=k+1;
                mnval(k)=nvalor;
                mnpos(k)=posic(i-1);
                nvalor=valores(i);
                XMIN=0;
            end            
        else
            if valores(i) > nvalor
                nvalor=valores(i);
            else
                j=j+1;
                mxval(j)=nvalor;
                mxpos(j)=posic(i-1);
                nvalor=valores(i);
                XMIN=1;
            end
        end
    end
end
end