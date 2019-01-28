close all
clear all

V_OC = 0.55;
I_SC = 5.2;
I_L = 5.2;
R_S = 0.005;
n = 1.7;
T = 25;
I_0 = 8.6e-6;
V_T = 25.9e-3;

I = [0:.001:5.2];

V = n.*V_T.*log((I_L-I)./I_0 + 1)-I.*R_S;

figure(1),plot(V,I),axis([0 .6 min(I) 6]),title('Problem 5')

N_S = 18;

I_mo = [0:.001:5.2];

V_mo = -I_mo.*N_S.*R_S + N_S.*n.*V_T.*log((I_L-I_mo+I_0)./I_0);

figure(2),plot(V_mo,I_mo),axis([0 11 min(I_mo) 6]),title('Problem 6')

N_pa = 6;
N_sa = 8*N_S;

I_a = [0:.001:31.2];

V_a = -I_a.*N_sa.*R_S./N_pa + N_sa.*n.*V_T.*log((N_pa.*I_L - I_a + N_pa.*I_0)./(N_pa.*I_0));

P_a = V_a.*I_a;

% figure(3),plot(V_a,I_a),axis([0 90 min(I_a) 35])
% figure(4),plot(V_a,P_a),axis([0 90 0 2000])

for x = 1:length(I_a)
    if V_a(x) == min(V_a)
        x_1 = x;
    end
    
    if I_a(x) == 0
        x_2 = x;
    end
    
    if floor(V_a(x)) == 70
        x_3 = x;
    end
    
    if I_a(x) == 15
        x_4 = x;
    end
end

Ia_SC = I_a(x_1)
Va_OC = V_a(x_2)

P_max = max(V_a.*I_a)

I_70V = I_a(x_3)

V_15A = V_a(x_4)