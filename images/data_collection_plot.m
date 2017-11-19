load('love.mat');
X=XX{1};
L=length(X);
S=zeros(L,1);
S=S+40;
C=zeros(L,3);
delta=1;


subplot(1,2,1)
    for i=1:L
        C(i,1)=(i/2+L/2-L/10)/L/10;
        C(i,2)=(i/2+L/2-L/10)/L;
        C(i,3)=(i/2+L/2-L/10)/L;
    end
    scatter3(X(:,1),X(:,2),X(:,3),S,C,'fill');
    hold on
    plot3(X(:,1),X(:,2),X(:,3),'Color',[.1,.7,.7]);
    xlabel('a_x ( m/s^2 )','Fontsize',13,'Fontweight','bold');
    ylabel('a_y ( m/s^2 )','Fontsize',13,'Fontweight','bold');
    zlabel('a_z ( m/s^2 )','Fontsize',13,'Fontweight','bold');
    view(-37.5,50);
    title('Acceleration','Fontsize',18)
subplot(1,2,2)
    for i=1:L
        C(i,1)=(i/2+L/2)/L;
        C(i,2)=(i/2+L/2-L/10)/L/6;
        C(i,3)=(i/2+L/2-L/10)/L;
    end
    scatter3(X(:,4),X(:,5),X(:,6),S,C,'fill');
    hold on
    plot3(X(:,4),X(:,5),X(:,6),'Color',[.7,.1,.7]);
    xlabel('\omega_x ( \circ/s )','Fontsize',13,'Fontweight','bold');
    ylabel('\omega_y ( \circ/s )','Fontsize',13,'Fontweight','bold');
    zlabel('\omega_z ( \circ/s )','Fontsize',13,'Fontweight','bold');
    view(-37.5,50);
    title('Angular Velocity','Fontsize',18);
    