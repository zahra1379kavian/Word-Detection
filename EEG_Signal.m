close all
clear
clc

load1 = load('SubjectData1.mat');
trainn = load1.train;
%trainn = load1.test;
%%
%%%%calcue frequency

samplefreq = 1/(trainn(1,2)-trainn(1,1));
fs = samplefreq;
%%
%%%%plot signal with DC

for i = 2:9
    figure
    HalfBandFFT(trainn(i,:),fs);
    title("channel"+(i-1));
end

%%
close all
%%%%Occupied bandwidth for electrods

for i = 2:9
    figure
   obw(trainn(i,:),fs);
end

%%
close all
%%%%remove DC signal and filter it.

d = load('bandpassfilter.mat');
d = cell2mat(struct2cell(d));
N = 100000;
Fs = 256;

train = trainn(2:9,:);
NoDC = train -mean(train);

for i = 2:1:9
    train_NoDC(i-1,:) = filtfilt(d,1,NoDC(i-1,:));
end

%%
close all
clc

%%%%Change the sampling rate

factor = 2;

for i = 1:8
    x_downsampled = dwnsmpl(train_NoDC(i,:),factor);
    newdata(i,:) = x_downsampled;
end

%%
close all
clc

%%%%epoching

inputsignal = newdata;
backwardsample=0.2;
forwardsample=0.8;
stimuli = dwnsmpl(trainn(10,:),2);

epchmatrix = epoching(inputsignal,backwardsample,forwardsample,stimuli,fs/2);
%save('epochSubjectData3train','epchmatrix')
save('epochSubjectData3test','epchmatrix')

