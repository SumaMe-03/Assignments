pkg load statistics;
pkg load signal;
clc;
clear all();
close all();
xc = -20:0.001:20;
p1 = 1; % gamma-1
p2 = 4; % gamma-2
p3 = 10; % gamma-3
subplot(2, 3, 3)
clf
plot(xc, exppdf(xc, p1), 'r', 'LineWidth', 1.5);
hold on;
plot(xc, exppdf(xc, p2), 'b', 'LineWidth', 1.5);
plot(xc, exppdf(xc, p3), 'y', 'LineWidth', 1.5);
hold off;
legend({"Case 1", "Case 2", "Case 3"});
axis([-6 6 -1 15]);
grid on;
xlabel('OBSERVATION');
ylabel('PROBABILITY DISTRIBUTION');
title('Que-1(c) EXPONENTIAL DISTRIBUTION');
set(gca, 'FontSize', 16);
legend hide;
legend show;
