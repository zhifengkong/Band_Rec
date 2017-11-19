function x=control(u,a,b)
    if x<a
        x=a;
    elseif x>b
        x=b;
    else
        x=u;
    end
end