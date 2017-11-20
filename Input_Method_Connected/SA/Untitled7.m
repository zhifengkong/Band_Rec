N=26;
load('letters.mat');
for i=1:N
    Res(i)=SA(300,X{1},i);
end
[A,B]=sort(Res);