close all
clear
clc

%detect Single Character Paradigm or Row-Column Paradigm

ld = load('SubjectData1');
subject1.test = ld.test;
subject1.train = ld.train;
subject1.s = parakind(subject1.test);


ld = load('SubjectData2');
subject2.test = ld.test;
subject2.train = ld.train;
subject2.s = parakind(subject2.test);

ld = load('SubjectData3');
subject3.test = ld.test;
subject3.train = ld.train;
subject3.s = parakind(subject3.test);

ld = load('SubjectData5');
subject5.test = ld.test;
subject5.train = ld.train;
subject5.s = parakind(subject5.test);

ld = load('SubjectData6');
subject6.test = ld.test;
subject6.train = ld.train;
subject6.s = parakind(subject6.test);

ld = load('SubjectData7');
subject7.test = ld.test;
subject7.train = ld.train;
subject7.s = parakind(subject7.test);

ld = load('SubjectData8');
subject8.test = ld.test;
subject8.train = ld.train;
subject8.s = parakind(subject8.test);

ld = load('SubjectData9');
subject9.test = ld.test;
subject9.train = ld.train;
subject9.s = parakind(subject9.test);

%%
clc
subject1.word = detectnum(subject1.train);
subject2.word = detectnum(subject2.train);
subject3.word = detectnum(subject3.train);
subject5.word = detectnum(subject5.train);
subject6.word = detectnum(subject6.train);
subject7.word = detectnum(subject7.train);
subject8.word = detectnum(subject8.train);
subject9.word = detectnum(subject9.train);

%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject1);

subject1.tim_test = tim_test;
subject1.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)));
subject1.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject1.cattwotrain = findtarget(subject1);
save ('infosubject1','subject1');

%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject2);

subject2.tim_test = tim_test;
subject2.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)));
subject2.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject2.cattwo = findtarget(subject2);
save ('infosubject2','subject2');
%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject3);

subject3.tim_test = tim_test;
subject3.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)-1));
subject3.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject3.cattwo = findtarget(subject3);
save ('infosubject3','subject3');
%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject5);

subject5.tim_test = tim_test;
subject5.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)-1));
subject5.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject5.cattwo = findtarget(subject5);
save ('infosubject5','subject5');
%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject6);

subject6.tim_test = tim_test;
subject6.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)-1));
subject6.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject6.cattwo = findtarget(subject6);
save ('infosubject6','subject6');
%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject7);

subject7.tim_test = tim_test;
subject7.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)-1));
subject7.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject7.cattwo = findtarget(subject7);
save ('infosubject7','subject7');
%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject8);

subject8.tim_test = tim_test;
subject8.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)-1));
subject8.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject8.cattwo = findtarget(subject8);
save ('infosubject8','subject8');
%%
[tim_test,target_tim_train,non_target_tim_train] = IndexExtraction(subject9);

subject9.tim_test = tim_test;
subject9.target_tim_train = target_tim_train((1:2),(2:length(target_tim_train)-1));
subject9.non_target_tim_train = non_target_tim_train((1:2),(2:length(non_target_tim_train)));
subject9.cattwo = findtarget(subject9);
save ('infosubject9','subject9');



function [tim_test, target_tim_train,non_target_tim_train] = IndexExtraction(subject)
nt = 1;
nt1 = 1;
nt2 = 1;
test = [0;0];
unmber1 = zeros(1,36);

for i = 1:length(subject.test(10,:))
    if subject.test(10,i)~= 0 & subject.test(10,i-1)== 0
        %if unmber1(1,subject.test(10,i)) == 0
            test(1,nt) = subject.test(10,i);
            test(2,nt) = i;
            nt = nt+1;
        %end
    end
    %x = find(subject.word(1,:) == subject.test(10,i));
    %if isempty(x) == 0
        %unmber1(1,subject.test(10,i)) = unmber1(1,subject.test(10,i))+1;
        
   % end
end

tim_test = [0;0];
number = zeros(1,36);
s2 = 1;

for i = 1:length(test)
    x = find(tim_test(1,:) == test(1,i));
    isempty(x);
    if isempty(x) == 0
        number(1,test(1,i)) = number(1,test(1,i))+1;
    end
    if find(tim_test(1,:) == test(1,i)) ~= 0 & number(1,test(1,i))<16
        s2 = s2;
    else
        tim_test(1,s2) = test(1,i);
        tim_test(2,s2) = test(2,i);
        s2 = s2+1;
    end
    if number(1,test(1,i))== 16
        number(1,test(1,i))=0;
    end
end
%tim_test = test;


if strcmp(subject.s,'SC')

    for i = 1:length(subject.train(10,:))
        if subject.train(10,i)~= 0 & subject.train(10,i-1)== 0
            if subject.train(11,i)== 0
                non_target_tim(1,nt1) = subject.train(10,i);
                %non_target_tim(2,nt1) = subject.train(1,i);
                non_target_tim(2,nt1) = i;
                nt1 = nt1+1;
            else
                target_tim(1,nt2) = subject.train(10,i);
                %target_tim(2,nt2) = subject.train(1,i);
                target_tim(2,nt2) = i;
                nt2 = nt2+1;
            end
        end
    end
    non_target_tim_train = [0;0];
    target_tim_train = [0;0];
    
    s1 = 2;
    s2 = 2;
    
    for i = 1:length(target_tim)
        if target_tim(1,i) ~= target_tim_train(1,s1-1)
            target_tim_train(1,s1) = target_tim(1,i);
            target_tim_train(2,s1) = target_tim(2,i);
            s1 = s1+1;
        end
    end
    number = zeros(1,36);
    
    for i = 1:length(non_target_tim)
        x = find(non_target_tim_train(1,:) == non_target_tim(1,i));
        isempty(x);
        if isempty(x) == 0
            number(1,non_target_tim(1,i)) = number(1,non_target_tim(1,i))+1;
        end
        if find(non_target_tim_train(1,:) == non_target_tim(1,i)) ~= 0 & number(1,non_target_tim(1,i))<16
            s2 = s2;
        else
            non_target_tim_train(1,s2) = non_target_tim(1,i);
            non_target_tim_train(2,s2) = non_target_tim(2,i);
            s2 = s2+1;
        end
        if number(1,non_target_tim(1,i))== 16
            number(1,non_target_tim(1,i))=0;
        end
    end
    

    
else
    for i = 1:length(subject.train(10,:))
        if subject.train(10,i)~= 0 & subject.train(10,i-1)== 0
            if subject.train(11,i)== 0
                non_target_tim(1,nt1) = subject.train(10,i);
                %non_target_tim(2,nt1) = subject.train(1,i);
                non_target_tim(2,nt1) = i;
                nt1 = nt1+1;
            else
                target_tim(1,nt2) = subject.train(10,i);
                %target_tim(2,nt2) = subject.train(1,i);
                target_tim(2,nt2) = i;
                nt2 = nt2+1;
            end
        end
    end
    non_target_tim_train = [0;0];
    target_tim_train = [0;0];
    
    s1 = 2;
    s2 = 2;
    
    for i = 1:length(target_tim)
        if target_tim(1,i) ~= target_tim_train(1,s1-1)
            target_tim_train(1,s1) = target_tim(1,i);
            target_tim_train(2,s1) = target_tim(2,i);
            s1 = s1+1;
        end
    end
    number = zeros(1,36);
    
    for i = 1:length(non_target_tim)
        x = find(non_target_tim_train(1,:) == non_target_tim(1,i));
        isempty(x);
        if isempty(x) == 0
            number(1,non_target_tim(1,i)) = number(1,non_target_tim(1,i))+1;
        end
        if find(non_target_tim_train(1,:) == non_target_tim(1,i)) ~= 0 & number(1,non_target_tim(1,i))<16
            s2 = s2;
        else
            non_target_tim_train(1,s2) = non_target_tim(1,i);
            non_target_tim_train(2,s2) = non_target_tim(2,i);
            s2 = s2+1;
        end
        if number(1,non_target_tim(1,i))== 16
            number(1,non_target_tim(1,i))=0;
        end
    end
    x = target_tim_train;
    L = size(target_tim_train,2);
    n = 3;
    word = [x(1,1) x(1,2);x(2,1) x(2,2)];
    
    for j = 4:L-1
        if x(1,j) == x(1,j-1)
            word(1,n)= x(1,j);
            word(2,n)= x(2,j);
            n = n+1;
            %elseif x(1,j) == x(1,j-2) & x(1,j-1) ~= x(1,j-3)
            %word(n)= x(1,j);
            %n = n+1;
        elseif word(1,n-2) == x(1,j) & x(1,j-1) ~= x(1,j-3) & mod(n,2)==0
            word(1,n)= x(1,j);
            word(2,n)= x(2,j);
            n = n+1;
        elseif word(1,n-1) == x(1,j) | word(1,n-2) == x(1,j)
            n = n;
        else
            word(1,n)= x(1,j);
            word(2,n)= x(2,j);
            n = n+1;
        end
    end
    target_tim_train = word;
end
end
function s = parakind(test)
t = nonzeros(test(10,:));
if t(t>12)
    s = 'SC';
else
    s = 'RC';
end
end
function word = detectnum(train)
n = 2;
x(1,1) = 0;
for i = 1:length(train)
    if train(11,i) ~= 0
        x(1,n) = train(10,i);
        if x(1,n-1) ~= x(1,n)
            n = n+1;
        end
    end
end
L = length(x);
x(1,1) = x(1,3);
n = 3;
word = [x(1,1) x(1,2)];

for j = 4:L-1
    if x(1,j) == x(1,j-1)
        word(n)= x(1,j);
        n = n+1;
        %elseif x(1,j) == x(1,j-2) & x(1,j-1) ~= x(1,j-3)
        %word(n)= x(1,j);
        %n = n+1;
    elseif word(1,n-2) == x(1,j) & x(1,j-1) ~= x(1,j-3) & mod(n,2)==0
        word(n)= x(1,j);
        n = n+1;
    elseif word(1,n-1) == x(1,j) | word(1,n-2) == x(1,j)
        n = n;
    else
        word(n)= x(1,j);
        n = n+1;
    end
end
end

function cattwo = findtarget(subject)
%cattwo = [subject.target_tim_train(2,:) subject.non_target_tim_train(2,:)];
%cattwo = sort(cattwo);
n = 1;
for i = 1:length(subject.train)
    if subject.train(10,i)~=0 & subject.train(10,i-1)==0
        A(2,n) = subject.train(10,i);
        A(1,n) = i;
        n = n+1;
    end
end
cattwo = A;
for i = 1:length(cattwo)
    if ismember(cattwo(1,i),subject.target_tim_train(2,:))
        cattwo(2,i) = 1;
    else
        cattwo(2,i) = 0;
    end
end
end