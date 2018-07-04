h = bill.time(1:20);
lng = length(h);
billm = 0;
t = h(1);
for i=2:lng
    billm = billm+t;
    t = h(i);
end