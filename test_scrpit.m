% % gridstep=0.01;
% % readnum=31;
% % overlap = 0.4;
% % res= 1;
% % s=30;
% % filepath='./data/local_frame/';
% % filePrefix='Hokuyo_';
% % load trimOutside;
% % �Դ���׼Ч������
% % readyCloud1=pcdownsample(pcdenoise(clouds{4}),'gridAverage',gridstep);
% % readyCloud2=pcdownsample(pcdenoise(clouds{3}),'gridAverage',gridstep);
% % [motion,result]=pcregrigid(readyCloud2,readyCloud1,'Tolerance',[0.01/s,0.009]);
% % pcshow(result);
% % hold on;
% % 
% % ����չ��
% % pcshow(clouds{4});
% % hold on;
% % pcshow(pctransform(clouds{3},currMotion2next));
% 
% %����ICP���������ϻ��˶�
% d=13;
% m=14;
% readyCloud1=pcdownsample(pcdenoise(clouds{d}),'gridAverage',gridstep);
% readyCloud2=pcdownsample(pcdenoise(clouds{m}),'gridAverage',gridstep);
% ns=createns(readyCloud2.Location,'nsmethod','kdtree');
% motion=myTrimICP(ns,[readyCloud2.Location';ones(1,readyCloud2.Count)],[readyCloud1.Location';ones(1,readyCloud1.Count)],relativeMotion{m-1},50,0.35);
% pcshow(clouds{m});
% hold on;
% pcshow(pctransform(clouds{d},affine3d(motion')));
% 
% %% ȫ�ַ���չ�֣���·�������
% % ori=[0 0 0 ;100 100 100 ];%ȫ�ֹ۲ⷽ��
% ori=[0 0 0 ;0.01 0.01 0.01 ];
% 
% for i=1:length(MotionGlobal)
%     currOri=MotionGlobal{i}*[ori';ones(1,size(ori,1))];
%     eachOri{i}=currOri(1:3,:)';
%     plot3(eachOri{i}(:,1),eachOri{i}(:,2),eachOri{i}(:,3),'r-o')
%     hold on
% end

%% չʾ·��ͼ

route=[];
for p=1:length(MotionGrt)
    route=[route; MotionGrt{p}(1:3,4)'./s];
end
plot3(route(:,1),route(:,2),route(:,3),'-*');
xlabel('x');
ylabel('y');
zlabel('z');
% axis([-3000 3000 -3000 3000 -3000 3000 ]);
axis([-0.2 0.2 -0.2 0.2 -0.2 0.2 ]);

% 
% 
% %% ĳ��֡eigƥ��
% tic
% ModelCloud=clouds{1};
% DataCloud=clouds{28};
% gridStep=0.03;
% overlap=0.35;
% res=10;
% [tarDesp,tarSeed,tarNorm] = extractEig(ModelCloud,gridStep); 
% [srcDesp,srcSeed,srcNorm] = extractEig(DataCloud,gridStep);
% T = eigMatch(tarDesp,srcDesp,tarSeed,srcSeed,tarNorm,srcNorm,overlap,gridStep);
% T = inv(T);
% R0= T(1:3,1:3);
% t0= T(1:3,4);
% Model= ModelCloud.Location(1:res:end,:)';
% Data= DataCloud.Location(1:res:end,:)';
% [MSE,R,t] = TrICP(Model, Data, R0, t0, 100, overlap);
% Motion=Rt2M(R,t);
% Motion(1:3,4)=Motion(1:3,4);
% toc
% 
% 
% %չʾĳ֡�͵�һ֡��׼
% close all;
% tar=13;
% pcshow(clouds{tar});
% hold on;
% pcshow(pctransform(clouds{1},affine3d( MotionGlobal{tar}')));
% 
% 
% %% ĳ֡��ֵ�ȶ� 
% load outside_GRT;
% tar =28;
% src=1;
% realMotion=GrtM{src}\GrtM{tar};   % inv(GrtM{src})*GrtM{tar}
% norm(realMotion(1:3,1:3)-motionInfo{1,1}(1:3,1:3),'fro')
% norm(realMotion(1:3,4)-motionInfo{1,1}(1:3,4).*30,2)
% 
% %% �޼�fullCloud
% farpoints=fullcloud.Location(:,1)<-0.6 | fullcloud.Location(:,1)>0.6 | fullcloud.Location(:,2)<-0.75 |fullcloud.Location(:,2)>0.75 ;
% select=~farpoints;
% fullTrimmedOutside=pointCloud(fullcloud.Location(select,:));