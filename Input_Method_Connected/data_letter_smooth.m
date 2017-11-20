function B=data_letter_smooth(A,n)
    for k=1:6
        B(:,k)=smooth(A(:,k),n,'sgolay',2);
    end
end