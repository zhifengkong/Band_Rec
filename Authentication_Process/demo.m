clear;
load('love.mat');
D_smo=V{1};
D1_smo=V{2};
[D2_smo,pos,X]=data_import('my_sensor_data_love1_1.txt');
for i=1:length(D_smo)
    for j=4:6
     D_smo{i}(:,j)=smooth(D_smo{i}(:,j),20,'sgolay',2);
    end
end
for i=1:length(D1_smo)
    for j=4:6
     D1_smo{i}(:,j)=smooth(D1_smo{i}(:,j),20,'sgolay',2);
    end
    [res(i),score{i},totalscore(i)]=judgement(D_smo,D1_smo{i});
end
totalscore
for i=1:length(D2_smo)
    for j=4:6
     D2_smo{i}(:,j)=smooth(D2_smo{i}(:,j),20,'sgolay',2);
    end
     [res1(i),score1{i},totalscore1(i)]=judgement(D_smo,D2_smo{i});
end
totalscore1
