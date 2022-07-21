
clear all
clc
n=0:31;
w=pi/2;
x=sin(w*n);
x1=sin((w*n)+(2*pi));
x2=sin((w*n)+(4*pi));
subplot(3,1,1)
stem(n,x);
subplot(3,1,2)
stem(n,x1);
subplot(3,1,3)
stem(n,x2);


