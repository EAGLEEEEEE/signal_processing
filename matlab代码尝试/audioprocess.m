clf,clear;
%% ���ֶ�ȡ
[y,Fs]=audioread('worship1.mp3'); %�����źţ������ʺͲ���λ����
%sound(y,Fs);
y=y(:,1); 
figure(1)
title('��� ������','FontSize',15);
%% ���ֳ���������� ���y3
% sigLength=length(y); 
% default=5000;
% y2=zeros(sigLength+default,1);
% y2(default+1:sigLength+default,1)=y(:,1);
% y(sigLength+default,1)=0;
% y3=y+y2*0.3;
% sound(y3,Fs);
% pause;
% t=(0:length(y)-1)/Fs; %����ʱ����
% sigLength=sigLength+default;
%% ����ѹ��
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
%% ���ֲ���
% audiowrite('worship_sample.wav',y_samp,Fs/degreeofcompress);
% sound(y_samp,Fs/degreeofcompress);
% pause;
%% ���ֲ�ֵ
% T=1:1:length(y_samp);
% T_inter=1:1:10*length(y_samp);
% y_inter=interp1(T,y_samp,T_inter);
% sound(y_inter,Fs/degreeofcompress);
% pause;
%% ���ָ���Ҷ�任 ����������
% n=0:sigLength-1;
% Y= fft(y,length(y)); %��sigLength������������������ٸ���Ҷ�任 
% mag=abs(Y);
% f=Fs*n/sigLength;
% f=log10(f);
% plot(f,abs(Y));
% xlabel('Frequency(10^x Hz)','FontSize',20);
%% �����˲�
% f_N=Fs; %������
% %���Ҫ��ָ��
% f_p=500;%ͨ����ֹƵ��
% f_s=1000;%�����ֹƵ��
% R_p=3;%ͨ�����˥��
% R_s=25;%������˥��   
% Ws=f_s/(f_N/2);
% Wp=f_p/(f_N/2);      %�����һ����Ƶ��
% [n, Wn]=buttord(Wp,Ws,R_p,R_s);      %��������ͽ�ֹƵ��
% [b,a]=butter(n, Wn);                  %����  
% freqz(b,a, 1000, 8000) %����H(z)�ķ�Ƶ��Ƶͼ, freqz(b,a, �������, ������)  
% %subplot(2,1,1); 
% axis([0 4000 -30 3]) 
% y_filed=filtfilt(b,a,y);%�������˲���
% sound(y_filed*1.5,Fs);
% audiowrite('worship_filed.wav',y_samp*1.5,Fs);
%% ����2.0
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
