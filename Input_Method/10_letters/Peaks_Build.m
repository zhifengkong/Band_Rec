function P=Peaks_Build(data)
load('max_data.mat');
n=10;
        for k=1:6
            A=data(:,k);
            M=max(A);
            m=min(A);
            temp=zeros(4*n,1);
            for t=2:length(A)-1
                delta=0;
                if (A(t)>A(t-1) && A(t)>A(t+1))
                    if A(t)>M/2
                        delta=1;
                    elseif A(t)>M/10
                        delta=2;
                    end
                end
                if (A(t)>A(t-1) && A(t)>A(t+1))
                    if A(t)<m/2
                        delta=3;
                    elseif A(t)<m/10
                        delta=4;
                    end
                end
                if delta~=0
                    temp(n*(delta-1)+ceil(t/length(A)*10))=temp(n*(delta-1)+ceil(t/length(A)*10))+1;
                end
            end
            P((k-1)*length(temp)+1:k*length(temp),1)=temp;
            clear A;
        end
end