%测试功能
%查看是否能提交
%重复测试
file_name = ['D:\OneDrive\桌面\resultPythonTest.xlsx'];
fid = fopen(file_name, 'r');%打开要读取的文件
jxw0=0.4;%槽宽初始值
cw0=0.12;%齿宽初始值
jxw1=1.4;%槽宽最大值
cw1=0.28;%齿宽最大值
s1=0.1;
s2=0.02;
jxwcell=2;
cwcell=2;
list_cell = {};
output=[];
for jxw=jxw0:s1:jxw1
    for cw=cw0:s2:cw1
        for c1=2:1:793
            site=['c',num2str(c1)];
            result=xlsread(file_name, 1, site);
            if result==jxw
                site=['d',num2str(c1)];
                result=xlsread(file_name, 1, site);
                if result==cw
                    site=['i',num2str(c1)];
                    result=xlsread(file_name, 1, site);
                    list_cell = [list_cell;result]
                end
            end
        end
        cwcell=cwcell+1;
    end
    jxwcell=jxwcell+1;
%     list_cell = [list_cell;]
end