%exp 2: Hata model

close all;
clear all;
clc;

gt = 2.5;
gr = 1.5;
pt = 1500;
freq = 900*10^6;
c= 3 * 10^8;
lam = c/freq;

d = 1:5000;

ht = 20; %ht of transmitting antenna 8<ht<20
hr = 8;  %ht of rec. antenna 2<hr<7

%------free space model-------
pr=(pt*gt*gr*lam^2)./(4*pi.*d).^2;
pr_db_free = 10.*log10(pr);

PL_free = pt./pr;
PL_db_free = 10.*log10(PL_free);

%------HATA Model--------
a_hr = (1.1*log10(freq/10^6) - 0.7)*hr - (1.56*log10(freq/10^6) - 0.8)
L50_db = 69.55 + 26.16*log10(freq/10^6) - a_hr - 13.82*log10(ht) + (44.9 - 6.55*log10(ht))*log10(d/1000);

%-----2 ray model------
pr_2ray = (pt*gt*gr*ht^2 * hr^2)./(d).^4;
pr_2ray_db = 10.*log10(pr_2ray);

PL_2ray=pt./pr_2ray;
PL_db_2ray = 10.*log10(pt./pr_2ray);



%---------------combined plot Pr vs d--------
figure;
plot(d,pr_db_free); %free space
hold;
plot(d,pr_2ray_db);  %2-ray space

xlabel('distance in meters');
ylabel('Pr in dB');
title('Pr vs Distance');


%---------------combined plot PL vs d--------
figure;
plot(d,PL_db_free); %free space
hold;
plot(d,PL_db_2ray);  %2-ray space
plot(d,L50_db);
xlabel('distance in meters');
ylabel('PL in dB');
title('PL vs Distance');
legend('free space model', '2 ray model','hata model');

