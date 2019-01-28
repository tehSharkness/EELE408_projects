close all
clear all

tt=1;

d = [79 172 355];
LT = [0:tt:23.5;0:tt:23.5;0:tt:23.5];

B = 360/365*(d-81); %in degrees

dec = 23.45*sin(B*pi/180); %in degrees

lat = 45; %45deg latitude
long = 111; %111deg longitude

LSTM = 15*7; %in degrees

EoT = 9.87*sin(2*B*pi/180) - 7.53*cos(B*pi/180) - 1.5*sin(B*pi/180);

TC_o = 4*(long-LSTM) + EoT;

TC = TC_o' * ones(1,24/tt);

LST = LT + TC./60;

HRA = 15*(LST-12); %in degrees



elev = asin((sin(dec*pi/180)*sin(lat*pi/180))'*ones(1,24/tt) + (cos(dec*pi/180)*cos(lat*pi/180))'*ones(1,24/tt).*cos(HRA*pi/180))*180/pi; %in degrees
azi = acos(((sin(dec*pi/180)*cos(lat*pi/180))'*ones(1,24/tt) - (cos(dec*pi/180)*sin(lat*pi/180))'*ones(1,24/tt).*cos(HRA*pi/180))./cos(elev*pi/180))*180/pi; %in degrees

azi_plot = [azi(:,1:12/tt),(360-azi(:,12/tt+1:24/tt))];

figure(1)

plot(azi_plot(1,:),90-max(elev(1,:),0),'go-')
hold on
plot(azi_plot(2,:),90-max(elev(2,:),0),'rx-')
plot(azi_plot(3,:),90-max(elev(3,:),0),'bs-')
hold off


figure(2)
%t = 0:.01:2*pi;
%P = polar(t,90*ones(size(t)));
%set(P, 'Visible', 'off')

polar(azi_plot(1,:).*pi/180,90.-max(elev(1,:),0),'go-')
hold on
polar(azi_plot(2,:).*pi/180,90.-max(elev(2,:),0),'rx-')
polar(azi_plot(3,:).*pi/180,90.-max(elev(3,:),0),'bs-')
hold off