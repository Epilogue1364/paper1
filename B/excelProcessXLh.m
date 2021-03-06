%分析792个大数据 找出每个槽高、槽宽对应的最大ΔB，即不考虑齿宽的影响
%用于绘图，看每个齿宽中，最大ΔB所对应的槽宽
clear;
clc;
file_name = ['D:\GitHub\paper1\result2Cr13\jxh0.3-1-jxw0.4-1.4-cw0.12-0.28normB.xlsx'];
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
list_cell = {};%储存
output=[12,9];
list_data=xlsread(file_name, 2, 'A2:I441')%将数据一同从excel中读出
%因为读取数据所需要的运算量比较大，如果分步读运行会非常慢
for jxw=jxw0:s1:jxw1
    output(jxwcell,1)=jxw;
    jxw=round(jxw*100)/100;%为保证对比时精度相同
    for jxh=jxh0:s1:jxh1
        output(1,cwcell)=jxh;
        jxh=round(jxh*100)/100;
        for c1=1:1:440
            result=round(list_data(c1,3)*100)/100;
            if result==jxw
                result=round(list_data(c1,2)*100)/100;
                if result==jxh
                    result=round(list_data(c1,9)*10000)/10000;
                    list_cell = [list_cell;result]
                end
            end
        end
        list_cell = cell2mat(list_cell);
        resultmax=max(list_cell)
        output(jxwcell,cwcell)=resultmax;
        cwcell=cwcell+1;
        list_cell = {};
        output;
    end
    cwcell=2;
    jxwcell=jxwcell+1;
    output; 
end
xlswrite(file_name, output, 5, 'A1') %输出结果为output的转置，为了后面分析方便而做的更改，该前面的输出顺序太麻烦，所以直接转置
fclose(fid);