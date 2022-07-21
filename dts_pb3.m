clc
clear all 

%problem1
w1=pi/4;
Amp1=1;
w2=2*pi/3;
Amp2=1;
t=1:31;
x1=Amp1*sin(w1*t)+Amp2*cos(w2*t);
N1=2*pi/w1;
N2=2*pi/w2;
if ~(mod((N1/N2),pi))
    disp("it is aperiodic");
    quit(0);
end
T_overall_1=lcm(sym(N1),sym(N2));
t_scale=0:30;
figure()
stem(t_scale,x1);