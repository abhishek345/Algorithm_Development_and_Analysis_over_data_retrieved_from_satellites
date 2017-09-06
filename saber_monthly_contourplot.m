%lat_input = 23.03;
%long_input = 72.58;
%parameter = 'ozone';
%filename = 'C:/Users/risha_000/Documents/Data/SABER/SABER_Temp_O3_February2015_v2.0.nc';
%dob = 'SABER Ozone Mixing Ratio of November, 2015';
%saveplot = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_November2015_ozone_23.03_72.58_lineplot.png';
%savename = 'C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_November2015_ozone_23.03_72.58.txt';
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
[x,y] = size(param);
param_val=zeros(x,y);
alt_out=zeros(110,1);
lat_out=zeros(180,1);
lat_count=zeros(180,1);
param_out=zeros(110,180);
param_count=zeros(110,180);
for i=1:x
    for j=1:y
        if(lat(i,j)>=-90 && lat(i,j)<=90)
            f=round(lat(i,j))+90;
            lat_out(f,1)=lat_out(f,1)+lat(i,j);
            lat_count(f,1)=lat_count(f,1)+1;
            z=round(alt(i,j));
            if(param(i,j)<0.000008 && param(i,j)>0 && z<=110)
                param_out(z,f)=param_out(z,f)+param(i,j);
                param_count(z,f)=param_count(z,f)+1;
            end
        end
    end
end

for i=1:110
    alt_out(i,1)=i;
end

for i=1:180
    lat_out(i,1)=lat_out(i,1)/lat_count(i,1);
    for j=1:110
        param_out(j,i)=param_out(j,i)/param_count(j,i);
        param_out(j,i)=round(param_out(j,i)*100000000)/100000000;
    end
end
contourc(lat_out,alt_out,param_out);