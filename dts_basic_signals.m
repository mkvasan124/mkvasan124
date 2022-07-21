clear all
clc

n=-20:1:20;
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
figure()
stem(n,del_n,'LineWidth',2)
hold on
stem(n,r_n)
stem(n,u_n)
hold off
grid on
legend('delta signal','ramp signal','unit step signal')