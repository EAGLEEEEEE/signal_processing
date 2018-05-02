[y,Fs]=audioread('worship1.mp3'); %读出信号，采样率和采样位数。
%sound(y,Fs);
y=y(:,1); 
figure(1)
%title('魔王声音快速傅里叶分析与时域分析','FontSize',20);

sigLength=length(y); 
t=(0:length(y)-1)/Fs; %计算时间轴
%subplot(3,1,1);plot(t,y);xlabel('Time(s)');
grid on;
n=0:sigLength-1;
Y= fft(y,length(y)); %在sigLength这个有限区间内做快速傅立叶变换 
mag=abs(Y);
f=Fs*n/sigLength;
f=log10(f);
subplot(2,1,1);plot(f,abs(Y));
%title('儿子声音快速傅里叶分析与时域分析','FontSize',20);
xlabel('Frequency(10^x Hz)','FontSize',20);
axis([-1,5,0,1000]);
grid on;
subplot(2,1,2);
xifft=ifft(Y);
%sound(xifft,Fs);
plot(t,xifft);xlabel('Time(s)','FontSize',
axis([0,6,-0.4,0.4]);
%gtext('魔王声音快速傅里叶分析与时域分析','FontSize',20);

grid on;
figure(2)
Nw=20;          %窗函数长 window length
L=Nw/2;         %窗函数每次移动的样点数
Ts=round((sigLength-Nw)/L)+1;     %计算把数据y共分成多少段
nfft=512;        % FFT的长度
TF=zeros(Ts,nfft);  %将存放三维图谱，先清零
for i=1:Ts
    xw=y((i-1)*L+1:i*L+L);   %取一段数据
    temp=fft(xw,nfft);       % FFT变换
    %temp=fftshift(temp);     %频谱以0频为中心
    TF(i,:)=temp;            %把谱图存放在TF中 代表TF矩阵中的第i行
end
fn=(1:nfft)*Fs/nfft;
tn=(1:Ts)*Nw/2/Fs;
[T,F]=meshgrid(tn,fn);
mesh(T,F,abs(TF.'));  %三维绘图
axis tight;
title('三维时频图-魔王'); 
ylabel('Frequency(Hz)'); 
xlabel('Time(s)'); 
zlabel('Volume');
grid on;
