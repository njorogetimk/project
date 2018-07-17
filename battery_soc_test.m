% Discharging the battery
%pv_data = xlsread('power_v2_data.xlsx','B2:Y2');
%ut_price = xlsread('power_v2_data.xlsx','B5:Y5');
load_data = xlsread('power_v2_data.xlsx','B4:Y4');
I_hourly = load_data/240;
SOC_initial = 100;
SOC_current = zeros(1,24);
for i=1:24
    SOC_i = (100/(590))*I_hourly(i);
    if i == 1
        SOC_current(i) =  SOC_initial-SOC_i;
    else
        SOC_current(i) = SOC_current(i-1)-SOC_i;
    end
    
end
plot(SOC_current)