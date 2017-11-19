clc;clear;
load('10_letters_data.mat');
U=zeros(1,6);
Max=U;
Min=U;
for i=1:10
    for j=1:10
        for k=1:6
            A=V{i}{j}(:,k);
            M=max(A);
            m=min(A);
            if M-m>U(k)
                U(k)=M-m;
            end
            if M>Max(k)
                Max(k)=M;
            end
            if m<Min(k)
                Min(k)=m;
            end
            clear A;
        end
    end
end