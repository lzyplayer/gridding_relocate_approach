function [ Xgrid ,Ygrid ,angleGrid ] = calGrid( Xlim ,xGnum ,Ylim,yGnum ,angleGnum )
%CALGRID �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
angleGrid=(2*pi)/angleGnum;
Xgrid=(Xlim(2)-Xlim(1))./xGnum;
Ygrid=(Ylim(2)-Ylim(1))./yGnum;

end

