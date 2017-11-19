clc;clear;
load('love.mat');
for i=1:7
    for j=1:5
        D{5*i-(5-j)}=V{i}{j};
        C{i}{j}=V{i}{j};
    end
end
for i=1:7
    display('i=',num2str(i));
    for j=1:5*7
        [res(i*5-4,j),score{i*5-4,j},totalscore(i*5-4,j)]=judgement(C{i},D{j});
        for k=2:5
            res(i*5-5+k,j)=res(i*5-4,j);
            score{i*5-5+k,j}=score{i*5-4,j};
            totalscore(i*5-5+k,j)=totalscore(i*5-4,j);
        end
    end
end
