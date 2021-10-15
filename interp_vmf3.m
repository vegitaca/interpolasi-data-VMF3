f_vmf3 = fopen('y2020.vmf3_r.txt');
s_vmf3 = textscan (f_vmf3,'%s %f %f %f %f %f %f %f %f %f %f','HeaderLines', 22);

%Specified the chosen station
vmf3_ft_i = find(strcmp(s_vmf3{:,1},'FORTLEZA'));
vmf3_ny_i = find(strcmp(s_vmf3{:,1},'NYALES20'));
vmf3_wz_i = find(strcmp(s_vmf3{:,1},'WETTZELL'));

j=1;

%Create loop for taking the mjd and zwd value of VMF3
for i=2:4:6
    if i == 2
        vmf3_ft(:,j) = s_vmf3{1,i}(vmf3_ft_i,1);
        vmf3_ny(:,j) = s_vmf3{1,i}(vmf3_ny_i,1);
        vmf3_wz(:,j) = s_vmf3{1,i}(vmf3_wz_i,1);
        j=j+1;
    else
        vmf3_ft(:,j) = s_vmf3{1,i}(vmf3_ft_i,1);
        vmf3_ny(:,j) = s_vmf3{1,i}(vmf3_ny_i,1);
        vmf3_wz(:,j) = s_vmf3{1,i}(vmf3_wz_i,1);
        j=1;
    end
end

%Make the time interval
waktu_mjd = 58849 :1/24:59214.7500000000;
%Transpose
waktu_mjd = waktu_mjd';

%Create struct
zwd_vmf3.mjd = waktu_mjd;
zwd_vmf3.ft = interp1(vmf3_ft(:,1),vmf3_ft(:,2),waktu_mjd)*100;
zwd_vmf3.ny = interp1(vmf3_ny(:,1),vmf3_ny(:,2),waktu_mjd)*100;
zwd_vmf3.wz = interp1(vmf3_wz(:,1),vmf3_wz(:,2),waktu_mjd)*100;
