clc;
close all;
clear all;

f_2G = 900*10^6;
f_3G = 2*10^9;
f_4G = 2.5*10^9;
f_5G = 5*10^9;
c = 3*10^8;

f = [f_2G, f_3G, f_4G, f_5G];
generations = {'2G (900MHz)', '3G (2GHz)', '4G (2.5GHz)', '5G (5GHz)'};
d_val = zeros(size(f));

for i = 1:length(f)
  lambda = c/f(i);
  D = lambda/2;
  d_val(i) = (2*D^2)/lambda;
end

bar(d_val)
xticks(1:length(f))
xticklabels(generations)

xlabel('Frequency (Hz)', 'Fontsize',22);
ylabel('Minimum Spacing (m)','Fontsize',22);
title('Minimum spacing vs. Frequency','Fontsize',22);
