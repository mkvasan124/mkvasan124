clear all
N = 10^6; % number of bits or symbols
rand('state',100); % initializing the rand() function
randn('state',200); % initializing the randn() function

% Transmitter
ip = rand(1,N)>0.5; % generating 0,1 with equal probability
ip_grouped = reshape(ip,[(size(ip,2)/2),2]);
for ii = 1:(size(ip,2)/2)
%     switch(ip_grouped(ii,:))
%         case [0,0]
%             s(ii)= -(1/sqrt(2))-(1j/sqrt(2));
%         case [0,1]
%             s(ii)= -(1/sqrt(2))+(1j/sqrt(2));
%         case [1,0]
%             s(ii)= (1/sqrt(2))-(1j/sqrt(2));
%         case [1,1]
%             s(ii)= -(1/sqrt(2))+(1j/sqrt(2));
%     end
    current = ip_grouped(ii,:);
    if(ip_grouped(ii,:)==[0,0])
        s(ii)= -(1/sqrt(2))-(1j/sqrt(2));
    end
    if(ip_grouped(ii,:)==[0,1])
        s(ii)= -(1/sqrt(2))+(1j/sqrt(2));
    end
    if(ip_grouped(ii,:)==[1,0])
        s(ii)= (1/sqrt(2))-(1j/sqrt(2));
    end
    if(ip_grouped(ii,:)==[1,1])
        s(ii)= (1/sqrt(2))+(1j/sqrt(2));
    end
end
    
% n = 1/sqrt(2)*[randn(1,N/2) + 1j*randn(1,N/2)]; % white gaussian noise, 0dB variance 
Eb_N0_dB = [-3:35]; % multiple Eb/N0 values
Eb_N0_W = 10.^(Eb_N0_dB/10);

for ii = 1:length(Eb_N0_dB)
    ii
   n = 1/sqrt(2)*[randn(1,N/2) + j*randn(1,N/2)];
   h = 1/sqrt(2)*[randn(1,N/2) + j*randn(1,N/2)];
   
   % Noise addition
   y = h.*s + 10^(-Eb_N0_dB(ii)/20)*n;  % additive white gaussian noise

   %equalization
   yHat = y./h;
   
   % receiver - hard decision decoding
   real_y = real(yHat);
   imag_y = imag(yHat);
   
   for jj = 1:(size(ip,2)/2)
     if(real_y(jj)<0 && imag_y(jj)<0)
         iphat(jj,:)=[0,0];
     end
     if(real_y(jj)<0 && imag_y(jj)>0)
         iphat(jj,:)=[0,1];
     end
     if(real_y(jj)>0 && imag_y(jj)<0)
         iphat(jj,:)=[1,0];
     end
     if(real_y(jj)>0 && imag_y(jj)>0)
         iphat(jj,:)=[1,1];
     end
   end
  iphat_ = reshape(iphat,1,[]);
  % counting the errors
  nErr(ii) = size(find([ip- iphat_]),2);
end

simBer = nErr/N; % simulated ber
theoryBer_AWGN = (erfc((0.707).*sqrt(Eb_N0_W))); 
theoryBer=0.5.*(1-sqrt(Eb_N0_W./(Eb_N0_W+1)));

% plot
close all
figure
semilogy(Eb_N0_dB,theoryBer_AWGN,'cd-','LineWidth',2);
hold on
semilogy(Eb_N0_dB,theoryBer,'bp-','LineWidth',2);
semilogy(Eb_N0_dB,simBer,'mx-','LineWidth',2);
hold off
axis([-3 35 10^-5 0.5])
grid on
legend('AWGN-Theory','Rayleigh-Theory', 'Rayleigh-Simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit error probability curve for QPSK modulation');

