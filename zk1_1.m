clc;
clear all;
close all;
%% 系统的状态空间模型
A=[0 1 0
   0 0 1
   -6 -11 -6];
B=[0;0;1];
C=[1,0,0];
D=0;
G=ss(A,B,C,D);
[y1,t,x1]=step(G);
figure
plot(t,x1,'-');grid on;hold on;
p=eig(A)';
disp(['系统的极点： ',num2str(p)]);
pc=[-3+2*1i*sqrt(3),-3-2*1i*sqrt(3),-5];
L=place(A',C',pc')';
T=eig(A-L*C)';
disp(['添加状态观测器后的极点是： ',num2str(T)]);
[xh,x,t]=simobsv(A,B,C,D,L);
legend('状态1','状态2','状态3','观测状态1','观测状态2','观测状态3');
title('系统的状态图像与系统的观测状态图像');
figure
subplot(211)
plot(t,x1,'-');grid on;
legend('状态1','状态2','状态3');
title('系统的状态图像');
subplot(212)
plot(t,xh,'-');grid on;
legend('观测状态1','观测状态2','观测状态3');
title('系统的观测状态图像');
%% 做误差的判断
detal1=x1(:,1)-xh(:,1);
detal2=x1(:,2)-xh(:,2);
detal3=x1(:,3)-xh(:,3);
figure
subplot(221)
plot(t,detal1);
legend('x1的状态值');
title('状态与观察到的状态值偏差');
subplot(222)
plot(t,detal2);
legend('x2的状态值');
title('状态与观察到的状态值偏差');
subplot(223)
plot(t,detal3);
legend('x3的状态值');
title('状态与观察到的状态值偏差');