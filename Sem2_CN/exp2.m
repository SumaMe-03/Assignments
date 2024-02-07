%exp 2
%BER vs SNR wireless channel
clc;
clear all;
close all;

N=10^5;
x = randi([0, 1], 1, N);

%-------Theoretical------------
SNR_db=0:50;
SNR=10.^(SNR_db/10);
BER_therotical=0.5*(1-sqrt(SNR./(SNR+2)));

%Y=h*x+n/SNR

ber = zeros(size(SNR));
for z=1:length(SNR)
  noise=(randn(1,N)+(i*randn(1,N)));
  h=(randn(1,N)+(i*randn(1,N)));
  y=(h.*x)+(noise./sqrt(SNR(z)));
  y_eq = y./h;
  op=real(y_eq)>0.5;
  ber(z)= size(find([x-op]),2);
end

BER_simulated=ber./N;

semilogy(SNR_db, BER_therotical,'linewidth',2);
hold;
semilogy(SNR_db,BER_simulated,'linewidth',2);

title("BER vs SNR for Rayleigh fading wireless channel using BPSK",'FontSize',22);
xlabel("SNR in db",'FontSize',22);
ylabel("Bit Error Rate",'FontSize',22);
legend("Theoretical", "Simulated");
legend('Location', 'best', 'FontSize', 22);

legend('Interpreter', 'none'); % Disable LaTeX-style interpretation in the legend
grid on;
