Fs = 100 %sampling freq
fm=1; %message freq
fc=10; %carrier freq
Ac=1; %amplitude carrier
Am=1; %amplitude message
ka=0.5; %amplitude sensitivity 2k2/k1
t=0:0.02:5;
m=Am*sin(2*pi*fm*t);
c=Ac*cos(2*pi*fc*t);
s=Ac*(1+ka*m).*c;
%square law demodulator
squared =s.*s; %square law operation
%filter
order_par=4;
d =
designfilt('lowpassfir','FilterOrder',6,'CutoffFrequency',fm,'Sample
Rate',Fs); %low pass filter
filt_data=filter(d,squared);
demod_m=sqrt(2*filt_data)-1;
figure(1)
subplot(211)
plot(t,s,'g')
xlabel('Time---->');
ylabel('Amplitude------->');
title('Amplitude Modulated Signal');
subplot(212)
plot(t,demod_m,'r')
xlabel('Time---->');
ylabel('Amplitude------->');
title('Message signal');