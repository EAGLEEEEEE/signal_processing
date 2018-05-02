clf,clear;
%% 音乐读取
[y,Fs]=audioread('worship1.mp3'); %读出信号，采样率和采样位数。
%sound(y,Fs);
y=y(:,1); 
figure(1)
title('崇拜 梁静茹','FontSize',15);
%% 音乐初步处理回声 输出y3
% sigLength=length(y); 
% default=5000;
% y2=zeros(sigLength+default,1);
% y2(default+1:sigLength+default,1)=y(:,1);
% y(sigLength+default,1)=0;
% y3=y+y2*0.3;
% sound(y3,Fs);
% pause;
% t=(0:length(y)-1)/Fs; %计算时间轴
% sigLength=sigLength+default;
%% 音乐压缩
% degreeofcompress=2;
% sizeofy_samp=length(y);
% sizeofy_samp=floor(sizeofy_samp/degreeofcompress);
% y_samp=zeros(sizeofy_samp,1);
% for i=1:floor(sigLength/degreeofcompress)
%     y_samp(i,1)=y(i*degreeofcompress,1);
% end
% sound(y_samp,Fs);
% pause;
% audiowrite('worship_compressed.wav',y_samp,Fs);
%% 音乐采样
% audiowrite('worship_sample.wav',y_samp,Fs/degreeofcompress);
% sound(y_samp,Fs/degreeofcompress);
% pause;
%% 音乐差值
% T=1:1:length(y_samp);
% T_inter=1:1:10*length(y_samp);
% y_inter=interp1(T,y_samp,T_inter);
% sound(y_inter,Fs/degreeofcompress);
% pause;
%% 音乐傅里叶变换 好像有问题
% n=0:sigLength-1;
% Y= fft(y,length(y)); %在sigLength这个有限区间内做快速傅立叶变换 
% mag=abs(Y);
% f=Fs*n/sigLength;
% f=log10(f);
% plot(f,abs(Y));
% xlabel('Frequency(10^x Hz)','FontSize',20);
%% 音乐滤波
% f_N=Fs; %采样率
% %设计要求指标
% f_p=500;%通带截止频率
% f_s=1000;%阻带截止频率
% R_p=3;%通带最大衰减
% R_s=25;%阻带最大衰减   
% Ws=f_s/(f_N/2);
% Wp=f_p/(f_N/2);      %计算归一化角频率
% [n, Wn]=buttord(Wp,Ws,R_p,R_s);      %计算阶数和截止频率
% [b,a]=butter(n, Wn);                  %计算  
% freqz(b,a, 1000, 8000) %作出H(z)的幅频相频图, freqz(b,a, 计算点数, 采样率)  
% %subplot(2,1,1); 
% axis([0 4000 -30 3]) 
% y_filed=filtfilt(b,a,y);%这里是滤波了
% sound(y_filed*1.5,Fs);
% audiowrite('worship_filed.wav',y_samp*1.5,Fs);
%% 回声2.0
a0=1;
a1=0.8;
a2=0.6;
T=1/Fs;
t=0:T:length(y)/Fs;
h=a0*mydelta(t-0.2)+a1*mydelta(t-0.4)+a2*mydelta(t-0.6);
y_echo=T*conv(y,h);
sound(y_echo,Fs);
audiowrite('worship_echo2.wav',y_echo,Fs);
subplot(1,2,1);
plot(y);
subplot(1,2,2);
plot(y_echo);
%% 
