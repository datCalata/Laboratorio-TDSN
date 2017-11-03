%2.2
[x ,fs ] = audioread('reverb.wav');
soundsc(x,fs);
%2.3.1
g=0.7;
m=20;
%z=tf('z')
%syms  n w
num = (g*z^(-m));
den=(1 - g*z^(-m));
Hz = num/den;
%pzmap(Hz)
%h=iztrans(Hz, n)
%Hw= fourier(h)
%ezplot((Hw))
B=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,g];
A=[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-g];
zplane(B,A)
[h,n]=impz(B,A);
stem(h,n)
[H,w]= freqz(B,A);
mod=20*log10(abs(H));
fase=angle(H);
plot(mod)
figure
plot(fase)
%2.3.2
y =comb(g,m,x)