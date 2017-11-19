load('10_letters_data.mat');
for i=1:10
    for j=1:10
        D{10*i-(10-j)}=V{i}{j};
        C{i}{j}=V{i}{j};
    end
end
for i=1:10
    display('i=',num2str(i));
    for j=1:10*10
        [res(i*10-9,j),score{i*10-9,j},totalscore(i*10-9,j)]=judgement(C{i},D{j});
        for k=2:10
            res(i*10-10+k,j)=res(i*10-9,j);
            score{i*10-10+k,j}=score{i*10-9,j};
            totalscore(i*10-10+k,j)=totalscore(i*10-9,j);
        end
    end
end

