clc;clear
for i=1:7
    [V_smo{i},~,~,V{i}]=data_import(['my_sensor_data_love',num2str(i),'.txt']);
end


i=1;
    L(i)=length(V{1}{i});
    t=1:1:L(i);
    t=t./62;
    s=zeros(L(i),1)+20;
    %scatter(t,V{1}{1}(:,1),s,'fill');
    plot(t,V{1}{i}(:,1));
    hold on
    plot(t,V_smo{1}{i}(:,1),'r-');
    legend('raw','filterd');
    %hold on 
    %plot(t,V_smo{1}{i}(:,1),'r-');
    grid on
    xlabel('time/s')
    ylabel('a_x/ms^{-2}')
    title(['Acceleration - "love" ',num2str(i)]);


