function out = Model(jxh, jxw, cw, jx, wc, cnz, cln, crn, model_path, data_path, xian_path, tu_path)
%
% Model_maybe_perfect.m
%
% Model exported on Aug 3 2021, 22:48 by COMSOL 5.6.0.280.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');
% model.modelPath(model_path);
model.modelPath('D:\学习资料\研究生阶段\磁流体实验室\1小论文1\0matlab联调\model2\');
model.label('Model.mph');

model.param.set('jxh', jxh, [native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'9a' 'd8'}), 'unicode') ]);
model.param.set('jxw', jxw, [native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'5b' 'bd'}), 'unicode') ]);
model.param.set('cw', cw, [native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode')  native2unicode(hex2dec({'5b' 'bd'}), 'unicode') ]);
model.param.set('jx', jx, [native2unicode(hex2dec({'95' 'f4'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
model.param.set('sc', '1.35[T]', [native2unicode(hex2dec({'52' '69'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode') ]);
% model.param.set('wc',wc, [native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode')  native2unicode(hex2dec({'95' 'f4'}), 'unicode')  native2unicode(hex2dec({'96' '94'}), 'unicode') ]);
model.param.set('cnz', cnz, [native2unicode(hex2dec({'60' '3b'}), 'unicode')  native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
model.param.set('cln', cln, [native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
model.param.set('crn', crn, [native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
%wc使用wc直接赋值时在运行到jxh1 jxw0.9 cw0.24时出现错误% 但是其他值时可以使用  使用内置函数叠加cw和jxw时均能使用
%原因：
model.param.set('wc', 'cw+jxw', [native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode')  native2unicode(hex2dec({'95' 'f4'}), 'unicode')  native2unicode(hex2dec({'96' '94'}), 'unicode') ]);


model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.table.create('evl2', 'Table');

model.component('comp1').geom('geom1').axisymmetric(true);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit('mm');
model.component('comp1').geom('geom1').useConstrDim(true);
model.component('comp1').geom('geom1').create('r5', 'Rectangle');
model.component('comp1').geom('geom1').feature('r5').label([native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r5').set('pos', [0 -20]);
model.component('comp1').geom('geom1').feature('r5').set('size', [30 140]);
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').label([native2unicode(hex2dec({'8f' '74'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r1').set('pos', [0 -10]);
model.component('comp1').geom('geom1').feature('r1').set('size', [10 106]);
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r2').set('pos', {'10-jxh' '42-jxw'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'jxh' 'jxw'});
model.component('comp1').geom('geom1').create('arr1', 'Array');
model.component('comp1').geom('geom1').feature('arr1').set('type', 'linear');
model.component('comp1').geom('geom1').feature('arr1').set('linearsize', 'cln');
model.component('comp1').geom('geom1').feature('arr1').set('displ', {'0' '-wc'});
model.component('comp1').geom('geom1').feature('arr1').selection('input').set({'r2'});
model.component('comp1').geom('geom1').create('r12', 'Rectangle');
model.component('comp1').geom('geom1').feature('r12').active(false);
model.component('comp1').geom('geom1').feature('r12').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') '+' native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r12').set('pos', {'10' '41-(cln-1)*wc'});
model.component('comp1').geom('geom1').feature('r12').set('size', {'jx' 'wc*cln-cw'});
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r3').set('pos', {'10-jxh' '49'});
model.component('comp1').geom('geom1').feature('r3').set('size', {'jxh' 'jxw'});
model.component('comp1').geom('geom1').create('arr2', 'Array');
model.component('comp1').geom('geom1').feature('arr2').set('type', 'linear');
model.component('comp1').geom('geom1').feature('arr2').set('linearsize', 'crn');
model.component('comp1').geom('geom1').feature('arr2').set('displ', {'0' 'wc'});
model.component('comp1').geom('geom1').feature('arr2').selection('input').set({'r3'});
model.component('comp1').geom('geom1').create('r13', 'Rectangle');
model.component('comp1').geom('geom1').feature('r13').active(false);
model.component('comp1').geom('geom1').feature('r13').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') '+' native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ' 1']);
model.component('comp1').geom('geom1').feature('r13').set('pos', [10 49]);
model.component('comp1').geom('geom1').feature('r13').set('size', {'jx' 'wc*crn-cw'});
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').label([native2unicode(hex2dec({'5d' 'ee'}), 'unicode')  native2unicode(hex2dec({'96' 'c6'}), 'unicode') ' 1']);
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'r1'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'arr1' 'arr2'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').label([native2unicode(hex2dec({'6c' '38'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'4f' '53'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r4').set('pos', {'10+0.4+jx' '43'});
model.component('comp1').geom('geom1').feature('r4').set('size', [6 5]);
model.component('comp1').geom('geom1').create('r6', 'Rectangle');
model.component('comp1').geom('geom1').feature('r6').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode')  native2unicode(hex2dec({'60' '3b'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r6').set('pos', {'10+jx' '43.5-(1.5+1+wc*cln)'});
model.component('comp1').geom('geom1').feature('r6').set('size', {'8.4' '1.5+1+wc*cln'});
model.component('comp1').geom('geom1').create('r7', 'Rectangle');
model.component('comp1').geom('geom1').feature('r7').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode')  native2unicode(hex2dec({'53' 'bb'}), 'unicode')  native2unicode(hex2dec({'96' '64'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r7').set('pos', {'10+jx' '14+28+1'});
model.component('comp1').geom('geom1').feature('r7').set('size', [6.4 0.5]);
model.component('comp1').geom('geom1').create('dif2', 'Difference');
model.component('comp1').geom('geom1').feature('dif2').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('dif2').selection('input').set({'r6'});
model.component('comp1').geom('geom1').feature('dif2').selection('input2').set({'r7'});
model.component('comp1').geom('geom1').create('r8', 'Rectangle');
model.component('comp1').geom('geom1').feature('r8').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode')  native2unicode(hex2dec({'60' '3b'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r8').set('pos', {'10+jx' '47.5'});
model.component('comp1').geom('geom1').feature('r8').set('size', {'8.4' '2.5+wc*crn'});
model.component('comp1').geom('geom1').create('r9', 'Rectangle');
model.component('comp1').geom('geom1').feature('r9').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode')  native2unicode(hex2dec({'53' 'bb'}), 'unicode')  native2unicode(hex2dec({'96' '64'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r9').set('pos', {'10+jx' '47.5'});
model.component('comp1').geom('geom1').feature('r9').set('size', [6.4 0.5]);
model.component('comp1').geom('geom1').create('dif3', 'Difference');
model.component('comp1').geom('geom1').feature('dif3').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode') ]);
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
model.component('comp1').material('mat1').info.create([native2unicode(hex2dec({'54' '08'}), 'unicode')  native2unicode(hex2dec({'62' '10'}), 'unicode')  native2unicode(hex2dec({'72' '69'}), 'unicode') ]);
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
model.result.table('evl2').comments([native2unicode(hex2dec({'4e' 'a4'}), 'unicode')  native2unicode(hex2dec({'4e' '92'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'4e' '8c'}), 'unicode')  native2unicode(hex2dec({'7e' 'f4'}), 'unicode')  native2unicode(hex2dec({'50' '3c'}), 'unicode') ]);

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
model.component('comp1').material('mat1').set('info', {[native2unicode(hex2dec({'54' '08'}), 'unicode')  native2unicode(hex2dec({'62' '10'}), 'unicode')  native2unicode(hex2dec({'72' '69'}), 'unicode') ] '' '78.09 N2, 20.95 O2, 0.93 Ar, 0.039 CO2, trace others (vol %)'});
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
model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('table', {'0' '0';  ...
'1' '0.0013633';  ...
'1.2589254' '0.0017163';  ...
'1.5848932' '0.0021606';  ...
'1.9952623' '0.0027201';  ...
'2.5118864' '0.0034244';  ...
'3.1622777' '0.004311';  ...
'3.9810717' '0.0054273';  ...
'5.0118723' '0.0068325';  ...
'6.3095734' '0.0086017';  ...
'7.9432823' '0.0108289';  ...
'10' '0.0136327';  ...
'12.5892541' '0.0171626';  ...
'15.8489319' '0.0216064';  ...
'19.9526231' '0.0272009';  ...
'25.1188643' '0.0342439';  ...
'31.6227766' '0.0431105';  ...
'39.8107171' '0.0542729';  ...
'50.1187234' '0.0683255';  ...
'63.0957344' '0.0860167';  ...
'79.4328235' '0.1165971';  ...
'100' '0.1835359';  ...
'125.8925412' '0.267807';  ...
'158.4893192' '0.413659';  ...
'199.5262315' '0.6259804';  ...
'251.1886432' '0.8445332';  ...
'316.227766' '1.0979217';  ...
'398.1071706' '1.261948';  ...
'501.1872336' '1.3423502';  ...
'630.9573445' '1.3989407';  ...
'794.3282347' '1.4525702';  ...
'1000' '1.5022321';  ...
'1258.9254118' '1.5467119';  ...
'1584.8931925' '1.597946';  ...
'1995.262315' '1.6397436';  ...
'2511.8864315' '1.680046';  ...
'3162.2776602' '1.7167375';  ...
'3981.0717055' '1.7464437';  ...
'5011.8723363' '1.7828889';  ...
'6309.5734448' '1.8225136';  ...
'7943.2823472' '1.8683077';  ...
'8009' '1.87';  ...
'9562.1509001' '1.9096235';  ...
'11415.0723891' '1.9475845';  ...
'13627.0467816' '1.982612';  ...
'16267.6501434' '2.0135902';  ...
'19419.9407568' '2.0398039';  ...
'23183.071659' '2.0611168';  ...
'27675.4094297' '2.0780434';  ...
'33038.257327' '2.0916642';  ...
'39440.29988' '2.103395';  ...
'47082.9087389' '2.114689';  ...
'56206.4766765' '2.1267979';  ...
'67097.9789695' '2.1406811';  ...
'80100' '2.157066';  ...
'95621.5090013' '2.1765788';  ...
'114150.7238913' '2.1998642';  ...
'136270.4678162' '2.2276608';  ...
'162676.5010443' '2.2608436';  ...
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
model.component('comp1').material('mat3').propertyGroup('BHCurve').descr('normHin', [native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') ]);
model.component('comp1').material('mat3').propertyGroup('BHCurve').descr('normBin', [native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'90' '1a'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') ]);
model.component('comp1').material('mat3').propertyGroup('BHCurve').addInput('magneticfield');
model.component('comp1').material('mat3').propertyGroup('BHCurve').addInput('magneticfluxdensity');

model.component('comp1').physics('mfnc').feature('mfc1').label([native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'57' 'df'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'90' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'5b' '88'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode') ]);
model.component('comp1').physics('mfnc').feature('mfc2').set('ConstitutiveRelationBH', 'RemanentFluxDensity');
model.component('comp1').physics('mfnc').feature('mfc2').set('e_crel_BH_RemanentFluxDensity', [0; 0; 1]);
model.component('comp1').physics('mfnc').feature('mfc2').set('materialType', 'solid');
model.component('comp1').physics('mfnc').feature('mfc2').label([native2unicode(hex2dec({'6c' '38'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'4f' '53'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'90' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'5b' '88'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode') ]);
model.component('comp1').physics('mfnc').feature('mfc3').set('ConstitutiveRelationBH', 'BHCurve');
model.component('comp1').physics('mfnc').feature('mfc3').set('materialType', 'from_mat');
model.component('comp1').physics('mfnc').feature('mfc3').label(['DT4' native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'90' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode')  native2unicode(hex2dec({'5b' '88'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode') ' 3']);

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
model.sol('sol1').feature('st1').label([native2unicode(hex2dec({'7f' '16'}), 'unicode')  native2unicode(hex2dec({'8b' 'd1'}), 'unicode')  native2unicode(hex2dec({'65' 'b9'}), 'unicode')  native2unicode(hex2dec({'7a' '0b'}), 'unicode') ': ' native2unicode(hex2dec({'7a' '33'}), 'unicode')  native2unicode(hex2dec({'60' '01'}), 'unicode') ]);
model.sol('sol1').feature('v1').label([native2unicode(hex2dec({'56' 'e0'}), 'unicode')  native2unicode(hex2dec({'53' 'd8'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').label([native2unicode(hex2dec({'7a' '33'}), 'unicode')  native2unicode(hex2dec({'60' '01'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('dDef').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('aDef').label([native2unicode(hex2dec({'9a' 'd8'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').feature('fc1').label([native2unicode(hex2dec({'51' '68'}), 'unicode')  native2unicode(hex2dec({'80' '26'}), 'unicode')  native2unicode(hex2dec({'54' '08'}), 'unicode') ' 1.1']);
model.sol('sol1').runAll;

model.result.dataset('dset1').set('frametype', 'material');
model.result.dataset('cln1').set('genpoints', {'10.06' '49[mm]+jxw/2+(crn-1)*wc'; '10.06' '49[mm]+jxw/2'});
model.result.dataset('cln2').set('genpoints', {'10.06' '42[mm]-jxw/2'; '10.06' '42[mm]-jxw/2-(cln-1)*wc'});
model.result('pg1').set('data', 'cln1');
model.result('pg1').set('xlabel', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ' (mm)']);
model.result('pg1').set('ylabel', [native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'90' '1a'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') ' (T)']);
model.result('pg1').set('xlabelactive', false);
model.result('pg1').set('ylabelactive', false);
model.result('pg1').feature('lngr1').set('data', 'cln1');
model.result('pg1').feature('lngr1').set('xdataexpr', 'z');
model.result('pg1').feature('lngr1').set('xdataunit', 'mm');
model.result('pg1').feature('lngr1').set('xdatadescr', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]);
model.result('pg1').feature('lngr1').set('resolution', 'normal');
model.result('pg1').feature('lngr2').set('data', 'cln2');
model.result('pg1').feature('lngr2').set('xdataexpr', 'z');
model.result('pg1').feature('lngr2').set('xdataunit', 'mm');
model.result('pg1').feature('lngr2').set('xdatadescr', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]);
model.result('pg1').feature('lngr2').set('resolution', 'normal');
model.result('pg2').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result.export('plot1').set('filename', [data_path, 'Line-jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','normB_R.txt']);
model.result.export('plot2').set('plot', 'lngr2');
model.result.export('plot2').set('filename', [data_path, 'Line-jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','normB_L.txt']);
model.result.export('img1').set('sourceobject', 'pg1');
model.result.export('img1').set('pngfilename', [xian_path,'Line-jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','normB.png']);
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
model.result.export('img2').set('pngfilename', [tu_path,'Picture-jxh',num2str(jxh),'-','jxw',num2str(jxw),'-','cw',num2str(cw),'-','normB.png']);
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
