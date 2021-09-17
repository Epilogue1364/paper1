function out = runtest(file_path, clearValue, jxh0, jxw0, cw0, jxh1, jxw1, cw1, s1, s2, s3, jx)
model_path = [file_path, '\Model.mph'];
result_path = [file_path,'\resultTest\'];
data_path = [result_path,'data\'];
xian_path = [result_path,'Line\'];
tu_path = [result_path,'picture\'];
% %删除文件夹
[status, message, messageid] = rmdir('resultTest', 's');
%创建文件夹
mkdir resultTest\data
mkdir resultTest\picture
mkdir resultTest\Line
%file_path = ['D:\学习资料\研究生阶段\磁流体实验室\1小论文1\0matlab联调\model2\'];

jxh=jxh0;%%槽高范围0.3-1.0mm
jxw=jxw0;%%槽宽范围0.4-1.4mm
cw=cw0;%%极齿宽范围0.12-0.28mm
%jx=0.1;%%间隙0.1mm
wc=jxw+cw;
cln=20;
crn=20;
cnz=cln+crn;
jxh= [ num2str(jxh),'[mm]'];
jxw= [ num2str(jxw),'[mm]'];
cw = [ num2str(cw),'[mm]'];
jx = [ num2str(jx),'[mm]'];
wc = [ num2str(wc),'[mm]'];
name_path=['jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','cln',num2str(cln-1),'-','crn',num2str(crn-1),'-']
%Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path, name_path)
