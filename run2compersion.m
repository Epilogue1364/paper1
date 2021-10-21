while 1

                %检测是否选择结果文件夹
                if app.clearValue==3 %选择result文件夹 在文件夹中生成三个文件夹 如果已经存在将不生成 1为选择现有文件夹 2为默认文件夹 3为生成新文件夹
                elseif app.clearValue==1 || app.clearValue==2
                    if strcmp(app.Switch_model.Value,'On')
                        button=questdlg('文件夹已存在，可能保存有文件，进行仿真前请选择处理方式','注意','清除','保留','取消计算',"取消计算");%内容，标题，选项（2个），默认选项
                        if strcmp(button,'清除')%判断'确定开始计算吗？'的选择
                            [~, ~, ~]=rmdir(app.result_path, 's');
                            h=msgbox('已清除','提醒');
                            start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        elseif strcmp(button,'保留')
                            h=msgbox('保留原有文件','提醒');
                            start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        elseif strcmp(button,'取消计算')
                            h=msgbox('已取消计算，请重新设置并开始计算','提醒');
                            start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                            break
                        end
                    end
                else
                    h=msgbox('请选择结果文件夹','操作错误','error');
                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                    app.EditField_resultPath.Value='当前未选择结果文件夹';
                    init_ran(app);
                    break;
                end

                %路径中不存在的文件夹时将自动生成，如果已存在将不生成
                mkdir(app.result_path, 'data');
                mkdir(app.result_path, 'picture');
                mkdir(app.result_path, 'line');

                count = 0;%计完成数
                All = ((app.jxh1-app.jxh0)/app.s1+1)*((app.jxw1-app.jxw0)/app.s2+1)*((app.cw1-app.cw0)/app.s3+1);%总数
                app.EditField_all.Value = All;
                %确定是否开始计算
                button=questdlg('确定开始计算吗？','计算程序','Yes','No','Yes');%内容，标题，选项（2个），默认选项
                if strcmp(button,'No')%判断'确定开始计算吗？'的选择
                    h=msgbox('已取消计算','退出计算','help');
                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                    init_ran(app);
                    break
                end
                %表格存储的顺序
                if app.SheetNum < 3
                    app.SheetNum=app.SheetNum+1;
                else
                    app.SheetNum=1; %超过3后
                end
                %查看是否有手动选择sheet
                if str2double(app.DropDown_Sheet.Value)==1
                    app.SheetNum=1;
                elseif str2double(app.DropDown_Sheet.Value)==2
                    app.SheetNum=2;
                elseif str2double(app.DropDown_Sheet.Value)==3
                    app.SheetNum=3;
                end
                %数据将会被替换判断
                switch app.SheetNum
                    case 1
                        Button_Sheet1ValueChanged(app, event);
                        if isempty(app.data1)==0 %如果是非空的
                            app.warnvar=1;
                        end
                    case 2
                        Button_Sheet2ValueChanged(app, event)
                        if isempty(app.data2)==0 %如果是非空的
                            app.warnvar=1;
                        end
                    case 3
                        Button_Sheet3ValueChanged(app, event)
                        if isempty(app.data3)==0 %如果是非空的
                            app.warnvar=1;
                        end
                end

                if app.warnvar==1
                    app.warnvar=0;
                    button=questdlg('数据储存位置已被占用，确定计算将会清空','计算程序','Yes','No','Yes');%内容，标题，选项（2个），默认选项
                    if strcmp(button,'No')%判断'确定开始计算吗？'的选择
                        h=msgbox('已取消计算','退出计算','help');
                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        init_ran(app);
                        break%否则关闭弹窗，不退出界面
                    end
                end

                %正式开始运行
                pre_run(app);%按钮的交互性改变


                if app.SheetNum==1
                    app.data1=zeros(round(All),9);%生成空矩阵
                elseif app.SheetNum==2
                    app.data2=zeros(round(All),9);%生成空矩阵
                elseif app.SheetNum==3
                    app.data3=zeros(round(All),9);%生成空矩阵
                end

                app.Image_line.ImageSource='D:\GitHub\paper1\请等待图片.png';
                app.TabGroup.SelectedTab=app.Tab_2;%将选项卡组置为第二个界面

                for jxhn = app.jxh0 : app.s1 : app.jxh1
                    if app.jxhbreak==1
                        break
                    end
                    for jxwn = app.jxw0 : app.s2 : app.jxw1
                        if app.jxwbreak==1
                            app.SheetNum=app.SheetNum-1;
                            break
                        end
                        for cwn = app.cw0 : app.s3 : app.cw1
                            oldtoc=toc;
                            pause(1);%####重要####
                            %如果没有上面的延时，将会直接进入Model1子程序，出现冲突，不仅无法与app页面交互，还会大大增加计算时间
                            %暂停程序的判断
                            if app.pauseValue==1 %如果暂停按钮被点击，变量置为一
                                f=msgbox('已暂停，点击确定或关闭窗口将继续','提醒','help');
                                uiwait(f);%弹出窗口并暂停，直至点击确定或关闭窗口
                                app.pauseValue=0;%暂停变量重置
                                app.Button_pause.Icon = 'pause.jpg';
                                app.Button_pause.Text = 'pause';
                                app.Button_pause.FontColor = [0 0 0];
                                app.Button_pause.Enable='on';
                                pause(1)
                            end


                            %终止程序
                            if app.runValue==1
                                app.Button_stop.Text = 'stopping';
                                app.Button_stop.FontColor = [1 0 0];
                                app.Button_stop.Enable='off';
                                app.Button_pause.Enable='off';
                                button=questdlg('确定终止吗？','终止计算','Yes','No','Yes');%内容，标题，选项（2个），默认选项
                                if strcmp(button,'Yes')
                                    app.jxwbreak=1;%跳出jxw循环的识别变量
                                    app.jxhbreak=1;%跳出jxh循环的识别变量
                                    h=msgbox('已终止计算','终止计算','help');
                                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                                    break %跳出cw循环
                                elseif strcmp(button,'No')
                                    app.runValue=0;
                                    app.Button_stop.Text = 'stop';
                                    app.Button_stop.FontColor = [0 0 0];
                                    app.Button_stop.Enable='on';
                                    app.Button_pause.Enable='on';
                                    pause(1)
                                end
                            end

                            %                             app.runValue=0;
                            %                             app.Button_stop.Text = 'stop';
                            %                             app.Button_stop.FontColor = [0 0 0];
                            %                             app.Button_stop.Enable='on';
                            %                             app.Button_pause.Enable='on';
                            %开始赋值准备仿真计算
                            wcn = cwn+jxwn;
                            if app.Button_cModel.Value==0
                                app.cln = floor(app.EditField_cln_in.Value/wcn);
                                app.crn = floor(app.EditField_crn_in.Value/wcn);
                            elseif app.Button_cModel.Value==1
                                app.cln = app.EditField_cln_in.Value+1;
                                app.crn = app.EditField_crn_in.Value+1;
                            end
                            %                             app.cln = floor(21/wcn);
                            %                             app.crn = app.cln;
                            app.cnz = app.cln + app.crn;
                            app.jxh = [ num2str(jxhn),'[mm]'];
                            app.jxw = [ num2str(jxwn),'[mm]'];
                            app.cw = [ num2str(cwn),'[mm]'];
                            app.wc = [ num2str(wcn),'[mm]'];
                            app.name_path=['jxh',num2str(app.jxh),'-','jxw',num2str(app.jxw),'-','cw',num2str(app.cw),'-','cln',num2str(app.cln-1),'-','crn',num2str(app.crn-1),'-'];

                            if strcmp(app.Switch_model.Value,'On')

                                Model2(app);
                            end
                            if strcmp(app.Switch_analyse.Value,'On')
                                mistake=analyseApp(app);
                                if mistake==1
                                    button=questdlg('结果文件不存在','错误','已添加','退出','退出');
                                    if strcmp(button,'退出')
                                        app.jxwbreak=1;%跳出jxw循环的识别变量
                                        app.jxhbreak=1;%跳出jxh循环的识别变量
                                        h=msgbox('结果文件不存在，已终止计算','终止计算','help');
                                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                                        break %跳出cw循环
                                    else
                                        mistake2=analyseApp(app);
                                        if mistake2==1
                                            app.jxwbreak=1;%跳出jxw循环的识别变量
                                            app.jxhbreak=1;%跳出jxh循环的识别变量
                                            h=msgbox('结果文件不存在，已终止计算','终止计算','help');
                                            start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                                            break %跳出cw循环
                                        end
                                    end
                                end
                            end

                            app.EditField_jxh_out.Value = jxhn;
                            app.EditField_jxw_out.Value = jxwn;
                            app.EditField_cw_out.Value = cwn;
                            app.EditField_cln_out.Value = app.cln-1;
                            app.EditField_crn_out.Value = app.crn-1;
                            %线图的更新
                            %Xian_name=[app.result_path,'\Line\', 'Xian-', app.name_path, 'normB.png'];
                            Xian_name=fullfile(app.result_path,'Line',['Xian-', app.name_path, 'normB.png']);
                            app.Image_line.ImageSource=Xian_name;
                            count = count + 1;
                            data=[count,jxhn,jxwn,cwn,app.B1,app.cln-1,app.B2,app.crn-1,app.B1+app.B2];
                            app.delta_B.Value=app.B1+app.B2;
                            if app.SheetNum==1
                                app.data1(count,:)=data;
                            elseif app.SheetNum==2
                                app.data2(count,:)=data;
                            elseif app.SheetNum==3
                                app.data3(count,:)=data;
                            end
                            %app.data1(count,:)=[count,jxhn,jxwn,cwn,app.B1,app.cln-1,app.B2,app.crn-1,app.B1+app.B2];
                            %查看表格显示状态按钮
                            if app.Button_Sheet1.Value==1
                                app.Table.Data=app.data1;
                            elseif app.Button_Sheet2.Value==1
                                app.Table.Data=app.data2;
                            elseif app.Button_Sheet3.Value==1
                                app.Table.Data=app.data3;
                            end
                            app.EditField_finished.Value = count;%更新程序已完成的数据
                            app.Gauge.Value = floor(count*100/All);%更新进度条
                            app.EditField_second.Value = floor(rem(toc,60));%更新计算所需时间的秒
                            app.EditField_minute.Value = floor(toc/60);%更新计算所需时间的分
                            oncetime=toc-oldtoc;
                            predicttime=(All-count)*oncetime;
                            app.EditField_second_2.Value = floor(rem(predicttime,60));%更新计算所需时间的秒
                            app.EditField_minute_2.Value = floor(predicttime/60);%更新计算所需时间的分
                        end
                    end
                end

                if app.jxhbreak==1
                    init_ran(app);%运行完毕的初始化
                    break
                end
                %程序运行完毕或程序终止
                init_ran(app);%运行完毕的初始化
                msgbox('计算完成','完成');
                app.TabGroup.SelectedTab=app.Tab_3;%将选项卡组置为第三个界面
                break
            end