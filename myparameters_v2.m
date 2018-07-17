%Parametes used in my project
% Fc=3780;                    % PWM Carrier frequency (Hz) 
% Ts_Power=1/Fc/200;          % SimPowerSystems sample time (s)
% Ts_Control=20*Ts_Power;     % Inverter Control system sample time (s)
fuzzy_controller = readfis('fuzzy_controller');

% RAW data
time = xlsread('power_v2_data.xlsx','B1:Y1');
G_data = xlsread('power_v2_data.xlsx','B2:Y2');
T_data = xlsread('power_v2_data.xlsx','B3:Y3');
load_data = xlsread('power_v2_data.xlsx','B4:Y4');
ut_price = xlsread('power_v2_data.xlsx','B5:Y5');

% Manufacturers data sheet data Solar panel
Pstc = 120;
Cp = 0.45;
Tr = 25;
Gstc = 1000;
Istc = 6.6;
Vstc = 18.1;

% Battery parameters
Q = 590; % Battery capacity
SOC = 100; %Initial state of charge
% Time vector
% t = vct;
% for i = 1:23
%     t(i+1) = t(i)+1;
% end