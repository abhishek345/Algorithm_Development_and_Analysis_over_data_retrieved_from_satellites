%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/toms/TOMS_2005_ozone_23.03_72.58.txt';
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/toms/TOMS_2005_ozone_23.03_72.58_lineplot.png';
%lat_input = 23.03;
%long_input = 72.58;
%dob = 'TOMS Total Column Ozone of 2005';
%year='2005';

days = 1:1:31;
month_pl = 1:1:12;
mean_year = zeros([12 1]);
fid1 = fopen(savename,'w');
fprintf(fid1,'%s\t\t%s\r\n','Month','Ozone');

for mon = 1:12
    if(mon<10)
        month=strcat('0',num2str(mon));
    else
         month=num2str(mon);
    end
    
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
    
    for dat=1:m
        if(dat<10)
            dates = strcat('0',num2str(dat));
        else
            dates=num2str(dat);
        end
        filename = strcat('C:/Users/Karthik/Documents/Data/TOMS/TOMS-EP_L3-TOMSEPL3_',year,'m',month,dates,'_v8.nc');
        lat=ncread(filename,'lat');
        long=ncread(filename,'lon');
        ozne=ncread(filename,'Ozone');
        x=size(lat);
        y=size(long);
        n=1;
        
        for i=1:y 
            for j=1:x
                if((isnan(ozne(i,j)) == 0) && (abs(lat(j,1)-lat_input)<1)  && (abs(long(i,1)-long_input)<1))
                    mean(dat,1) = mean(dat,1) + ozne(i,j);
                    n = n + 1;
                end
            end
        end
        add(dat,1)=mean(dat,1);
        mean(dat,1) = mean(dat,1) / n;
        mean_year(mon,1)=mean_year(mon,1)+mean(dat,1);
    end
    dat=dat-1;
    mean_year(mon,1)=mean_year(mon,1)/dat;
    if(mean_year(mon,1)~=0)
        fprintf(fid1,'%d\t\t%f\r\n',month_pl(mon),mean_year(mon,1)); 
    end
end
fclose(fid1);
%ix = (mean_year==0);
%mean_year(ix)=[];
%month_pl(ix)=[];
%plot(days,mean,'-o');
a = figure;
set(a,'Visible','off');
plot(month_pl(mean_year ~= 0),mean_year(mean_year ~= 0),'-o');
title(dob);
ylabel('Total Column Ozone (DU)');
xlabel('Months');
saveas(a,saveplot,'png');
close all