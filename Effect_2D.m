clear all;clc;close all;
path='F:\Vism_NEMP\Bethe_McElastic\';
str1='equlibrium1';
str2='edgeE'
path_in='F:\Vism_NEMP\Effect_2D\1D\'
%a=hdf5info([path,'simplebeam22_electron_177.h5'])
%mydata=hdf5read('I:\VSimLecture_201408\examples\lesson1\HEMP\simplebeam22_electrons_177.h5','/electrons')
%总的文件夹数
% avi_object=VideoWriter('F:\Vism_NEMP\Bethe_McElatic_2D\movie_Ez.avi');
% open(avi_object);
T=200;
dt=1*10^(-11)*100;
Lx=301;
Ly=301;
Ky=101;
X=300;
Y=300;
x=linspace(-X/2,X/2,Lx);
y=linspace(-Y/2,Y/2,Ly);
for i=1:200
Fig=figure;
 %标准化输入
 str3=num2str(i);
 input=[path,str1,'_',str2,'_',str3,'.h5']
 data=hdf5read(input,['/',str2]);
 %data=hdf5read(input,'/electron');
Ex=reshape(data(1,:,:),Ly,Lx)*1e2;
Ey=reshape(data(2,:,:),Ly,Lx);
Ez=reshape(data(3,:,:),Ly,Lx)*1e2;
imagesc(x,y,interp2(Ez))
% 
% pbaspect([3,1,1]) % length-width ratio 
% 
 xlim([-150 150])
 ylim([-150 150])
 box on;
 xlabel('\fontsize{16} x/m')
 set(gca,'xminortick','on')
 ylabel('\fontsize{16} y/m')
 set(gca,'yminortick','on')
  axis square;
set(gca,'YDir','normal')
%   min1=min(min(Ez)); %vpa设置有效数字
%   max1=max(max(Ez));
min1=-5500;
max1=0;
%   LL= linspace(min1,max1,5);
  p=colorbar;
%  TLL=arrayfun(@(x) sprintf('%.0f',x),LL,'un',0)%修改显示位数
%  set(p,'TickLabels',TLL)
set(p,'Ylim',[-5e3,5e3])
  colormap(jet(100))
   set(gca,'fontsize',16)
 set(get(p,'label'),'string','\fontsize{16} E_z/(vm^{-1})')
% 
% 
%  
%  caxis('auto');
%  
% 
% hold off;
% t(i)=dt*i;
% title(['t=',num2str(t(i)),'ns'])
%   frame = getframe(Fig); 
%      im = frame2im(frame); 
%      [imind,cm] = rgb2ind(im,256);
%       if(i==1)% this value should be i_min
%          imwrite(imind,cm,[path,'Ez'],'gif','WriteMode','overwrite', 'Loopcount',inf);
%      else
%          imwrite(imind,cm,[path,'Ez'],'gif','WriteMode','append','DelayTime',0.05);
%       end
%       
%       close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% amplitude
%Am(i)=max(max(-Ex));
%Bm(i)=max(max(abs(Ex)));     
%       
%       
%  Fig=figure;
%  
%  ExMonitor=Ez(2,:);
%  
%  plot(x,ExMonitor,'k');
% pbaspect([3,1,1]) % length-width ratio 
%  
% %plot(x,ExMonitor)
% xlabel('x/m')
% ylabel('Ez/vm^{-1}')
% ylim([-7000 0])
%  
 dt=1e-12*2000/1e-9;
 t(i)=dt*i;
title(['t=',num2str(t(i)),'ns'])
%   frame = getframe(Fig); 
%      im = frame2im(frame); 
%      [imind,cm] = rgb2ind(im,256);
%       if(i==1)% this value should be i_min
%          imwrite(imind,cm,[path,'EzMonitor'],'gif','WriteMode','overwrite', 'Loopcount',inf);
%      else
%          imwrite(imind,cm,[path,'EzMonitor'],'gif','WriteMode','append','DelayTime',0.05);
%       end
 

M = getframe;
% the M is writed to avi_object by writeVideo function 
%     writeVideo(avi_object, M);
saveas(gcf,[path_in,num2str(i)],'png');
close
end
%  save('C:\Users\yjs\Desktop\avalanche\E_max.dat','E_max')
%  save('C:\Users\yjs\Desktop\avalanche\E_x.dat','E_x')
%  x=1:T;
%  plot(x,E_x,x,E_y,x,E_z,x,E_max)  
% legend('\fontsize{13} E_x','\fontsize{13} E_y','\fontsize{13} E_z','\fontsize{13} E')
% xlabel('t(ns)')
% ylabel('E(V/m)')
% axis square;