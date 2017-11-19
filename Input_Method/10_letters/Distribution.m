clc;clear;
load('26_letters_data.mat');
load('max_data.mat');
n=10;
N=100000;
Letter=26;
for i=1:Letter
    for j=1:10
        for k=1:6
            A=V{i}{j}(:,k);
            temp=zeros(2*n,1);
            L=length(A);
            for t=1:N
                u1=ceil(rand*L);
                u2=ceil(rand*L);
                um=min(u1,u2);
                uM=max(u1,u2);
                X=A(um)-A(uM);
                if X==U(k)
                    W=n;
                elseif X==-U(k)
                    W=-n+1;
                else
                    W=ceil(X/U(k)*n);
                end
                temp(W+n)=temp(W+n)+1;
            end
            temp=temp/N;
            P{i}{j}(k*2*n-(2*n-1):k*2*n,1)=temp;
            clear A;
        end
    end
end