
%分析792个大数据 找出每个槽高、槽宽对应的最大ΔB，即不考虑齿宽的影响
%用于绘图，看每个齿宽中，最大ΔB所对应的槽宽
clear;
clc;
file_name = ['D:\GitHub\paper1\newRange\间隙\All\jx0.2Length19.2Lh处理.xlsx'];
fid = fopen(file_name, 'r');%打开要读取的文件
% jxh=槽高，jxw=槽宽，cw=极齿宽，jx=间隙，cnz=总槽数，cln=左槽数，crn右槽数
%设置变量下限
jxh0=0.1;%%槽高范围0.1-1.0mm
jxw0=0.1;%%槽宽范围0.1-2.0mm
cw0=0.1;%%极齿宽范围0.1-0.5mm
%设置变量上限
jxh1=1.0;%%槽高范围0.1-1.0mm
jxw1=2.0;%%槽宽范围0.1-2.0mm
cw1=0.5;%%极齿宽范围0.1-0.5mm
s1=0.1;
s2=0.1;
jxwcell=2;%用于输出结果时的坐标
cwcell=2;%用于输出结果时的坐标
output=[21,6];
list_data=xlsread(file_name, 1, 'A2:E1001')%将数据一同从excel中读出
%因为读取数据所需要的运算量比较大，如果分步读运行会非常慢
c0=1;
c1=9;


for jxw=jxw0:s1:jxw1
    output(jxwcell,1)=jxw;
    jxw=round(jxw*100)/100;%为保证对比时精度相同
    for cw=cw0:s1:cw1
        output(1,cwcell)=cw;
        cw=round(cw*100)/100;
        for c=c0:1:c1
            outrange=(list_data(c+1,5)-list_data(c,5))/list_data(c,5);
            if outrange<0.02
                Lh=list_data(c,2);
                output(jxwcell,cwcell)=Lh;
                break
            end
        end
        c0=c0+10;
        c1=c1+10;
        cwcell=cwcell+1;     
    end
    cwcell=2;
    jxwcell=jxwcell+1;
    output;
end
fclose(fid);
xlswrite(file_name, output, 2, 'A1') %输出结果为output的转置，为了后面分析方便而做的更改，该前面的输出顺序太麻烦，所以直接转置
