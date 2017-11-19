function [D_smo,pos,X,D]=data_import(A)
    XX=importdata(A);
    X=XX.data;
    [D_smo,pos]=datasort(X);
end