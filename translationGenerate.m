function [ transList ] = translationGenerate( XGrid,XLimit,XGridNum,YGrid,YLimit,YGridNum )
%TRANSLATIONGENERATE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
transList=cell(XGridNum*YGridNum+100,1);
i=1;
for Xtag=XLimit(1):XGrid:XLimit(2)
    for Ytag=YLimit(1):YGrid:YLimit(2)
        transList{i}=[Xtag , Ytag,0]';
        i=i+1;
    end
end


% kron([1;2;3;4],[1;2;3;4]);
