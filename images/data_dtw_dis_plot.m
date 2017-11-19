clc;clear;
[D_smo,pos,X]=data_import('my_sensor_data_love1.txt');
D1_smo=data_import('my_sensor_data_test.txt');
vec{1}=D_smo{1}(:,1);
vec{2}=D_smo{2}(:,1);
vec21=VecRegulate(vec{1},vec{2},1);
for i=1:2
    t=1:1:length(vec{i});
    t=t./62;
    if i==1
        str='b-';
    else
        str='r-';
    end
    plot(t,vec{i},str);
    hold on
end
legend('"love" 1','"love" 2');
xlabel('time/s');
ylabel('a_x/ms^{-2}');
title('Acceleration of x axis - "love" ');