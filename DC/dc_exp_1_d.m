clc;
clear all();
close all();
q1=1 %case 1
q2=4 %case 2
q3=10 %case 3
xd = -2:0.01:2; %Range of x
subplot(2,3,6)
%poisspdf is inbuilt octave function to plot poisson distribution
plot(xd,poisspdf (xd, q1),"marker",'+',"markersize",3,'r','LineWidth',2,xd,poisspdf (xd,
q2),"marker",'o',"markersize",3,'g','LineWidth',2,xd,poisspdf (xd,
q3),"marker",'*',"markersize",3,'c','LineWidth',2); %poisspdf is inbuilt octave function to plot poisson
distribution
legend ({"Case 1", "Case 2","Case 3"});
legend hide
legend show
axis ([-1 3 -0.1 0.4])
grid on;
xlabel('OBSERVATION')
ylabel('PROBABILITY DISTRIBUTION')
title('Que-1(d) POISSION DISTRIBUTION')
set(gca,'FontSize',16);
