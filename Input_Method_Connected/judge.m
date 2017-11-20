function L=judge(a,b,i,data)
    load('letters.mat');
    a=round(a);
    b=round(b);
    La=abs(b-a);
    Lb=length(V_smo{i}{10});
    L=0;
    if a<=0 || b>length(data)
        L=1000;
        return;
    end
    if La/2>=Lb || La*2<=Lb
        L=1000;
        return;
    end
    LL=zeros(1,6)+1000;
    for j=1:5
        z=V_smo{i}{4*j};
        X=data(a:b,:);
        for k=1:6
            aa=dtw(X(:,k),z(:,k))/avg_all(k);
            if aa<LL(k)
                LL(k)=aa;
            end
        end
    end
    L=sum(LL)/6;
end