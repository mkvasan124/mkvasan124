clear all
close all
bw = [1,2,5,10];
No = 1;
var_no = bw*No;
p=0:10^4;
for i=1:length(bw)
    C(i,:)=bw(i).* log2(1+(p/var_no(i)));
end
figure()
plot(p,C(1,:))
hold on
plot(p,C(2,:))
hold off
title('signal power vs capacity')
xlabel('signal power')
ylabel('capacity')
legend('1hz','10hx')
grid on

    
  