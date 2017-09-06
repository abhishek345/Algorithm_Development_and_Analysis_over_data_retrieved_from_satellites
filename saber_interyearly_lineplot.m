%lat_input = 23.03;
%long_input = 72.58;
%parameter = 'ozone';
%dob = 'SABER Ozone Mixing Ratio from 2014 to 2015';
%year1 = '2014';
%year2 = '2015';
yea1 = str2num(year1);
yea2 = str2num(year2);
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_2014_2015_ozone_23.03_72.58_lineplot.png';
%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_2014_2015_ozone_23.03_72.58.txt';
if(strcmp(parameter,'ozone')==1)
    p = 'O3_96';
    plabel = 'Ozone Mixing Ratio';
else
    p = 'ktemp';
    plabel = 'Temperature (K)';
end

alt_val=zeros(155,yea2-yea1+1);
alt_out=zeros(1,1);
count=zeros(155,yea2-yea1+1);
param_val=zeros(155,yea2-yea1+1);
param_out=zeros(1,1);
month = {'January','February','March','April','May','November','December'};
ye = 1;
fid = fopen(savename,'w');

for year=yea1:yea2
    fprintf(fid,'\t\t%d\r\n',year);
    fprintf(fid,'%s\t\t%s\r\n','Altitude',plabel);
    legend_year{ye} = num2str(year);
    f=1;
    for w=1:7
        filename = strcat('C:/Users/Karthik/Documents/Data/SABER/SABER_Temp_O3_',month(w),num2str(year),'_v2.0.nc');
        filename = filename{1};

        alt=ncread(filename,'tpaltitude');
        lat=ncread(filename,'tplatitude');
        long=ncread(filename,'tplongitude');
        param=ncread(filename,p);
        [x,y] = size(lat);

        for i=1:x
            for j=1:y
                if((abs(lat(i,j)-lat_input))<5 && (abs(long(i,j)-long_input))<5)
                    if(param(i,j) ~= -999)
                        z=round(floor(alt(i,j)));
                        if(z ~= 0 && z < 156)
                            alt_val(z,ye)=alt_val(z,ye)+alt(i,j);
                            count(z,ye)=count(z,ye)+1;
                            param_val(z,ye)=param_val(z,ye)+param(i,j);
                        end
                    end
                end
            end
        end
    end

    for i=20:155
        alt_val(i,ye)=alt_val(i,ye)/count(i,ye);
        param_val(i,ye)=param_val(i,ye)/count(i,ye);
        if(isnan(alt_val(i,ye))==0)
            alt_out(f,ye)=alt_val(i,ye);
            param_out(f,ye)=param_val(i,ye);
            fprintf(fid,'%f\t\t%f\r\n',alt_out(f,1),param_out(f,1));
            f=f+1;
        end
    end
    ye=ye+1;
    fprintf(fid,'\r\n');
end

fclose(fid);
a = figure;
set(a,'Visible','off');
plot(param_out,alt_out);
legend(legend_year);
title(dob);
xlabel(plabel);
ylabel('Altitude (km)');
saveas(a,saveplot,'png');
close all