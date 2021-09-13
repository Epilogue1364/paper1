%分析792个大数据 找出每个齿宽、槽宽对应的最大ΔB，即不考虑槽高的影响
%用于绘图，看每个齿宽中，最大ΔB所对应的槽宽
clear;
clc;
file_name = ['D:\OneDrive\桌面\resultMAX.xlsx'];
fid = fopen(file_name, 'r');%打开要读取的文件
jxh0=0.3;%槽高初始值
cw0=0.12;%齿宽初始值
jxh1=1.0;%槽高最大值
cw1=0.28;%齿宽最大值
s1=0.1;
s2=0.02;
jxhcell=2;%用于输出结果时的坐标
cwcell=2;%用于输出结果时的坐标
list_cell = {};%储存
output=[];
list_data=xlsread(file_name, 1, 'A2:I793');%将数据一同从excel中读出
%因为读取数据所需要的运算量比较大，如果分步读运行会非常慢
for jxh=jxh0:s1:jxh1
    output(jxhcell,1)=jxh;
    jxh=round(jxh*100)/100;%为保证对比时精度相同
    for cw=cw0:s2:cw1 
        output(1,cwcell)=cw;
        cw=round(cw*100)/100;
        for c1=1:1:792
            result=round(list_data(c1,2)*100)/100;
            if result==jxh
                result=round(list_data(c1,4)*100)/100;
                if result==cw
                    result=round(list_data(c1,9)*10000)/10000;
                    list_cell = [list_cell;result];
                end
            end
        end
        list_cell = cell2mat(list_cell);
        resultmax=max(list_cell);
        output(jxhcell,cwcell)=resultmax;
        cwcell=cwcell+1;
        list_cell = {};
        output;
    end
    cwcell=2;
    jxhcell=jxhcell+1;
    output 
end
xlswrite(file_name, output', 5, 'A1') %输出结果为output的转置，为了后面分析方便而做的更改，该前面的输出顺序太麻烦，所以直接转置
fclose(fid);