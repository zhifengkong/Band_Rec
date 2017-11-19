function D_best=bestdist(D)
    n=length(D);
    for k=1:6
       clear AA;
       for i=1:n
           AA{i}=D{i}(:,k);
       end
       t=1;
       for i=1:n
           for j=i+1:n
               d(t)=dtw(AA{i},AA{j},k);
               t=t+1;
           end
       end
       XX=d(:);
       XX=sort(XX);
       S=XX(round(length(XX)/4));
       D_best(k)=S;
    end
end