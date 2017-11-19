function [group,group_alter]=input_process(data,N,k)
    group=SVMt(data,N,k);
    group_alter=knn(data,N);
end