[y,Fs]=audioread('worship1.mp3'); %�����źţ������ʺͲ���λ����
%sound(y,Fs);
y=y(:,1); 
figure(1)
%title('ħ���������ٸ���Ҷ������ʱ�����','FontSize',20);

sigLength=length(y); 
t=(0:length(y)-1)/Fs; %����ʱ����
%subplot(3,1,1);plot(t,y);xlabel('Time(s)');
grid on;
n=0:sigLength-1;
Y= fft(y,length(y)); %��sigLength������������������ٸ���Ҷ�任 
mag=abs(Y);
f=Fs*n/sigLength;
f=log10(f);
subplot(2,1,1);plot(f,abs(Y));
%title('�����������ٸ���Ҷ������ʱ�����','FontSize',20);
xlabel('Frequency(10^x Hz)','FontSize',20);
axis([-1,5,0,1000]);
grid on;
subplot(2,1,2);
xifft=ifft(Y);
%sound(xifft,Fs);
plot(t,xifft);xlabel('Time(s)','FontSize',
axis([0,6,-0.4,0.4]);
%gtext('ħ���������ٸ���Ҷ������ʱ�����','FontSize',20);

grid on;
figure(2)
Nw=20;          %�������� window length
L=Nw/2;         %������ÿ���ƶ���������
Ts=round((sigLength-Nw)/L)+1;     %���������y���ֳɶ��ٶ�
nfft=512;        % FFT�ĳ���
TF=zeros(Ts,nfft);  %�������άͼ�ף�������
for i=1:Ts
    xw=y((i-1)*L+1:i*L+L);   %ȡһ������
    temp=fft(xw,nfft);       % FFT�任
    %temp=fftshift(temp);     %Ƶ����0ƵΪ����
    TF(i,:)=temp;            %����ͼ�����TF�� ����TF�����еĵ�i��
end
fn=(1:nfft)*Fs/nfft;
tn=(1:Ts)*Nw/2/Fs;
[T,F]=meshgrid(tn,fn);
mesh(T,F,abs(TF.'));  %��ά��ͼ
axis tight;
title('��άʱƵͼ-ħ��'); 
ylabel('Frequency(Hz)'); 
xlabel('Time(s)'); 
zlabel('Volume');
grid on;
