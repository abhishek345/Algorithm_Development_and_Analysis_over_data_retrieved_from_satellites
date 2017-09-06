filename = 'C:\Users\Karthik\Documents\Data\GROUND\abu\2016March10.dat';
O = zeros(5,4);
N = csvread(filename);
%Ozone
dob = 'Total Column Ozone on 10th March, 2016';
oz=plot(N(:,2),N(:,1),'-o');
%x1 = 218;
%y1 = 0.6;
%txt1 = '\leftarrow Decrease in ozone due to Hazy Cloud';
%text(x1,y1,txt1);
title(dob);
xlim([175,275]);
xlabel('Total Column Ozone (DU)');
ylabel('Height (km)');
legend('Error Percentage = ~5%','location','NorthOutside');
saveas(oz,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_ozone','png');
close all
%Water Vapour
dob = 'Water Vapour on 10th March, 2016';
wv=plot(N(:,3),N(:,1),'-o');
xlim([0,1.8]);
title(dob);
xlabel('Water Vapour (cm)');
ylabel('Height (km)');
saveas(wv,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_water_vapour','png');
close all
%Aerosol
dob = 'Aersol Optical Thickness on 10th March, 2016';
ae=plot(N(:,4),N(:,1),'-o');
xlim([0,0.55]);
title(dob);
%x1 = 0.2;
%y1 = 0.6;
%txt1 = '\leftarrow Increase in aerosol due to Hazy Sky';
%text(x1,y1,txt1);
xlabel('Aersol Optical Thickness');
ylabel('Height (km)');
saveas(ae,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_aerosol','png');
close all