clear;
clc;
tic;
% % %删除文件夹
%  [status, message, messageid] = rmdir('result', 's');
% %创建文件夹
% mkdir result\data
% mkdir result\picture
% mkdir result\Line
%声明地址
file_path = ['E:\Information\NewEasyModel\'];
model_path = [file_path, 'Model.mph'];
result_path = [file_path,'result\'];
data_path = [result_path,'data\'];
xian_path = [result_path,'Line\'];
tu_path = [result_path,'picture\'];
xlsx_path=[result_path,'result.xlsx'];
%变量
%jxh=槽高，jxw=槽宽，cw=极齿宽，jx=间隙，cnz=总槽数，cln=左槽数，crn右槽数
%设置变量下限
jxh0=0.3;%%槽高范围0.3-1.0mm
jxw0=0.4;%%槽宽范围0.4-1.4mm
cw0=0.12;%%极齿宽范围0.12-0.28mm
%设置变量上限
jxh1=1.0;%%槽高范围0.3-1.0mm
jxw1=1.4;%%槽宽范围0.4-1.4mm
cw1=0.28;%%极齿宽范围0.12-0.28mm
%步进
s1=0.1;%%槽高步进
s2=0.1;%%槽宽步进
s3=0.02;%%极齿宽步进
count=0;
All=32;
bar = waitbar(0,'开始');   % waitbar显示进度条
jxhn=0.7;%槽宽初始值为0.8mm
jxwn=0.8;%槽宽初始值为0.8mm
cwn=0.2;%极齿宽初始值为0.2mm
jxn=0.1;%间隙为0.1mm
cnz=42;
cln=21;
crn=21;
wcn=jxwn+cwn;
wc = [ num2str(wcn),'[mm]']
for jxhn=jxh0:s1:jxh1%参数为槽高
    jxh= [ num2str(jxhn),'[mm]']
    jxw= [ num2str(jxwn),'[mm]']
    cw = [ num2str(cwn),'[mm]']
    jx = [ num2str(jxn),'[mm]']
    wc = [ num2str(wcn),'[mm]']
    Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path,tu_path);
    count = count + 1;
    str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
    waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用
end

jxhn=0.7;%槽宽初始值为0.8mm
for jxwn=jxw0:s2:jxw1%参数为槽高
    jxh= [ num2str(jxhn),'[mm]']
    jxw= [ num2str(jxwn),'[mm]']
    cw = [ num2str(cwn),'[mm]']
    jx = [ num2str(jxn),'[mm]']
    wc = [ num2str(wcn),'[mm]']
    Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path,tu_path);
    count = count + 1;
    str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
    waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用
end
jxwn=0.8;%槽宽初始值为0.8mm
for cwn=cw0:s3:cw1
    jxh= [ num2str(jxhn),'[mm]']
    jxw= [ num2str(jxwn),'[mm]']
    cw = [ num2str(cwn),'[mm]']
    jx = [ num2str(jxn),'[mm]']
    wc = [ num2str(wcn),'[mm]']
    Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path,tu_path);
    count = count + 1;
    str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
    waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用
end

cwn=0.2;%极齿宽初始值为0.2mm
for cln=26:5:36
    crn=cnz-cln
    cln
    jxh= [ num2str(jxhn),'[mm]']
    jxw= [ num2str(jxwn),'[mm]']
    cw = [ num2str(cwn),'[mm]']
    jx = [ num2str(jxn),'[mm]']
    wc = [ num2str(wcn),'[mm]']
    Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path,tu_path);
    count = count + 1;
    str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
    waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用
end