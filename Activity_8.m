close all
clear all

xx = 0:.00001:.0035; %Distance into wafer 0-50 um, resolution of .1 um
tt = [1e-9 10e-9 100e-9];   %time after light pulse

D_p = 10;       %cm^2/s
PHI = 5e13;     %cm^-2
N_A = 1e15;     %cm^-3

sigma = sqrt(2*D_p*tt);  %cm

p1 = PHI/(sqrt(2*pi)*sigma(1))*exp(-(xx.^2)./(2*sigma(1)^2)) + N_A;
p2 = PHI/(sqrt(2*pi)*sigma(2))*exp(-(xx.^2)./(2*sigma(2)^2)) + N_A;
p3 = PHI/(sqrt(2*pi)*sigma(3))*exp(-(xx.^2)./(2*sigma(3)^2)) + N_A;

figure(1)
subplot(3,1,1),plot(xx,p1,'-')
subplot(3,1,2),plot(xx,p2,':')
subplot(3,1,3),plot(xx,p3,'--')

figure(2)
plot(xx,p1,'-')
hold on
plot(xx,p2,':')
plot(xx,p3,'--')
hold off