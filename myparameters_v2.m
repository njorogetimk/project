%Parametes used in my project
Fc=3780;                    % PWM Carrier frequency (Hz) 
Ts_Power=1/Fc/200;          % SimPowerSystems sample time (s)
Ts_Control=20*Ts_Power;     % Inverter Control system sample time (s)
fuzzy_controller = readfis('fuzzy_controller');

pv_data = xlsread('power_v2_data.xlsx','B2:Y2');
ut_price = xlsread('power_v2_data.xlsx','B5:Y5');