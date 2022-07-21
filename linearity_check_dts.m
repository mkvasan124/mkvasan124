clear all
close all
clc

n=-20:1:20;
%declaring A and B
A=2;
B=4;

for i=1:length(n)
    if(n(i)<0)
        x1_n(i)=0;
    else
        x1_n(i)=1;
    end
end


for i=1:length(n)
    if(n(i)<0)
        x2_n(i)=0;
    else
        x2_n(i)=2;
    end
end

%the following for loop represents the system h(t)=t*x(t)
for i=1:length(n)
    y1_n(i)=n(i)*x1_n(i);
    y2_n(i)=n(i)*x2_n(i);
end

x3_n= A*x1_n + B*x2_n;

for i=1:length(n)
    A0_y3_n(i)=n(i)*x3_n(i);
end

E0_y3_n=A.*y1_n+B.*y2_n;
flag=(A0_y3_n == E0_y3_n);

subplot(3,2,1)
stem(n,x1_n)
title('x1(n)')
xlabel('n')
ylabel('x1(n)')
axis([-11 11 0 3])

subplot(3,2,2)
stem(n,x2_n)
title('x2(n)')
xlabel('n')
ylabel('x2(n)')
axis([-11 11 0 3])

subplot(3,2,3)
stem(n,x3_n)
title('x3(n)')
xlabel('n')
ylabel('x3(n)')
axis([-11 11 0 3])

subplot(3,2,4)
stem(n,y1_n)
title('y1(n)')
xlabel('n')
ylabel('y1(n)')
axis([-11 11 0 5])

subplot(3,2,5)
stem(n,y2_n)
title('y2(n)')
xlabel('n')
ylabel('y2(n)')
axis([-11 11 0 5])

figure()
subplot(2,1,1)
stem(n,A0_y3_n)
title('actual output')
xlabel('n')
ylabel('y3(n)')


subplot(2,1,2)
stem(n,E0_y3_n)
title('expected output')
xlabel('n')
ylabel('y3(n)')



