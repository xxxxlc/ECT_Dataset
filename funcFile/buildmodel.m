function [outputArg1] = buildmodel(filename)
%BUILDMODLE 此处显示有关此函数的摘要
%   调用COMSOL，对所产生的介质随机流形矩阵进行计算


model = mphopen('c');
%model.component("comp1").geom('geom1').image();
model.func.create('int2', 'Interpolation');
model.func('int2').set('source', 'file');
model.func('int2').set('filename',filename);
%model.func('int2').image().set("pngfilename", ".\data_test_result\physics.png");
%model.func('int2').image().export();
model.component("comp1").material("mat2").propertyGroup('def').set('relpermittivity', 'int2(x,y)');

model.study('std1').run
M = mphevalglobalmatrix(model,'es.C','dataset','dset2','trans','maxwellmutual');
outputArg1 = M;
end

