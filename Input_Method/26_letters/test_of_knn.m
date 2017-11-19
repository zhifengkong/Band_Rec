clear;
load('26_data.mat');
Letter=26;
for k=0:2:8
    ['k=',num2str(k)]
    for i=1:Letter
        ['i=',num2str(i)]
        for j=9:10
            group{k/2+1}(i,j-8)=knn_26(V_smo{i}{mod(j-1+k,10)+1},8,k);
        end
    end
end