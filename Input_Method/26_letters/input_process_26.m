function [group,group_alter]=input_process_26(data,N,k)
    group=SVMt_26(data,N,k);
    group_alter=knn_26(data,N);
end