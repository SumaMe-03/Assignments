pkg load communications

N = 3000; % Number of bits to be transmitted using 16-QAM
X = randi([0, 1], 1, N); % Random input bits generation
M = 16; % Number of Symbols in 16-QAM

% Symbol Generation
yy = [];
for i = 1:4:length(X)
    real_part = 2 * X(i + 3) + X(i + 2);
    imag_part = 2 * X(i + 1) + X(i);
    y = -3 + (2 * real_part) + (1j * (-3 + 2 * imag_part));
    % Transmitted Symbols
    yy = [yy y];
endfor

% Detection based on euclidean distance
ber_simulated = [];
ber_theoretical = [];
ref_symbols = qammod(0:M-1, M); % Correct usage of qammod
for EbN0db = 0:15
    EbN0 = 10^(EbN0db/10);
    n = (1/sqrt(2)) * (randn(1, length(yy)) + 1j * randn(1, length(yy)));
    sigma = sqrt(1/((log2(M)) * EbN0)); % Symbol energy is normalized to Unity
    r = yy + sigma * n;

    % Calculation of Euclidean Distances of received symbols from reference symbols
    min_dist_index = [];
    for i = 1:length(r)
        Dist = [];
        for k = 1:length(ref_symbols)
            dist = abs(r(i) - ref_symbols(k));
            Dist = [Dist dist];
        endfor
        [~, idx] = min(Dist); % Find the index of the minimum distance
        min_dist_index = [min_dist_index idx];
    endfor

    % Estimation of Bits
    x_estimated = [];
    for i = 1:length(min_dist_index)
        bin_rep = dec2bin(min_dist_index(i) - 1, log2(M));
        for j = 1:length(bin_rep)
            x_estimated = [x_estimated str2num(bin_rep(j))];
        endfor
    endfor

    % BER Computation
    ber_simulated = [ber_simulated sum(X ~= x_estimated) / N];
    ber_theoretical = [ber_theoretical (1/log2(M)) * erfc(sqrt(3 * EbN0))];
endfor

% BER Plotting
EbN0db = 0:15;
semilogy(EbN0db, ber_simulated, 'ro-', EbN0db, ber_theoretical, 'k>-');
title('BER vs Eb/Ne Plot for 16-QAM');
xlabel('Eb/Ne (dB)');
ylabel('BER');
grid on;
legend('Simulated', 'Theoretical');
axis([0 15 10^-6 10^0]);

% Adjust font size for title, xlabel, and ylabel
titleFontSize = 28;
labelFontSize = 28;

% Set font size for title
titleHandle = get(gca, 'Title');
set(titleHandle, 'FontSize', titleFontSize);

% Set font size for x-label
xlabelHandle = get(gca, 'XLabel');
set(xlabelHandle, 'FontSize', labelFontSize);

% Set font size for y-label
ylabelHandle = get(gca, 'YLabel');
set(ylabelHandle, 'FontSize', labelFontSize);

% Increase font size of x and y labels
set(gca, 'FontSize', labelFontSize);
