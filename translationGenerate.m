function [ transList ] = translationGenerate( XGrid,XLimit,XGridNum,YGrid,YLimit,YGridNum )
%TRANSLATIONGENERATE 此处显示有关此函数的摘要
%   此处显示详细说明
transList=cell(XGridNum*YGridNum+100,1);
i=1;
for Xtag=XLimit(1):XGrid:XLimit(2)
    for Ytag=YLimit(1):YGrid:YLimit(2)
        transList{i}=[Xtag , Ytag,0]';
        i=i+1;
    end
end


% kron([1;2;3;4],[1;2;3;4]);
