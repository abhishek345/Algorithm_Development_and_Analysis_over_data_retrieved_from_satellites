%filename = 'C:/Users/Karthik/Documents/Data/TOMS/TOMS-EP_L3-TOMSEPL3_2005m0101_v8.nc';
%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/toms/TOMS_January2005_01_ozone_23.03_72.58.txt';
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/toms/TOMS_January2005_01_ozone_23.03_72.58_lineplot.png';
%lat_input = 23.03;
%long_input = 72.58;
%dob = 'TOMS Total Column Ozone on 01 January, 2005';

lat=ncread(filename,'lat');
long=ncread(filename,'lon');
ozne=ncread(filename,'Ozone');
x=size(lat);
y=size(long);
mean=0;
n=0;
count=0.5;

fid1 = fopen(savename,'w');
fprintf(fid1,'%s\t\t%s\t\t%s\r\n','Latitude','longitude','Ozone');

while mean == 0
    for i=1:y
        for j=1:x
            if((isnan(ozne(i,j)) == 0) && (abs(lat(j,1)-lat_input)<count)  && (abs(long(i,1)-long_input)<count))
                mean = mean + ozne(i,j);
                n = n + 1;
            end
        end
    end
    if(mean ~= 0)
        mean = mean / n;
    else
        count = count + 0.5;
        if( count >= 5)
            break;
        end
    end
end

fprintf(fid1,'%f\t\t%f\t\t%f\r\n',lat_input,long_input,mean);
fclose(fid1);
a = figure;
set(a,'Visible','off');
plot(1,mean,'-o');
title(dob);
xlabel('');
ylabel('Total Column Ozone (DU)');
saveas(a,saveplot,'png');
close all