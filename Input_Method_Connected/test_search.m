x=1000;
score0=10000;
for i=1:50
    i
    a=x-i;
    for j=30:70
        b=a+j;
        score=judge(a,b,1,X{1});
        if score<score0
            score0=score;
            Ra=a;
            Rb=b;
        end
    end
end