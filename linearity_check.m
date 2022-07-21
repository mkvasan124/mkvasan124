clear all
close all
clc

t=-10:0.01:10;
%declaring A and B
A=2;
B=4;

for i=1:length(t)
    if(t(i)<0)
        x1_t(i)=0;
    else
        x1_t(i)=1;
    end
end


for i=1:length(t)
    if(t(i)<0)
        x2_t(i)=0;
    else
        x2_t(i)=2;
    end
end

%the following for loop represents the system h(t)=t*x(t)
for i=1:length(t)
    y1_t(i)=t(i)*x1_t(i);
    y2_t(i)=t(i)*x2_t(i);
end

x3_t= A*x1_t + B*x2_t;

for i=1:length(t)
    A0_y3_t(i)=t(i)*x3_t(i);
end

E0_y3_t=A.*y1_t+B.*y2_t;
flag=(A0_y3_t == E0_y3_t);

subplot(3,2,1)
plot(t,x1_t)
title('x1(t)')
xlabel('t')
ylabel('x1(t)')
axis([-11 11 0 3])

subplot(3,2,2)
plot(t,x2_t)
title('x2(t)')
xlabel('t')
ylabel('x2(t)')
axis([-11 11 0 3])

subplot(3,2,3)
plot(t,x3_t)
title('x3(t)')
xlabel('t')
ylabel('x3(t)')
axis([-11 11 0 3])

subplot(3,2,4)
plot(t,y1_t)
title('y1(t)')
xlabel('t')
ylabel('y1(t)')
axis([-11 11 0 5])

subplot(3,2,5)
plot(t,y2_t)
title('y2(t)')
xlabel('t')
ylabel('y2(t)')
axis([-11 11 0 5])

figure()
subplot(2,1,1)
plot(t,A0_y3_t)
title('actual output')
xlabel('t')
ylabel('y3(t)')


subplot(2,1,2)
plot(t,E0_y3_t)
title('expected output')
xlabel('t')
ylabel('y3(t)')



