%lat_input = 23.03;
%long_input = 72.58;
%parameter = 'ozone';
%filename = 'C:/Users/Karthik/Documents/Data/SABER_Daily/SABER_Temp_O3_January2015_1_v2.0.nc';
%dob = 'SABER Ozone Mixing Ratio of 1 January, 2015';
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_January2015_1_ozone_23.03_72.58_lineplot.png';
%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_January2015_1_ozone_23.03_72.58.txt';
if(strcmp(parameter,'ozone')==1)
    p = 'O3_96';
    plabel = 'Ozone Mixing Ratio';
else
    p = 'ktemp';
    plabel = 'Temperature (K)';
end

alt_val=zeros(155,1);
alt_out=zeros(1,1);
count=zeros(155,1);
param_val=zeros(155,1);
param_out=zeros(1,1);

param=ncread(filename,p);
alt=ncread(filename,'tpaltitude');
lat=ncread(filename,'tplatitude');
long=ncread(filename,'tplongitude');
[x,y] = size(lat);
f=1;
val = 5;
fid = fopen(savename,'w');
fprintf(fid,'%s\t\t%s\r\n','Altitude',plabel);

for i=1:x
    for j=1:y
        if((abs(lat(i,j)-lat_input))<val && (abs(long(i,j)-long_input))<val)
            if(param(i,j) ~= -999)
                z=round(floor(alt(i,j)));
                if(z ~= 0)
                    alt_val(z,1)=alt_val(z,1)+alt(i,j);
                    count(z,1)=count(z,1)+1;
                    param_val(z,1)=param_val(z,1)+param(i,j);
                end
            end
        end
    end
end

for i=20:155
    alt_val(i,1)=alt_val(i,1)/count(i,1);
    param_val(i,1)=param_val(i,1)/count(i,1);
    if(isnan(alt_val(i,1))==0)
        alt_out(f,1)=alt_val(i,1);
        param_out(f,1)=param_val(i,1);
        fprintf(fid,'%f\t\t%f\r\n',alt_out(f,1),param_out(f,1));
        f=f+1;
    end
end

fclose(fid);
a = figure;
set(a,'Visible','off');
plot(param_out,alt_out);
title(dob);
xlabel(plabel);
ylabel('Altitude (km)');
saveas(a,saveplot,'png');
close all