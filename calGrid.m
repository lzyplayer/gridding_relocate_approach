function [ Xgrid ,Ygrid ,angleGrid ] = calGrid( Xlim ,xGnum ,Ylim,yGnum ,angleGnum )
%CALGRID 此处显示有关此函数的摘要
%   此处显示详细说明
angleGrid=(2*pi)/angleGnum;
Xgrid=(Xlim(2)-Xlim(1))./xGnum;
Ygrid=(Ylim(2)-Ylim(1))./yGnum;

end

