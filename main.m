clc;clear;close all;
load outside_full_wellTrimmed;
load Clear_OutSide;

XGridNum=20;
YGridNum=30;
angleGridNum=180;
tar=12;
icpGridStep=0.004;
overlap=0.3;
%% 网格大小
XLimit=fullTrimmedOutside.XLimits;
YLimit=fullTrimmedOutside.YLimits;
XLimit=[-0.2 0.2];
YLimit=[-0.2 0.1];
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


dSFullCloud=pcdownsample(fullTrimmedOutside,'gridAverage',icpGridStep);
IcpModel=[dSFullCloud.Location'.*s;ones(1,dSFullCloud.Count)];
modelNs=createns(dSFullCloud.Location,'nsmethod','kdtree');
dSTarClouds=pcdownsample(clouds{tar},'gridAverage',icpGridStep);
IcpData=[dSTarClouds.Location'.*s;ones(1,dSTarClouds.Count)]; 
% parfor i=1:TNum
tic
parfor i=1:TNum
    for j=1:RNum
        currMotion=[[RList{j},TList{i}];0 0 0 1];
        realMotion=currMotion;
        realMotion(1:3,4)=currMotion(1:3,4).*s;
%         load outsideGRT;
%         realMotion=MotionGrt{tar};        
        MSE(i,j)=calMse(modelNs,IcpData,realMotion,overlap);
    end
%     if(mod(i,100)==0)
%         disp(['   ' num2str(i/Tnum*100) '% completed!'] );
%     end
end
toc
min(min(MSE))

