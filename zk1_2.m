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
[y,t,x]=step(G);
figure
plot(t,x,'-');grid on;
