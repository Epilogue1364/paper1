clear;
clc;
tic;
% %删除文件夹
[status, message, messageid] = rmdir('resultStepOptimize2', 's');
%创建文件夹
mkdir resultStepOptimize2\data
mkdir resultStepOptimize2\picture
mkdir resultStepOptimize2\Line
%声明地址
file_path = ['E:\GitHub\paper1\'];
model_path = [file_path, 'Model.mph'];
result_path = [file_path,'resultStepOptimize2\'];
data_path = [result_path,'data\']
xian_path = [result_path,'Line\'];
tu_path = [result_path,'picture\'];
xlsx_path=[result_path,'result.xlsx'];
%变量
%jxh=槽高，jxw=槽宽，cw=极齿宽，jx=间隙，cnz=总槽数，cln=左槽数，crn右槽数
% %设置变量下限
% jxh0=0.3;%%槽高范围0.3-1.0mm
% jxw0=0.4;%%槽宽范围0.4-1.4mm
% cw0=0.12;%%极齿宽范围0.12-0.28mm
% %设置变量上限
% jxh1=1.0;%%槽高范围0.3-1.0mm
% jxw1=1.4;%%槽宽范围0.4-1.4mm
% cw1=0.28;%%极齿宽范围0.12-0.28mm
% %步进
% s1=0.1;%%槽高步进
% s2=0.1;%%槽宽步进
% s3=0.02;%%极齿宽步进
count=0;
All=5;
bar = waitbar(0,'开始');   % waitbar显示进度条
jxhn=0.7;%槽宽初始值为0.8mm
jxwn=0.8;%槽宽初始值为0.8mm
cwn=0.2;%极齿宽初始值为0.2mm
jxn=0.1;%间隙为0.1mm
cnz=42;
cln=27
crn=15
wcn=jxwn+cwn;
jxh= [ num2str(jxhn),'[mm]']
jxw= [ num2str(jxwn),'[mm]']
cw = [ num2str(cwn),'[mm]']
jx = [ num2str(jxn),'[mm]']
wc = [ num2str(wcn),'[mm]']
name_path=['jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','cln',num2str(cln-1),'-','crn',num2str(crn-1),'-']
Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path, name_path);
site=['A',num2str(count+2)];
analyse(jxh, jxw, cw, cln, crn, data_path, xlsx_path, name_path, site);
count = count + 1;
str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用

cln=21
crn=21
jxh= [ num2str(jxhn),'[mm]']
jxw= [ num2str(jxwn),'[mm]']
cw = [ num2str(cwn),'[mm]']
jx = [ num2str(jxn),'[mm]']
wc = [ num2str(wcn),'[mm]']
name_path=['jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','cln',num2str(cln-1),'-','crn',num2str(crn-1),'-']
Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path, name_path);
site=['A',num2str(count+2)];
analyse(jxh, jxw, cw, cln, crn, data_path, xlsx_path, name_path, site);
count = count + 1;
str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
waitbar(count/All,bar,str)   

cwn=0.16;%极齿宽初始值为0.2mm
jxh= [ num2str(jxhn),'[mm]']
jxw= [ num2str(jxwn),'[mm]']
cw = [ num2str(cwn),'[mm]']
jx = [ num2str(jxn),'[mm]']
wc = [ num2str(wcn),'[mm]']
name_path=['jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','cln',num2str(cln-1),'-','crn',num2str(crn-1),'-']
Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path, name_path);
site=['A',num2str(count+2)];
analyse(jxh, jxw, cw, cln, crn, data_path, xlsx_path, name_path, site);
count = count + 1;
str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用


jxwn=0.9;%槽宽初始值为0.8mm
jxh= [ num2str(jxhn),'[mm]']
jxw= [ num2str(jxwn),'[mm]']
cw = [ num2str(cwn),'[mm]']
jx = [ num2str(jxn),'[mm]']
wc = [ num2str(wcn),'[mm]']
name_path=['jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','cln',num2str(cln-1),'-','crn',num2str(crn-1),'-']
Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path, name_path);
site=['A',num2str(count+2)];
analyse(jxh, jxw, cw, cln, crn, data_path, xlsx_path, name_path, site);
count = count + 1;
str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用



jxhn=0.6;%槽宽初始值为0.8mm
jxh= [ num2str(jxhn),'[mm]']
jxw= [ num2str(jxwn),'[mm]']
cw = [ num2str(cwn),'[mm]']
jx = [ num2str(jxn),'[mm]']
wc = [ num2str(wcn),'[mm]']
name_path=['jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','cln',num2str(cln-1),'-','crn',num2str(crn-1),'-']
Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path, name_path);
site=['A',num2str(count+2)];
analyse(jxh, jxw, cw, cln, crn, data_path, xlsx_path, name_path, site);
count = count + 1;
str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用
