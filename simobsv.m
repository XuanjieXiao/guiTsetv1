%求系统在单位阶跃响应下的观测值
function [xh,x,t]=simobsv(A,B,C,D,L)
G=ss(A,B,C,D);
[y,t,x]=step(G);                 %求原系统的单位阶跃响应
[y1,xh1]=step((A-L*C),B,C,D,1,t);%把观测器的状态方程看成双输入，u和y
[y2,xh2]=lsim((A-L*C),L,C,D,y,t);%求任意输入下的响应，这里把极点配置前的单位阶跃响应作为输入数据
xh=xh1+xh2;                      %得到观测器单位阶跃响应的观测值。
plot(t,x,'-',t,xh,'-');grid on;