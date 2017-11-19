function [a,b]=peak_finding(vec)
    L=length(vec);
    M=max(vec(4:L-4));
    m=min(vec(4:L-4));
    peak1=[];
    pos1=[];
    peak2=[];
    pos2=[];
    delta1=0;
    delta2=0;
    for i=1+4:L-4
        if vec(i)>=max(vec(i-3:i+3)) && vec(i)>M/2
            peak1=[peak1,vec(i)];
            pos1=[pos1,i];
            delta1=1;
        elseif vec(i)<=min(vec(i-3:i+3)) && vec(i)<m/2
            peak2=[peak2,vec(i)];
            pos2=[pos2,i]; 
            delta2=1;
        end
    end
    if delta1==0
        a=M/2;
    else
        a=median(peak1);
    end
    if delta2==0
        b=m/2;
    else
        b=median(peak2);
    end
end