clc;clear
for i=1:7
    [V_smo{i},~,~,V{i}]=data_import(['my_sensor_data_love',num2str(i),'.txt']);
end


for i=1:2
    L(i)=length(V{1}{i});
    t=1:1:L(i);
    t=t./62;
    s=zeros(L(i),1)+20;
    %scatter(t,V{1}{1}(:,1),s,'fill');
    subplot(2,2,i)
    plot(t,V{1}{i}(:,1));
    hold on
    plot(t,V{1}{i}(:,2),'r-');
    hold on
    plot(t,V{1}{i}(:,3),'g-');
    legend('a_x','a_y','a_z');
    %hold on 
    %plot(t,V_smo{1}{i}(:,1),'r-');
    grid on
    xlabel('time/s')
    ylabel('a_x/ms^{-2}')
    title(['Acceleration - "love" ',num2str(i)]);
end
for i=3:4
    L(i)=length(V{1}{i});
    t=1:1:L(i);
    t=t/62;
    s=zeros(L(i),1)+20;
    %scatter(t,V{1}{1}(:,1),s,'fill');
    subplot(2,2,i)
    plot(t,V{1}{i}(:,4));
    hold on
    plot(t,V{1}{i}(:,5),'r-');
    hold on
    plot(t,V{1}{i}(:,6),'g-');
    legend('\omega_x','\omega_y','\omega_z');
    %hold on 
    %plot(t,V_smo{1}{i}(:,4),'r-');
    grid on
    xlabel('time/s')
    ylabel('\omega_x/\circs^{-1}')  
    title(['Angular velocity - "love" ',num2str(i-2)]);
end
