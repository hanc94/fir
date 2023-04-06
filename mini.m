
    %Canción sin ruido
name='cancion_flauta.wav';
[y,Fs] = audioread(name);
muestras=length(y);
nfft=2^nextpow2(muestras);
y_tf=fft(y,nfft);
y_tff=y_tf/muestras;
z=(nfft/2)+1;
x_tf=Fs/2*linspace(0,1,z);
hold on
    %Canción con ruido
name2='cancion_ruido.wav';
[y2,Fs2] = audioread(name2);
muestras2=length(y2);
nfft2=2^nextpow2(muestras2);
y_tf2=fft(y2,nfft2);
y_tff2=y_tf2/muestras2;
z2=(nfft2/2)+1;
x_tf2=Fs2/2*linspace(0,1,z2);

    %Gráfica
%figure(1);
%plot(x_tf2,2*abs(y_tff2(1:z2)),'g',x_tf,2*abs(y_tff(1:z)),'r')
% grid on;
% legend('Sin Ruido','Con Ruido');
% xlabel('Frecuencia [Hz]');
% title('Análisis Espectral');

%Filtro IIR


%fc=2000;
%[b,a]=butter(18,fc/(Fs/2));
% freqz(b,a);
% hold on

%audio=filter(b,a,y2);
%sound(audio,Fs)


%Filtro FIR
n=-1000:1000;
w=2*pi*(2000/Fs);
filtro=((w)/(pi))*sinc((w/pi)*n);
freqz(filtro);
hold on

audio2=filter(filtro,1,y2);
%sound(audio2,Fs)

