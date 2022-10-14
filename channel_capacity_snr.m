clear all
close all
B=[1,5,10];
snr_db=(1:30);
snr_watts = 10.^((1:30)/10);
for i=1:length(B)
    C(i,:)=snr_watts(1:30)/B(i);
end
C_db = 10*log10(C);
plot(snr_db,C(1,:));
hold on
plot(snr_db,C(2,:));
plot(snr_db,C(3,:));
title('capacity vs snr')
grid on
xlabel('snr')
ylabel('capacity')
legend('1hz','5hz','10hz')





    
  