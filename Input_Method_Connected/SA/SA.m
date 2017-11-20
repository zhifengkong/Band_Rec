%matlab 程序实现 模拟退火算法程序 函数求极值（引用后修改，感谢 ARMYLAU）

%使用模拟退火法求函数J的最小值
%根据题意，我们设计冷却表进度表为：
%即初始温度为30
%衰减参数为0.95
%马可夫链长度为4
%Metropolis的步长为0.02
%结束条件为根据上一个最优解与最新的一个最优解的之差小于某个容差。
%使用METROPOLIS接受准则进行模拟, 程序如下

function [Res,BestX,BestY]=SA(x,Data,ii)
%% parameters
a0=max(x-25,1); % initial point
b0=min(x+25,length(Data)); % initial point
l_min=30; 
l_max=80; 
bias_max=50;
c1=10; % penalty parameter
c2=10; % penalty parameter
h=1; % numerically compute partial diff of judge(a,b)
yita=2; % learning rate
cvg_threshold=0.1; % judge whether converge
iter_threshold=100; % if not converge, break
L=length(Data);

%%
%要求最优值的目标函数,搜索的最大区间
XMAX= bias_max;
YMAX = bias_max;
%冷却表参数
MarkovLength = 2; %// 马可夫链长度
DecayScale = 0.8; %// 衰减参数
StepFactor = 2; %// 步长因子
Temperature0=30;
Temperature=Temperature0; %// 初始温度
Tolerance = 0.7; %// 容差
AcceptPoints = 0.0; %// Metropolis过程中总接受点
rnd =rand;

%% 随机选点 初值设定
PreX = a0;
PreY = b0;
BestX = PreX;
BestY = PreY;
PreBestX  = PreX;
PreBestY = PreX;

%% 每迭代一次退火一次(降温), 直到满足迭代条件为止
iter=0;
mm=abs(J(BestX, BestY,x,l_min,l_max,bias_max, c1, c2,ii,Data)...
    -J(PreBestX, PreBestY,x,l_min,l_max,bias_max, c1, c2,ii,Data));
del=0;
while mm > Tolerance
    iter=iter+1
    BB(iter)=BestX;
    if iter>3
        if BB(iter)==BB(iter-1)
            del=del+1;
        else
            del=0;
        end
    end
    if del==10
        break;
    end
    BestX
    BestY
    
    Temperature=DecayScale*Temperature;
    %StepFactor=StepFactor.*Temperature./Temperature0;
    AcceptPoints = 0.0;
    % 在当前温度T下迭代loop(即MARKOV链长度)次
    for i=1:1:4
        % 1) 在此点附近随机选下一点
        p=0;
        while p==0
            if mod(i,4)==1
                NextX = PreX + StepFactor*XMAX*abs((rand-0.5));
                NextY = PreY + StepFactor*YMAX*abs((rand-0.5));
            elseif mod(i,4)==2
                NextX = PreX + StepFactor*XMAX*abs((rand-0.5));
                NextY = PreY - StepFactor*YMAX*abs((rand-0.5));
            elseif mod(i,4)==3
                NextX = PreX - StepFactor*XMAX*abs((rand-0.5));
                NextY = PreY + StepFactor*YMAX*abs((rand-0.5));
            else
                NextX = PreX - StepFactor*XMAX*abs((rand-0.5));
                NextY = PreY - StepFactor*YMAX*abs((rand-0.5));
            end
            if (NextX>=x-bias_max && NextX<=x && NextY>=x && NextY<=x+bias_max)
                p=1;
            end
        end
        % 2) 是否全局最优解
        Nex=J(NextX,NextY,x,l_min,l_max,bias_max, c1, c2,ii,Data);
        if (J(BestX,BestY,x,l_min,l_max,bias_max, c1, c2,ii,Data) ...
                > Nex)
            % 保留上一个最优解
            PreBestX =BestX;
            PreBestY = BestY;
            % 此为新的最优解
            BestX=NextX;
            BestY=NextY;
        end
        % 3) Metropolis过程
        if( J(PreX,PreY,x,l_min,l_max,bias_max, c1, c2,ii,Data)...
                - Nex > 0 )
            %// 接受, 此处lastPoint即下一个迭代的点以新接受的点开始
            PreX=NextX;
            PreY=NextY;
            AcceptPoints=AcceptPoints+1;
        else
            changer = -1 * ( Nex ...
                - J(PreX,PreY,x,l_min,l_max,bias_max, c1, c2,ii,Data) ) / Temperature ;
            rnd=rand;
            p1=exp(changer);
            double (p1);
            if p1 > rand             %// 不接受, 保存原解
                PreX=NextX;
                PreY=NextY;
                AcceptPoints=AcceptPoints+1;
            end
        end
    end
    mm=abs(J( BestX,BestY,x,l_min,l_max,bias_max, c1, c2,ii,Data)...
        -J(PreBestX, PreBestY,x,l_min,l_max,bias_max, c1, c2,ii,Data));
end
%%
disp('ideal a and b is')
disp([BestX, BestY])
disp('this J is')
disp(J(BestX, BestY,x,l_min,l_max,bias_max, c1, c2,ii,Data))
disp('the judge is')
disp(judge(BestX,BestY,ii,Data))
Res=judge(BestX,BestY,ii,Data);
disp('number of iterations')
disp(iter)
end