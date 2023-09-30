%Name: Suma Gadepalli
%Class: TE 8
%Rollno: 32364


clc;
clear all;
close all;
pkg load communications

%no. of bits to be transmitted using PSK
N=3000;

%random input bits generation
x=randi([0,1],1,N);

%No. of symbols in 8-PSK
M=8;

%Symbol Generation
yy=[];
for i=1:3:length(x)
  if x(i)==0 && x(i+1)==0 && x(i+2)==0
    y=cosd(0) + 1j*sind(0);
  elseif x(i)==0 && x(i+1)==0 && x(i+2)==1
    y=cosd(45) + 1j*sind(45);
  elseif x(i)==0 && x(i+1)==1 && x(i+2)==1
    y=cosd(90) + 1j*sind(90);
  elseif x(i)==0 && x(i+1)==1 && x(i+2)==0
    y=cosd(135) + 1j*sind(135);
  elseif x(i)==1 && x(i+1)==1 && x(i+2)==0
    y=cosd(180) + 1j*sind(180);
  elseif x(i)==1 && x(i+1)==1 && x(i+2)==1
    y=cosd(225) + 1j*sind(225);
  elseif x(i)==1 && x(i+1)==0 && x(i+2)==1
    y=cosd(270) + 1j*sind(270);
  elseif x(i)==1 && x(i+1)==0 && x(i+2)==0
    y=cosd(315) + 1j*sind(315);
  endif

  %Transmitted Symbols
  yy=[yy y];
endfor

%Constellation diagram without noise
scatterplot(yy);
title('Constellation Diagram without Noise');
xlabel('In-phase');
ylabel('Quadrature');

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

% Increase point size in the scatterplot without noise
pointSize = 20;
scatterHandle = get(gca, 'Children'); % Get scatterplot handle
set(scatterHandle, 'MarkerSize', pointSize);

% Increase font size of x and y labels
set(gca, 'FontSize', labelFontSize);


%change the value of &amp
%noisy constellation diagram
EbN0db=20;
EbN0=10^(EbN0db/10);

%AWGN channel
n = (1/sqrt(2))*[randn(1,length(yy)) + 1j*randn(1,length(yy))];
sigma=sqrt(1/((log2(M)*EbN0)));

%Received Symbols
r = yy + sigma*n;

%constellation diagram with noise
scatterplot(r);
title('Constellation Diagram with Noise');
xlabel('In-phase');
ylabel('Quadrature');

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

