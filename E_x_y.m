clear all;clc;
path='I:\VSimLecture_201408\examples\lesson1\HEMP1D\';
str1='HEMPTest2';
str2='EField'
%a=hdf5info([path,'simplebeam22_electron_177.h5'])
%mydata=hdf5read('I:\VSimLecture_201408\examples\lesson1\HEMP\simplebeam22_electrons_177.h5','/electrons')
%总的文件夹数
%avi_object=VideoWriter('I:\VSimLecture_201408\examples\lesson1\HEMP\movie_Ex.avi');
%open(avi_object);
T=400;
dt=1*10^(-11)*100;
Lx=901;
Ly=51;
Ky=101;
X=90;
Y=2.5;
x=linspace(0,X,Lx);
y=linspace(-Y,Y,Ly);
for i=1:T
Fig=figure;
 %标准化输入
 str3=num2str(i);
 input=[path,str1,'_',str2,'_',str3,'.h5']
 data=hdf5read(input,['/',str2]);
 %data=hdf5read(input,'/electron');
Ex=reshape(data(1,:,:),Ly,Lx);
Ey=reshape(data(2,:,:),Ly,Lx);
Ez=reshape(data(3,:,:),Ly,Lx);
E=sqrt(Ez.^2);
%去噪点
% if(dt*i>2*10^(-7))
%    E(E(1:20,:)>20000)=20000; 
% end
% if(dt*i>3*10^(-7))
%    E(E(1:60,:)>20000)=20000; 
% end

imagesc(x,y,interp2(E))

pbaspect([3,1,1])
 xlim([0 90])
 ylim([-2.5 2.5])
 box on;
 xlabel('\fontsize{12} x/m')
 set(gca,'xminortick','on')
 ylabel('\fontsize{12} y/m')
 set(gca,'yminortick','on')
 % axis square;
 
  min1=min(min(E)); %vpa设置有效数字
  max1=max(max(E));
  LL= linspace(min1,max1,5);
 p=colorbar('YTick',LL);
 TLL=arrayfun(@(x) sprintf('%.0f',x),LL,'un',0)%修改显示位数
 set(p,'TickLabels',TLL)
 colormap(jet(100))
 set(get(p,'label'),'string','\fontsize{12} |E_z|/(vm^{-1})')


%  if(i*dt<4.9*10^(-7))
%  caxis('auto');
%  else
%  caxis([0 25000]);
%  LL=linspace(0,25000,5);
%   p=colorbar('YTick',LL);
%  end
 

hold off;
t(i)=dt*i;
title(['t=',num2str(t(i)),'ns'])
  frame = getframe(Fig); 
     im = frame2im(frame); 
     [imind,cm] = rgb2ind(im,256);
      if(i==1)% this value should be i_min
         imwrite(imind,cm,[path,'E_z'],'gif','WriteMode','overwrite', 'Loopcount',inf);
     else
         imwrite(imind,cm,[path,'E_z'],'gif','WriteMode','append','DelayTime',0.01);
      end
      close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% amplitude
Fig=figure;
 
 ExMonitor=E(21,:);
 
 plot(x,ExMonitor,'k');
pbaspect([3,1,1]) % length-width ratio 
 
%plot(x,ExMonitor)
xlabel('x/m')
ylabel('E/vm^{-1}')
ylim([0 27000])
 
 
 t(i)=dt*i;
title(['t=',num2str(t(i)),'ns'])
  frame = getframe(Fig); 
     im = frame2im(frame); 
     [imind,cm] = rgb2ind(im,256);
      if(i==1)% this value should be i_min
         imwrite(imind,cm,[path,'EMonitor'],'gif','WriteMode','overwrite', 'Loopcount',inf);
     else
         imwrite(imind,cm,[path,'EMonitor'],'gif','WriteMode','append','DelayTime',0.01);
      end
 

      
      
      
%M = getframe;
% the M is writed to avi_object by writeVideo function 
   % writeVideo(avi_object, M);
%saveas(gcf,[path,[str2,num2str(i)]],'png'); 
 close
 end
%close(avi_object)        
