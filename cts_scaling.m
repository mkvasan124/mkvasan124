clear all
close all
clc
t=-10:0.01:10;
for i=1:length(t)
    if(t(i)>=5)
       x_t(i)=1; 
    else if (t(i)<=-5)
            x_t(i)=1;
        else
            x_t(i)=2;
        end
    end
end
comp=input('enter expansion factor');
exp=input('enter compression factor');

t_exp=t/exp;
t_comp=t.*comp;
% t_fold=t.*-1;

figure()
plot(t,x_t);
hold on
plot(t_comp,x_t);
plot(t_exp,x_t);
% plot(t_fold,x_t);
hold off
axis([-11 11 -5 5])
legend('original signal','expanded_signal','compression signal')
            