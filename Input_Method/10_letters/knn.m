function [GGG,F]=knn(data,N)
    load('10_letters_data.mat');
    Letter=10;
    for i=1:Letter
        for j=1:N
            Train{i}{j}=V{i}{j};
        end
    end
    for i=1:Letter
        for j=1:N
            ts((i-1)*N+j)=0;
            for k=1:6
                ts((i-1)*N+j)=ts((i-1)*N+j)+dtw(Train{i}{j}(:,k)/max(abs(Train{i}{j}(:,k))),data(:,k)/max(abs(data(:,k))));
            end
        end
    end
    [E,F]=sort(ts);
    for i=1:4
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
