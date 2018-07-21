%Parametes used in my project
% Fc=3780;                    % PWM Carrier frequency (Hz) 
% Ts_Power=1/Fc/200;          % SimPowerSystems sample time (s)
% Ts_Control=20*Ts_Power;     % Inverter Control system sample time (s)
fuzzy_controller = readfis('fuzzy_controller');

% RAW data
time = xlsread('power_v2_data.xlsx','sheet3','A2:A49')';
G_data = xlsread('power_v2_data.xlsx','sheet3','B2:B49')';
T_data = xlsread('power_v2_data.xlsx','sheet3','C2:C49')';
load_data = xlsread('power_v2_data.xlsx','sheet3','D2:D49')';
ut_price_i = xlsread('power_v2_data.xlsx','sheet3','E2:E49')';
max_p = max(ut_price_i);
ut_price = ut_price_i/max_p; %Normalized ut_price

% Manufacturers data sheet data Solar panel
Pstc = 120;
Cp = 0.45;
Tr = 25;
Gstc = 1000;
Istc = 6.6;
Vstc = 18.1;

% Battery parameters
Q = 590; % Battery capacity
SOC = xlsread('power_v2_data.xlsx','sheet2','I2:I25')'; %Initial state of charge
% Time vector
% t = vct;
% for i = 1:23
%     t(i+1) = t(i)+1;
% end