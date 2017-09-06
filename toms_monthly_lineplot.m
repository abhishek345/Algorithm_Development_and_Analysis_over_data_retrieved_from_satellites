%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/toms/TOMS_January2005_ozone_23.03_72.58.txt';
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/toms/TOMS_January2005_ozone_23.03_72.58_lineplot.png';
%lat_input = 23.03;
%long_input = 72.58;
%dob = 'TOMS Total Column Ozone of January, 2005';
%month = '01';
%year='2005';

days = 1:1:31;

if(strcmp(month,'01')==1 ||strcmp(month,'03')==1 || strcmp(month,'05')==1 || strcmp(month,'07')==1 || strcmp(month,'08')==1 || strcmp(month,'10')==1)
    m=31;
elseif(strcmp(month,'02')==1 )
    m=28;
elseif(strcmp(month,'11')==1)
    m=15;
elseif(strcmp(month,'04')==1 || strcmp(month,'06')==1 ||strcmp(month,'09')==1) 
    m=30;
elseif(strcmp(month,'12')==1)
    m=14;
end
mean = zeros([m 1]);
add = zeros([m 1]);
fid1 = fopen(savename,'w');
fprintf(fid1,'%s\t\t%s\r\n','Day','Ozone');

for dates=1:m
    if(dates<10)
        dates = strcat('0',num2str(dates));
    else
        dates=num2str(dates);
    end
    filename = strcat('C:/Users/Karthik/Documents/Data/TOMS/TOMS-EP_L3-TOMSEPL3_',year,'m',month,dates,'_v8.nc');
    dates=str2num(dates);
    lat=ncread(filename,'lat');
    long=ncread(filename,'lon');
    ozne=ncread(filename,'Ozone');
    x=size(lat);
    y=size(long);
    n=1;
    for i=1:y
        for j=1:x
            if((isnan(ozne(i,j)) == 0) && (abs(lat(j,1)-lat_input)<1)  && (abs(long(i,1)-long_input)<1))
                mean(dates,1) = mean(dates,1) + ozne(i,j);
                n = n + 1;
            end
        end
    end
    mean(dates,1) = mean(dates,1) / n;
    if(mean(dates,1)~=0)
        fprintf(fid1,'%d\t\t%f\r\n',days(dates),mean(dates,1));
    end
end
fclose(fid1);
%ix = (mean==0);
%mean(ix)=[];
%days(ix)=[];
a = figure;
set(a,'Visible','off');
plot(days(mean~=0),mean(mean~=0),'-o');
title(dob);
ylabel('Total Column Ozone (DU)');
xlabel('Days');
saveas(a,saveplot,'png');
close all