fs = 1000; %sampling frequency
fc = 10; %carrier frequency
fm = 1; %message frequency
am = 1; %amplitude of message signal
ac = 2; %amplitude of carrier signal
t = 0:0.001:5; %time for x axis
m = am*cos(2*pi*fm*t); %message signal
c = ac*cos(2*pi*fc*t); %carrier signal
%Step1: Adding message and carrier to generate v1
v1 = m+c; %summer
%Step2: Passing v1 into non-linear device
a1 = 0.9;
a2 = 0.2;
v2 = a1*v1 + a2*(v1.^2); %non-linear device
[b,a]=butter(1,[((fc-fm)/fs),((fc+fm)/fs)]);%butterworth band pass filter
to generate transfer coefficients
y=filter(b,a,v2); %applying transfer to v2
figure(1)
subplot(211)
plot(t,m,'g')
xlabel('Time---->');
ylabel('Amplitude------->');
title('Message signal');
subplot(212)
plot(t,c,'r')
xlabel('Time---->');
ylabel('Amplitude------->');
title('Carrier signal');
figure(2)
subplot(211)
plot(t,v1)
xlabel('Time---->');
ylabel('Amplitude------->');
title('Output of adder');
subplot(212)
plot(t,v2)
xlabel('Time---->');
ylabel('Amplitude------->');
title('output of non linear device');
plot(t,y)
xlabel('Time---->');
ylabel('Amplitude------->');
title('AM modulated signal');