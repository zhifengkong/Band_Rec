clear;
for i=1:26
    [VV{i},pos{i},X{i}]=data_letter_import(['my_sensor_data_',num2str(i),'.txt']);
end
for i=1:26
    if i==2
        for j=1:5
            V{i}{j}=VV{i}{j};
        end
        for j=6:10
            V{i}{j}=VV{i}{j+1};
        end
    elseif i==8
        for j=1:5
            V{i}{j}=VV{i}{j};
        end
        for j=6:10
            V{i}{j}=VV{i}{j+1};
        end
    elseif i==16
        for j=1:10
            V{i}{j}=VV{i}{j+1};
        end
    elseif i==26
        for j=1:9
            V{i}{j}=VV{i}{j};
        end
        V{i}{10}=X{i}(1330:1370,:);
    else
        V{i}=VV{i};
    end
end
for i=1:length(V)
    for j=1:10
        for k=1:6
            V_smo{i}{j}(:,k)=smooth(V{i}{j}(:,k),5,'sgolay',2);
        end
    end
end