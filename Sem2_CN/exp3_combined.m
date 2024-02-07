clc;
clear all;
close all;

N = 10^5;
x = randi([0, 1], 1, N);
SNR_db = 0:50;
SNR = 10.^(SNR_db/10);
BER_theoretical = 0.5 * (1 - sqrt(SNR./(SNR+2)));

% Y=h*x+n/root(SNR)
ber = zeros(size(SNR));
for z = 1:length(SNR)
    noise = (randn(1, N) + (1i * randn(1, N)));
    h = (randn(1, N) + (1i * randn(1, N)));
    y = (h .* x) + (noise ./ sqrt(SNR(z)));
    y = y ./ h;
    op = real(y) > 0.5;
    ber(z)= size(find([x-op]),2);
end

BER_simulated = ber./N;
semilogy(SNR_db, BER_theoretical, 'linewidth',3);
hold on;
semilogy(SNR_db, BER_simulated, 'linewidth',3);

BER_theoretical = [exp(-SNR./2)]./2;
% Y=x+n/root(SNR)
ber = zeros(size(SNR));
for z = 1:length(SNR)
    noise = (randn(1, N) + (1i * randn(1, N)));
    h = (randn(1, N) + (1i * randn(1, N)));
    y = x + (noise ./ sqrt(SNR(z)));
    op = real(y) > 0.5;
    ber(z)= size(find([x-op]),2);
end

BER_simulated = ber./N;
semilogy(SNR_db, BER_theoretical, 'linewidth',3);
semilogy(SNR_db, BER_simulated, 'linewidth',3);

ylim([10^-4, 10^0]);
title("BER vs SNR for Rayleigh fading wireless channel using BPSK",'Fontsize',22);
xlabel("SNR in db",'Fontsize',22);
ylabel("Bit Error Rate",'Fontsize',22);
legend({'Theoretical wireless', 'Simulated wireless', 'Theoretical wireline', 'Simulated wireline'}, 'Interpreter', 'none','Fontsize',22);
grid on;

