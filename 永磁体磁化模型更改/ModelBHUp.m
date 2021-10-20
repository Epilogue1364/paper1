function out = model
%
% ModelBHUp.m
%
% Model exported on Oct 20 2021, 17:20 by COMSOL 5.6.0.280.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\GitHub\paper1');

model.label('ModelBHUp.mph');

model.param.set('jxh', '0.7[mm]', [native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'9a' 'd8'}), 'unicode') ]);
model.param.set('jxw', '0.4[mm]', [native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'5b' 'bd'}), 'unicode') ]);
model.param.set('cw', '0.16[mm]', [native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode')  native2unicode(hex2dec({'5b' 'bd'}), 'unicode') ]);
model.param.set('jx', '0.1[mm]', [native2unicode(hex2dec({'95' 'f4'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
model.param.set('sc', '1.35[T]', [native2unicode(hex2dec({'52' '69'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode') ]);
model.param.set('wc', 'cw+jxw', [native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode')  native2unicode(hex2dec({'95' 'f4'}), 'unicode')  native2unicode(hex2dec({'96' '94'}), 'unicode') ]);
model.param.set('cnz', '42', [native2unicode(hex2dec({'60' '3b'}), 'unicode')  native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
model.param.set('cln', 'floor((19.201[mm]+jxw)/wc)', [native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);
model.param.set('crn', 'floor((19.201[mm]+jxw)/wc)', [native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'69' 'fd'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode') ]);

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
model.component('comp1').geom('geom1').create('r12', 'Rectangle');
model.component('comp1').geom('geom1').feature('r12').active(false);
model.component('comp1').geom('geom1').feature('r12').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') '+' native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r12').set('pos', {'10' '41-(cln-1)*wc'});
model.component('comp1').geom('geom1').feature('r12').set('size', {'jx' 'wc*cln-cw'});
model.component('comp1').geom('geom1').create('r13', 'Rectangle');
model.component('comp1').geom('geom1').feature('r13').active(false);
model.component('comp1').geom('geom1').feature('r13').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') '+' native2unicode(hex2dec({'7a' '7a'}), 'unicode')  native2unicode(hex2dec({'6c' '14'}), 'unicode')  native2unicode(hex2dec({'96' '99'}), 'unicode') ' 1']);
model.component('comp1').geom('geom1').feature('r13').set('pos', [10 49]);
model.component('comp1').geom('geom1').feature('r13').set('size', {'jx' 'wc*crn-cw'});
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').label([native2unicode(hex2dec({'6c' '38'}), 'unicode')  native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'4f' '53'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r4').set('pos', {'10+0.4+jx' '43'});
model.component('comp1').geom('geom1').feature('r4').set('size', [6 5]);
model.component('comp1').geom('geom1').create('r6', 'Rectangle');
model.component('comp1').geom('geom1').feature('r6').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode')  native2unicode(hex2dec({'60' '3b'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r6').set('pos', {'10+jx' '43.5-(wc*cln-jxw+0.5)'});
model.component('comp1').geom('geom1').feature('r6').set('size', {'8.4' 'wc*cln-jxw+0.5'});
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
model.component('comp1').geom('geom1').feature('r8').set('size', {'8.4' 'wc*crn-jxw+0.5'});
model.component('comp1').geom('geom1').create('r9', 'Rectangle');
model.component('comp1').geom('geom1').feature('r9').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode')  native2unicode(hex2dec({'53' 'bb'}), 'unicode')  native2unicode(hex2dec({'96' '64'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r9').set('pos', {'10+jx' '47.5'});
model.component('comp1').geom('geom1').feature('r9').set('size', [6.4 0.5]);
model.component('comp1').geom('geom1').create('dif3', 'Difference');
model.component('comp1').geom('geom1').feature('dif3').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'97' '74'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('dif3').selection('input').set({'r8'});
model.component('comp1').geom('geom1').feature('dif3').selection('input2').set({'r9'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').label([native2unicode(hex2dec({'5d' 'e6'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r2').set('pos', {'10.1' '43-wc'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'jxh' 'jxw'});
model.component('comp1').geom('geom1').create('arr1', 'Array');
model.component('comp1').geom('geom1').feature('arr1').set('type', 'linear');
model.component('comp1').geom('geom1').feature('arr1').set('linearsize', 'cln-1');
model.component('comp1').geom('geom1').feature('arr1').set('displ', {'0' '-wc'});
model.component('comp1').geom('geom1').feature('arr1').selection('input').set({'r2'});
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').label([native2unicode(hex2dec({'53' 'f3'}), 'unicode')  native2unicode(hex2dec({'6b' 'cd'}), 'unicode')  native2unicode(hex2dec({'9f' '7f'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r3').set('pos', {'10.1' '48+cw'});
model.component('comp1').geom('geom1').feature('r3').set('size', {'jxh' 'jxw'});
model.component('comp1').geom('geom1').create('arr2', 'Array');
model.component('comp1').geom('geom1').feature('arr2').set('type', 'linear');
model.component('comp1').geom('geom1').feature('arr2').set('linearsize', 'crn-1');
model.component('comp1').geom('geom1').feature('arr2').set('displ', {'0' 'wc'});
model.component('comp1').geom('geom1').feature('arr2').selection('input').set({'r3'});
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').label([native2unicode(hex2dec({'5d' 'ee'}), 'unicode')  native2unicode(hex2dec({'96' 'c6'}), 'unicode') ' 1']);
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'dif2' 'dif3'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'arr1' 'arr2'});
model.component('comp1').geom('geom1').create('ls1', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls1').active(false);
model.component('comp1').geom('geom1').feature('ls1').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord1', [10 42]);
model.component('comp1').geom('geom1').feature('ls1').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls1').set('coord2', [10.1 42]);
model.component('comp1').geom('geom1').create('ls2', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls2').active(false);
model.component('comp1').geom('geom1').feature('ls2').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord1', [10 49]);
model.component('comp1').geom('geom1').feature('ls2').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls2').set('coord2', [10.1 49]);
model.component('comp1').geom('geom1').create('ls3', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls3').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls3').set('coord1', {'10' '43.5-(wc*cln-jxw+0.5)'});
model.component('comp1').geom('geom1').feature('ls3').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls3').set('coord2', {'10.1' '43.5-(wc*cln-jxw+0.5)'});
model.component('comp1').geom('geom1').create('ls4', 'LineSegment');
model.component('comp1').geom('geom1').feature('ls4').set('specify1', 'coord');
model.component('comp1').geom('geom1').feature('ls4').set('coord1', {'10' '48+wc*crn-jxw'});
model.component('comp1').geom('geom1').feature('ls4').set('specify2', 'coord');
model.component('comp1').geom('geom1').feature('ls4').set('coord2', {'10.1' '48+wc*crn-jxw'});
model.component('comp1').geom('geom1').create('r14', 'Rectangle');
model.component('comp1').geom('geom1').feature('r14').active(false);
model.component('comp1').geom('geom1').feature('r14').set('pos', [10.1 23.8]);
model.component('comp1').geom('geom1').feature('r14').set('size', [10 43.4]);
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.view.create('view2', 3);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material.create('mat4', 'Common');
model.component('comp1').material('mat1').info.create([native2unicode(hex2dec({'54' '08'}), 'unicode')  native2unicode(hex2dec({'62' '10'}), 'unicode')  native2unicode(hex2dec({'72' '69'}), 'unicode') ]);
model.component('comp1').material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('C', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('rho_gas_2', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('TD', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat2').selection.set([75]);
model.component('comp1').material('mat2').propertyGroup.create('RemanentFluxDensity', 'Remanent flux density');
model.component('comp1').material('mat3').selection.set([2 4 40]);
model.component('comp1').material('mat3').propertyGroup.create('BHCurve', 'B-H Curve');
model.component('comp1').material('mat3').propertyGroup('BHCurve').func.create('BH', 'Interpolation');
model.component('comp1').material('mat4').propertyGroup.create('BHCurve', 'B-H Curve');
model.component('comp1').material('mat4').propertyGroup('BHCurve').func.create('BH', 'Interpolation');

model.component('comp1').physics.create('mfnc', 'MagnetostaticsNoCurrents', 'geom1');
model.component('comp1').physics('mfnc').create('mfc2', 'MagneticFluxConservation', 2);
model.component('comp1').physics('mfnc').feature('mfc2').selection.set([75]);
model.component('comp1').physics('mfnc').create('zsp1', 'ZeroMagneticScalarPotential', 1);
model.component('comp1').physics('mfnc').feature('zsp1').selection.set([2]);
model.component('comp1').physics('mfnc').create('mfc3', 'MagneticFluxConservation', 2);
model.component('comp1').physics('mfnc').feature('mfc3').selection.set([2 4 40]);

model.component('comp1').mesh('mesh1').create('fq1', 'FreeQuad');
model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').feature('fq1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('fq1').selection.set([3 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74]);
model.component('comp1').mesh('mesh1').feature('fq1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('ftri1').create('size1', 'Size');

model.result.table('evl2').label('Evaluation 2D');
model.result.table('evl2').comments([native2unicode(hex2dec({'4e' 'a4'}), 'unicode')  native2unicode(hex2dec({'4e' '92'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'4e' '8c'}), 'unicode')  native2unicode(hex2dec({'7e' 'f4'}), 'unicode')  native2unicode(hex2dec({'50' '3c'}), 'unicode') ]);

model.component('comp1').view('view1').set('showlabels', true);
model.component('comp1').view('view1').axis.set('xmin', 4.800215244293213);
model.component('comp1').view('view1').axis.set('xmax', 23.886638641357422);
model.component('comp1').view('view1').axis.set('ymin', 61.03538513183594);
model.component('comp1').view('view1').axis.set('ymax', 68.92155456542969);

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
model.component('comp1').material('mat3').label('2Cr13');
model.component('comp1').material('mat3').propertyGroup('def').label('Basic');
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'10.295[MS/m]' '0' '0' '0' '10.295[MS/m]' '0' '0' '0' '10.295[MS/m]'});
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'1[1]' '0' '0' '0' '1[1]' '0' '0' '0' '1[1]'});
model.component('comp1').material('mat3').propertyGroup('def').set('relpermeability', {'mfnc.normB/(mu0_const*mfnc.normH)' '0' '0' '0' 'mfnc.normB/(mu0_const*mfnc.normH)' '0' '0' '0' 'mfnc.normB/(mu0_const*mfnc.normH)'});
model.component('comp1').material('mat3').propertyGroup('BHCurve').label('B-H Curve');
model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').label('Interpolation 1');
model.component('comp1').material('mat3').propertyGroup('BHCurve').func('BH').set('table', {'0' '0';  ...
'1' '0.0003546';  ...
'1.1937766' '0.0004233';  ...
'1.4251027' '0.0005053';  ...
'1.7012543' '0.0006032';  ...
'2.0309176' '0.0007201';  ...
'2.424462' '0.0008596';  ...
'2.8942661' '0.0010262';  ...
'3.4551073' '0.001225';  ...
'4.1246264' '0.0014624';  ...
'4.9238826' '0.0017458';  ...
'5.8780161' '0.0020841';  ...
'7.0170383' '0.0024879';  ...
'8.3767764' '0.00297';  ...
'10' '0.0035455';  ...
'11.9377664' '0.0042326';  ...
'14.2510267' '0.0050528';  ...
'17.0125428' '0.0060319';  ...
'20.3091762' '0.0072007';  ...
'24.2446202' '0.008596';  ...
'28.9426612' '0.0102617';  ...
'34.5510729' '0.0122502';  ...
'41.2462638' '0.014624';  ...
'49.2388263' '0.0174578';  ...
'58.7801607' '0.0208407';  ...
'70.1703829' '0.0248792';  ...
'83.767764' '0.0297002';  ...
'100' '0.0354554';  ...
'119.3776642' '0.0431569';  ...
'142.510267' '0.053366';  ...
'170.125428' '0.0655534';  ...
'203.0917621' '0.0802035';  ...
'242.4462017' '0.10007';  ...
'289.4266125' '0.123786';  ...
'345.5107295' '0.1557353';  ...
'412.4626383' '0.1964199';  ...
'492.3882632' '0.2513281';  ...
'587.8016072' '0.3411937';  ...
'701.7038287' '0.4866155';  ...
'837.6776401' '0.8204481';  ...
'1000' '0.9422092';  ...
'1193.7766417' '1.018825';  ...
'1425.1026703' '1.0837878';  ...
'1701.2542799' '1.1451911';  ...
'2030.9176209' '1.195642';  ...
'2424.4620171' '1.2453487';  ...
'2894.2661247' '1.2975897';  ...
'3455.1072946' '1.3483929';  ...
'3940' '1.383';  ...
'4594.868655' '1.4209807';  ...
'5357.2235365' '1.4544419';  ...
'6246.0640715' '1.4827289';  ...
'7282.3760516' '1.5055234';  ...
'8490.6271134' '1.522983';  ...
'9899.3444266' '1.5357223';  ...
'11541.7882292' '1.5447017';  ...
'13456.7371118' '1.5510451';  ...
'15689.4035915' '1.5558408';  ...
'18292.5015933' '1.5599876';  ...
'21327.4910412' '1.5641293';  ...
'24866.028946' '1.5686776';  ...
'28991.6612483' '1.5738873';  ...
'33801.7953635' '1.5799368';  ...
'39410' '1.5869849';  ...
'45948.6865505' '1.5952018';  ...
'53572.2083246' '1.6047818';  ...
'62460.6140089' '1.6159513';  ...
'72823.7493959' '1.628974';  ...
'84906.2356332' '1.6441573';  ...
'98993.4375336' '1.6618598';  ...
'115417.8297733' '1.6824993';  ...
'134567.3525261' '1.7065633';  ...
'156894.0058304' '1.7346198';  ...
'182924.9904352' '1.7673313';  ...
'213274.8831531' '1.8054701';  ...
'223772.0270022' '1.8186612'});
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
model.component('comp1').material('mat4').active(false);
model.component('comp1').material('mat4').label('45steel');
model.component('comp1').material('mat4').propertyGroup('def').label('Basic');
model.component('comp1').material('mat4').propertyGroup('def').set('electricconductivity', {'10.295[MS/m]' '0' '0' '0' '10.295[MS/m]' '0' '0' '0' '10.295[MS/m]'});
model.component('comp1').material('mat4').propertyGroup('def').set('relpermittivity', {'1[1]' '0' '0' '0' '1[1]' '0' '0' '0' '1[1]'});
model.component('comp1').material('mat4').propertyGroup('def').set('relpermeability', {'mfnc.normB/(mu0_const*mfnc.normH)' '0' '0' '0' 'mfnc.normB/(mu0_const*mfnc.normH)' '0' '0' '0' 'mfnc.normB/(mu0_const*mfnc.normH)'});
model.component('comp1').material('mat4').propertyGroup('BHCurve').label('B-H Curve');
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').label('Interpolation 1');
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').set('table', {'0' '0';  ...
'75.8' '0.0062';  ...
'132.5' '0.0112';  ...
'180.8' '0.0157';  ...
'295' '0.0269';  ...
'414.2' '0.0393';  ...
'563.3' '0.0556';  ...
'947.5' '0.1007';  ...
'1338.3' '0.1491';  ...
'1770.8' '0.2013';  ...
'2192.5' '0.2528';  ...
'2551.6' '0.3003';  ...
'2949.2' '0.3516';  ...
'3347.5' '0.4003';  ...
'3800' '0.4513';  ...
'4271.7' '0.5014';  ...
'4645' '0.5364';  ...
'4867.4986104' '0.5366796'});
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').set('extrap', 'linear');
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').set('argunit', 'A/m');
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').set('fununit', 'T');
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').set('defineinv', true);
model.component('comp1').material('mat4').propertyGroup('BHCurve').func('BH').set('defineprimfun', true);
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', '');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normB', 'BH(normHin)');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('normH', 'BH_inv(normBin)');
model.component('comp1').material('mat4').propertyGroup('BHCurve').set('Wpm', 'BH_prim(normHin)');
model.component('comp1').material('mat4').propertyGroup('BHCurve').descr('normHin', [native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') ]);
model.component('comp1').material('mat4').propertyGroup('BHCurve').descr('normBin', [native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'90' '1a'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') ]);
model.component('comp1').material('mat4').propertyGroup('BHCurve').addInput('magneticfield');
model.component('comp1').material('mat4').propertyGroup('BHCurve').addInput('magneticfluxdensity');

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
model.result.dataset.create('cln3', 'CutLine2D');
model.result.create('pg1', 'PlotGroup1D');
model.result.create('pg2', 'PlotGroup2D');
model.result('pg1').create('lngr1', 'LineGraph');
model.result('pg1').create('lngr2', 'LineGraph');
model.result('pg1').create('lngr3', 'LineGraph');
model.result('pg1').feature('lngr1').set('xdata', 'expr');
model.result('pg1').feature('lngr1').set('expr', 'mfnc.normB');
model.result('pg1').feature('lngr2').set('xdata', 'expr');
model.result('pg1').feature('lngr2').set('expr', 'mfnc.normB');
model.result('pg1').feature('lngr3').set('xdata', 'expr');
model.result('pg1').feature('lngr3').set('expr', 'mfnc.normB');
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
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').runAll;

model.result.dataset('dset1').set('frametype', 'material');
model.result.dataset('cln1').set('genpoints', {'10.04' '48[mm]+wc*crn-jxw/2'; '10.04' '48[mm]-jxw/2'});
model.result.dataset('cln2').set('genpoints', {'10.04' '43[mm]+jxw/2'; '10.04' '43[mm]-(wc*cln-jxw/2)'});
model.result.dataset('cln3').set('genpoints', {'10.04' '43[mm]-(wc*cln-jxw/2)'; '10.04' '48[mm]+wc*crn-jxw/2'});
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
model.result('pg1').feature('lngr3').active(false);
model.result('pg1').feature('lngr3').set('data', 'cln3');
model.result('pg1').feature('lngr3').set('xdataexpr', 'z');
model.result('pg1').feature('lngr3').set('xdataunit', 'mm');
model.result('pg1').feature('lngr3').set('xdatadescr', ['z ' native2unicode(hex2dec({'57' '50'}), 'unicode')  native2unicode(hex2dec({'68' '07'}), 'unicode') ]);
model.result('pg1').feature('lngr3').set('resolution', 'normal');
model.result('pg2').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result.export('plot1').set('filename', 'D:\GitHub\paper1\resultModelBH\Line-jxh0.3[mm]-jxw0.5[mm]-cw0.12[mm]-cln32-crn32-normB_R.txt');
model.result.export('plot2').set('plot', 'lngr2');
model.result.export('plot2').set('filename', 'D:\GitHub\paper1\resultModelBH\Line-jxh0.3[mm]-jxw0.5[mm]-cw0.12[mm]-cln32-crn32-normB_L.txt');
model.result.export('img1').set('sourceobject', 'pg1');
model.result.export('img1').set('unit', 'px');
model.result.export('img1').set('width', '681*4');
model.result.export('img1').set('height', '425*4');
model.result.export('img1').set('sizedesc', '173 x 108 mm');
model.result.export('img1').set('pngfilename', ['D:\' native2unicode(hex2dec({'5b' '66'}), 'unicode')  native2unicode(hex2dec({'4e' '60'}), 'unicode')  native2unicode(hex2dec({'8d' '44'}), 'unicode')  native2unicode(hex2dec({'65' '99'}), 'unicode') '\' native2unicode(hex2dec({'78' '14'}), 'unicode')  native2unicode(hex2dec({'7a' '76'}), 'unicode')  native2unicode(hex2dec({'75' '1f'}), 'unicode')  native2unicode(hex2dec({'96' '36'}), 'unicode')  native2unicode(hex2dec({'6b' 'b5'}), 'unicode') '\' native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'4f' '53'}), 'unicode')  native2unicode(hex2dec({'5b' '9e'}), 'unicode')  native2unicode(hex2dec({'9a' '8c'}), 'unicode')  native2unicode(hex2dec({'5b' 'a4'}), 'unicode') '\1' native2unicode(hex2dec({'5c' '0f'}), 'unicode')  native2unicode(hex2dec({'8b' 'ba'}), 'unicode')  native2unicode(hex2dec({'65' '87'}), 'unicode') '1\0matlab' native2unicode(hex2dec({'80' '54'}), 'unicode')  native2unicode(hex2dec({'8c' '03'}), 'unicode') '\model2\result4\Line\Line-jxh1[mm]-jxw0.9[mm]-cw0.24[mm]-normB.png']);
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
model.result.export('img2').set('pngfilename', ['D:\' native2unicode(hex2dec({'5b' '66'}), 'unicode')  native2unicode(hex2dec({'4e' '60'}), 'unicode')  native2unicode(hex2dec({'8d' '44'}), 'unicode')  native2unicode(hex2dec({'65' '99'}), 'unicode') '\' native2unicode(hex2dec({'78' '14'}), 'unicode')  native2unicode(hex2dec({'7a' '76'}), 'unicode')  native2unicode(hex2dec({'75' '1f'}), 'unicode')  native2unicode(hex2dec({'96' '36'}), 'unicode')  native2unicode(hex2dec({'6b' 'b5'}), 'unicode') '\' native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'4f' '53'}), 'unicode')  native2unicode(hex2dec({'5b' '9e'}), 'unicode')  native2unicode(hex2dec({'9a' '8c'}), 'unicode')  native2unicode(hex2dec({'5b' 'a4'}), 'unicode') '\1' native2unicode(hex2dec({'5c' '0f'}), 'unicode')  native2unicode(hex2dec({'8b' 'ba'}), 'unicode')  native2unicode(hex2dec({'65' '87'}), 'unicode') '1\0matlab' native2unicode(hex2dec({'80' '54'}), 'unicode')  native2unicode(hex2dec({'8c' '03'}), 'unicode') '\model2\result4\picture\Picture-jxh1[mm]-jxw0.9[mm]-cw0.24[mm]-normB.png']);
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

out = model;
