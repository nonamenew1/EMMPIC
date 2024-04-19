clear all;clc;close all;
path='F:\Vism_NEMP\Bethe_McElatic_2D\';
path1='F:\Vism_NEMP\Bethe_McElastic\';
str1='equlibrium1';
str2='edgeE'
path_in='F:\Vism_NEMP\Effect_2D\1D_2D\'
str4='equlibrium1';
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
Ex_2D=reshape(data(1,:,:),Ly,Lx)*1e2;
Ey_2D=reshape(data(2,:,:),Ly,Lx);
Ez_2D=reshape(data(3,:,:),Ly,Lx)*1e2;
%imagesc(x,y,interp2(Ex))
 input1=[path1,str4,'_',str2,'_',str3,'.h5']
 data1=hdf5read(input1,['/',str2]);
 %data=hdf5read(input,'/electron');
Ex_1D=reshape(data1(1,:,:),Ly,Lx)*1e2;
Ey_1D=reshape(data1(2,:,:),Ly,Lx);
Ez_1D=reshape(data1(3,:,:),Ly,Lx)*1e2;
% pbaspect([3,1,1]) % length-width ratio 
% 
x=linspace(0,150,151);
plot(x,Ez_1D(ceil(end/2):end,ceil(end/2)),'r',x,-Ez_2D(ceil(end/2):end,ceil(end/2)),'k')
 xlim([0 150])
 ylim([-4000 800])
 axis square;
 box on;
 xlabel('\fontsize{16} x/m')
 set(gca,'xminortick','on')
 ylabel('\fontsize{16} E_x/(Vm^{-1})')
 set(gca,'yminortick','on')
 
 legend('\fontsize{16} 1D','\fontsize{16} 2D','location','SouthEastOutside')

set(gca,'fontsize',16)
min_Ez_1D(i)=min(Ez_1D(ceil(end/2),ceil(end/2):end));
min_Ez_2D(i)=min(Ez_2D(ceil(end/2),ceil(end/2):end))
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

% tt=linspace(1,200,200)*dt;
%  plot(tt,min_Ez_1D,'r',tt,min_Ez_2D,'k'); axis square;
%  box on;set(gca,'fontsize',16);
%   xlabel('\fontsize{16} t/s')
%  set(gca,'xminortick','on')
%  ylabel('\fontsize{16} E_x/(Vm^{-1})')
%  set(gca,'yminortick','on')
%  legend('\fontsize{16} 1D','\fontsize{16} 2D','location','SouthEastOutside')