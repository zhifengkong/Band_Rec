clc;clear;
load('10_letters_data.mat');
load('distribution.mat');
load('peak.mat');
Letter=10;
N=8;
len=Letter-N;
for TIME=1:5
for i=1:Letter
    TE1=P;
    TE2=Peak;
    for j=1:10
        P{i}{j}=TE1{i}{mod(j+2-1,10)+1};
    end
end
for i=1:Letter
    for j=1:N
        T1(1:120,i*N-(N-j))=P{i}{j};
        Group(i*N-(N-j))=i;
    end
    for j=N+1:10
        test(1:120,j-N+(i-1)*(len))=P{i}{j};
        Group_test(j-N+(i-1)*(len))=i;
    end
end
T=T1;
for i=1:Letter-1
    Group1=2+zeros(1,N*(Letter+1-i));
    Group1(1:N)=1;
    SvmStruct{i}=svmtrain(T,Group1,'kernel_function','linear');
    a=size(T);
    TT=T(:,N+1:a(2));
    T=TT;
    clear TT;
    clear Group1;
end
pec(TIME)=0;
for j=1:len*Letter
    for i=1:9
        if svmclassify(SvmStruct{i},test(:,j)')==1
            result{TIME}(j)=i;
            break;
        end
        result{TIME}(j)=Letter;
    end
    if result{TIME}(j)==Group_test(j)
        pec(TIME)=pec(TIME)+1;
    end
end
pec(TIME)=pec(TIME)/(len*Letter);
pec(TIME)
result{TIME}
end
mean(pec)
