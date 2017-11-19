function [GGG,F]=knn_26(data,N,k)
    load('26_data.mat');
    Letter=26;
    for i=1:Letter
        for j=1:N
            Train{i}{j}=V_smo{i}{mod(j+k-1,10)+1};
        end
    end
    for i=1:Letter
        D=bestdist(Train{i});
        for j=1:N
            ts((i-1)*N+j)=0;
            for k=1:6
                ts((i-1)*N+j)=ts((i-1)*N+j)+dtw(Train{i}{j}(:,k),data(:,k))/D(k);
            end
        end
    end
    [E,F]=sort(ts);
    for i=1:8
        G(i)=ceil(F(i)/N);
    end
    H=unique(G);
    for i=1:length(H)
        for j=1:length(G)
            if H(i)==G(j)
                R(i)=j;
                break;
            end
        end
    end
    [a,b]=sort(R);
    for i=1:length(H)
        GG(i)=H(b(i));
    end
    GGG=GG(1);
end
