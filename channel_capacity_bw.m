clear all
close all
bw = (1:100);
No = 1;
var_no = bw*No;
p = [1,10];
for j=1:2
    for i=1:100
        C(j,i) = bw(i)*log2(1+(p(j)/var_no(i)));
    end
end
figure()
plot(bw,C(1,:))
hold on
plot(bw,C(2,:))
hold off
title('bandwidth vs capacity')
xlabel('bandwidth')
ylabel('capacity')
legend('1w','10w')
grid on



    
  