
%% csvȫ�����Ƹ�����ֵ��׼

   for i=1:size(icpList,1)
        GrtM{i}=[icpList(i,1:4);icpList(i,5:8);icpList(i,9:12);icpList(i,13:16)];
   end
%    GrtM=GrtM';
   
%% ��ֵ���
%scannum=length(clouds);
% for i=1:scannum
%     Data_{i}=clouds{i}.Location;    
% end
% RotErr=0;
% TranErr=0;
% scannum=length(GrtR);
% for i=1:scannum
%     RotErr=norm((p(i).M(1:3,1:3)-GrtR{i}),'fro')+RotErr;
%     TranErr=norm((p(i).M(1:3,4)-GrtT{i}),2)+TranErr;
% end
% RotErr=RotErr/scannum
% TranErr=TranErr/scannum
%  RotLogErr=log(RotErr)


% clc;
% close all;
% clear;

%% ��ȡչʾ����
% datapath='./data/red_room/map2.ply';
% clouds=pcread(datapath);
% pcshow(clouds);

%% ���pointcloud�ֱ���(gridStep)
filepath='./data/global_frame_ap/';
prefix='PointCloud';
clouds=readCloudCsv(filepath,prefix,2,0,0);



%% չʾ��׼

% s=30;

for i=1:length(clouds)
    curMotion=p(i).M;
    curMotion(1:3,4)=curMotion(1:3,4)./s;
    pcshow(pctransform( colorful_clouds{i},affine3d(curMotion')));
    hold on;
end


%% ȫ��չʾ 
for i=1:length(clouds)
%     curMotion=p(i).M;
%     curMotion(1:3,4)=curMotion(1:3,4)./s;
    pcshow(pcdenoise(clouds{i}));
end



%����׼չʾ
pcshow(clouds{1});
hold on;

Tdata=inv(MotionGrt{2})*[clouds{2}.Location';ones(1,size(clouds{2}.Location,1))];
Tdata=Tdata';
pcshow(pointCloud(Tdata(:,1:3)));



%% ����
% for i=1:length(cloudsCopy)
% [clearClouds{i},inlinerOnes{i},outlierOnes{i}]=pcdenoise(cloudsCopy{i});
% end

%% չʾ����
% s=30;
% for i=1:length(cloudsCopy)
%     curMotion=p(i).M;
%     curMotion(1:3,4)=curMotion(1:3,4)./s;
%     pcshow(pctransform (pointCloud(cloudsCopy{i}.Location(outlierOnes{i},:)),affine3d(curMotion')));
%     hold on
% end


%% read Motion from posescaner
% for i=1:size(posescannerleica,1)
%     MotionGrt{i}=[posescannerleica(i,1:4);posescannerleica(i,5:8);posescannerleica(i,9:12);posescannerleica(i,13:16)];
% end

