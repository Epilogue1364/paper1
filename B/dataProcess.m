function [h,m] = dataProcess(file_name)
fid = fopen(file_name, 'r');%打开要读取的文件
%tline = fgetl(fid);
list_cell = {};
pat = '%';

while 1
    tline = fgetl(fid);
    
    if not(ischar(tline))
        break
    elseif  contains(tline,pat)
        continue
    else
        temp = strsplit(tline);     %分割字符串
        temp = str2double(temp);
        list_cell = [list_cell;temp];
    end
end

list_cell = cell2mat(list_cell);
h = list_cell;
fclose(fid);
h = h(:,2);
[m,n]=size(h);
m=m-1;
h=h';