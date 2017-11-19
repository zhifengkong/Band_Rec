function group=SVMt_26(data,N,k)
    % k means k-th test, for example, when N=8, k=1 uses data 1 to 8 for train, k=2 uses data 3 to 10 for trian, k=3 uses data 5 to 10 and 1 to 2 for train,....
    load('26_letters_data.mat');
    load('distribution_26.mat');
    load('peak_26.mat');
    Letter=26;
    len=10-N;
    lambda=1;
    for i=1:Letter
        TE1=P;
        TE2=Peak;
        for j=1:10
            P{i}{j}=TE1{i}{mod(j+2*(k-1)-1,10)+1};
            Peak{i}{j}=TE2{i}{mod(j+2*(k-1)-1,10)+1};
        end
    end
for i=1:Letter
    for j=1:N
        T1(1:120,i*N-(N-j))=P{i}{j};
        T1(121:360,i*N-(N-j))=Peak{i}{j}*lambda;
        Group(i*N-(N-j))=i;
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
test(1:120,1)=Distribution_Build(data);
test(121:360,1)=Peaks_Build(data);
    for i=1:Letter-1
        if svmclassify(SvmStruct{i},test')==1
            result=i;
            break;
        end
        result=Letter;
    end
group=result;
end