% señal para comparacion 
w= [3 5 7];
% imagen o señal 
I=[3 2 4 1 3 8 4 0 3 8 0 7 7 7 1 2 ];

% make  a w matrix

Mw= diag( w(1)*ones(1,numel (I)-1),-1)+ diag( w(2)*ones(1,numel (I)),0)+diag( w(3)*ones(1,numel (I)-1),+1);
p= double(Mw ~=0);


% primera aproximacion 

corr_1= conv(I,fliplr(w),'same');
%I*Mw'
% ploteo stem (corr_1)
% segunda aproximacion
corr_2= sum(p.*(Mw-ones(16,1)*I).^2,2)';

% tercera aproximacion

s_II= sqrt(sum ((p.*(ones(16,1)*I)).^2,2))';
s_ww= sqrt(sum(w.^2));
corr_3 = corr_1/s_ww./s_II;

%% 
time= linspace(-10,50,1000);
Ts= diff(time(1:2));
Fs= 1/Ts;
signal1= sinc(time);
signal2= sinc(time-30)+0.05*rand(1,1000);

figure,
subplot(311),plot( time,signal1,'k');
subplot(312),plot( time,signal2,'b');
[acor , lag]= xcorr(signal1,signal2);
[~,I]= max (abs(acor));
lagdiff= lag(I);
timediff= lagdiff/Fs;
subplot (313), plot(time+timediff,signal2,'r');




