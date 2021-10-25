function analyse(jxh, jxw, cw, cln, crn, data_path, xlsx_path, name_path, site)

% xlsx_path=[result_path,'result.xlsx'];
file_name = [data_path, name_path, 'Line-normB_R.txt'];
[h,m] = dataProcess(file_name);
t=floor(m/(cln-1));
m=t*(cln-1);
B1=BCalculate(h,t,m);%输入(数据组，步进，数据总量)，输出磁通密度模差值和
file_name =  [data_path, name_path, 'Line-normB_L.txt'];
[h,m] = dataProcess(file_name);
t=floor(m/(crn-1));
m=t*(crn-1);
B2=BCalculate(h,t,m);%输入(数据组，步进，数据总量)，输出磁通密度模差值和
title = {'槽高[mm]','槽宽[mm]','极齿宽[mm]','左极齿ΔB[T]','左极齿数','右极齿ΔB[T]','右极齿数','总ΔB[T]'};
data_output={jxh(1:length(jxh)-4),jxw(1:length(jxw)-4),cw(1:length(cw)-4),B1,cln-1,B2,crn-1,B1+B2};
xlswrite(xlsx_path, data_output, 1, site);
