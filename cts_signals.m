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

delay = input('enter the time delay');
advance=input('enter the time advance');


t_delay= t+delay;
t_advanced = t-advance; 


figure()
plot(t,del_t)
hold on
plot(t_delay,del_t)
hold off
legend('original signal','delayed version')
axis([-35 35 -4 4])

figure()
plot(t,u_t)
hold on
plot(t_delay,u_t)
hold off
legend('original signal','delayed version')
axis([-35 35 -4 4])

figure()
plot(t,r_t)
hold on
plot(t_delay,r_t)
hold off
legend('original signal','delayed version')
axis([-35 35 -4 4])

figure()
plot(t,del_t)
hold on
plot(t_advanced,del_t)
hold off
legend('original signal','advanced version')
axis([-35 35 -4 4])

figure()
plot(t,u_t)
hold on
plot(t_advanced,u_t)
hold off
legend('original signal','advanced version')
axis([-35 35 -4 4])

figure()
plot(t,u_t)
hold on
plot(t_advanced,u_t)
hold off
legend('original signal','advanced version')
axis([-35 35 -4 4])

figure()
plot(t,del_t)
hold on
plot(-1.*t,del_t)
hold off
legend('original signal','fold version')
axis([-35 35 -4 4])

figure()
plot(t,r_t)
hold on
plot(-1.*t,r_t)
hold off
legend('original signal','fold version')
axis([-35 35 -4 4])

figure()
plot(t,u_t)
hold on
plot(-1.*t,u_t)
hold off
legend('original signal','fold version')
axis([-35 35 -4 4])


figure()
subplot(3,1,1)
plot(t,del_t)
hold on
plot(t,u_t)
plot(t,r_t)
hold off
grid on
title('original signal')
axis([-35 35 -4 4])
legend('delta','step','ramp')

subplot(3,1,2)
plot(t_delay,del_t)
hold on
plot(t_delay,u_t)
plot(t_delay,r_t)
hold off
grid on
title('delayed version')
axis([-35 35 -4 4])
legend('delta','step','ramp')

subplot(3,1,3)
plot(t_advanced,del_t)
hold on
plot(t_advanced,u_t)
plot(t_advanced,r_t)
hold off
grid on
title('advanced version')
axis([-35 35 -4 4])
legend('delta','step','ramp')

