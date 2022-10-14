clear all
close all
SNR_db = 0:1:30;
SNR_watts = (10.^(SNR_db/10));
BER_bask_watts = (0.5)*erfc((0.5*sqrt(SNR_watts)));
BER_bask_db = db(BER_bask_watts);
BER_bpsk_watts = (0.5)*erfc(sqrt(SNR_watts));
BER_bpsk_db = db(BER_bpsk_watts);
BER_bfsk_watts = (0.5)*erfc(sqrt(SNR_watts/2));
BER_bfsk_db = db(BER_bfsk_watts);

figure(1)
% hold on
semilogy(SNR_db,BER_bask_watts,'r-d')
hold on
semilogy(SNR_db,BER_bpsk_watts,'b-o')
hold on
semilogy(SNR_db,BER_bfsk_watts,'g-s')
% hold off
grid on
xlabel('SNR')
ylabel('BER')
title('Binary modulation schemes')
legend('BASK','BPSK','BFSK')


