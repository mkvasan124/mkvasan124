clear all
clc

n=-30:1:30;
for i=1:length(n)
if(n(i)==0)
    del_n(i)=1;
else
    del_n(i)=0;
end
if (n(i)>=0)
    u_n(i)=1;
else
    u_n(i)=0;
end
if (n(i)>=0)
    r_n(i)=n(i);
else
    r_n(i)=0;
end
end

delay = input('enter the time delay');
advance=input('enter the time advance');


n_delay= n+delay;
n_advanced = n-advance; 


figure()
stem(n,del_n)
hold on
stem(n_delay,del_n)
hold off
axis([-35 35 -2 2])
legend('original signal','delayed version')


figure()
stem(n,u_n)
hold on
stem(n_delay,u_n)
hold off
axis([-35 35 -2 2])
legend('original signal','delayed version')

figure()
stem(n,r_n)
hold on
stem(n_delay,r_n)
hold off
axis([-35 35 -10 35])
legend('original signal','delayed version')

figure()
stem(n,del_n)
hold on
stem(n_advanced,del_n)
hold off
axis([-35 35 -2 2])
legend('original signal','advanced version')

figure()
stem(n,u_n)
hold on
stem(n_advanced,u_n)
hold off
axis([-35 35 -2 2])
legend('original signal','advanced version')

figure()
stem(n,r_n)
hold on
stem(-1*n,r_n)
hold off
axis([-35 35 -35 35])
legend('original signal','fold version')

figure()
stem(n,del_n)
hold on
stem(-1*n,del_n)
hold off
axis([-35 35 -2 2])
legend('original signal','fold version')

figure()
stem(n,u_n)
hold on
stem(-1*n,u_n)
hold off
axis([-35 35 -2 2])
legend('original signal','fold version')

figure()
subplot(3,1,1)
stem(n,del_n)
hold on
stem(n,u_n)
stem(n,r_n)
hold off
grid on
title('original signal')
axis([-35 35 -4 4])
legend('delta','step','ramp')

subplot(3,1,2)
stem(n_delay,del_n)
hold on
stem(n_delay,u_n)
stem(n_delay,r_n)
hold off
grid on
title('delayed version')
axis([-35 35 -4 4])
legend('delta','step','ramp')

subplot(3,1,3)
stem(n_advanced,del_n)
hold on
stem(n_advanced,u_n)
stem(n_advanced,r_n)
hold off
grid on
title('advanced version')
axis([-35 35 -4 4])
legend('delta','step','ramp')








