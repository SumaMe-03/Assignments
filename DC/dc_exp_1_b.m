% Program to plot PSD and Autocorrelation of White Gaussian Random Process
clc;
clear all;
close all;
pkg load statistics;
y=normrnd(0,1,1,200);
Gy=periodogram(y);
Ry=abs(ifft(Gy,256));
Ry=[Ry(130:256)' Ry(1:129)'];
t=-127:1:128;
figure
subplot(1,2,1)
plot(Gy)
xlabel('frequencysamples');
title('PSD')
subplot(1,2,2)
stem(t,Ry)
xlabel('time shift')
title('autocorrelation')
