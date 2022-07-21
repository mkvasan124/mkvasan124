clear all
clc

t=-10:0.001:10;
for i=1:length(t)
if(t(i)==0)
    del_t(i)=1;
else
    del_t(i)=0;
end
if (t(i)>=0)
    u_t(i)=1;
else
    u_t(i)=0;
end
if (t(i)>=0)
    r_t(i)=t(i);
else
    r_t(i)=0;
end
end

A=input('enter the amplitude scaling factor');


figure()
plot(t,del_t)
hold on
plot(t,A*del_t)
hold off
legend('original signal','amplitude scaled version')

figure()
plot(t,u_t)
hold on
plot(t,A*u_t)
hold off
legend('original signal','amplitude scaled version')

figure()
plot(t,r_t)
hold on
plot(t,A*r_t)
hold off
legend('original signal','amplitude scaled version')

figure()
plot(t,del_t)
hold on
plot(t,(1/A)*del_t)
hold off
legend('original signal','delayed version')

figure()
plot(t,u_t)
hold on
plot(t,(1/A)*u_t)
hold off
legend('original signal','delayed version')

figure()
plot(t,r_t)
hold on
plot(t,(1/A)*r_t)
hold off
legend('original signal','delayed version')

