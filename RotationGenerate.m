function [rotList] = RotationGenerate(grid)
%ROTATIONGENERATE 此处显示有关此函数的摘要
%   此处显示详细说明
rotList=cell((2*pi/grid),1);
i=1;
for step=0:grid:(2*pi)
    rotList{i}=OulerToRota([0 0 step]);
    i=i+1;
end

