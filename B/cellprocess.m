[file,path]=uigetfile('.txt'); %fliepath为文件夹路径
pathfile=fullfile(path,file);
in_BH = importdata(pathfile)
[m,n] = size(in_BH);
mat2str(in_BH)
% %string=["'",0,"'","'",0,"'"];
% string=["'",0,"'","'",0,"'"]
% for i=1:1:m
%     string(1,2)=num2str(in_BH(i,1))
%     string(1,5)=num2str(in_BH(i,2))
%     str2
%     
% end
% 
% %bh{1,1}
% %num2str(in_BH(i,2))]