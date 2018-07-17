G_data = xlsread('power_v2_data.xlsx','B2:Y2');
T_data = xlsread('power_v2_data.xlsx','B3:Y3');

Pstc = 120;
Cp = 0.45;
Tr = 25;
Gstc = 1000;
Istc = 6.6;
Vstc = 18.1;

vct = ones(1,length(T_data));
Tr_data = Tr*vct;
k = G_data/Gstc;
Pmt = Pstc*Cp*abs(T_data-Tr_data);
Pma = Pstc*vct+Pmt;
Pm = 4*(k.*Pma+0.01*Pstc*vct);
bar(Pm)

Im = (G_data/Gstc)*Istc;