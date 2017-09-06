%lat_input = 23.03;
%long_input = 72.58;
parameter = 'ozone';
filename = 'C:/Users/Karthik/Documents/Data/SABER_Daily/SABER_Temp_O3_January2015_1_v2.0.nc';
dob = 'SABER Ozone Mixing Ratio of 1 January, 2015';
saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_January2015_1_ozone_23.03_72.58_contourplot.png';
if(strcmp(parameter,'ozone')==1)
    p = 'O3_96';
    plabel = 'Ozone Mixing Ratio';
else
    p = 'ktemp';
    plabel = 'Temperature (K)';
end

param=ncread(filename,p);
alt=ncread(filename,'tpaltitude');
lat=ncread(filename,'tplatitude');
long=ncread(filename,'tplongitude');
[x,y] = size(lat);
f=1;

for i=1:x
    for j=1:y
        if(param(i,j) == -999)
            lat(i,j)=lat(i,j)/0;
            alt(i,j)=alt(i,j)/0;
            param(i,j)=param(i,j)/0;
        end
    end
end

contourf(lat,alt,param);