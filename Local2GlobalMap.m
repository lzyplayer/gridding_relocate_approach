function [ fullCloud ] = Local2GlobalMap( localCloud , MotionGlobal ,s ,mergeGrid )
%LOCAL2GLOBALMAP �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
fullCloud=localCloud{1};
for tar=2:length(localCloud)
    transMotion=MotionGlobal{tar};
    transMotion(1:3,4)=MotionGlobal{tar}(1:3,4)./s;
    TranCData= transMotion*[localCloud{tar}.Location';ones(1,localCloud{tar}.Count)];
    tcloud=pointCloud( TranCData(1:3,:)');
    fullCloud=pcmerge(fullCloud,tcloud,mergeGrid);
end
end

