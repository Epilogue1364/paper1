classdef PECCASMFS < matlab.apps.AppBase
    properties (Access = public)
        Comsol matlab.ui.Figure
        Label_rateOfProgress_symbol matlab.ui.control.Label
        Label_rateOfProgress matlab.ui.control.Label
        EditField_finished matlab.ui.control.NumericEditField
        EditField_all matlab.ui.control.NumericEditField
        Button_stop matlab.ui.control.Button
        Label_second matlab.ui.control.Label
        EditField_second matlab.ui.control.NumericEditField
        Label_minute matlab.ui.control.Label
        EditField_minute matlab.ui.control.NumericEditField
        Label_time matlab.ui.control.Label
        Button_pause matlab.ui.control.Button
        Button_run matlab.ui.control.Button
        TabGroup matlab.ui.container.TabGroup
        Tab_1 matlab.ui.container.Tab
        TabGroup2 matlab.ui.container.TabGroup
        Tab_4 matlab.ui.container.Tab
        Label_2 matlab.ui.control.Label
        Button_cModel matlab.ui.control.StateButton
        Label matlab.ui.control.Label
        Label_crn_in matlab.ui.control.Label
        Label_cln_in matlab.ui.control.Label
        EditField_crn_in matlab.ui.control.NumericEditField
        EditField_cln_in matlab.ui.control.NumericEditField
        gap matlab.ui.control.NumericEditField
        Label_gap matlab.ui.control.Label
        Label_import matlab.ui.control.Label
        Label_min matlab.ui.control.Label
        Label_step matlab.ui.control.Label
        Label_max matlab.ui.control.Label
        Label_jxh_in matlab.ui.control.Label
        EditField_jxh_min matlab.ui.control.NumericEditField
        EditField_jxh_step matlab.ui.control.NumericEditField
        EditField_jxh_max matlab.ui.control.NumericEditField
        Label_jxw_in matlab.ui.control.Label
        EditField_jxw_min matlab.ui.control.NumericEditField
        EditField_jxw_step matlab.ui.control.NumericEditField
        EditField_jxw_max matlab.ui.control.NumericEditField
        Label_cw_in matlab.ui.control.Label
        EditField_cw_min matlab.ui.control.NumericEditField
        EditField_cw_step matlab.ui.control.NumericEditField
        EditField_cw_max matlab.ui.control.NumericEditField
        Tab_5 matlab.ui.container.Tab
        DropDown_Sheet matlab.ui.control.DropDown
        Lamp_analyse matlab.ui.control.Lamp
        Lamp_model matlab.ui.control.Lamp
        Switch_analyse matlab.ui.control.Switch
        Label_switchAnalyse matlab.ui.control.Label
        Switch_model matlab.ui.control.Switch
        Label_switchModel matlab.ui.control.Label
        EditField_filePath matlab.ui.control.EditField
        Button_initialize matlab.ui.control.Button
        EditField_resultPath matlab.ui.control.EditField
        DropDown_resultFile matlab.ui.control.DropDown
        Button_file_path matlab.ui.control.Button
        Tab_2 matlab.ui.container.Tab
        Button_openResultFile matlab.ui.control.Button
        Button_openFile matlab.ui.control.Button
        Label_import_2 matlab.ui.control.Label
        Gauge matlab.ui.control.LinearGauge
        EditField_crn_out matlab.ui.control.NumericEditField
        Label_crn_out matlab.ui.control.Label
        EditField_cln_out matlab.ui.control.NumericEditField
        Label_cln_out matlab.ui.control.Label
        EditField_cw_out matlab.ui.control.NumericEditField
        Label_cw_out matlab.ui.control.Label
        EditField_jxw_out matlab.ui.control.NumericEditField
        Label_jxw_out matlab.ui.control.Label
        EditField_jxh_out matlab.ui.control.NumericEditField
        Label_jxh_out matlab.ui.control.Label
        delta_B matlab.ui.control.NumericEditField
        Label_delta_B matlab.ui.control.Label
        Label_back matlab.ui.control.Label
        Label_image matlab.ui.control.Label
        Image_line matlab.ui.control.Image
        Tab_3 matlab.ui.container.Tab
        Button_Export matlab.ui.control.Button
        Button_Clear matlab.ui.control.Button
        Button_Sheet3 matlab.ui.control.StateButton
        Button_Sheet2 matlab.ui.control.StateButton
        Button_Sheet1 matlab.ui.control.StateButton
        Table matlab.ui.control.Table
        Button_quit matlab.ui.control.Button
        Image_logo matlab.ui.control.Image
        Label_lab matlab.ui.control.Label
    end
    properties (Access = public)
        file_path
        clearValue
        result_path
        pauseValue
        resultname
        runValue
        data1
        data2
        data3
        name_path
        jxh
        jxw
        cw
        wc
        cln
        crn
        cnz
        jx
        B1
        B2
        computer
        jxh0
        jxw0
        cw0
        jxh1
        jxw1
        cw1
        s1
        s2
        s3
        clnin
        crnin
        sealSpacel
        sealSpacer
        SheetNum
        warnvar
        jxwbreak
        jxhbreak
    end
    methods (Access = private)
        function init_run(app)
            app.Button_run.Icon = 'run.jpg';
            app.Button_run.Text = 'run';
            app.Button_run.FontColor = [0 0 0];
            app.Button_run.Enable='on';
        end
        function init_stop(app)
            app.Button_stop.Text = 'stop';
            app.Button_stop.FontColor = [0 0 0];
            app.Button_stop.Visible='off';
            app.Button_stop.Enable='off';
        end
        function init_pause(app)
            app.Button_pause.Text = 'pause';
            app.Button_pause.FontColor = [0 0 0];
            app.Button_pause.Visible='off';
            app.Button_pause.Enable='off';
        end
        function init_ran(app)
            init_run(app);
            init_stop(app);
            init_pause(app)
            app.Button_initialize.Enable='on';
            app.Button_file_path.Enable='on';
            app.Button_quit.Enable='on';
            app.DropDown_resultFile.Enable='on';
            app.DropDown_resultFile.Value=num2str(0);
            app.clearValue = 0;
            app.pauseValue = 0;
            app.resultname='';
            app.runValue = 0;
            app.Button_Export.Enable='on';
            app.Button_Clear.Enable='on';
            app.Button_cModel.Enable='on';
            app.DropDown_Sheet.Value='0';
            app.jxhbreak=0;
            app.jxwbreak=0;
            app.EditField_jxh_min.Enable='on';
            app.EditField_jxw_min.Enable='on';
            app.EditField_cw_min.Enable='on';
            app.EditField_jxh_max.Enable='on';
            app.EditField_jxw_max.Enable='on';
            app.EditField_cw_max.Enable='on';
            app.EditField_jxh_step.Enable='on';
            app.EditField_jxw_step.Enable='on';
            app.EditField_cw_step.Enable='on';
            app.gap.Enable='on';
            app.EditField_cln_in.Enable='on';
            app.EditField_crn_in.Enable='on';
            app.EditField_resultPath.Value='当前未选择结果文件夹';
            app.EditField_jxh_out.Value=0;
            app.EditField_jxw_out.Value=0;
            app.EditField_cw_out.Value=0;
            app.EditField_cln_out.Value=0;
            app.EditField_crn_out.Value=0;
            app.delta_B.Value=0;
        end
        function pre_run(app)
            clc;
            tic;
            app.jxwbreak=0;
            app.jxhbreak=0;
            app.Button_pause.Visible='on';
            app.Button_pause.Enable='on';
            app.Button_stop.Visible='on';
            app.Button_stop.Enable='on';
            app.Button_initialize.Enable='off';
            app.Button_file_path.Enable='off';
            app.DropDown_resultFile.Enable='off';
            app.Button_quit.Enable='off';
            app.Button_run.Enable='off';
            app.Button_Export.Enable='off';
            app.Button_Clear.Enable='off';
            app.Gauge.Value = 0;
            app.Button_cModel.Enable='off';
            app.EditField_jxh_min.Enable='off';
            app.EditField_jxw_min.Enable='off';
            app.EditField_cw_min.Enable='off';
            app.EditField_jxh_max.Enable='off';
            app.EditField_jxw_max.Enable='off';
            app.EditField_cw_max.Enable='off';
            app.EditField_jxh_step.Enable='off';
            app.EditField_jxw_step.Enable='off';
            app.EditField_cw_step.Enable='off';
            app.gap.Enable='off';
            app.EditField_cln_in.Enable='off';
            app.EditField_crn_in.Enable='off';
            app.EditField_finished.Value=0;
            app.EditField_minute.Value=0;
            app.EditField_second.Value=0;
        end
        function out=Model1(app)
            import com.comsol.model.*
            import com.comsol.model.util.*
            model = ModelUtil.create('Model');
            model.modelPath(app.file_path);
            model.label('Model.mph');
            data_path = [app.result_path,'\data\'];
            xian_path = [app.result_path,'\Line\'];
            tu_path = [app.result_path,'\picture\'];
            model.param.set('jxh', app.jxh, [native2unicode(hex2dec({'69' 'fd'}), 'unicode') native2unicode(hex2dec({'9a' 'd8'}), 'unicode') ]);
            model.param.set('jxw', app.jxw, [native2unicode(hex2dec({'69' 'fd'}), 'unicode') native2unicode(hex2dec({'5b' 'bd'}), 'unicode') ]);
            model.param.set('cw', app.cw, [native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'9f' '7f'}), 'unicode') native2unicode(hex2dec({'5b' 'bd'}), 'unicode') ]);
            model.param.set('jx', app.jx, [native2unicode(hex2dec({'95' 'f4'}), 'unicode') native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
            model.param.set('sc', '1.35[T]', [native2unicode(hex2dec({'52' '69'}), 'unicode') native2unicode(hex2dec({'78' 'c1'}), 'unicode') ]);
            model.param.set('cnz', app.cnz, [native2unicode(hex2dec({'60' '3b'}), 'unicode') native2unicode(hex2dec({'69' 'fd'}), 'unicode') native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
            model.param.set('cln', app.cln, [native2unicode(hex2dec({'5d' 'e6'}), 'unicode') native2unicode(hex2dec({'69' 'fd'}), 'unicode') native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
            model.param.set('crn', app.crn, [native2unicode(hex2dec({'53' 'f3'}), 'unicode') native2unicode(hex2dec({'69' 'fd'}), 'unicode') native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
            model.param.set('wc', 'cw+jxw', [native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'9f' '7f'}), 'unicode') native2unicode(hex2dec({'95' 'f4'}), 'unicode') native2unicode(hex2dec({'96' '94'}), 'unicode') ]);
            model.component.create('comp1', true);
            model.component('comp1').geom.create('geom1', 2);
            model.result.table.create('evl2', 'Table');
            model.component('comp1').geom('geom1').axisymmetric(true);
            model.component('comp1').mesh.create('mesh1');
            model.component('comp1').geom('geom1').lengthUnit('mm');
            model.component('comp1').geom('geom1').useConstrDim(true);
            model.component('comp1').geom('geom1').create('r5', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r5').label([native2unicode(hex2dec({'7a' '7a'}), 'unicode') native2unicode(hex2dec({'6c' '14'}), 'unicode') native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r5').set('pos', [0 -20]);
            model.component('comp1').geom('geom1').feature('r5').set('size', [30 140]);
            model.component('comp1').geom('geom1').create('r1', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r1').label([native2unicode(hex2dec({'8f' '74'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r1').set('pos', [0 -10]);
            model.component('comp1').geom('geom1').feature('r1').set('size', [10 106]);
            model.component('comp1').geom('geom1').create('r2', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r2').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode') native2unicode(hex2dec({'6b' 'cd'}), 'unicode') native2unicode(hex2dec({'9f' '7f'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r2').set('pos', {'10-jxh' '42-jxw'});
            model.component('comp1').geom('geom1').feature('r2').set('size', {'jxh' 'jxw'});
            model.component('comp1').geom('geom1').create('arr1', 'Array');
            model.component('comp1').geom('geom1').feature('arr1').set('type', 'linear');
            model.component('comp1').geom('geom1').feature('arr1').set('linearsize', 'cln');
            model.component('comp1').geom('geom1').feature('arr1').set('displ', {'0' '-wc'});
            model.component('comp1').geom('geom1').feature('arr1').selection('input').set({'r2'});
            model.component('comp1').geom('geom1').create('r12', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r12').active(false);
            model.component('comp1').geom('geom1').feature('r12').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode') native2unicode(hex2dec({'6b' 'cd'}), 'unicode') native2unicode(hex2dec({'9f' '7f'}), 'unicode') '+' native2unicode(hex2dec({'7a' '7a'}), 'unicode') native2unicode(hex2dec({'6c' '14'}), 'unicode') native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r12').set('pos', {'10' '41-(cln-1)*wc'});
            model.component('comp1').geom('geom1').feature('r12').set('size', {'jx' 'wc*cln-cw'});
            model.component('comp1').geom('geom1').create('r3', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r3').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode') native2unicode(hex2dec({'6b' 'cd'}), 'unicode') native2unicode(hex2dec({'9f' '7f'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r3').set('pos', {'10-jxh' '49'});
            model.component('comp1').geom('geom1').feature('r3').set('size', {'jxh' 'jxw'});
            model.component('comp1').geom('geom1').create('arr2', 'Array');
            model.component('comp1').geom('geom1').feature('arr2').set('type', 'linear');
            model.component('comp1').geom('geom1').feature('arr2').set('linearsize', 'crn');
            model.component('comp1').geom('geom1').feature('arr2').set('displ', {'0' 'wc'});
            model.component('comp1').geom('geom1').feature('arr2').selection('input').set({'r3'});
            model.component('comp1').geom('geom1').create('r13', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r13').active(false);
            model.component('comp1').geom('geom1').feature('r13').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode') native2unicode(hex2dec({'6b' 'cd'}), 'unicode') native2unicode(hex2dec({'9f' '7f'}), 'unicode') '+' native2unicode(hex2dec({'7a' '7a'}), 'unicode') native2unicode(hex2dec({'6c' '14'}), 'unicode') native2unicode(hex2dec({'96' '99'}), 'unicode') ' 1']);
            model.component('comp1').geom('geom1').feature('r13').set('pos', [10 49]);
            model.component('comp1').geom('geom1').feature('r13').set('size', {'jx' 'wc*crn-cw'});
            model.component('comp1').geom('geom1').create('dif1', 'Difference');
            model.component('comp1').geom('geom1').feature('dif1').label([native2unicode(hex2dec({'5d' 'ee'}), 'unicode') native2unicode(hex2dec({'96' 'c6'}), 'unicode') ' 1']);
            model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'r1'});
            model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'arr1' 'arr2'});
            model.component('comp1').geom('geom1').create('r4', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r4').label([native2unicode(hex2dec({'6c' '38'}), 'unicode') native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'4f' '53'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r4').set('pos', {'10+0.4+jx' '43'});
            model.component('comp1').geom('geom1').feature('r4').set('size', [6 5]);
            model.component('comp1').geom('geom1').create('r6', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r6').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode') native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'97' '74'}), 'unicode') native2unicode(hex2dec({'60' '3b'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r6').set('pos', {'10+jx' '43.5-(1.5+1+wc*cln)'});
            model.component('comp1').geom('geom1').feature('r6').set('size', {'8.4' '1.5+1+wc*cln'});
            model.component('comp1').geom('geom1').create('r7', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r7').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode') native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'97' '74'}), 'unicode') native2unicode(hex2dec({'53' 'bb'}), 'unicode') native2unicode(hex2dec({'96' '64'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r7').set('pos', {'10+jx' '14+28+1'});
            model.component('comp1').geom('geom1').feature('r7').set('size', [6.4 0.5]);
            model.component('comp1').geom('geom1').create('dif2', 'Difference');
            model.component('comp1').geom('geom1').feature('dif2').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode') native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'97' '74'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('dif2').selection('input').set({'r6'});
            model.component('comp1').geom('geom1').feature('dif2').selection('input2').set({'r7'});
            model.component('comp1').geom('geom1').create('r8', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r8').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode') native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'97' '74'}), 'unicode') native2unicode(hex2dec({'60' '3b'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r8').set('pos', {'10+jx' '47.5'});
            model.component('comp1').geom('geom1').feature('r8').set('size', {'8.4' '2.5+wc*crn'});
            model.component('comp1').geom('geom1').create('r9', 'Rectangle');
            model.component('comp1').geom('geom1').feature('r9').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode') native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'97' '74'}), 'unicode') native2unicode(hex2dec({'53' 'bb'}), 'unicode') native2unicode(hex2dec({'96' '64'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('r9').set('pos', {'10+jx' '47.5'});
            model.component('comp1').geom('geom1').feature('r9').set('size', [6.4 0.5]);
            model.component('comp1').geom('geom1').create('dif3', 'Difference');
            model.component('comp1').geom('geom1').feature('dif3').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode') native2unicode(hex2dec({'67' '81'}), 'unicode') native2unicode(hex2dec({'97' '74'}), 'unicode') ]);
            model.component('comp1').geom('geom1').feature('dif3').selection('input').set({'r8'});
            model.component('comp1').geom('geom1').feature('dif3').selection('input2').set({'r9'});
            model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
            model.component('comp1').geom('geom1').feature('ls1').set('specify1', 'coord');
            model.component('comp1').geom('geom1').feature('ls1').set('coord1', [10 42]);
            model.component('comp1').geom('geom1').feature('ls1').set('specify2', 'coord');
            model.component('comp1').geom('geom1').feature('ls1').set('coord2', [10.1 42]);
            model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
            model.component('comp1').geom('geom1').feature('ls2').set('specify1', 'coord');
            model.component('comp1').geom('geom1').feature('ls2').set('coord1', [10 49]);
            model.component('comp1').geom('geom1').feature('ls2').set('specify2', 'coord');
            model.component('comp1').geom('geom1').feature('ls2').set('coord2', [10.1 49]);
            model.component('comp1').geom('geom1').create('ls3', 'LineSegment');
            model.component('comp1').geom('geom1').feature('ls3').set('specify1', 'coord');
            model.component('comp1').geom('geom1').feature('ls3').set('coord1', {'10' '42-cln*wc+cw'});
            model.component('comp1').geom('geom1').feature('ls3').set('specify2', 'coord');
            model.component('comp1').geom('geom1').feature('ls3').set('coord2', {'10.1' '42-cln*wc+cw'});
            model.component('comp1').geom('geom1').create('ls4', 'LineSegment');
            model.component('comp1').geom('geom1').feature('ls4').set('specify1', 'coord');
            model.component('comp1').geom('geom1').feature('ls4').set('coord1', {'10' '49+wc*crn-cw'});
            model.component('comp1').geom('geom1').feature('ls4').set('specify2', 'coord');
            model.component('comp1').geom('geom1').feature('ls4').set('coord2', {'10.1' '49+wc*crn-cw'});
            model.component('comp1').geom('geom1').run;
            model.component('comp1').geom('geom1').run('fin');
            model.view.create('view2', 3);
            model.component('comp1').material.create('mat1', 'Common');
            model.component('comp1').material.create('mat2', 'Common');
            model.component('comp1').material.create('mat3', 'Common');
            model.component('comp1').material('mat1').info.create([native2unicode(hex2dec({'54' '08'}), 'unicode') native2unicode(hex2dec({'62' '10'}), 'unicode') native2unicode(hex2dec({'72' '69'}), 'unicode') ]);
            model.component('comp1').material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
            model.component('comp1').material('mat1').propertyGroup('def').func.create('C', 'Piecewise');
            model.component('comp1').material('mat1').propertyGroup('def').func.create('rho_gas_2', 'Piecewise');
            model.component('comp1').material('mat1').propertyGroup('def').func.create('TD', 'Piecewise');
            model.component('comp1').material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
            model.component('comp1').material('mat2').selection.set([8]);
            model.component('comp1').material('mat2').propertyGroup.create('RemanentFluxDensity', 'Remanent flux density');
            model.component('comp1').material('mat3').selection.set([2 6 7]);
            model.component('comp1').material('mat3').propertyGroup.create('BHCurve', 'B-H Curve');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func.create('BH', 'Interpolation');
            model.component('comp1').physics.create('mfnc', 'MagnetostaticsNoCurrents', 'geom1');
            model.component('comp1').physics('mfnc').create('mfc2', 'MagneticFluxConservation', 2);
            model.component('comp1').physics('mfnc').feature('mfc2').selection.set([8]);
            model.component('comp1').physics('mfnc').create('zsp1', 'ZeroMagneticScalarPotential', 1);
            model.component('comp1').physics('mfnc').feature('zsp1').selection.set([2]);
            model.component('comp1').physics('mfnc').create('mfc3', 'MagneticFluxConservation', 2);
            model.component('comp1').physics('mfnc').feature('mfc3').selection.set([2 6 7]);
            model.component('comp1').mesh('mesh1').create('fq1', 'FreeQuad');
            model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
            model.component('comp1').mesh('mesh1').feature('fq1').selection.geom('geom1', 2);
            model.component('comp1').mesh('mesh1').feature('fq1').selection.set([3 4]);
            model.component('comp1').mesh('mesh1').feature('fq1').create('size1', 'Size');
            model.component('comp1').mesh('mesh1').feature('ftri1').create('size1', 'Size');
            model.result.table('evl2').label('Evaluation 2D');
            model.result.table('evl2').comments([native2unicode(hex2dec({'4e' 'a4'}), 'unicode') native2unicode(hex2dec({'4e' '92'}), 'unicode') native2unicode(hex2dec({'76' '84'}), 'unicode') native2unicode(hex2dec({'4e' '8c'}), 'unicode') native2unicode(hex2dec({'7e' 'f4'}), 'unicode') native2unicode(hex2dec({'50' '3c'}), 'unicode') ]);
            model.component('comp1').view('view1').set('showlabels', true);
            model.component('comp1').view('view1').axis.set('xmin', -9.320108413696289);
            model.component('comp1').view('view1').axis.set('xmax', 42.06402587890625);
            model.component('comp1').view('view1').axis.set('ymin', -27.673625946044922);
            model.component('comp1').view('view1').axis.set('ymax', -5.008055210113525);
            model.component('comp1').material('mat1').label('Air [gas]');
            model.component('comp1').material('mat1').set('family', 'custom');
            model.component('comp1').material('mat1').set('diffuse', 'custom');
            model.component('comp1').material('mat1').set('customdiffuse', [0.9019607843137255 0.9019607843137255 1]);
            model.component('comp1').material('mat1').set('customambient', [0.9019607843137255 0.9019607843137255 1]);
            model.component('comp1').material('mat1').set('noise', true);
            model.component('comp1').material('mat1').set('noisescale', 0.08);
            model.component('comp1').material('mat1').set('noisefreq', 3);
            model.component('comp1').material('mat1').set('lighting', 'simple');
            model.component('comp1').material('mat1').set('info', {[native2unicode(hex2dec({'54' '08'}), 'unicode') native2unicode(hex2dec({'62' '10'}), 'unicode') native2unicode(hex2dec({'72' '69'}), 'unicode') ] '' '78.09 N2, 20.95 O2, 0.93 Ar, 0.039 CO2, trace others (vol %)'});
            model.component('comp1').material('mat1').propertyGroup('def').func('k').label('Piecewise');
            model.component('comp1').material('mat1').propertyGroup('def').func('k').set('arg', 'T');
            model.component('comp1').material('mat1').propertyGroup('def').func('k').set('pieces', {'70.0' '1000.0' '-8.404165E-4+1.107418E-4*T^1-8.635537E-8*T^2+6.31411E-11*T^3-1.88168E-14*T^4'});
            model.component('comp1').material('mat1').propertyGroup('def').func('C').label('Piecewise 1');
            model.component('comp1').material('mat1').propertyGroup('def').func('C').set('arg', 'T');
            model.component('comp1').material('mat1').propertyGroup('def').func('C').set('pieces', {'100.0' '375.0' '1010.96988+0.0439478992*T^1-2.92239848E-4*T^2+6.50346734E-7*T^3'; '375.0' '1300.0' '1093.29008-0.63555211*T^1+0.00163399216*T^2-1.41293513E-6*T^3+5.59492011E-10*T^4-8.66307242E-14*T^5'; '1300.0' '3000.0' '701.080663+0.849386727*T^1-5.8464873E-4*T^2+2.30243637E-7*T^3-4.84675815E-11*T^4+4.2350197E-15*T^5'});
            model.component('comp1').material('mat1').propertyGroup('def').func('rho_gas_2').label('Piecewise 2');
            model.component('comp1').material('mat1').propertyGroup('def').func('rho_gas_2').set('arg', 'T');
            model.component('comp1').material('mat1').propertyGroup('def').func('rho_gas_2').set('pieces', {'80.0' '3000.0' '352.716*T^-1'});
            model.component('comp1').material('mat1').propertyGroup('def').func('TD').label('Piecewise 3');
            model.component('comp1').material('mat1').propertyGroup('def').func('TD').set('arg', 'T');
            model.component('comp1').material('mat1').propertyGroup('def').func('TD').set('pieces', {'300.0' '753.0' '1.713214E-4-1.204913E-6*T^1+2.839046E-9*T^2-1.532799E-12*T^3'; '753.0' '873.0' '0.00416418-1.191227E-5*T^1+8.863636E-9*T^2'});
            model.component('comp1').material('mat1').propertyGroup('def').func('eta').label('Piecewise 4');
            model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
            model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('pieces', {'120.0' '600.0' '-1.132275E-7+7.94333E-8*T^1-7.197989E-11*T^2+5.158693E-14*T^3-1.592472E-17*T^4'; '600.0' '2150.0' '3.892629E-6+5.75387E-8*T^1-2.675811E-11*T^2+9.709691E-15*T^3-1.355541E-18*T^4'});
            model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'k(T[1/K])[W/(m*K)]' '0' '0' '0' 'k(T[1/K])[W/(m*K)]' '0' '0' '0' 'k(T[1/K])[W/(m*K)]'});
            model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', 'C(T[1/K])[J/(kg*K)]');
            model.component('comp1').material('mat1').propertyGroup('def').set('density', 'rho_gas_2(T[1/K])[kg/m^3]');
            model.component('comp1').material('mat1').propertyGroup('def').set('TD', 'TD(T[1/K])[m^2/s]');
            model.component('comp1').material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T[1/K])[Pa*s]');
            model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
            model.component('comp1').material('mat1').propertyGroup('def').addInput('temperature');
            model.component('comp1').material('mat2').label('N42 (Sintered NdFeB)');
            model.component('comp1').material('mat2').propertyGroup('def').label('Basic');
            model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'1/1.4[uohm*m]' '0' '0' '0' '1/1.4[uohm*m]' '0' '0' '0' '1/1.4[uohm*m]'});
            model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').label('Remanent flux density');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('murec', '');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('normBr', '');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('murec', '');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('normBr', '');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('murec', '');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('normBr', '');
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('murec', {'1.05' '0' '0' '0' '1.05' '0' '0' '0' '1.05'});
            model.component('comp1').material('mat2').propertyGroup('RemanentFluxDensity').set('normBr', 'sc');
            model.component('comp1').material('mat3').label('DT4');
            model.component('comp1').material('mat3').propertyGroup('def').label('Basic');
            model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'10.295[MS/m]' '0' '0' '0' '10.295[MS/m]' '0' '0' '0' '10.295[MS/m]'});
            model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'1[1]' '0' '0' '0' '1[1]' '0' '0' '0' '1[1]'});
            model.component('comp1').material('mat3').propertyGroup('def').set('relpermeability', {'mfnc.normB/(mu0_const*mfnc.normH)' '0' '0' '0' 'mfnc.normB/(mu0_const*mfnc.normH)' '0' '0' '0' 'mfnc.normB/(mu0_const*mfnc.normH)'});
            model.component('comp1').material('mat3').propertyGroup('BHCurve').label('B-H Curve');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').label('Interpolation 1');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('table', {'0' '0'; ...
                '1' '0.0013633'; ...
                '1.2589254' '0.0017163'; ...
                '1.5848932' '0.0021606'; ...
                '1.9952623' '0.0027201'; ...
                '2.5118864' '0.0034244'; ...
                '3.1622777' '0.004311'; ...
                '3.9810717' '0.0054273'; ...
                '5.0118723' '0.0068325'; ...
                '6.3095734' '0.0086017'; ...
                '7.9432823' '0.0108289'; ...
                '10' '0.0136327'; ...
                '12.5892541' '0.0171626'; ...
                '15.8489319' '0.0216064'; ...
                '19.9526231' '0.0272009'; ...
                '25.1188643' '0.0342439'; ...
                '31.6227766' '0.0431105'; ...
                '39.8107171' '0.0542729'; ...
                '50.1187234' '0.0683255'; ...
                '63.0957344' '0.0860167'; ...
                '79.4328235' '0.1165971'; ...
                '100' '0.1835359'; ...
                '125.8925412' '0.267807'; ...
                '158.4893192' '0.413659'; ...
                '199.5262315' '0.6259804'; ...
                '251.1886432' '0.8445332'; ...
                '316.227766' '1.0979217'; ...
                '398.1071706' '1.261948'; ...
                '501.1872336' '1.3423502'; ...
                '630.9573445' '1.3989407'; ...
                '794.3282347' '1.4525702'; ...
                '1000' '1.5022321'; ...
                '1258.9254118' '1.5467119'; ...
                '1584.8931925' '1.597946'; ...
                '1995.262315' '1.6397436'; ...
                '2511.8864315' '1.680046'; ...
                '3162.2776602' '1.7167375'; ...
                '3981.0717055' '1.7464437'; ...
                '5011.8723363' '1.7828889'; ...
                '6309.5734448' '1.8225136'; ...
                '7943.2823472' '1.8683077'; ...
                '8009' '1.87'; ...
                '9562.1509001' '1.9096235'; ...
                '11415.0723891' '1.9475845'; ...
                '13627.0467816' '1.982612'; ...
                '16267.6501434' '2.0135902'; ...
                '19419.9407568' '2.0398039'; ...
                '23183.071659' '2.0611168'; ...
                '27675.4094297' '2.0780434'; ...
                '33038.257327' '2.0916642'; ...
                '39440.29988' '2.103395'; ...
                '47082.9087389' '2.114689'; ...
                '56206.4766765' '2.1267979'; ...
                '67097.9789695' '2.1406811'; ...
                '80100' '2.157066'; ...
                '95621.5090013' '2.1765788'; ...
                '114150.7238913' '2.1998642'; ...
                '136270.4678162' '2.2276608'; ...
                '162676.5010443' '2.2608436'; ...
                '164120.8321529' '2.2626586'});
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('extrap', 'linear');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('argunit', 'A/m');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('fununit', 'T');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('defineinv', true);
            model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('defineprimfun', true);
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', '');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normB', 'BH(normHin)');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('normH', 'BH_inv(normBin)');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').set('Wpm', 'BH_prim(normHin)');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').descr('normHin', [native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'57' '3a'}), 'unicode') native2unicode(hex2dec({'6a' '21'}), 'unicode') ]);
            model.component('comp1').material('mat3').propertyGroup('BHCurve').descr('normBin', [native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'90' '1a'}), 'unicode') native2unicode(hex2dec({'5b' 'c6'}), 'unicode') native2unicode(hex2dec({'5e' 'a6'}), 'unicode') native2unicode(hex2dec({'6a' '21'}), 'unicode') ]);
            model.component('comp1').material('mat3').propertyGroup('BHCurve').addInput('magneticfield');
            model.component('comp1').material('mat3').propertyGroup('BHCurve').addInput('magneticfluxdensity');
            model.component('comp1').physics('mfnc').feature('mfc1').label([native2unicode(hex2dec({'7a' '7a'}), 'unicode') native2unicode(hex2dec({'6c' '14'}), 'unicode') native2unicode(hex2dec({'57' 'df'}), 'unicode') native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'90' '1a'}), 'unicode') native2unicode(hex2dec({'91' 'cf'}), 'unicode') native2unicode(hex2dec({'5b' '88'}), 'unicode') native2unicode(hex2dec({'60' '52'}), 'unicode') ]);
            model.component('comp1').physics('mfnc').feature('mfc2').set('ConstitutiveRelationBH', 'RemanentFluxDensity');
            model.component('comp1').physics('mfnc').feature('mfc2').set('e_crel_BH_RemanentFluxDensity', [0; 0; 1]);
            model.component('comp1').physics('mfnc').feature('mfc2').set('materialType', 'solid');
            model.component('comp1').physics('mfnc').feature('mfc2').label([native2unicode(hex2dec({'6c' '38'}), 'unicode') native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'4f' '53'}), 'unicode') native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'90' '1a'}), 'unicode') native2unicode(hex2dec({'91' 'cf'}), 'unicode') native2unicode(hex2dec({'5b' '88'}), 'unicode') native2unicode(hex2dec({'60' '52'}), 'unicode') ]);
            model.component('comp1').physics('mfnc').feature('mfc3').set('ConstitutiveRelationBH', 'BHCurve');
            model.component('comp1').physics('mfnc').feature('mfc3').set('materialType', 'from_mat');
            model.component('comp1').physics('mfnc').feature('mfc3').label(['DT4' native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'90' '1a'}), 'unicode') native2unicode(hex2dec({'91' 'cf'}), 'unicode') native2unicode(hex2dec({'5b' '88'}), 'unicode') native2unicode(hex2dec({'60' '52'}), 'unicode') ' 3']);
            model.component('comp1').mesh('mesh1').feature('fq1').feature('size1').set('hauto', 2);
            model.component('comp1').mesh('mesh1').feature('fq1').feature('size1').set('custom', 'on');
            model.component('comp1').mesh('mesh1').feature('fq1').feature('size1').set('hmax', 0.02);
            model.component('comp1').mesh('mesh1').feature('fq1').feature('size1').set('hmaxactive', true);
            model.component('comp1').mesh('mesh1').feature('ftri1').feature('size1').set('hauto', 3);
            model.component('comp1').mesh('mesh1').run;
            model.study.create('std1');
            model.study('std1').create('stat', 'Stationary');
            model.sol.create('sol1');
            model.sol('sol1').study('std1');
            model.sol('sol1').attach('std1');
            model.sol('sol1').create('st1', 'StudyStep');
            model.sol('sol1').create('v1', 'Variables');
            model.sol('sol1').create('s1', 'Stationary');
            model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
            model.sol('sol1').feature('s1').feature.remove('fcDef');
            model.result.dataset.create('rev1', 'Revolve2D');
            model.result.dataset.create('cln1', 'CutLine2D');
            model.result.dataset.create('cln2', 'CutLine2D');
            model.result.create('pg1', 'PlotGroup1D');
            model.result.create('pg2', 'PlotGroup2D');
            model.result('pg1').create('lngr1', 'LineGraph');
            model.result('pg1').create('lngr2', 'LineGraph');
            model.result('pg1').feature('lngr1').set('xdata', 'expr');
            model.result('pg1').feature('lngr1').set('expr', 'mfnc.normB');
            model.result('pg1').feature('lngr2').set('xdata', 'expr');
            model.result('pg1').feature('lngr2').set('expr', 'mfnc.normB');
            model.result('pg2').create('surf1', 'Surface');
            model.result('pg2').feature('surf1').set('data', 'dset1');
            model.result('pg2').feature('surf1').set('expr', 'mfnc.normB');
            model.result.export.create('plot1', 'Plot');
            model.result.export.create('plot2', 'Plot');
            model.result.export.create('img1', 'Image');
            model.result.export.create('img2', 'Image');
            model.sol('sol1').attach('std1');
            model.sol('sol1').feature('st1').label([native2unicode(hex2dec({'7f' '16'}), 'unicode') native2unicode(hex2dec({'8b' 'd1'}), 'unicode') native2unicode(hex2dec({'65' 'b9'}), 'unicode') native2unicode(hex2dec({'7a' '0b'}), 'unicode') ': ' native2unicode(hex2dec({'7a' '33'}), 'unicode') native2unicode(hex2dec({'60' '01'}), 'unicode') ]);
            model.sol('sol1').feature('v1').label([native2unicode(hex2dec({'56' 'e0'}), 'unicode') native2unicode(hex2dec({'53' 'd8'}), 'unicode') native2unicode(hex2dec({'91' 'cf'}), 'unicode') ' 1.1']);
            model.sol('sol1').feature('s1').label([native2unicode(hex2dec({'7a' '33'}), 'unicode') native2unicode(hex2dec({'60' '01'}), 'unicode') native2unicode(hex2dec({'6c' '42'}), 'unicode') native2unicode(hex2dec({'89' 'e3'}), 'unicode') native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1.1']);
            model.sol('sol1').feature('s1').feature('dDef').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode') native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' 1']);
            model.sol('sol1').feature('s1').feature('aDef').label([native2unicode(hex2dec({'9a' 'd8'}), 'unicode') native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ' 1']);
            model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
            model.sol('sol1').feature('s1').feature('fc1').label([native2unicode(hex2dec({'51' '68'}), 'unicode') native2unicode(hex2dec({'80' '26'}), 'unicode') native2unicode(hex2dec({'54' '08'}), 'unicode') ' 1.1']);
            model.sol("sol1").feature("s1").feature("fc1").set("maxiter", 100);
            model.sol('sol1').runAll;
            model.result.dataset('dset1').set('frametype', 'material');
            model.result.dataset('cln1').set('genpoints', {'10.06' '49[mm]+jxw/2+(crn-1)*wc'; '10.06' '49[mm]+jxw/2'});
            model.result.dataset('cln2').set('genpoints', {'10.06' '42[mm]-jxw/2'; '10.06' '42[mm]-jxw/2-(cln-1)*wc'});
            model.result('pg1').set('data', 'cln1');
            model.result('pg1').set('xlabel', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode') native2unicode(hex2dec({'68' '07'}), 'unicode') ' (mm)']);
            model.result('pg1').set('ylabel', [native2unicode(hex2dec({'78' 'c1'}), 'unicode') native2unicode(hex2dec({'90' '1a'}), 'unicode') native2unicode(hex2dec({'5b' 'c6'}), 'unicode') native2unicode(hex2dec({'5e' 'a6'}), 'unicode') native2unicode(hex2dec({'6a' '21'}), 'unicode') ' (T)']);
            model.result('pg1').set('xlabelactive', false);
            model.result('pg1').set('ylabelactive', false);
            model.result('pg1').feature('lngr1').set('data', 'cln1');
            model.result('pg1').feature('lngr1').set('xdataexpr', 'z');
            model.result('pg1').feature('lngr1').set('xdataunit', 'mm');
            model.result('pg1').feature('lngr1').set('xdatadescr', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode') native2unicode(hex2dec({'68' '07'}), 'unicode') ]);
            model.result('pg1').feature('lngr1').set('resolution', 'normal');
            model.result('pg1').feature('lngr2').set('data', 'cln2');
            model.result('pg1').feature('lngr2').set('xdataexpr', 'z');
            model.result('pg1').feature('lngr2').set('xdataunit', 'mm');
            model.result('pg1').feature('lngr2').set('xdatadescr', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode') native2unicode(hex2dec({'68' '07'}), 'unicode') ]);
            model.result('pg1').feature('lngr2').set('resolution', 'normal');
            model.result('pg2').feature('surf1').set('colortable', 'RainbowLight');
            model.result('pg2').feature('surf1').set('resolution', 'normal');
            model.result.export('plot1').set('filename', [data_path, 'Line-', app.name_path, 'normB_R.txt']);
            model.result.export('plot2').set('plot', 'lngr2');
            model.result.export('plot2').set('filename', [data_path, 'Line-', app.name_path, 'normB_L.txt']);
            model.result.export('img1').set('sourceobject', 'pg1');
            model.result.export('img1').set('pngfilename', [xian_path, 'Xian-', app.name_path, 'normB.png']);
            model.result.export('img1').set('alwaysask', true);
            model.result.export('img1').set('logo1d', false);
            model.result.export('img1').set('size', 'manualprint');
            model.result.export('img1').set('unit', 'px');
            model.result.export('img1').set('height', '425*4');
            model.result.export('img1').set('width', '681*4');
            model.result.export('img1').set('lockratio', 'off');
            model.result.export('img1').set('resolution', '400');
            model.result.export('img1').set('antialias', 'on');
            model.result.export('img1').set('zoomextents', 'on');
            model.result.export('img1').set('fontsize', '9');
            model.result.export('img1').set('colortheme', 'globaltheme');
            model.result.export('img1').set('customcolor', [1 1 1]);
            model.result.export('img1').set('background', 'color');
            model.result.export('img1').set('gltfincludelines', 'on');
            model.result.export('img1').set('title1d', 'on');
            model.result.export('img1').set('legend1d', 'on');
            model.result.export('img1').set('logo1d', 'off');
            model.result.export('img1').set('options1d', 'on');
            model.result.export('img1').set('title2d', 'on');
            model.result.export('img1').set('legend2d', 'on');
            model.result.export('img1').set('logo2d', 'off');
            model.result.export('img1').set('options2d', 'on');
            model.result.export('img1').set('title3d', 'on');
            model.result.export('img1').set('legend3d', 'on');
            model.result.export('img1').set('logo3d', 'on');
            model.result.export('img1').set('options3d', 'off');
            model.result.export('img1').set('axisorientation', 'on');
            model.result.export('img1').set('grid', 'on');
            model.result.export('img1').set('axes1d', 'on');
            model.result.export('img1').set('axes2d', 'on');
            model.result.export('img1').set('showgrid', 'on');
            model.result.export('img1').set('target', 'file');
            model.result.export('img1').set('qualitylevel', '100');
            model.result.export('img1').set('qualityactive', 'on');
            model.result.export('img1').set('imagetype', 'png');
            model.result.export('img1').set('lockview', 'off');
            model.result.export('img2').set('sourceobject', 'pg2');
            model.result.export('img2').set('unit', 'mm');
            model.result.export('img2').set('width', 173);
            model.result.export('img2').set('height', 108);
            model.result.export('img2').set('sizedesc', '2724 x 1701 px');
            model.result.export('img2').set('pngfilename', [tu_path,'tu-', app.name_path, 'normB.png']);
            model.result.export('img2').set('alwaysask', true);
            model.result.export('img2').set('size', 'manualprint');
            model.result.export('img2').set('unit', 'mm');
            model.result.export('img2').set('height', '108');
            model.result.export('img2').set('width', '173');
            model.result.export('img2').set('lockratio', 'off');
            model.result.export('img2').set('resolution', '400');
            model.result.export('img2').set('antialias', 'on');
            model.result.export('img2').set('zoomextents', 'on');
            model.result.export('img2').set('fontsize', '9');
            model.result.export('img2').set('colortheme', 'globaltheme');
            model.result.export('img2').set('customcolor', [1 1 1]);
            model.result.export('img2').set('background', 'color');
            model.result.export('img2').set('gltfincludelines', 'on');
            model.result.export('img2').set('title1d', 'on');
            model.result.export('img2').set('legend1d', 'on');
            model.result.export('img2').set('logo1d', 'on');
            model.result.export('img2').set('options1d', 'on');
            model.result.export('img2').set('title2d', 'on');
            model.result.export('img2').set('legend2d', 'on');
            model.result.export('img2').set('logo2d', 'off');
            model.result.export('img2').set('options2d', 'on');
            model.result.export('img2').set('title3d', 'on');
            model.result.export('img2').set('legend3d', 'on');
            model.result.export('img2').set('logo3d', 'on');
            model.result.export('img2').set('options3d', 'off');
            model.result.export('img2').set('axisorientation', 'on');
            model.result.export('img2').set('grid', 'on');
            model.result.export('img2').set('axes1d', 'on');
            model.result.export('img2').set('axes2d', 'on');
            model.result.export('img2').set('showgrid', 'on');
            model.result.export('img2').set('target', 'file');
            model.result.export('img2').set('qualitylevel', '100');
            model.result.export('img2').set('qualityactive', 'on');
            model.result.export('img2').set('imagetype', 'png');
            model.result.export('img2').set('lockview', 'off');
            model.result.export('plot1').run;
            model.result.export('plot2').run;
            model.result.export('img1').run;
            model.result.export('img2').run;
            out = model;
        end
        function [mistake]=analyseApp(app)
            file_name = [app.result_path,'\data\', 'Line-', app.name_path, 'normB_R.txt'];
            if ~exist( file_name ,'file')
                mistake=1;
                return
            end
            [h,m] = dataProcessApp(app,file_name);
            t=floor(m/(app.cln-1));
            m=t*(app.cln-1);
            app.B1=BCalculate(h,t,m);file_name = [app.result_path,'\data\', 'Line-', app.name_path, 'normB_L.txt'];
            [h,m] = dataProcessApp(app,file_name);
            t=floor(m/(app.crn-1));
            m=t*(app.crn-1);
            app.B2=BCalculate(h,t,m);
            mistake=0;
        end
        function [h,m] = dataProcessApp(~,file_name)
            fid = fopen(file_name, 'r');
            list_cell = {};
            pat = '%';
            while 1
                tline = fgetl(fid);
                if not(ischar(tline))
                    break
                elseif contains(tline,pat)
                    continue
                else
                    temp = strsplit(tline);
                    temp = str2double(temp);
                    list_cell = [list_cell;temp];
                end
            end
            list_cell = cell2mat(list_cell);
            h = list_cell;
            fclose(fid);
            h = h(:,2);
            [m,n]=size(h);
            m=m-1;
            h=h';
        end
        function deleteSheet(~,file,SheetName)
            Excel = actxserver('Excel.Application');
            set(Excel, 'Visible',0);
            set(Excel,'DisplayAlerts',0);
            Workbooks = Excel.Workbooks;
            [~, sheet_names] = xlsfinfo(file);
            if length( sheet_names ) == 1
                Workbook=Workbooks.Open(file);
                Excel.ActiveWorkBook.Sheets.Add([]);
                Workbook.Save;
                Workbooks.Close;
            end
            if length( sheet_names ) == 1;[~, sheet_names] = xlsfinfo(file);
            end
            Workbook=Workbooks.Open(file);
            Sheets = Excel.ActiveWorkBook.Sheets;
            Idx = ismember( sheet_names, SheetName );
            [ MaxValue , Id ] = max( Idx );
            if MaxValue == 1
                current_sheet = get(Sheets, 'Item', Id ); invoke(current_sheet, 'Delete')
            end
            Workbook.Save;
            Workbooks.Close;
            invoke(Excel, 'Quit');
            delete(Excel);
        end
        function [ Message ] = ifun_exportTableData2Excel (~,Path , FileName ,SheetName, TableData )
            try
                if exist( Path , 'dir' ) ~= 7
                    mkdir( Path );
                end
                AddressFile = fullfile( Path , FileName );
                if ~exist( AddressFile ,'file')
                    xlswrite(AddressFile,[' ']);
                end
                try
                    deleteSheet(app, AddressFile, SheetName);
                catch
                end
                writecell(TableData , AddressFile ,'Sheet', SheetName);
                Message = 1;
            catch
                Message = 0;
            end
        end
    end
    methods (Access = private)
        function startupFcn(app)
            app.file_path = 'D:\GitHub\paper1';
            app.clearValue = 0;
            app.pauseValue = 0;
            app.resultname;
            app.runValue = 0;
            app.B1=0;
            app.B2=0;
            userpath('clear');
            userpath(app.file_path);
            app.computer=1;
            app.jxh0 = app.EditField_jxh_min.Value;
            app.jxw0 = app.EditField_jxw_min.Value;
            app.cw0 = app.EditField_cw_min.Value;
            app.jxh1 = app.EditField_jxh_max.Value;
            app.jxw1 = app.EditField_jxw_max.Value;
            app.cw1 = app.EditField_cw_max.Value;
            app.s1 = app.EditField_jxh_step.Value;
            app.s2 = app.EditField_jxw_step.Value;
            app.s3 = app.EditField_cw_step.Value;
            app.jx = [ num2str(app.gap.Value),'[mm]'];
            app.sealSpacel = app.EditField_cln_in.Value;
            app.sealSpacer = app.EditField_crn_in.Value;
            app.SheetNum=0;
            app.warnvar=0;
            app.EditField_jxh_out.Editable='off';
            app.EditField_jxw_out.Editable='off';
            app.EditField_cw_out.Editable='off';
            app.EditField_cln_out.Editable='off';
            app.EditField_crn_out.Editable='off';
            app.delta_B.Editable='off';
            app.EditField_minute.Editable='off';
            app.EditField_second.Editable='off';
            app.EditField_finished.Editable='off';
            app.EditField_all.Editable='off';
            app.Table.ColumnEditable=[false,false,false,false,false,false,false,false,false];
            app.EditField_filePath.Editable='off';
            app.EditField_resultPath.Editable='off';
        end
        function Button_initializePushed(app, event)
            button=questdlg('确定初始化吗？','初始化','Yes','No','Yes');
            if strcmp(button,'Yes')
                init_run(app);
                init_stop(app);
                init_pause(app)
                app.Button_initialize.Enable='on';
                app.Button_file_path.Enable='on';
                app.Button_quit.Enable='on';
                app.Button_Export.Enable='on';
                app.Button_Clear.Enable='on';
                app.DropDown_resultFile.Enable='on';
                app.DropDown_resultFile.Value=num2str(0);
                app.EditField_resultPath.Value='当前未选择结果文件夹';
                app.clearValue = 0;
                app.pauseValue = 0;
                app.resultname='';
                app.runValue = 0;
                app.EditField_finished.Value = 0;
                app.EditField_all.Value = 0;
                app.SheetNum=0;
                app.data1=[];
                app.data2=[];
                app.data3=[];
                app.EditField_all.Value=0;
                app.EditField_finished.Value=0;
                app.EditField_minute.Value=0;
                app.EditField_second.Value=0;
                app.EditField_jxh_out.Value=0;
                app.EditField_jxw_out.Value=0;
                app.EditField_cw_out.Value=0;
                app.EditField_cln_out.Value=0;
                app.EditField_crn_out.Value=0;
                app.delta_B.Value=0;
                app.Table.Data=app.data1;
                h=msgbox('已初始化','初始化');
                start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
            end
        end
        function Button_file_pathPushed(app, event)
            while 1
                judge=uigetdir(app.file_path,'请选择程序文件夹');
                if judge == 0
                    break
                else
                    app.file_path=judge;
                    userpath(app.file_path);
                    app.EditField_filePath.Value = app.file_path;
                end
                break;
            end
        end
        function Button_runPushed(app, event)
            while 1
                if app.clearValue==3
                elseif app.clearValue==1 || app.clearValue==2
                    if strcmp(app.Switch_model.Value,'On')
                        button=questdlg('文件夹已存在，可能保存有文件，进行仿真前请选择处理方式','注意','清除','保留','取消计算',"取消计算");
                        if strcmp(button,'清除')
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
                mkdir(app.result_path, 'data');
                mkdir(app.result_path, 'picture');
                mkdir(app.result_path, 'line');
                count = 0;
                All = ((app.jxh1-app.jxh0)/app.s1+1)*((app.jxw1-app.jxw0)/app.s2+1)*((app.cw1-app.cw0)/app.s3+1);
                app.EditField_all.Value = All;
                button=questdlg('确定开始计算吗？','计算程序','Yes','No','Yes');
                if strcmp(button,'No')
                    h=msgbox('已取消计算','退出计算','help');
                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                    init_ran(app);
                    break
                end
                if app.SheetNum < 3
                    app.SheetNum=app.SheetNum+1;
                else
                    app.SheetNum=1;
                end
                if str2double(app.DropDown_Sheet.Value)==1
                    app.SheetNum=1;
                elseif str2double(app.DropDown_Sheet.Value)==2
                    app.SheetNum=2;
                elseif str2double(app.DropDown_Sheet.Value)==3
                    app.SheetNum=3;
                end
                switch app.SheetNum
                    case 1
                        Button_Sheet1ValueChanged(app, event);
                        if isempty(app.data1)==0
                            app.warnvar=1;
                        end
                    case 2
                        Button_Sheet2ValueChanged(app, event)
                        if isempty(app.data2)==0
                            app.warnvar=1;
                        end
                    case 3
                        Button_Sheet3ValueChanged(app, event)
                        if isempty(app.data3)==0
                            app.warnvar=1;
                        end
                end
                if app.warnvar==1
                    app.warnvar=0;
                    button=questdlg('数据储存位置已被占用，确定计算将会清空','计算程序','Yes','No','Yes');
                    if strcmp(button,'No')
                        h=msgbox('已取消计算','退出计算','help');
                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        init_ran(app);
                        break
                    end
                end
                pre_run(app);
                if app.SheetNum==1
                    app.data1=zeros(round(All),9);
                elseif app.SheetNum==2
                    app.data2=zeros(round(All),9);
                elseif app.SheetNum==3
                    app.data3=zeros(round(All),9);
                end
                app.Image_line.ImageSource='D:\GitHub\paper1\请等待图片.png';
                app.TabGroup.SelectedTab=app.Tab_2;
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
                            pause(1);
                            if app.pauseValue==1
                                f=msgbox('已暂停，点击确定或关闭窗口将继续','提醒','help');
                                uiwait(f);
                                app.pauseValue=0;
                            end
                            app.Button_pause.Icon = 'pause.jpg';
                            app.Button_pause.Text = 'pause';
                            app.Button_pause.FontColor = [0 0 0];
                            app.Button_pause.Enable='on';
                            if app.runValue==1
                                app.Button_stop.Text = 'stopping';
                                app.Button_stop.FontColor = [1 0 0];
                                app.Button_stop.Enable='off';
                                app.Button_pause.Enable='off';
                                button=questdlg('确定终止吗？','终止计算','Yes','No','Yes');
                                if strcmp(button,'Yes')
                                    app.jxwbreak=1;
                                    app.jxhbreak=1;
                                    h=msgbox('已终止计算','终止计算','help');
                                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                                    break
                                elseif strcmp(button,'No')
                                    app.runValue=0;
                                    app.Button_stop.Text = 'stop';
                                    app.Button_stop.FontColor = [0 0 0];
                                    app.Button_stop.Enable='on';
                                    app.Button_pause.Enable='on';
                                    pause(1)
                                end
                            end
                            wcn = cwn+jxwn;
                            if app.Button_cModel.Value==0
                                app.cln = floor(app.EditField_cln_in.Value/wcn);
                                app.crn = floor(app.EditField_crn_in.Value/wcn);
                            elseif app.Button_cModel.Value==1
                                app.cln = app.EditField_cln_in.Value+1;
                                app.crn = app.EditField_crn_in.Value+1;
                            end
                            app.cnz = app.cln + app.crn;
                            app.jxh = [ num2str(jxhn),'[mm]'];
                            app.jxw = [ num2str(jxwn),'[mm]'];
                            app.cw = [ num2str(cwn),'[mm]'];
                            app.wc = [ num2str(wcn),'[mm]'];
                            app.name_path=['jxh',num2str(app.jxh),'-','jxw',num2str(app.jxw),'-','cw',num2str(app.cw),'-','cln',num2str(app.cln-1),'-','crn',num2str(app.crn-1),'-'];
                            if strcmp(app.Switch_model.Value,'On')
                                Model1(app);
                            end
                            if strcmp(app.Switch_analyse.Value,'On')
                                mistake=analyseApp(app);
                                if mistake==1
                                    button=questdlg('结果文件不存在','错误','已添加','退出','退出');
                                    if strcmp(button,'退出')
                                        app.jxwbreak=1;
                                        app.jxhbreak=1;
                                        h=msgbox('结果文件不存在，已终止计算','终止计算','help');
                                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                                        break
                                    else
                                        mistake2=analyseApp(app);
                                        if mistake2==1
                                            app.jxwbreak=1;
                                            app.jxhbreak=1;
                                            h=msgbox('结果文件不存在，已终止计算','终止计算','help');
                                            start(timer('timerFcn',@(~,~)close(h),'StartDelay',1.5))
                                            break
                                        end
                                    end
                                end
                            end
                            app.EditField_jxh_out.Value = jxhn;
                            app.EditField_jxw_out.Value = jxwn;
                            app.EditField_cw_out.Value = cwn;
                            app.EditField_cln_out.Value = app.cln;
                            app.EditField_crn_out.Value = app.crn;
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
                            if app.Button_Sheet1.Value==1
                                app.Table.Data=app.data1;
                            elseif app.Button_Sheet2.Value==1
                                app.Table.Data=app.data2;
                            elseif app.Button_Sheet3.Value==1
                                app.Table.Data=app.data3;
                            end
                            app.EditField_finished.Value = count;
                            app.Gauge.Value = floor(count*100/All);
                            app.EditField_second.Value = floor(rem(toc,60));
                            app.EditField_minute.Value = floor(toc/60);
                        end
                    end
                end
                if app.jxhbreak==1
                    init_ran(app);
                    break
                end
                init_ran(app);
                msgbox('计算完成','完成');
                app.TabGroup.SelectedTab=app.Tab_3;
                break
            end
        end
        function Button_quitPushed(app, event)
            button=questdlg('确定退出吗？','退出程序','Yes','No','Yes');
            if strcmp(button,'Yes')
                delete(app.Comsol);
            end
        end
        function Button_pausePushed(app, event)
            app.pauseValue = 1;
            app.Button_pause.Icon = 'run.jpg';
            app.Button_pause.Text = 'go on';
            app.Button_pause.FontColor = [1 0 0];
            app.Button_pause.Enable='off';
        end
        
        function DropDown_resultFileValueChanged(app, event)
            app.clearValue = str2double(app.DropDown_resultFile.Value);
            while 1
                if app.clearValue==1
                    judge=uigetdir(app.file_path,'请选择结果文件夹');
                    if judge == 0
                        h=msgbox('请选择结果文件夹','操作错误','error');
                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        app.DropDown_resultFile.Value='0';
                        break
                    else
                        app.result_path=judge;
                    end
                elseif app.clearValue==2
                    app.result_path =fullfile( app.file_path, 'result_default' );
                elseif app.clearValue==3
                    app.resultname=char(inputdlg('请输入新文件名'));
                    if isempty(app.resultname) == 1
                        h=msgbox('请选择结果文件夹','操作错误','error');
                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        app.DropDown_resultFile.Value='0';
                        break
                    else
                        app.result_path = fullfile(app.file_path, app.resultname);
                    end
                elseif app.clearValue==0
                    app.EditField_resultPath.Value='当前未选择结果文件夹';
                    break
                end
                app.EditField_resultPath.Value=app.result_path;
                break
            end
        end
        function Button_stopPushed(app, event)
            app.runValue=1;
        end
        function Button_Sheet1ValueChanged(app, event)
            app.Button_Sheet1.Value=1;
            app.Button_Sheet2.Value=0;
            app.Button_Sheet3.Value=0;
            app.Table.Data=app.data1;
        end
        function Button_Sheet2ValueChanged(app, event)
            app.Button_Sheet1.Value=0;
            app.Button_Sheet2.Value=1;
            app.Button_Sheet3.Value=0;
            app.Table.Data=app.data2;
        end
        function Button_Sheet3ValueChanged(app, event)
            app.Button_Sheet1.Value=0;
            app.Button_Sheet2.Value=0;
            app.Button_Sheet3.Value=1;
            app.Table.Data=app.data3;
        end
        function Button_ExportPushed(app, event)
            while 1
                FileName=['jxh',num2str(app.jxh0),'-',num2str(app.jxh1),'-','jxw',num2str(app.jxw0),'-',num2str(app.jxw1),'-','cw',num2str(app.cw0),'-',num2str(app.cw1),'normB'];
                SheetName='wow';
                value=app.Table.ColumnName;
                [m,n]=size(value);
                for t1=1:1:m
                    for t2=1:1:n
                        colName(t2,t1)=value(t1,t2);
                    end
                end
                numDate=num2cell(app.Table.Data);
                TableData=[colName;numDate];
                button=questdlg('文件名如何命名','文件名','默认','自定义','取消','默认');
                if strcmp(button,'自定义')
                    FileName=char(inputdlg('请输入自定义文件名'));
                    if isempty(FileName) == 1
                        h=msgbox('取消自定义','操作错误','error');
                        start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                        break
                    end
                    FileName=[FileName,'.xlsx'];
                    k=msgbox('正在导出xlsx文件……','正在导出');
                    start(timer('timerFcn',@(~,~)ifun_exportTableData2Excel (app,app.result_path, FileName,SheetName, TableData),"StopFcn",@(~,~)close(k)))
                    h=msgbox('已导出xlsx文件至结果文件夹','导出成功');
                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',5))
                    winopen(app.result_path);
                elseif strcmp(button,'默认')
                    FileName=[FileName,'.xlsx'];
                    k=msgbox('正在导出xlsx文件……','正在导出');
                    start(timer('timerFcn',@(~,~)ifun_exportTableData2Excel (app,app.result_path, FileName,SheetName, TableData),"StopFcn",@(~,~)close(k)))
                    h=msgbox('已导出xlsx文件至结果文件夹','导出成功');
                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',5))
                    winopen(app.result_path);
                elseif strcmp(button,'取消')
                    h=msgbox('取消导出','导出失败','help');
                    start(timer('timerFcn',@(~,~)close(h),'StartDelay',1))
                end
            end
        end
        function EditField_jxh_minValueChanged(app, event)
            app.jxh0 = app.EditField_jxh_min.Value;
        end
        function EditField_jxh_stepValueChanged(app, event)
            app.s1 = app.EditField_jxh_step.Value;
        end
        function EditField_jxh_maxValueChanged(app, event)
            app.jxh1 = app.EditField_jxh_max.Value;
        end
        function EditField_jxw_minValueChanged(app, event)
            app.jxw0 = app.EditField_jxw_min.Value;
        end
        function EditField_jxw_stepValueChanged(app, event)
            app.s2 = app.EditField_jxw_step.Value;
        end
        function EditField_jxw_maxValueChanged(app, event)
            app.jxw1 = app.EditField_jxw_max.Value;
        end
        function EditField_cw_minValueChanged(app, event)
            app.cw0 = app.EditField_cw_min.Value;
        end
        function EditField_cw_stepValueChanged(app, event)
            app.s3 = app.EditField_cw_step.Value;
        end
        function EditField_cw_maxValueChanged(app, event)
            app.cw1 = app.EditField_cw_max.Value;
        end
        function gapValueChanged(app, event)
            app.jx = app.gap.Value;
        end
        function EditField_cln_inValueChanged(app, event)
            app.clnin = app.EditField_cln_in.Value;
        end
        function EditField_crn_inValueChanged(app, event)
            app.crnin = app.EditField_crn_in.Value;
        end
        function Switch_modelValueChanged(app, event)
            if strcmp(app.Switch_model.Value,'On')
                app.Lamp_model.Color='0.00,1.00,0.00';
            elseif strcmp(app.Switch_model.Value,'Off')
                app.Lamp_model.Color='0.90,0.90,0.90';
            end
        end
        function Switch_analyseValueChanged(app, event)
            if strcmp(app.Switch_analyse.Value,'On')
                app.Lamp_analyse.Color='0.00,1.00,0.00';
            elseif strcmp(app.Switch_analyse.Value,'Off')
                app.Lamp_analyse.Color='0.90,0.90,0.90';
            end
        end
        function Button_ClearPushed(app, event)
            button=questdlg('确认清除吗？','清除','确认','取消','确认');
            if strcmp(button,'确认')
                app.Table.Data=[];
                if app.Button_Sheet1.Value==1
                    app.data1=[];
                elseif app.Button_Sheet2.Value==1
                    app.data2=[];
                elseif app.Button_Sheet3.Value==1
                    app.data3=[];
                end
            elseif strcmp(button,'取消')
                h=msgbox('已取消清除','提醒');
                start(timer('timerFcn',@(~,~)close(h),'StartDelay',0.5))
            end
        end
        function Button_cModelValueChanged(app, event)
            value = app.Button_cModel.Value;
            if value==0
                app.Button_cModel.Text='密封空间';
                app.Label_cln_in.Text='左密封空间';
                app.Label_crn_in.Text='右密封空间';
                app.EditField_cln_in.Value=21;
                app.EditField_crn_in.Value=21;
            elseif value==1
                app.Button_cModel.Text='齿数';
                app.Label_cln_in.Text='左齿数';
                app.Label_crn_in.Text='右齿数';
                app.EditField_cln_in.Value=20;
                app.EditField_crn_in.Value=20;
            end
        end
        function Button_openFilePushed(app, event)
            winopen(app.file_path);
        end
        function Button_openResultFilePushed(app, event)
            if exist( app.result_path, 'dir' ) ~= 7
                h=msgbox('该结果文件夹尚未建立，run后即可自动创建，或可手动创建','错误','error');
                start(timer('timerFcn',@(~,~)close(h),'StartDelay',2))
            else
                winopen(app.result_path);
            end
        end
    end
    methods (Access = private)
        function createComponents(app)
            app.Comsol = uifigure('Visible', 'off');
            app.Comsol.Position = [200 100 900 550];
            app.Comsol.Name = 'PECCAS-MFS';
            app.Label_lab = uilabel(app.Comsol);
            app.Label_lab.HorizontalAlignment = 'center';
            app.Label_lab.FontName = '楷体';
            app.Label_lab.FontSize = 14;
            app.Label_lab.FontColor = [0.2196 0.1294 0.451];
            app.Label_lab.Position = [121 527 109 20];
            app.Label_lab.Text = '磁性液体研究所';
            app.Image_logo = uiimage(app.Comsol);
            app.Image_logo.Position = [1 501 190 50];
            app.Image_logo.ImageSource = '北京交通大学logo.png';
            app.Button_quit = uibutton(app.Comsol, 'push');
            app.Button_quit.ButtonPushedFcn = createCallbackFcn(app, @Button_quitPushed, true);
            app.Button_quit.Icon = 'open.png';
            app.Button_quit.FontSize = 18;
            app.Button_quit.Position = [760 10 100 30];
            app.Button_quit.Text = 'quit';
            app.TabGroup = uitabgroup(app.Comsol);
            app.TabGroup.Position = [0 48 900 455];
            app.Tab_1 = uitab(app.TabGroup);
            app.Tab_1.Title = '输入';
            app.Button_file_path = uibutton(app.Tab_1, 'push');
            app.Button_file_path.ButtonPushedFcn = createCallbackFcn(app, @Button_file_pathPushed, true);
            app.Button_file_path.Icon = 'file.jpg';
            app.Button_file_path.FontSize = 16;
            app.Button_file_path.FontWeight = 'bold';
            app.Button_file_path.Tooltip = {'默认程序所在文件夹为D:\GitHub\paper1'; '如有改变，请在此选择程序所在根目录'};
            app.Button_file_path.Position = [40 380 160 40];
            app.Button_file_path.Text = '选择程序文件夹';
            app.DropDown_resultFile = uidropdown(app.Tab_1);
            app.DropDown_resultFile.Items = {'请选择结果文件夹', '默认文件夹', '选择文件夹', '新建文件夹'};
            app.DropDown_resultFile.ItemsData = {'0', '2', '1', '3'};
            app.DropDown_resultFile.ValueChangedFcn=createCallbackFcn(app,@DropDown_resultFileValueChanged, true);
            app.DropDown_resultFile.Tooltip = {'请选择结果文件夹，若不选择将无法进行计算。'; '选择默认文件夹将会清空默认文件夹后存放数据。你也可以选择已有文件夹，或新建文件夹。'};
            app.DropDown_resultFile.FontSize = 16;
            app.DropDown_resultFile.FontWeight = 'bold';
            app.DropDown_resultFile.Position = [40 325 160 40];
            app.DropDown_resultFile.Value = '0';
            app.EditField_resultPath = uieditfield(app.Tab_1, 'text');
            app.EditField_resultPath.FontSize = 16;
            app.EditField_resultPath.Position = [240 325 620 40];
            app.EditField_resultPath.Value = '当前未选择结果文件夹';
            app.Button_initialize = uibutton(app.Tab_1, 'push');
            app.Button_initialize.ButtonPushedFcn = createCallbackFcn(app, @Button_initializePushed, true);
            app.Button_initialize.Icon = '初始化2.png';
            app.Button_initialize.FontSize = 18;
            app.Button_initialize.FontWeight = 'bold';
            app.Button_initialize.Tooltip = {'默认程序所在文件夹为D:\GitHub\paper1'; '如有改变，请在此选择程序所在根目录'};
            app.Button_initialize.Position = [40 20 160 40];
            app.Button_initialize.Text = '初始化';
            app.EditField_filePath = uieditfield(app.Tab_1, 'text');
            app.EditField_filePath.FontSize = 16;
            app.EditField_filePath.Position = [240 380 620 40];
            app.EditField_filePath.Value = '默认D:\GitHub\paper1';
            app.Label_switchModel = uilabel(app.Tab_1);
            app.Label_switchModel.HorizontalAlignment = 'center';
            app.Label_switchModel.Position = [93 172 53 22];
            app.Label_switchModel.Text = '仿真开关';
            app.Switch_model = uiswitch(app.Tab_1, 'slider');
            app.Switch_model.ValueChangedFcn = createCallbackFcn(app, @Switch_modelValueChanged, true);
            app.Switch_model.Position = [62 211 45 20];
            app.Label_switchAnalyse = uilabel(app.Tab_1);
            app.Label_switchAnalyse.HorizontalAlignment = 'center';
            app.Label_switchAnalyse.Position = [81 91 77 22];
            app.Label_switchAnalyse.Text = '数据分析开关';
            app.Switch_analyse = uiswitch(app.Tab_1, 'slider');
            app.Switch_analyse.ValueChangedFcn = createCallbackFcn(app, @Switch_analyseValueChanged, true);
            app.Switch_analyse.Position = [62 129 45 20];
            app.Lamp_model = uilamp(app.Tab_1);
            app.Lamp_model.Position = [180 211 20 20];
            app.Lamp_model.Color = [0.902 0.902 0.902];
            app.Lamp_analyse = uilamp(app.Tab_1);
            app.Lamp_analyse.Position = [180 129 20 20];
            app.Lamp_analyse.Color = [0.902 0.902 0.902];
            app.DropDown_Sheet = uidropdown(app.Tab_1);
            app.DropDown_Sheet.Items = {'可选择结果表格', 'Sheet1', 'Sheet2', 'Sheet3'};
            app.DropDown_Sheet.ItemsData = {'0', '1', '2', '3'};
            app.DropDown_Sheet.Tooltip = {'请选择结果文件夹，若不选择将无法进行计算。'; '选择默认文件夹将会清空默认文件夹后存放数据。你也可以选择已有文件夹，或新建文件夹。'};
            app.DropDown_Sheet.FontSize = 16;
            app.DropDown_Sheet.FontWeight = 'bold';
            app.DropDown_Sheet.Position = [40 270 160 40];
            app.DropDown_Sheet.Value = '0';
            app.TabGroup2 = uitabgroup(app.Tab_1);
            app.TabGroup2.Position = [240 13 620 297];
            app.Tab_4 = uitab(app.TabGroup2);
            app.Tab_4.Title = '优化模式1';
            app.EditField_cw_max = uieditfield(app.Tab_4, 'numeric');
            app.EditField_cw_max.ValueChangedFcn = createCallbackFcn(app, @EditField_cw_maxValueChanged, true);
            app.EditField_cw_max.FontSize = 18;
            app.EditField_cw_max.Position = [268 72 70 30];
            app.EditField_cw_max.Value = 0.12;
            app.EditField_cw_step = uieditfield(app.Tab_4, 'numeric');
            app.EditField_cw_step.ValueChangedFcn = createCallbackFcn(app, @EditField_cw_stepValueChanged, true);
            app.EditField_cw_step.FontSize = 18;
            app.EditField_cw_step.Position = [178 72 70 30];
            app.EditField_cw_step.Value = 0.02;
            app.EditField_cw_min = uieditfield(app.Tab_4, 'numeric');
            app.EditField_cw_min.ValueChangedFcn = createCallbackFcn(app, @EditField_cw_minValueChanged, true);
            app.EditField_cw_min.FontSize = 18;
            app.EditField_cw_min.Position = [88 72 70 30];
            app.EditField_cw_min.Value = 0.12;
            app.Label_cw_in = uilabel(app.Tab_4);
            app.Label_cw_in.HorizontalAlignment = 'center';
            app.Label_cw_in.FontSize = 18;
            app.Label_cw_in.Position = [25 72 50 27];
            app.Label_cw_in.Text = '齿宽';
            app.EditField_jxw_max = uieditfield(app.Tab_4, 'numeric');
            app.EditField_jxw_max.ValueChangedFcn = createCallbackFcn(app, @EditField_jxw_maxValueChanged, true);
            app.EditField_jxw_max.FontSize = 18;
            app.EditField_jxw_max.Position = [268 132 70 30];
            app.EditField_jxw_max.Value = 0.5;
            app.EditField_jxw_step = uieditfield(app.Tab_4, 'numeric');
            app.EditField_jxw_step.ValueChangedFcn = createCallbackFcn(app, @EditField_jxw_stepValueChanged, true);
            app.EditField_jxw_step.FontSize = 18;
            app.EditField_jxw_step.Position = [178 132 70 30];
            app.EditField_jxw_step.Value = 0.1;
            app.EditField_jxw_min = uieditfield(app.Tab_4, 'numeric');
            app.EditField_jxw_min.ValueChangedFcn = createCallbackFcn(app, @EditField_jxw_minValueChanged, true);
            app.EditField_jxw_min.FontSize = 18;
            app.EditField_jxw_min.Position = [88 132 70 30];
            app.EditField_jxw_min.Value = 0.4;
            app.Label_jxw_in = uilabel(app.Tab_4);
            app.Label_jxw_in.HorizontalAlignment = 'center';
            app.Label_jxw_in.FontSize = 18;
            app.Label_jxw_in.Position = [25 132 50 27];
            app.Label_jxw_in.Text = '槽宽';
            app.EditField_jxh_max = uieditfield(app.Tab_4, 'numeric');
            app.EditField_jxh_max.ValueChangedFcn = createCallbackFcn(app, @EditField_jxh_maxValueChanged, true);
            app.EditField_jxh_max.FontSize = 18;
            app.EditField_jxh_max.Position = [268 192 70 30];
            app.EditField_jxh_max.Value = 0.4;
            app.EditField_jxh_step = uieditfield(app.Tab_4, 'numeric');
            app.EditField_jxh_step.ValueChangedFcn = createCallbackFcn(app, @EditField_jxh_stepValueChanged, true);
            app.EditField_jxh_step.FontSize = 18;
            app.EditField_jxh_step.Position = [178 192 70 30];
            app.EditField_jxh_step.Value = 0.1;
            app.EditField_jxh_min = uieditfield(app.Tab_4, 'numeric');
            app.EditField_jxh_min.ValueChangedFcn = createCallbackFcn(app, @EditField_jxh_minValueChanged, true);
            app.EditField_jxh_min.FontSize = 18;
            app.EditField_jxh_min.Position = [88 192 70 30];
            app.EditField_jxh_min.Value = 0.3;
            app.Label_jxh_in = uilabel(app.Tab_4);
            app.Label_jxh_in.HorizontalAlignment = 'center';
            app.Label_jxh_in.FontSize = 18;
            app.Label_jxh_in.Position = [25 192 50 27];
            app.Label_jxh_in.Text = '槽高';
            app.Label_max = uilabel(app.Tab_4);
            app.Label_max.HorizontalAlignment = 'center';
            app.Label_max.FontSize = 18;
            app.Label_max.Position = [268 232 70 33];
            app.Label_max.Text = '最大值';
            app.Label_step = uilabel(app.Tab_4);
            app.Label_step.HorizontalAlignment = 'center';
            app.Label_step.FontSize = 18;
            app.Label_step.Position = [178 232 70 33];
            app.Label_step.Text = '步进';
            app.Label_min = uilabel(app.Tab_4);
            app.Label_min.HorizontalAlignment = 'center';
            app.Label_min.FontSize = 18;
            app.Label_min.Position = [85 232 70 33];
            app.Label_min.Text = '最小值';
            app.Label_import = uilabel(app.Tab_4);
            app.Label_import.HorizontalAlignment = 'center';
            app.Label_import.FontSize = 18;
            app.Label_import.FontWeight = 'bold';
            app.Label_import.FontColor = [0 0.4471 0.7412];
            app.Label_import.Position = [25 232 50 33];
            app.Label_import.Text = '输入';
            app.Label_gap = uilabel(app.Tab_4);
            app.Label_gap.HorizontalAlignment = 'center';
            app.Label_gap.FontSize = 18;
            app.Label_gap.Position = [25 12 50 27];
            app.Label_gap.Text = '间隙';
            app.gap = uieditfield(app.Tab_4, 'numeric');
            app.gap.ValueChangedFcn = createCallbackFcn(app, @gapValueChanged, true);
            app.gap.FontSize = 18;
            app.gap.Position = [88 12 70 30];
            app.gap.Value = 0.1;
            app.EditField_cln_in = uieditfield(app.Tab_4, 'numeric');
            app.EditField_cln_in.ValueChangedFcn = createCallbackFcn(app, @EditField_cln_inValueChanged, true);
            app.EditField_cln_in.FontSize = 18;
            app.EditField_cln_in.Position = [511 130 70 30];
            app.EditField_cln_in.Value = 21;
            app.EditField_crn_in = uieditfield(app.Tab_4, 'numeric');
            app.EditField_crn_in.ValueChangedFcn = createCallbackFcn(app, @EditField_crn_inValueChanged, true);
            app.EditField_crn_in.FontSize = 18;
            app.EditField_crn_in.Position = [511 70 70 30];
            app.EditField_crn_in.Value = 21;
            app.Label_cln_in = uilabel(app.Tab_4);
            app.Label_cln_in.HorizontalAlignment = 'right';
            app.Label_cln_in.FontSize = 18;
            app.Label_cln_in.Position = [406 130 95 30];
            app.Label_cln_in.Text = '左密封空间';
            app.Label_crn_in = uilabel(app.Tab_4);
            app.Label_crn_in.HorizontalAlignment = 'right';
            app.Label_crn_in.FontSize = 18;
            app.Label_crn_in.Position = [406 70 95 30];
            app.Label_crn_in.Text = '右密封空间';
            app.Label = uilabel(app.Tab_4);
            app.Label.FontSize = 18;
            app.Label.Position = [388 191 113 33];
            app.Label.Text = '当前齿数模式';
            app.Button_cModel = uibutton(app.Tab_4, 'state');
            app.Button_cModel.ValueChangedFcn = createCallbackFcn(app, @Button_cModelValueChanged, true);
            app.Button_cModel.Text = '密封空间';
            app.Button_cModel.FontSize = 14;
            app.Button_cModel.Position = [511 193 71 30];
            app.Label_2 = uilabel(app.Tab_4);
            app.Label_2.Position = [500 5 113 22];
            app.Label_2.Text = '长度单位默认为毫米';
            app.Tab_5 = uitab(app.TabGroup2);
            app.Tab_5.Title = '待更新';
            app.Tab_2 = uitab(app.TabGroup);
            app.Tab_2.Title = '计算';
            app.Image_line = uiimage(app.Tab_2);
            app.Image_line.Position = [40 145 420 264];
            app.Image_line.ImageSource = '请等待图片.png';
            app.Label_image = uilabel(app.Tab_2);
            app.Label_image.HorizontalAlignment = 'center';
            app.Label_image.FontSize = 18;
            app.Label_image.FontWeight = 'bold';
            app.Label_image.Position = [120 108 260 30];
            app.Label_image.Text = '磁场密度模曲线图';
            app.Label_back = uilabel(app.Tab_2);
            app.Label_back.FontSize = 18;
            app.Label_back.FontWeight = 'bold';
            app.Label_back.FontColor = [0 0.4471 0.7412];
            app.Label_back.Position = [513 363 185 33];
            app.Label_back.Text = '当前所完成计算的参数';
            app.Label_delta_B = uilabel(app.Tab_2);
            app.Label_delta_B.HorizontalAlignment = 'center';
            app.Label_delta_B.FontSize = 18;
            app.Label_delta_B.Position = [513 241 113 33];
            app.Label_delta_B.Text = '总磁通密度模';
            app.delta_B = uieditfield(app.Tab_2, 'numeric');
            app.delta_B.FontSize = 18;
            app.delta_B.Position = [633 241 66 33];
            app.Label_jxh_out = uilabel(app.Tab_2);
            app.Label_jxh_out.HorizontalAlignment = 'center';
            app.Label_jxh_out.FontSize = 18;
            app.Label_jxh_out.Position = [514 323 59 33];
            app.Label_jxh_out.Text = '槽高';
            app.EditField_jxh_out = uieditfield(app.Tab_2, 'numeric');
            app.EditField_jxh_out.FontSize = 18;
            app.EditField_jxh_out.Position = [513 284 60 33];
            app.Label_jxw_out = uilabel(app.Tab_2);
            app.Label_jxw_out.HorizontalAlignment = 'center';
            app.Label_jxw_out.FontSize = 18;
            app.Label_jxw_out.Position = [584 324 59 33];
            app.Label_jxw_out.Text = '槽宽';
            app.EditField_jxw_out = uieditfield(app.Tab_2, 'numeric');
            app.EditField_jxw_out.FontSize = 18;
            app.EditField_jxw_out.Position = [583 285 60 33];
            app.Label_cw_out = uilabel(app.Tab_2);
            app.Label_cw_out.HorizontalAlignment = 'center';
            app.Label_cw_out.FontSize = 18;
            app.Label_cw_out.Position = [654 324 59 33];
            app.Label_cw_out.Text = '齿宽';
            app.EditField_cw_out = uieditfield(app.Tab_2, 'numeric');
            app.EditField_cw_out.FontSize = 18;
            app.EditField_cw_out.Position = [653 285 60 33];
            app.Label_cln_out = uilabel(app.Tab_2);
            app.Label_cln_out.HorizontalAlignment = 'center';
            app.Label_cln_out.FontSize = 18;
            app.Label_cln_out.Position = [724 323 59 33];
            app.Label_cln_out.Text = '左齿数';
            app.EditField_cln_out = uieditfield(app.Tab_2, 'numeric');
            app.EditField_cln_out.FontSize = 18;
            app.EditField_cln_out.Position = [723 284 60 33];
            app.Label_crn_out = uilabel(app.Tab_2);
            app.Label_crn_out.HorizontalAlignment = 'center';
            app.Label_crn_out.FontSize = 18;
            app.Label_crn_out.Position = [794 323 59 33];
            app.Label_crn_out.Text = '右齿数';
            app.EditField_crn_out = uieditfield(app.Tab_2, 'numeric');
            app.EditField_crn_out.FontSize = 18;
            app.EditField_crn_out.Position = [793 284 60 33];
            app.Gauge = uigauge(app.Tab_2, 'linear');
            app.Gauge.FontSize = 14;
            app.Gauge.Position = [572 40 281 40];
            app.Label_import_2 = uilabel(app.Tab_2);
            app.Label_import_2.HorizontalAlignment = 'center';
            app.Label_import_2.FontSize = 18;
            app.Label_import_2.FontWeight = 'bold';
            app.Label_import_2.FontColor = [0 0.4471 0.7412];
            app.Label_import_2.Position = [513 41 50 33];
            app.Label_import_2.Text = '进度';
            app.Button_openFile = uibutton(app.Tab_2, 'push');
            app.Button_openFile.ButtonPushedFcn = createCallbackFcn(app, @Button_openFilePushed, true);
            app.Button_openFile.Icon = 'file.jpg';
            app.Button_openFile.FontSize = 16;
            app.Button_openFile.FontWeight = 'bold';
            app.Button_openFile.Tooltip = {'默认程序所在文件夹为D:\GitHub\paper1'; '如有改变，请在此选择程序所在根目录'};
            app.Button_openFile.Position = [513 176 165 40];
            app.Button_openFile.Text = '打开程序文件夹';
            app.Button_openResultFile = uibutton(app.Tab_2, 'push');
            app.Button_openResultFile.ButtonPushedFcn = createCallbackFcn(app, @Button_openResultFilePushed, true);
            app.Button_openResultFile.Icon = 'file.jpg';
            app.Button_openResultFile.FontSize = 16;
            app.Button_openResultFile.FontWeight = 'bold';
            app.Button_openResultFile.Tooltip = {'默认程序所在文件夹为D:\GitHub\paper1'; '如有改变，请在此选择程序所在根目录'};
            app.Button_openResultFile.Position = [688 176 165 40];
            app.Button_openResultFile.Text = '打开结果文件夹';
            app.Tab_3 = uitab(app.TabGroup);
            app.Tab_3.Title = '输出';
            app.Table = uitable(app.Tab_3);
            app.Table.ColumnName = {'序号'; '槽高[mm]'; '槽宽[mm]'; '极齿宽[mm]'; '左极齿ΔB[T]'; '左极齿数'; '右极齿ΔB[T]'; '右极齿数'; '总ΔB[T]'};
            app.Table.RowName = {};
            app.Table.ColumnSortable = true;
            app.Table.ColumnEditable = true;
            app.Table.Position = [85 0 795 430];
            app.Button_Sheet1 = uibutton(app.Tab_3, 'state');
            app.Button_Sheet1.ValueChangedFcn = createCallbackFcn(app, @Button_Sheet1ValueChanged, true);
            app.Button_Sheet1.Text = 'Sheet1';
            app.Button_Sheet1.Position = [15 391 56 22];
            app.Button_Sheet1.Value = true;
            app.Button_Sheet2 = uibutton(app.Tab_3, 'state');
            app.Button_Sheet2.ValueChangedFcn = createCallbackFcn(app, @Button_Sheet2ValueChanged, true);
            app.Button_Sheet2.Text = 'Sheet2';
            app.Button_Sheet2.Position = [15 361 56 22];
            app.Button_Sheet3 = uibutton(app.Tab_3, 'state');
            app.Button_Sheet3.ValueChangedFcn = createCallbackFcn(app, @Button_Sheet3ValueChanged, true);
            app.Button_Sheet3.Text = 'Sheet3';
            app.Button_Sheet3.Position = [15 332 56 22];
            app.Button_Clear = uibutton(app.Tab_3, 'push');
            app.Button_Clear.ButtonPushedFcn = createCallbackFcn(app, @Button_ClearPushed, true);
            app.Button_Clear.Tag = '清空当前表格';
            app.Button_Clear.Position = [15 16 56 22];
            app.Button_Clear.Text = 'Clear';
            app.Button_Export = uibutton(app.Tab_3, 'push');
            app.Button_Export.ButtonPushedFcn = createCallbackFcn(app, @Button_ExportPushed, true);
            app.Button_Export.Tag = '导出为xlsx文件';
            app.Button_Export.Position = [15 46 56 24];
            app.Button_Export.Text = '导出';
            app.Button_run = uibutton(app.Comsol, 'push');
            app.Button_run.ButtonPushedFcn = createCallbackFcn(app, @Button_runPushed, true);
            app.Button_run.Icon = 'run.jpg';
            app.Button_run.FontSize = 18;
            app.Button_run.Position = [40 10 100 30];
            app.Button_run.Text = 'run';
            app.Button_pause = uibutton(app.Comsol, 'push');
            app.Button_pause.ButtonPushedFcn = createCallbackFcn(app, @Button_pausePushed, true);
            app.Button_pause.Icon = 'pause.jpg';
            app.Button_pause.FontSize = 18;
            app.Button_pause.Enable = 'off';
            app.Button_pause.Visible = 'off';
            app.Button_pause.Position = [170 10 100 30];
            app.Button_pause.Text = 'pause';
            app.Label_time = uilabel(app.Comsol);
            app.Label_time.HorizontalAlignment = 'right';
            app.Label_time.FontSize = 16;
            app.Label_time.Position = [339 10 50 30];
            app.Label_time.Text = '已计算';
            app.EditField_minute = uieditfield(app.Comsol, 'numeric');
            app.EditField_minute.FontSize = 16;
            app.EditField_minute.Position = [399 10 40 30];
            app.Label_minute = uilabel(app.Comsol);
            app.Label_minute.FontSize = 18;
            app.Label_minute.Position = [444 10 40 30];
            app.Label_minute.Text = '分钟';
            app.EditField_second = uieditfield(app.Comsol, 'numeric');
            app.EditField_second.FontSize = 16;
            app.EditField_second.Position = [484 10 40 30];
            app.Label_second = uilabel(app.Comsol);
            app.Label_second.FontSize = 18;
            app.Label_second.Position = [529 10 40 30];
            app.Label_second.Text = '秒';
            app.Button_stop = uibutton(app.Comsol, 'push');
            app.Button_stop.ButtonPushedFcn = createCallbackFcn(app, @Button_stopPushed, true);
            app.Button_stop.Icon = 'stop.png';
            app.Button_stop.FontSize = 18;
            app.Button_stop.Enable = 'off';
            app.Button_stop.Visible = 'off';
            app.Button_stop.Position = [640 10 100 30];
            app.Button_stop.Text = 'stop';
            app.EditField_all = uieditfield(app.Comsol, 'numeric');
            app.EditField_all.FontSize = 18;
            app.EditField_all.Position = [820 512 40 30];
            app.EditField_finished = uieditfield(app.Comsol, 'numeric');
            app.EditField_finished.FontSize = 18;
            app.EditField_finished.Position = [768 512 40 30];
            app.Label_rateOfProgress = uilabel(app.Comsol);
            app.Label_rateOfProgress.HorizontalAlignment = 'center';
            app.Label_rateOfProgress.FontSize = 18;
            app.Label_rateOfProgress.Position = [616 512 144 30];
            app.Label_rateOfProgress.Text = '程序已完成/总数';
            app.Label_rateOfProgress_symbol = uilabel(app.Comsol);
            app.Label_rateOfProgress_symbol.HorizontalAlignment = 'center';
            app.Label_rateOfProgress_symbol.FontSize = 18;
            app.Label_rateOfProgress_symbol.Position = [808 512 11 30];
            app.Label_rateOfProgress_symbol.Text = '/';
            app.Comsol.Visible = 'on';
        end
    end
    methods (Access = public)
        function app = sourceProgram
            createComponents(app)
            registerApp(app, app.Comsol)
            runStartupFcn(app, @startupFcn)
            if nargout == 0
                clear app
            end
        end
        function delete(app)
            delete(app.Comsol)
        end
    end
end