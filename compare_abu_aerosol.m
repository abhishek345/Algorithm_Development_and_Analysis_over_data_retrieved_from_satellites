filename = 'C:\Users\Karthik\Documents\Data\GROUND\abu\2016March10.dat';
O = zeros(5,4);
N = csvread(filename);
x = 1:2;

name = {'Abu Road';'Mid Way';};
y = [N(1,4) N(2,4)];
pc = (N(2,4)-N(1,4))/N(1,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Abu Road and Mid Way');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Abu Road_Mid Way_aerosol','png');
close all

name = {'Mid Way';'Abu Road';};
y = [N(2,4) N(1,4)];
pc = (N(1,4)-N(2,4))/N(2,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Mid Way and Abu Road');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Mid Way_Abu Road_aerosol','png');
close all

name = {'Abu Road';'Hill View';};
y = [N(1,4) N(3,4)];
pc = (N(3,4)-N(1,4))/N(1,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Abu Road and Hill View');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Abu Road_Hill View_aerosol','png');
close all

name = {'Hill View';'Abu Road';};
y = [N(3,4) N(1,4)];
pc = (N(1,4)-N(3,4))/N(3,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Hill View and Abu Road');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Hill View_Abu Road_aerosol','png');
close all

name = {'Abu Road';'Oriya';};
y = [N(1,4) N(4,4)];
pc = (N(4,4)-N(1,4))/N(1,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Abu Road and Oriya');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Abu Road_Oriya_aerosol','png');
close all

name = {'Oriya';'Abu Road';};
y = [N(4,4) N(1,4)];
pc = (N(1,4)-N(4,4))/N(4,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Oriya and Abu Road');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Oriya_Abu Road_aerosol','png');
close all

name = {'Abu Road';'Guru Shikhar';};
y = [N(1,4) N(5,4)];
pc = (N(5,4)-N(1,4))/N(1,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Abu Road and Guru Shikhar');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Abu Road_Guru Shikhar_aerosol','png');
close all

name = {'Guru Shikhar';'Abu Road';};
y = [N(5,4) N(1,4)];
pc = (N(1,4)-N(5,4))/N(5,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Guru Shikhar and Abu Road');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Guru Shikhar_Abu Road_aerosol','png');
close all

name = {'Mid Way';'Hill View';};
y = [N(2,4) N(3,4)];
pc = (N(3,4)-N(2,4))/N(2,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Mid Way and Hill View');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Mid Way_Hill View_aerosol','png');
close all

name = {'Hill View';'Mid Way';};
y = [N(3,4) N(2,4)];
pc = (N(2,4)-N(3,4))/N(3,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Hill View and Mid Way');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Hill View_Mid Way_aerosol','png');
close all

name = {'Mid Way';'Oriya';};
y = [N(2,4) N(4,4)];
pc = (N(4,4)-N(2,4))/N(2,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Mid Way and Oriya');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Mid Way_Oriya_aerosol','png');
close all

name = {'Oriya';'Mid Way';};
y = [N(4,4) N(2,4)];
pc = (N(2,4)-N(4,4))/N(4,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Oriya and Mid Way');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Oriya_Mid Way_aerosol','png');
close all

name = {'Mid Way';'Guru Shikhar';};
y = [N(2,4) N(5,4)];
pc = (N(5,4)-N(2,4))/N(2,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Mid Way and Guru Shikhar');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Mid Way_Guru Shikhar_aerosol','png');
close all

name = {'Guru Shikhar';'Mid Way';};
y = [N(5,4) N(2,4)];
pc = (N(2,4)-N(5,4))/N(5,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Guru Shikhar and Mid Way');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Guru Shikhar_Mid Way_aerosol','png');
close all

name = {'Hill View';'Oriya';};
y = [N(3,4) N(4,4)];
pc = (N(4,4)-N(3,4))/N(3,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Hill View and Oriya');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Hill View_Oriya_aerosol','png');
close all

name = {'Oriya';'Hill View';};
y = [N(4,4) N(3,4)];
pc = (N(3,4)-N(4,4))/N(4,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Oriya and Hill View');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Oriya_Hill View_aerosol','png');
close all

name = {'Hill View';'Guru Shikhar';};
y = [N(3,4) N(5,4)];
pc = (N(5,4)-N(3,4))/N(3,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Hill View and Guru Shikhar');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Hill View_Guru Shikhar_aerosol','png');
close all

name = {'Guru Shikhar';'Hill View';};
y = [N(5,4) N(3,4)];
pc = (N(3,4)-N(5,4))/N(5,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Guru Shikhar and Hill View');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Guru Shikhar_Hill View_aerosol','png');
close all

name = {'Oriya';'Guru Shikhar';};
y = [N(4,4) N(5,4)];
pc = (N(5,4)-N(4,4))/N(4,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Oriya and Guru Shikhar');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Oriya_Guru Shikhar_aerosol','png');
close all

name = {'Guru Shikhar';'Oriya';};
y = [N(5,4) N(4,4)];
pc = (N(4,4)-N(5,4))/N(5,4)*100;
pclabel = strcat({'Percentage change ='},{' '},num2str(pc),{'%'});
out = figure;
bar(x,y,0.5);
set(gca,'xticklabel',name)
title('Comparision between Guru Shikhar and Oriya');
ylabel('Aerosol Optical Thickness');
ylim([0,0.6]);
legend(pclabel,'location','NorthOutside');
saveas(out,'C:\Users\Karthik\Documents\NetBeansProjects\PRL_project\web\microtops_abu\2016March10_Guru Shikhar_Oriya_aerosol','png');
close all