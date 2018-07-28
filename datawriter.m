%% plot after simulation
% t = 0:0.01:1.67;
% plot(soc)
% hold on
% plot((Pm/max(Pm))*100)
% hold on
% plot(t,load_data/max(load_data)*100)
% hold on
% plot((bill/(1000*max_p))*100)
%legend('soc','PV','Load','bill')

%% Write the data to excel
filename = 'data.xlsx';
max_pv = max(Pm.Data);
max_ld = max(load_data);

% Get the normalizing value for the powers; pv and load
if max_pv > max_ld
    nvl = maxpv;
else
    nvl = max_ld;
end

t = time(2:length(time))';
xlswrite(filename,t, 1, 'A')
Load = load_data(2:length(load_data))'*100/nvl;  %Total hourly load
xlswrite(filename, Load, 1, 'B')
PVOut = Pm.Data*100/nvl;        % Amount of power PV provides
xlswrite(filename, PVOut, 1, 'C')
BatSOC = soc.Data;      % The current SOC of the battery
xlswrite(filename, BatSOC, 1, 'D')
NetLoad = net_load_out.Data*100/nvl;    % The extra load to cater for
xlswrite(filename, NetLoad, 1, 'E')
UtPrice = price_out.Data*100;       % The normalized utility load
xlswrite(filename, UtPrice, 1, 'F')
TheBill = bill.Data*0.1/max_p;            % The normalized bill
xlswrite(filename, TheBill, 1, 'G')
FuzOut = fz_out.Data*100/nvl;           % The output of the fuzzy controller
xlswrite(filename, FuzOut, 1, 'H')
