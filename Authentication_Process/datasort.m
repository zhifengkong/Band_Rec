function [DD,Pos_w]=datasort(MM)
    M=MM(:,1);
    Pos=[];
    k=1;
    in=0.05;
    for i=1:length(M)
        if abs(M(i))>in
            Ms(k)=i;
            k=k+1;
        end
    end
    k=k-1;
    M1=diff(Ms);
    [U,V]=sort(M1);
    j=1;
    for i=1:length(U)
        if U(i)>40
            Rank(j)=V(i);
            j=j+1;
        end
    end
    Rank=sort(Rank);
    j=2;
    Pos(1)=Ms(1);
    for i=1:length(Rank)
        Pos(j)=Ms(Rank(i));
        j=j+1;
        Pos(j)=Ms(Rank(i)+1);
        j=j+1;
    end
    Pos(j)=Ms(length(Ms));

    j=1;
    for i=1:ceil(length(Pos)/4)
        Pos1(j,1)=Pos(4*i-3);
        Pos1(j,2)=Pos(4*i-2);
        j=j+1;
    end
    Pos=Pos1;
    
    PPPP=size(Pos);
    for i=1:PPPP(1)
        wid1=1;
        wid2=1;
        while (Pos(i,1)-wid1>0) && (abs(M(Pos(i,1)-wid1))>0.04)
            wid1=wid1+1;
        end
        while abs(M(Pos(i,1)+wid2))>0.04
            wid2=wid2+1;
        end
        Pos_w(:,1)=max(Pos(:,1)-wid1,1);
        Pos_w(:,2)=Pos(:,2)+wid2;
    end
    DD={};
    PPPP=size(Pos);
    for i=1:PPPP(1)
        DD{i}=MM(Pos_w(i,1):Pos_w(i,2),:);
    end
end
