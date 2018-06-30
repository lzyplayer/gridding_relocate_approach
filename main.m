clc;clear;close all;
load outside_full_wellTrimmed;
load Clear_OutSide;

XGridNum=40;
YGridNum=50;
angleGridNum=180;
%% 网格大小
XLimit=fullTrimmedOutside.XLimits;
YLimit=fullTrimmedOutside.YLimits;
[XGrid,YGrid,angleGrid]=calGrid(XLimit,XGridNum,YLimit,YGridNum,angleGridNum);

%% 生成地图
TList=translationGenerate(XGrid,XLimit,XGridNum,YGrid,YLimit,YGridNum);
RList=RotationGenerate%%%%%%%%%%