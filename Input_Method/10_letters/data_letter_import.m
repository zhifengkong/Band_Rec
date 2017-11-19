function [D,pos,X]=data_letter_import(A)
    XX=importdata(A);
    X=XX.data;
    [D,pos]=data_letter_sort(X);
end