clc;
clear all;
close all;
%% ϵͳ��״̬�ռ�ģ��
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
disp(['ϵͳ�ļ��㣺 ',num2str(p)]);
pc=[-3+2*1i*sqrt(3),-3-2*1i*sqrt(3),-5];
L=place(A',C',pc')';
T=eig(A-L*C)';
disp(['���״̬�۲�����ļ����ǣ� ',num2str(T)]);
[xh,x,t]=simobsv(A,B,C,D,L);
legend('״̬1','״̬2','״̬3','�۲�״̬1','�۲�״̬2','�۲�״̬3');
title('ϵͳ��״̬ͼ����ϵͳ�Ĺ۲�״̬ͼ��');
figure
subplot(211)
plot(t,x1,'-');grid on;
legend('״̬1','״̬2','״̬3');
title('ϵͳ��״̬ͼ��');
subplot(212)
plot(t,xh,'-');grid on;
legend('�۲�״̬1','�۲�״̬2','�۲�״̬3');
title('ϵͳ�Ĺ۲�״̬ͼ��');
%% �������ж�
detal1=x1(:,1)-xh(:,1);
detal2=x1(:,2)-xh(:,2);
detal3=x1(:,3)-xh(:,3);
figure
subplot(221)
plot(t,detal1);
legend('x1��״ֵ̬');
title('״̬��۲쵽��״ֵ̬ƫ��');
subplot(222)
plot(t,detal2);
legend('x2��״ֵ̬');
title('״̬��۲쵽��״ֵ̬ƫ��');
subplot(223)
plot(t,detal3);
legend('x3��״ֵ̬');
title('״̬��۲쵽��״ֵ̬ƫ��');