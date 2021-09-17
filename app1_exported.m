classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        COMSOLMATLABUIFigure  matlab.ui.Figure
        Label_import_2        matlab.ui.control.Label
        Label_import          matlab.ui.control.Label
        Label_min             matlab.ui.control.Label
        Label_step            matlab.ui.control.Label
        Label_max             matlab.ui.control.Label
        Label_jxh_in          matlab.ui.control.Label
        EditField_jxh_min     matlab.ui.control.NumericEditField
        EditField_jxh_step    matlab.ui.control.NumericEditField
        EditField_jxh_max     matlab.ui.control.NumericEditField
        Label_jxw_in          matlab.ui.control.Label
        EditField_jxw_min     matlab.ui.control.NumericEditField
        EditField_jxw_step    matlab.ui.control.NumericEditField
        EditField_jxw_max     matlab.ui.control.NumericEditField
        Label_cw_in           matlab.ui.control.Label
        EditField_cw_min      matlab.ui.control.NumericEditField
        EditField_cw_step     matlab.ui.control.NumericEditField
        EditField_cw_max      matlab.ui.control.NumericEditField
        Button_file_path      matlab.ui.control.Button
        Knob_clear            matlab.ui.control.DiscreteKnob
        Label_clear           matlab.ui.control.Label
        Button_pause          matlab.ui.control.Button
        Button_run            matlab.ui.control.Button
        Button_quit           matlab.ui.control.Button
        Image_logo            matlab.ui.control.Image
        Label_lab             matlab.ui.control.Label
        Label_cln_crn_in      matlab.ui.control.Label
        EditField_crn_in      matlab.ui.control.NumericEditField
        EditField_cln_in      matlab.ui.control.NumericEditField
        EditField_crn_out     matlab.ui.control.NumericEditField
        Label_crn_out         matlab.ui.control.Label
        EditField_cln_out     matlab.ui.control.NumericEditField
        Label_cln_out         matlab.ui.control.Label
        EditField_cw_out      matlab.ui.control.NumericEditField
        Label_cw_out          matlab.ui.control.Label
        EditField_jxw_out     matlab.ui.control.NumericEditField
        Label_jxw_out         matlab.ui.control.Label
        EditField_jxh_out     matlab.ui.control.NumericEditField
        Label_jxh_out         matlab.ui.control.Label
        delta_B               matlab.ui.control.NumericEditField
        Label_delta_B         matlab.ui.control.Label
        Label_image           matlab.ui.control.Label
        gap                   matlab.ui.control.NumericEditField
        Label_gap             matlab.ui.control.Label
        Label_back            matlab.ui.control.Label
        Image_line            matlab.ui.control.Image
        Gauge                 matlab.ui.control.LinearGauge
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button_file_path
        function Button_file_pathPushed(app, event)
            file_path = uigetdir('*.*','请选择文件夹') %fliepath为文件夹路径
        end

        % Button pushed function: Button_run
        function Button_runPushed(app, event)
%             while 1
%                 
%             end
            file_path = uigetdir('*.*','请选择文件夹') %fliepath为文件夹路径
            clearValue = app.Knob_clear.Value
            jxh0 = app.EditField_jxh_min.Value;
            jxw0 = app.EditField_jxw_min.Value
            cw0 = app.EditField_cw_min.Value;
            jxh1 = app.EditField_jxh_max.Value;
            jxw1 = app.EditField_jxw_max.Value;
            cw1 = app.EditField_cw_max.Value;
            s1 = app.EditField_jxh_step.Value;
            s2 = app.EditField_jxw_step.Value;
            s3 = app.EditField_cw_step.Value;
            jx = app.gap.Value;
            clnin = app.EditField_cln_in.Value;
            crnin = app.EditField_crn_in.Value;
            
            %run(file_path, clearValue, jxh0, jxw0, cw0, jxh1, jxw1, cw1, s1, s2, s3, jx)
            app.Gauge.Value=45;
        end

        % Image clicked function: Image_line
        function Image_lineClicked(app, event)
            
        end

        % Button pushed function: Button_quit
        function Button_quitPushed(app, event)
            delete(app.COMSOLMATLABUIFigure)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create COMSOLMATLABUIFigure and hide until all components are created
            app.COMSOLMATLABUIFigure = uifigure('Visible', 'off');
            app.COMSOLMATLABUIFigure.Position = [100 100 750 550];
            app.COMSOLMATLABUIFigure.Name = '基于COMSOL与MATLAB的磁性液体密封磁场参数化仿真软件';
            app.COMSOLMATLABUIFigure.Icon = 'comsol.jpg';

            % Create Gauge
            app.Gauge = uigauge(app.COMSOLMATLABUIFigure, 'linear');
            app.Gauge.FontSize = 14;
            app.Gauge.Position = [421 491 292 42];

            % Create Image_line
            app.Image_line = uiimage(app.COMSOLMATLABUIFigure);
            app.Image_line.ImageClickedFcn = createCallbackFcn(app, @Image_lineClicked, true);
            app.Image_line.Position = [371 202 350 270];
            app.Image_line.ImageSource = '测试用图片.png';

            % Create Label_back
            app.Label_back = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_back.FontSize = 18;
            app.Label_back.FontWeight = 'bold';
            app.Label_back.FontColor = [0 0.4471 0.7412];
            app.Label_back.Position = [391 140 185 33];
            app.Label_back.Text = '当前所完成计算的参数';

            % Create Label_gap
            app.Label_gap = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_gap.HorizontalAlignment = 'center';
            app.Label_gap.FontSize = 18;
            app.Label_gap.Position = [20 69 50 30];
            app.Label_gap.Text = '间隙';

            % Create gap
            app.gap = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.gap.FontSize = 18;
            app.gap.Position = [83 68 70 30];
            app.gap.Value = 0.1;

            % Create Label_image
            app.Label_image = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_image.HorizontalAlignment = 'center';
            app.Label_image.FontSize = 18;
            app.Label_image.FontWeight = 'bold';
            app.Label_image.Position = [421 170 260 30];
            app.Label_image.Text = '磁场密度模曲线图';

            % Create Label_delta_B
            app.Label_delta_B = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_delta_B.HorizontalAlignment = 'center';
            app.Label_delta_B.FontSize = 18;
            app.Label_delta_B.Position = [391 18 113 33];
            app.Label_delta_B.Text = '总磁通密度模';

            % Create delta_B
            app.delta_B = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.delta_B.FontSize = 18;
            app.delta_B.Position = [511 18 70 33];

            % Create Label_jxh_out
            app.Label_jxh_out = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_jxh_out.HorizontalAlignment = 'center';
            app.Label_jxh_out.FontSize = 18;
            app.Label_jxh_out.Position = [392 100 59 33];
            app.Label_jxh_out.Text = '槽高';

            % Create EditField_jxh_out
            app.EditField_jxh_out = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxh_out.FontSize = 18;
            app.EditField_jxh_out.Position = [391 61 60 33];

            % Create Label_jxw_out
            app.Label_jxw_out = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_jxw_out.HorizontalAlignment = 'center';
            app.Label_jxw_out.FontSize = 18;
            app.Label_jxw_out.Position = [462 101 59 33];
            app.Label_jxw_out.Text = '槽宽';

            % Create EditField_jxw_out
            app.EditField_jxw_out = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxw_out.FontSize = 18;
            app.EditField_jxw_out.Position = [461 62 60 33];

            % Create Label_cw_out
            app.Label_cw_out = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_cw_out.HorizontalAlignment = 'center';
            app.Label_cw_out.FontSize = 18;
            app.Label_cw_out.Position = [532 101 59 33];
            app.Label_cw_out.Text = '齿宽';

            % Create EditField_cw_out
            app.EditField_cw_out = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_cw_out.FontSize = 18;
            app.EditField_cw_out.Position = [531 62 60 33];

            % Create Label_cln_out
            app.Label_cln_out = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_cln_out.HorizontalAlignment = 'center';
            app.Label_cln_out.FontSize = 18;
            app.Label_cln_out.Position = [602 100 59 33];
            app.Label_cln_out.Text = '左齿数';

            % Create EditField_cln_out
            app.EditField_cln_out = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_cln_out.FontSize = 18;
            app.EditField_cln_out.Position = [601 61 60 33];

            % Create Label_crn_out
            app.Label_crn_out = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_crn_out.HorizontalAlignment = 'center';
            app.Label_crn_out.FontSize = 18;
            app.Label_crn_out.Position = [672 100 59 33];
            app.Label_crn_out.Text = '右齿数';

            % Create EditField_crn_out
            app.EditField_crn_out = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_crn_out.FontSize = 18;
            app.EditField_crn_out.Position = [671 61 60 33];

            % Create EditField_cln_in
            app.EditField_cln_in = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_cln_in.FontSize = 18;
            app.EditField_cln_in.Position = [243 68 40 30];

            % Create EditField_crn_in
            app.EditField_crn_in = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_crn_in.FontSize = 18;
            app.EditField_crn_in.Position = [293 68 40 30];

            % Create Label_cln_crn_in
            app.Label_cln_crn_in = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_cln_crn_in.HorizontalAlignment = 'center';
            app.Label_cln_crn_in.FontSize = 18;
            app.Label_cln_crn_in.Position = [163 68 77 30];
            app.Label_cln_crn_in.Text = '左右齿宽';

            % Create Label_lab
            app.Label_lab = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_lab.HorizontalAlignment = 'center';
            app.Label_lab.FontName = '楷体';
            app.Label_lab.FontSize = 14;
            app.Label_lab.FontColor = [0.2196 0.1294 0.451];
            app.Label_lab.Position = [121 527 109 20];
            app.Label_lab.Text = '磁性液体研究所';

            % Create Image_logo
            app.Image_logo = uiimage(app.COMSOLMATLABUIFigure);
            app.Image_logo.Position = [1 501 190 50];
            app.Image_logo.ImageSource = '北京交通大学logo.png';

            % Create Button_quit
            app.Button_quit = uibutton(app.COMSOLMATLABUIFigure, 'push');
            app.Button_quit.ButtonPushedFcn = createCallbackFcn(app, @Button_quitPushed, true);
            app.Button_quit.Icon = 'switch.png';
            app.Button_quit.FontSize = 18;
            app.Button_quit.Position = [650 20 80 30];
            app.Button_quit.Text = 'quit';

            % Create Button_run
            app.Button_run = uibutton(app.COMSOLMATLABUIFigure, 'push');
            app.Button_run.ButtonPushedFcn = createCallbackFcn(app, @Button_runPushed, true);
            app.Button_run.Icon = 'run.jpg';
            app.Button_run.FontSize = 18;
            app.Button_run.Position = [20 20 100 30];
            app.Button_run.Text = 'run';

            % Create Button_pause
            app.Button_pause = uibutton(app.COMSOLMATLABUIFigure, 'push');
            app.Button_pause.Icon = 'pause.jpg';
            app.Button_pause.FontSize = 18;
            app.Button_pause.Position = [130 20 100 30];
            app.Button_pause.Text = 'pause';

            % Create Label_clear
            app.Label_clear = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_clear.HorizontalAlignment = 'center';
            app.Label_clear.FontSize = 18;
            app.Label_clear.FontWeight = 'bold';
            app.Label_clear.FontColor = [1 0 0];
            app.Label_clear.Position = [20 355 95 50];
            app.Label_clear.Text = {'请选择是否'; '清空文件夹'};

            % Create Knob_clear
            app.Knob_clear = uiknob(app.COMSOLMATLABUIFigure, 'discrete');
            app.Knob_clear.Items = {'Yes', '', 'No'};
            app.Knob_clear.ItemsData = {'1', '2', '0', ''};
            app.Knob_clear.FontSize = 18;
            app.Knob_clear.Position = [190 340 96 96];
            app.Knob_clear.Value = '2';

            % Create Button_file_path
            app.Button_file_path = uibutton(app.COMSOLMATLABUIFigure, 'push');
            app.Button_file_path.ButtonPushedFcn = createCallbackFcn(app, @Button_file_pathPushed, true);
            app.Button_file_path.Icon = 'file.jpg';
            app.Button_file_path.FontSize = 18;
            app.Button_file_path.Position = [20 465 160 30];
            app.Button_file_path.Text = '选择文件地址';

            % Create EditField_cw_max
            app.EditField_cw_max = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_cw_max.FontSize = 18;
            app.EditField_cw_max.Position = [263 128 70 30];
            app.EditField_cw_max.Value = 0.28;

            % Create EditField_cw_step
            app.EditField_cw_step = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_cw_step.FontSize = 18;
            app.EditField_cw_step.Position = [173 128 70 30];
            app.EditField_cw_step.Value = 0.02;

            % Create EditField_cw_min
            app.EditField_cw_min = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_cw_min.FontSize = 18;
            app.EditField_cw_min.Position = [83 128 70 30];
            app.EditField_cw_min.Value = 0.12;

            % Create Label_cw_in
            app.Label_cw_in = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_cw_in.HorizontalAlignment = 'center';
            app.Label_cw_in.FontSize = 18;
            app.Label_cw_in.Position = [20 128 50 27];
            app.Label_cw_in.Text = '齿宽';

            % Create EditField_jxw_max
            app.EditField_jxw_max = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxw_max.FontSize = 18;
            app.EditField_jxw_max.Position = [263 188 70 30];
            app.EditField_jxw_max.Value = 1.4;

            % Create EditField_jxw_step
            app.EditField_jxw_step = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxw_step.FontSize = 18;
            app.EditField_jxw_step.Position = [173 188 70 30];
            app.EditField_jxw_step.Value = 0.1;

            % Create EditField_jxw_min
            app.EditField_jxw_min = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxw_min.FontSize = 18;
            app.EditField_jxw_min.Position = [83 188 70 30];
            app.EditField_jxw_min.Value = 0.4;

            % Create Label_jxw_in
            app.Label_jxw_in = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_jxw_in.HorizontalAlignment = 'center';
            app.Label_jxw_in.FontSize = 18;
            app.Label_jxw_in.Position = [20 188 50 27];
            app.Label_jxw_in.Text = '槽宽';

            % Create EditField_jxh_max
            app.EditField_jxh_max = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxh_max.FontSize = 18;
            app.EditField_jxh_max.Position = [263 248 70 30];
            app.EditField_jxh_max.Value = 1;

            % Create EditField_jxh_step
            app.EditField_jxh_step = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxh_step.FontSize = 18;
            app.EditField_jxh_step.Position = [173 248 70 30];
            app.EditField_jxh_step.Value = 0.1;

            % Create EditField_jxh_min
            app.EditField_jxh_min = uieditfield(app.COMSOLMATLABUIFigure, 'numeric');
            app.EditField_jxh_min.FontSize = 18;
            app.EditField_jxh_min.Position = [83 248 70 30];
            app.EditField_jxh_min.Value = 0.3;

            % Create Label_jxh_in
            app.Label_jxh_in = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_jxh_in.HorizontalAlignment = 'center';
            app.Label_jxh_in.FontSize = 18;
            app.Label_jxh_in.Position = [20 248 50 27];
            app.Label_jxh_in.Text = '槽高';

            % Create Label_max
            app.Label_max = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_max.HorizontalAlignment = 'center';
            app.Label_max.FontSize = 18;
            app.Label_max.Position = [263 288 70 33];
            app.Label_max.Text = '最大值';

            % Create Label_step
            app.Label_step = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_step.HorizontalAlignment = 'center';
            app.Label_step.FontSize = 18;
            app.Label_step.Position = [173 288 70 33];
            app.Label_step.Text = '步进';

            % Create Label_min
            app.Label_min = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_min.HorizontalAlignment = 'center';
            app.Label_min.FontSize = 18;
            app.Label_min.Position = [80 288 70 33];
            app.Label_min.Text = '最小值';

            % Create Label_import
            app.Label_import = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_import.HorizontalAlignment = 'center';
            app.Label_import.FontSize = 18;
            app.Label_import.FontWeight = 'bold';
            app.Label_import.FontColor = [0 0.4471 0.7412];
            app.Label_import.Position = [20 288 50 33];
            app.Label_import.Text = '输入';

            % Create Label_import_2
            app.Label_import_2 = uilabel(app.COMSOLMATLABUIFigure);
            app.Label_import_2.HorizontalAlignment = 'center';
            app.Label_import_2.FontSize = 18;
            app.Label_import_2.FontWeight = 'bold';
            app.Label_import_2.FontColor = [0 0.4471 0.7412];
            app.Label_import_2.Position = [372 494 50 33];
            app.Label_import_2.Text = '进度';

            % Show the figure after all components are created
            app.COMSOLMATLABUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.COMSOLMATLABUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.COMSOLMATLABUIFigure)
        end
    end
end