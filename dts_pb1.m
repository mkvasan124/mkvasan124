clc
clear all 

%problem1
w1=2*pi/5;
Amp1=1;
w2=3*pi/2;
Amp2=1;
t=1:51;
x1=Amp1*sin(w1*t)+Amp2*cos(w2*t);
T1=2*pi/w1;
T2=2*pi/w2;
if ~(mod((T1/T2),pi))
    disp("it is aperiodic");
    quit(0);
end
T_overall_1=lcm(sym(T1),sym(T2));
t_scale=0:50;
figure()
stem(t_scale,x1);

%problem2
w3=2*pi/5;
Amp3=1;
w4=3;
Amp4=1;
x2=Amp3*sin(w3*t)+Amp4*cos(w4*t);
T3=2*pi/w3;
T4=2*pi/w4;
if ~(mod((T3/T4),pi))
    disp("it is aperiodic");
    quit(0);
end
T_overall_2=lcm(sym(T3),sym(T4));
figure()
stem(t_scale,x2);

