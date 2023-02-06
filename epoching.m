function epchmatrix = epoching(inputsignal,backwardsample,forwardsample,stimuli,fs)
backdata = floor(backwardsample*fs);
forwarddata = floor(forwardsample*fs);

s1 = find(stimuli~=0);
s2 = s1;
for i=1:1:length(s1)
    if i~=1
        if(s1(i)-s1(i-1)>1)
            s2(i)=-1;
        end
    end
    if i==1
        s2(i)=-1;
    end
end

s3 = find(s2 == -1);
stimuli = s1(s3);

for i = 1:length(stimuli)
    n1 = stimuli(i)-backdata;
    n2 = stimuli(i)+forwarddata;

    epchmatrix(1,i,:) = inputsignal(1,n1:n2);
    epchmatrix(2,i,:) = inputsignal(2,n1:n2);
    epchmatrix(3,i,:) = inputsignal(3,n1:n2);
    epchmatrix(4,i,:) = inputsignal(4,n1:n2);
    epchmatrix(5,i,:) = inputsignal(5,n1:n2);
    epchmatrix(6,i,:) = inputsignal(6,n1:n2);
    epchmatrix(7,i,:) = inputsignal(7,n1:n2);
    epchmatrix(8,i,:) = inputsignal(8,n1:n2);
end
end