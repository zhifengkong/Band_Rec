A=importdata('my_sensor_data_lazy.txt');
A=A.data;
for k=1:6
    A(:,k)=smooth(A(:,k),7,'sgolay',2);
end
B=A(10:450,:);
x=60;
k=1;
%Res={};
% while x<380
%     for i=1:26
%         Res{k}(i)=SA(x,B,i);
%     end
%     [R{k},Ran{k}]=sort(Res{k});
%     k=k+1;
%     x=x+50;
% end
    x=180;
     for i=1:26
         [Res(i),BestX(i),BestY(i)]=SA(x,B,i);
     end
     [R,Ran]=sort(Res);
     
     for i=1:26
         subplot(5,6,i);
         contra(B(round(BestX(i)):round(BestY(i)),:),V_smo{i}{10},1);
     end
     
%B(95:150) is letter "l"
%B(165:200) is letter "a"
%B(200:250) is letter "z"
%B(250:312) is letter "y"
