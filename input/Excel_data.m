
%%
real_data = readtable('number data.xlsx');
data1 = table2array(real_data);
data1(2,:)  = data1(2,:)* 8e4;
writematrix(data1,'number_data.dat');



%%
data_range = readtable("heterogeneity data.xlsx", "Range", "C17:Y25");
data = table2array(data_range);
W3 = [data(1, 1:6); data(1, 9:14); data(1, 17:22);
    data(3, 1:6); data(3, 9:14); data(3, 17:22)];
writematrix(W3,'week3-4.dat');
W7 = [data(7, 1:6); data(7, 9:14); data(7, 17:22);
    data(9, 1:6); data(9, 9:14); data(9, 17:22)];
writematrix(W7,'week7-8.dat');
