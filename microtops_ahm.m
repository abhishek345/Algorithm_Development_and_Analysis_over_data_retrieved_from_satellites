%filename = 'C:\Users\Karthik\Documents\Data\GROUND\ahmedabad\2016March30std.dat';
%OS = zeros(8,4);
%NS = csvread(filename);
filename = 'C:\Users\Karthik\Documents\Data\GROUND\ahmedabad\2016March30.dat';
O = zeros(8,4);
N = csvread(filename);
%Ozone
dob = 'Total Column Ozone on 30th March 2016';
oz=plot(N(:,1),N(:,2),'-o');
%oz=errorbar(N(:,1),N(:,2),NS(:,2),'-o');
xlim([10,18]);
ylim([175,275]);
title(dob);
xlabel('Time (IST)');
ylabel('Total Column Ozone (DU)');
saveas(oz,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_ahm\2016March30_ozone','png');
close all
%Water Vapour
dob = 'Water Vapour on 30th March 2016';
wv=plot(N(:,1),N(:,3),'-o');
%wv=errorbar(N(:,1),N(:,3),NS(:,3),'-o');
xlim([10,18]);
ylim([0,3.5]);
title(dob);
xlabel('Time (IST)');
ylabel('Water Vapour (cm)');    
saveas(wv,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_ahm\2016March30_water_vapour','png');
close all
%Aerosol
dob = 'Aersol Optical Thickness on 30th March 2016';
ae=plot(N(:,1),N(:,4),'-o');
%ae=errorbar(N(:,1),N(:,4),NS(:,4),'-o');
xlim([10,18]);
ylim([0,0.7]);
title(dob);
xlabel('Time (IST)');
ylabel('Aersol Optical Thickness');
saveas(ae,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_ahm\2016March30_aerosol','png');
close all