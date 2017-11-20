function y=J(a,b,x,l_min,l_max,bias_max, c1, c2,ii,Data)
    y=judge(a,b,ii,Data)+c1*(f(l_min-b+a)+f(b-a-l_max))+...
        c2*((f(x-b)+f(b-x-bias_max))+(f(a-x)+f(x-a-bias_max)));
end