function out = run(file_path, clearValue, jxh0, jxw0, cw0, jxh1, jxw1, cw1, s1, s2, s3)
clear;
clc;
tic;

while 1
    %声明地址
    model_path = [file_path, '\Model.mph']
    result_path = [file_path,'\resultB\']
    data_path = [result_path,'data\']
    xian_path = [result_path,'Line\']
    tu_path = [result_path,'picture\']
    xlsx_path=[result_path,'result.xlsx']
    title = {'槽高[mm]','槽宽[mm]','极齿宽[mm]','左极齿ΔB[T]','右极齿ΔB[T]','总ΔB[T]'};
    xlswrite(xlsx_path, title, 1, 'A1');
   
    
    
end

