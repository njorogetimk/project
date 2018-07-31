clear
clc

fuzzy_controller = readfis('fuzzy_controller');

% RAW data
time = xlsread('power_v2_data.xlsx','sheet1','A2:A169')';
G_data = xlsread('power_v2_data.xlsx','sheet1','B2:B169')';
T_data = xlsread('power_v2_data.xlsx','sheet1','C2:C169')';
load_data = xlsread('power_v2_data.xlsx','sheet1','D2:D169')';
ut_price_i = xlsread('power_v2_data.xlsx','sheet1','E2:E169')';
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
Q = 340; % Battery capacity
SOC = xlsread('power_v2_data.xlsx','sheet2','I2:I25')'; %Initial state of charge
% Time vector
% t = vct;
% for i = 1:23
%     t(i+1) = t(i)+1;
% end