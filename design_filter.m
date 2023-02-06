close all
clc
clear

N = 10^5;

load1 = load('bandpassfilter');
%load1 = load('bandPass_clustring');
h = cell2mat(struct2cell(load1));

gd = groupdelay(h,N);

%%
t = 0:1/100:10-1/100;
x = sin(2*pi*1*t);

figure
plot(t,x);

xgd = zphasefilter(x,h,gd);

hold on
plot(t,xgd);
legend('orginal signal','Filterd signal');




function gd = groupdelay(h,N)
xf = fft(h,N);
n= 0:1:length(h)-1;
x1 = h.*n;
x2 = fft(x1,N);
gd2 = real(x2./xf);
w = linspace(0,pi,length(gd2));
figure
plot(w,gd2);
figure
gd = grpdelay(h,N);
[h1,w] = freqz(h,N);
plot(w/pi,gd);
end

function xgd = zphasefilter(x,h,gd)
Lm = length(x);
x = repmat(x,1,2);

s = filter(h,1,x);
Lgd = gd(1);

xgd(1,1:Lgd) = 0;
xgd(1,Lgd+1:Lm) = x(Lgd+1:Lm);

end
