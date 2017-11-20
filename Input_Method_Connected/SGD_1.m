function [Res,iter]=SGD_1(x,Data)
%% stochastic gradient descent

% given x, parameters: l_max,l_min,bias_max
% min -judge(a,b)
% s.t. l_min<b-a<l_max
% 0<b-x<bias_max, 0<x-a<bias_max

% transform to penalties
% penalty function is f(x)=1/(1+exp(-c*x)), where c is large
% f'(x)=(c*exp(-c*x))/(1+exp(-c*x))^2
% min J(a,b)=judge(a,b)+c1*(f(l_min-b+a)+f(b-a-l_max))
% +c2*((f(x-b)+f(b-x-bias_max))+(f(a-x)+f(x-a-bias_max)))

% formula is: min J(x)
% yita--learning rate
% a0,b0 initial points
% a=a-yita*J_a, b=b-yita*J_b


ii=1;

%% test function, want to find its max with constraints

%% parameters
a0=max(x-35,1); % initial point
b0=min(x+35,length(Data)); % initial point
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

%% penalty functions and its grad
f=inline('exp(0.1*(u+20))','u');
grad_f=inline('0.1*exp(0.1*(u+20))','u');

%% SGD
disp([num2str(ii),'-th...'])
a(ii)=0; b(ii)=0;
a_new(ii)=a0; b_new(ii)=b0;
iter(ii)=0;
while(abs(a_new(ii)-a(ii))+abs(b_new(ii)-b(ii))>cvg_threshold)
    iter(ii)=iter(ii)+1;
    if iter(ii)>iter_threshold
        disp('ERROR: not converge')
        break
    end
    if a_new(ii)<=0 || b_new(ii)>=L
        score(ii)=1000;
        break;
    end
    % update
    a(ii)=a_new(ii); b(ii)=b_new(ii);
    a_new(ii)=a(ii)-yita*rand*(...
        (judge(a(ii)+h,b(ii),ii,Data)-judge(a(ii)-h,b(ii),ii,Data))/(2*h)...
        +c1*(grad_f(l_min-b(ii)+a(ii))-grad_f(b(ii)-a(ii)-l_max))...
        +c2*(grad_f(a(ii)-x)-grad_f(x-a(ii)-bias_max))...
        );
    b_new(ii)=b(ii)-yita*rand*(...
        (judge(a(ii),b(ii)+h,ii,Data)-judge(a(ii),b(ii)-h,ii,Data))/(2*h)...
        +c1*(-grad_f(l_min-b(ii)+a(ii))+grad_f(b(ii)-a(ii)-l_max))...
        +c2*(-grad_f(x-b(ii))+grad_f(b(ii)-x-bias_max))...
        );
end
    if a_new(ii)<=0 || b_new(ii)>=L
        score(ii)=1000;
    else
        score(ii)=judge(a_new(ii),b_new(ii),ii,Data);
    end
%% Choose closest one
Res=score(ii);

end