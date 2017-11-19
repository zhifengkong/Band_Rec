function vec=VecRegulate(vec1,vec2,Z)
    [~, dtwPath,~]=dtw(vec1,vec2,Z);
    k=1;
    for i=1:length(dtwPath)-1
        for j=1:dtwPath(2,i+1)-dtwPath(2,i)
            vec(k)=vec1(dtwPath(1,i));
            k=k+1;
        end
    end
    vec(k)=vec1(dtwPath(1,i+1));
    vec=vec';
end