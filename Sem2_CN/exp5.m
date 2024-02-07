% exp 5
% BER vs SNR
% MIMO
% BER = 2L-1 C L (1/2)^L * (1/SNR)^L

clc;
clear all;
close all;

SNR_dB = 0:60;
SNR = 10.^(SNR_dB/10);
L = [1 2 3 4 5];

for i=1:length(L)
  comb = nchoosek((2*L(i) -1 ), L(i));
  BER_MA = comb * (0.5^L(i)) * ((1./SNR).^L(i));
  semilogy(SNR_dB, BER_MA, 'linewidth',3);
  hold on;
endfor;

xlabel('SNR (dB)','Fontsize',22);
ylabel('BER','Fontsize',22);
title('BER vs SNR for MIMO','Fontsize',22);
legend('L=1', 'L=2', 'L=3', 'L=4', 'L=5','Fontsize',22);
%grid on;
