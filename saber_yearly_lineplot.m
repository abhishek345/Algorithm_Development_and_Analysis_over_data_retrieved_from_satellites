%lat_input = 23.03;
%long_input = 72.58;
%parameter = 'ozone';
%dob = 'SABER Ozone Mixing Ratio of 2015';
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_2015_ozone_23.03_72.58_lineplot.png';
%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_2015_ozone_23.03_72.58.txt';
%year1 = '2015';
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
f=1;
val = 2.5;
fid = fopen(savename,'w');
fprintf(fid,'%s\t\t%s\r\n','Altitude',plabel);
month = {'January','February','March','April','May','August','November','December'};

for w=1:8
    filename = strcat('C:/Users/Karthik/Documents/Data/SABER/SABER_Temp_O3_',month(w),year1,'_v2.0.nc');
    filename = filename{1};
    
    alt=ncread(filename,'tpaltitude');
    lat=ncread(filename,'tplatitude');
    long=ncread(filename,'tplongitude');
    param=ncread(filename,p);
    [x,y] = size(lat);

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