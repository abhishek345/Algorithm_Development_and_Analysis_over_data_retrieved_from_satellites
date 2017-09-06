folder=dir('C:\Users\Karthik\Documents\Data\LIDAR\*.dat');
dob = 'Relative Density vs Altitude';
O = zeros(1024,2);
count = 0;
for i=127:141
    filename=strcat('C:\Users\Karthik\Documents\Data\LIDAR\',folder(i).name);
    N = csvread(filename);
    O = O + N;
    count = count + 1;
end
O = O / count;
O(:,1) = O(:,1) * 0.096;

out1 = plot(O(:,2),O(:,1));
title(dob);
x1 = 20500;
y1 = 10;
%txt1 = '\downarrow';
txt2 = '\leftarrow Signature of Cirrus cloud';
%text(x1,y1,txt1);
%x1 = 1100000;
%y1 = 12;
text(x1,y1,txt2);
xlabel('Photon Counts');
ylabel('Altitude (km)');
ylim([2,25]);
saveas(out1,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\lidar_abu\2016March10_05_30','png');
close all

for i=1:1024
    O(i,2) = O(i,2) * O(i,1) * O(i,1);
end

out = plot(O(:,2),O(:,1));
title(dob);
xlabel('Range Corrected Photon Counts (~Relative Atmospheric Density)');
ylabel('Altitude (km)');
ylim([38,80]);
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\lidar_abu\2016March10_05_100','png');
close all