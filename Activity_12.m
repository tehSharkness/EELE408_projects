close all
clear all

I_0 = 5e-6;
I_L = 10e-3;
R_S = [.1 10 20 50 100];
V_T = 25.9e-3;

I_S = [-100e-3:1e-4:9.9999e-3];

V_S = zeros(length(R_S),length(I_S));

V_S(1,:) = V_T*log((-I_S+I_L)./I_0)+I_S*R_S(1);
V_S(2,:) = V_T*log((-I_S+I_L)./I_0)+I_S*R_S(2);
V_S(3,:) = V_T*log((-I_S+I_L)./I_0)+I_S*R_S(3);
V_S(4,:) = V_T*log((-I_S+I_L)./I_0)+I_S*R_S(4);
V_S(5,:) = V_T*log((-I_S+I_L)./I_0)+I_S*R_S(5);

figure(1),plot(I_S,V_S)

slope_s = mean([diff(V_S(1,:)); diff(V_S(2,:)); diff(V_S(3,:)); diff(V_S(4,:)); diff(V_S(5,:))].')./1e-4;

R_sh = [1000 100 10];

V_sh = [-100e-3:1e-4:100e-3];

I = zeros(length(R_sh),length(V_sh));

I_sh(1,:) = I_L - I_0*exp(V_T*V_sh)-V_sh/R_sh(1);
I_sh(2,:) = I_L - I_0*exp(V_T*V_sh)-V_sh/R_sh(2);
I_sh(3,:) = I_L - I_0*exp(V_T*V_sh)-V_sh/R_sh(3);

figure(2),plot(V_sh,I_sh)

slope_sh = mean([diff(I_sh(1,:)); diff(I_sh(2,:)); diff(I_sh(3,:))].')./1e-4;