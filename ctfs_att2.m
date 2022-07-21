                       clear all
close all
clc

t=-4:0.01:4;
f= -30:30;
x_t=((square(2*pi*t))+1)/2;
plot(t,x_t);

t=0:0.01:2;  
x_t=((square(2*pi*t))+1)/2;
plot(t,x_t);

for k=1:length(f)
    a_k(k) = 0.5*trapz(t,x_t.*exp(-j*2*pi*f(k)*t));
end

mag_a_k=abs(a_k);
stem(f,mag_a_k)

for i=1:length(t)
    for k=1:length(f)
        int1(k,:)=a_k(k).*exp(j*2*pi*f(k)*t);
    end
    r_x_t(:,:)=sum(int1);
end

figure();
plot(t,r_x_t);
hold on
plot(t,x_t)
hold off


