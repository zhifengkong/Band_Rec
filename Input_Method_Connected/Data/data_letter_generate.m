clear;
N=26;
for i=1:N
    if i==3
    [V1{i},pos{i},X{i}]=data_letter_import(['my_sensor_data_con_',num2str(i),'.txt'],1);
    else
      [V1{i},pos{i},X{i}]=data_letter_import(['my_sensor_data_con_',num2str(i),'.txt']);  
    end
end
aver=zeros(1,26);
for i=1:N
    for j=1:length(V1{i})
        aver(i)=aver(i)+length(V1{i}{j});
    end
    aver(i)=aver(i)/length(V1{i});
end
for i=1:N
    k=1;
    for j=1:length(V1{i})
        if length(V1{i}{j})>aver(i)-15
            V{i}{k}=V1{i}{j};
            k=k+1;
        end
    end
end

for i=1:N
    for j=1:20
        V_smo{i}{j}=data_letter_smooth(V{i}{j},7);
    end
end

for i=1:N
    for j=1:20
        for k=1:6
            avg{i}{j}{k}=mean(abs(V_smo{i}{j}(:,k)));
        end
    end
end

avg_all=zeros(1,6);
for k=1:6
    for i=1:N
        for j=1:20
            avg_all(k)=avg_all(k)+avg{i}{j}{k};
        end
    end
    avg_all(k)=avg_all(k)/20/N;
end