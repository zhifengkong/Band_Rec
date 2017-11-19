
A=importdata('my_sensor_data_love1.txt');
Acc=A.data(:,1:3);
Gro=A.data(:,4:6);
dt=1/62;
v=[0 0 0]';
n=length(Acc);
R=[0 0 0;0 0 0]';
N=[0 0 0]';
for i=1:n
    v=v+dt*Acc(i,:)';
    R(:,i+1)=R(:,i)+v*dt;
    N=Gro(i,:)';
    theta=dt*norm(N);
    theta=theta*pi/180;
    N=N/norm(N);
    RR=[cos(theta)+(1-cos(theta))*N(1)^2,(1-cos(theta))*N(1)*N(2)-(sin(theta))*N(3),(1-cos(theta))*N(1)*N(3)+sin(theta)*N(2);
        (1-cos(theta))*N(1)*N(2)+(sin(theta))*N(3),cos(theta)+(1-cos(theta))*N(2)^2,(1-cos(theta))*N(2)*N(3)-sin(theta)*N(1);
        (1-cos(theta))*N(1)*N(3)-(sin(theta))*N(2),(1-cos(theta))*N(2)*N(3)+(sin(theta))*N(1),cos(theta)+(1-cos(theta))*N(3)^2];
    v=RR*v;
end


plot3(0,0,0,'r.','markersize',5);
hold on
plot3(R(1,:),R(2,:),R(3,:));
axis equal;

xlabel('x'),ylabel('y'),zlabel('z');
grid on


%plot(smooth(Acc(:,1),'sgolay',2),'r-')
[D,pos]=datasort(A.data);
for i=1:length(D)
    for j=1:6
        D_smo{i}(:,j)=smooth(D{i}(:,j),'sgolay',2);
    end
end
%{
subplot(2,3,1)
plot(D{1}(:,1))
subplot(2,3,2)
plot(D{1}(:,2))
subplot(2,3,3)
plot(D{1}(:,3))
subplot(2,3,4)
plot(D{1}(:,4))
subplot(2,3,5)
plot(D{1}(:,5))
subplot(2,3,6)
plot(D{1}(:,6))
%}


