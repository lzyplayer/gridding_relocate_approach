function [Mse]=calMse(curNs,data,initialMotion,minTrim)
%myTrimICP  ICP�ü�
%curNSΪ��ǰsģ�͵���KD��
%��ʼ�˶���
maxTrim=1;

scan=initialMotion*data;

[corr,distance] = knnsearch(curNs,scan(1:3,:)');
minLength = floor(minTrim*length(corr));
maxLength = ceil(maxTrim*length(corr));
dtNorm2 = sortrows(distance.^2);
dtNorm2 = cumsum(dtNorm2);
dtTable = [minLength:maxLength];
resultMSE = dtNorm2(minLength:maxLength)'./dtTable;
resultObject = ObjectiveFunction(resultMSE,dtTable./maxLength);
[~,indexNum] = min(resultObject);

Mse=resultMSE(indexNum);


end
