 % %变量
    % %jxh=槽高，jxw=槽宽，cw=极齿宽，jx=间隙，cnz=总槽数，cln=左槽数，crn右槽数
    % %设置变量下限
    % jxh0=0.3;%%槽高范围0.3-1.0mm
    % jxw0=0.4;%%槽宽范围0.4-1.4mm
    % cw0=0.12;%%极齿宽范围0.12-0.28mm
    % %设置变量上限
    % jxh1=1.0;%%槽高范围0.3-1.0mm
    % jxw1=1.4;%%槽宽范围0.4-1.4mm
    % cw1=0.28;%%极齿宽范围0.12-0.28mm
    % %步进
    % s1=0.1;%%槽高步进
    % s2=0.1;%%槽宽步进
    % s3=0.02;%%极齿宽步进
    %进度
    count = 0;
    All=((jxh1-jxh0)/s1+1)*((jxw1-jxw0)/s2+1)*((cw1-cw0)/s3+1)
    bar = waitbar(0,'开始');   % waitbar显示进度条
    %固定值
    jx=0.1;%间隙0.1mm
    
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