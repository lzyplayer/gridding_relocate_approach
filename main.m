clc;clear;close all;
load outside_full_wellTrimmed;
load Clear_OutSide;

XGridNum=40;
YGridNum=50;
angleGridNum=180;
tar=12;
icpGridStep=0.04;
overlap=0.3;
ICPthreashold=5;
%% 网格大小
fullTrimmedOutside=fullTrimmedOutside;
XLimit=fullTrimmedOutside.XLimits;
YLimit=fullTrimmedOutside.YLimits;
[XGrid,YGrid,angleGrid]=calGrid(XLimit,XGridNum,YLimit,YGridNum,angleGridNum);

%% 生成地图
TList=translationGenerate(XGrid,XLimit,XGridNum,YGrid,YLimit,YGridNum);
RList=RotationGenerate(angleGrid);%仅z轴

%% 枚举
RNum=length(RList);
TNum=length(TList);
MotionList=cell(TNum,RNum);
MseResult=cell(TNum,RNum);
MSE=zeros(TNum,RNum);
tic
% parfor i=1:TNum
dSFullCloud=pcdownsample(fullTrimmedOutside,'gridAverage',icpGridStep);
IcpModel=[dSFullCloud.Location'.*s;ones(1,dSFullCloud.Count)];
modelNs=createns(dSFullCloud.Location,'nsmethod','kdtree');

parfor i=1:TNum
    for j=1:RNum
        currMotion=[[RList{j},TList{i}];0 0 0 1];
        realMotion=currMotion;
        realMotion(1:3,4)=currMotion(1:3,4).*s;
        dSTarClouds=pcdownsample(clouds{tar},'gridAverage',icpGridStep);
        IcpData=[dSTarClouds.Location'.*s;ones(1,dSTarClouds.Count)];    
%         load outsideGRT
%         realMotion=MotionGrt{tar};        
        [~,MSE(i,j)]=myTrimICP(modelNs,IcpModel,IcpData,realMotion,ICPthreashold,overlap);
    end
end
toc

