folder=dir('C:\Users\Karthik\Documents\Data\LIDAR\*.dat');
dob = 'Density vs Altitude';
O = zeros(1024,8);
H = zeros(1024,1);
T = 1:8;
cn=1;
for j=1:7
    count = 0;
    for i=1:18
        filename=strcat('C:\Users\Karthik\Documents\Data\LIDAR\',folder(cn).name);
        N = csvread(filename);
        H(:,1) = N(:,1) * 0.096;
        O(:,j) = O(:,j) + N(:,2);
        count = count + 1;
        cn = cn + 1;
    end
    O(:,j) = O(:,j) / count;
    for q=1:1024
    O(q,j) = O(q,j) * H(q,1) * H(q,1);
    end
end
count = 0;
for i=1:15
    filename=strcat('C:\Users\Karthik\Documents\Data\LIDAR\',folder(cn).name);
    N = csvread(filename);
    O(:,8) = O(:,8) + N(:,2);
    count = count + 1;
    cn = cn + 1;
end
O(:,8) = O(:,8) / count;
for q=1:1024
    O(q,8) = O(q,8) * H(q,1) * H(q,1);
end
contourf(T,H,O);
%ylim([2,30]);