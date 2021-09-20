clear;
clc;
tic;
%提示
% bar = waitbar(0,'继续将会删除以往数据');   % waitbar显示进度条
while 1
    fileS= str2num(char(inputdlg('请输入:0表示不删除原文件，1表示删除原文件','注意')))
    if fileS==1
        % %删除文件夹
          = rmdir('resultTest', 's');
        %创建文件夹
        mkdir resultB\data
        mkdir resultB\picture
        mkdir resultB\Line
        break
    elseif fileS==0
        break
    end
end

% %声明地址
file_path = ['D:\学习资料\研究生阶段\磁流体实验室\1小论文1\0matlab联调\model2\'];
model_path = [file_path, 'Model.mph'];
result_path = [file_path,'resultAll\'];
data_path = [result_path,'data\'];
xian_path = [result_path,'Line\'];
tu_path = [result_path,'picture\'];
xlsx_path=[result_path,'result.xlsx']
title = {'槽高[mm]','槽宽[mm]','极齿宽[mm]','左极齿ΔB[T]','右极齿ΔB[T]','总ΔB[T]'};
xlswrite(xlsx_path, title, 1, 'A1');
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
%进度
count = 0;
All=((jxh1-jxh0)/s1+1)*((jxw1-jxw0)/s2+1)*((cw1-cw0)/s3+1)
bar = waitbar(0,'开始');   % waitbar显示进度条
%固定值
jx=0.1;%%间隙0.1mm

for jxhn=jxh0:s1:jxh1
    for jxwn=jxw0:s2:jxw1
        for cwn=cw0:s3:cw1
            str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
            waitbar(count/All,bar,str)                       % 更新进度条bar，配合bar使用
            jxn=0.1;
            wcn=cwn+jxwn;
            clnn=floor(20/wcn);
            crnn=clnn;
            cnzn=clnn+crnn;
            jxh= [ num2str(jxhn),'[mm]'];
            jxw= [ num2str(jxwn),'[mm]'];
            cw = [ num2str(cwn),'[mm]'];
            jx = [ num2str(jxn),'[mm]'];
            wc = [ num2str(wcn),'[mm]'];
            cnz = cnzn;
            cln = clnn;
            crn = crnn;
            toc;
            %Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path,tu_path); 
            site=['A',num2str(count+2)];
            analyse(jxh, jxw, cw, clnn, data_path, xlsx_path, site);
            count = count + 1;
            str=['已完成...',num2str(100*count/All),'%'];    % 百分比形式显示处理进程,不需要删掉这行代码就行
            waitbar(count/All,bar,str);                       % 更新进度条bar，配合bar使用
        end
    end
end
