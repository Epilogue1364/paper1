function analyse(jxh, jxw, cw, clnn, data_path, xlsx_path, site)

% xlsx_path=[result_path,'result.xlsx'];
file_name = [data_path, 'Line-jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','normB_L.txt'];
[h,m] = dataProcess(file_name);
t=floor(m/(clnn-1));
m=t*(clnn-1);
B1=BCalculate(h,t,m);%输入(数据组，步进，数据总量)，输出磁通密度模差值和
file_name = [data_path, 'Line-jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','normB_R.txt'];
[h,m] = dataProcess(file_name);
m=t*(clnn-1);
B2=BCalculate(h,t,m);%输入(数据组，步进，数据总量)，输出磁通密度模差值和
title = {'槽高[mm]','槽宽[mm]','极齿宽[mm]','左极齿ΔB[T]','右极齿ΔB[T]','总ΔB[T]'};
data_output={jxh(1:length(jxh)-4),jxw(1:length(jxw)-4),cw(1:length(cw)-4),B1,B2,B1+B2};
xlswrite(xlsx_path, data_output, 1, site);
