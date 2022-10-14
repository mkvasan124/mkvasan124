clear
N = 10^6; % number of bits or symbols
rand('state',100); % initializing the rand() function
randn('state',200); % initializing the randn() function
Eb = 1; %energy/bit

% Transmitter
ip = rand(1,N)>0.5; % generating 0,1 with equal probability
s = sqrt(Eb)*ip; % BASK modulation 0 -> 0; 1 -> (Eb)^ 1/2 
n = 1/sqrt(2)*[randn(1,N) + 1j*randn(1,N)]; % white gaussian noise, 0dB variance 
Eb_N0_dB = [-3:17]; % multiple Eb/N0 values
Eb_N0_W = 10.^((Eb_N0_dB)/10);

for ii = 1:length(Eb_N0_dB)
   % Noise addition
   y = s + 10^(-Eb_N0_dB(ii)/20)*n; % additive white gaussian noise

   % receiver - hard decision decoding
   ipHat = real(y) > (sqrt(Eb)/2);

   % counting the errors
   nErr(ii) = size(find([ip- ipHat]),2);

end

simBer = nErr/N; % simulated ber
theoryBer = 0.5*erfc(0.5*sqrt(Eb_N0_W)); % theoretical ber

% plot
close all
figure
semilogy(Eb_N0_dB,theoryBer,'bx-');
hold on
semilogy(Eb_N0_dB,simBer,'mo-');
axis([-3 17 10^-5 0.5])
grid on
legend('theory', 'simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit error probability curve for BPSK modulation');

