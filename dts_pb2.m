%problem1
w1=2/3;
Amp1=1;
w2=2/5;
Amp2=1;
w3=2*pi/3;
Amp3=0;
t=1:21;
x1=Amp1*sin(w2*t)+Amp2*cos(w1*t)+Amp3*sin(w3*t);
T1=2*pi/w1;
T2=2*pi/w2;
T3=2*pi/w3;
% if ~(mod((T1/T2),pi))
%     disp("it is aperiodic");
%     quit(0);
% end
T_overall_1=lcm(sym(T1),sym(T2));
t_scale_1=0:20;
stem(t,x1);
