clear;
[Data_b{1},pos_b{1},X_b{1}]=data_import('my_sensor_data_want.txt');
[Data_b{2},pos_b{2},X_b{2}]=data_import('my_sensor_data_stop.txt');
[Data_b{3},pos_b{3},X_b{3}]=data_import('my_sensor_data_mind.txt');
[Data_b{4},pos_b{4},X_b{4}]=data_import('my_sensor_data_moon.txt');
[Data_b{5},pos_b{5},X_b{5}]=data_import('my_sensor_data_game.txt');
[Data_b{6},pos_b{6},X_b{6}]=data_import('my_sensor_data_laugh.txt');
[Data_b{7},pos_b{7},X_b{7}]=data_import('my_sensor_data_high.txt');
Data_b{7}{10}=X_b{7}(5034:5257,:);
[Data_b{8},pos_b{8},X_b{8}]=data_import('my_sensor_data_even.txt');
[Data_b{9},pos_b{9},X_b{9}]=data_import('my_sensor_data_bet.txt');
[Data_b{10},pos_b{10},X_b{10}]=data_import('my_sensor_data_book.txt');
load('love_0.mat');
for i=1:10
    for j=1:10
        for k=1:6
            Data_b_smo{i}{j}(:,k)=smooth(Data_b{i}{j}(:,k),9,'sgolay',2);
        end
    end
end
for i=1:50
    for k=1:6
        Data_a_smo{i}(:,k)=smooth(Data_a{i}(:,k),9,'sgolay',2);
    end
end
for i=1:10
    Train{i}=Data_a_smo{5*i};
end
for i=1:50
    [~,~,totalscore_a(i)]=judgement(Train,Data_a_smo{i});
end
for i=1:10
    ['i=',num2str(i),'...']
    for j=1:10
        [~,~,totalscore_b(i,j)]=judgement(Train,Data_b_smo{i}{j});
    end
end
