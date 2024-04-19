clear all;clc;
path='I:\VSimLecture_201408\examples\lesson1\HEMP2D\';
str1='HEMPTest2';
str2='EField'
path_in='F:\Vism_NEMP\Effect_2D\2D\'
%a=hdf5info([path,'simplebeam22_electron_177.h5'])
%mydata=hdf5read('I:\VSimLecture_201408\examples\lesson1\HEMP\simplebeam22_electrons_177.h5','/electrons')
%总的文件夹数
%avi_object=VideoWriter('I:\VSimLecture_201408\examples\lesson1\HEMP\movie_Ex.avi');
%open(avi_object);
T=900;
dt=1*10^(-11)*100;
Lx=9001;
Ly=3;
Ky=101;
X=900;
Y=0.2;
x=linspace(0,X,Lx);
y=linspace(-Y,Y,Ly);
for i=1:T
Fig=figure;
 %标准化输入
 str3=num2str(i);
 input=[path,str1,'_',str2,'_',str3,'.h5']
 data=hdf5read(input,['/',str2]);
 %data=hdf5read(input,'/electron');
Ex=smooth(reshape(data(1,:,:),Ly,Lx),20);
Ey=smooth(reshape(data(2,:,:),Ly,Lx),20);
Ez=smooth(-reshape(data(3,:,:),Ly,Lx),20);
% imagesc(x,y,interp2(Ex))
% 
% pbaspect([3,1,1]) % length-width ratio 
% 
%  xlim([0 900])
%  ylim([-0.2 0.2])
%  box on;
%  xlabel('\fontsize{12} x/m')
%  set(gca,'xminortick','on')
%  ylabel('\fontsize{12} y/m')
%  set(gca,'yminortick','on')
%   %axis square;
%  
%   min1=min(min(Ez)); %vpa设置有效数字
%   max1=max(max(Ez));
%   LL= linspace(min1,max1,5);
%  p=colorbar('YTick',LL);
%  TLL=arrayfun(@(x) sprintf('%.0f',x),LL,'un',0)%修改显示位数
%  set(p,'TickLabels',TLL)
%  colormap(jet(100))
%  set(get(p,'label'),'string','\fontsize{12} E_z/(vm^{-1})')
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
%  
%  t(i)=dt*i;
% title(['t=',num2str(t(i)),'ns'])
%   frame = getframe(Fig); 
%      im = frame2im(frame); 
%      [imind,cm] = rgb2ind(im,256);
%       if(i==1)% this value should be i_min
%          imwrite(imind,cm,[path,'EzMonitor'],'gif','WriteMode','overwrite', 'Loopcount',inf);
%      else
%          imwrite(imind,cm,[path,'EzMonitor'],'gif','WriteMode','append','DelayTime',0.05);
%       end
%  
 close
  E_x(i)=max(max(Ex));
 E_y(i)=max(max(Ey));
 E_z(i)=max(max(Ez));
 E_max(i)=sqrt(E_x(i)^2+E_y(i)^2+E_z(i)^2);

end
 save('C:\Users\yjs\Desktop\avalanche\E_max.dat','E_max')
 save('C:\Users\yjs\Desktop\avalanche\E_x.dat','E_x')
 x=1:T;
 plot(x,E_x,x,E_y,x,E_z,x,E_max)  
legend('\fontsize{13} E_x','\fontsize{13} E_y','\fontsize{13} E_z','\fontsize{13} E')
xlabel('t(ns)')
ylabel('E(V/m)')
axis square;