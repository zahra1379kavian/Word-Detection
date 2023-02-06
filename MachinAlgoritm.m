close all
clc
clear

l1 = load('epochSubjectData1train');

ld = load('infosubject1');

l = load('epochSubjectData1test');
%l = load('epochSubjectData2train');


[ld.FtrSVM, ld.stringsvm] = svmalgoritm(l1,ld,l);
[ld.FtrLDA, ld.stringlda] = ldaalgoritm(l1,ld,l);


function [ftr, string] = svmalgoritm(l1,ld,l)
%l1 = load('epochSubjectData1train');
m1 = cell2mat(struct2cell(l1));

%ld = load('infosubject1');
test = ld.subject1.test;
train = ld.subject1.train;
[target_tim_train,non_target_tim_train] = IndexExtraction(ld.subject1);
result = findtarget(non_target_tim_train(2,:),target_tim_train(2,:));

%l = load('epochSubjectData1test');
m = cell2mat(struct2cell(l));


n1 = size(m1,1);
n2 = size(m1,2);
n3 = size(m1,3);

for i = 1:1:n2
    for j = 1:1:n1
        data1(i,n3*j-n3+1:n3*j)=m1(j,i,:);
    end
end


n1 = size(m,1);
n2 = size(m,2);
n3 = size(m,3);

for i = 1:1:n2
    for j = 1:1:n1
        data2(i,n3*j-n3+1:n3*j)=m(j,i,:);
    end
end

ftr = fitcsvm(data1,result');
ptr = predict(ftr,data2);

p = ptr';
p2 = find(p ~= 0);
zerotr = nnz(ptr);

n = 1;
for k = 1:size( ld.subject1.train(10,:),2)
    if  ld.subject1.train(10,k) ~= 0 &  ld.subject1.train(10,k-1) == 0
        E(1,n) =  ld.subject1.train(10,k);
        n = n+1;
    end
end

if strcmp(ld.subject1.s,'SC')
s = 1;
for i = 1:15:size(p2,2)
    if s<6
    n(1,s) = E(1,p2(1,i));
    s = s + 1;
    end
end
string = detectword(n,ld.subject1.s);
else
 s = 1;
for i = 1:15:size(p2,2)
    if s<10
    n(1,s) = E(1,p2(1,i));
    n(2,s) = E(1,p2(1,i+1));
    s = s + 1;
    end
end
string = n;
end
end

function [ftr, string] = ldaalgoritm(l1,ld,l)
%l1 = load('epochSubjectData1train');
m1 = cell2mat(struct2cell(l1));

%ld = load('infosubject1');
test = ld.subject1.test;
train = ld.subject1.train;
[target_tim_train,non_target_tim_train] = IndexExtraction(ld.subject1);
result = findtarget(non_target_tim_train(2,:),target_tim_train(2,:));

%l = load('epochSubjectData1test');
m = cell2mat(struct2cell(l));


n1 = size(m1,1);
n2 = size(m1,2);
n3 = size(m1,3);

for i = 1:1:n2
    for j = 1:1:n1
        data1(i,n3*j-n3+1:n3*j)=m1(j,i,:);
    end
end


n1 = size(m,1);
n2 = size(m,2);
n3 = size(m,3);

for i = 1:1:n2
    for j = 1:1:n1
        data2(i,n3*j-n3+1:n3*j)=m(j,i,:);
    end
end

ftr = fitcdiscr(data1,result');
ptr = predict(ftr,data2);

p = ptr';
p2 = find(p ~= 0);
zerotr = nnz(ptr);

n = 1;
for k = 1:size( ld.subject1.train(10,:),2)
    if  ld.subject1.train(10,k) ~= 0 &  ld.subject1.train(10,k-1) == 0
        E(1,n) =  ld.subject1.train(10,k);
        n = n+1;
    end
end

if strcmp(ld.subject1.s,'SC')
s = 1;
for i = 1:15:size(p2,2)
    if s<6
    n(1,s) = E(1,p2(1,i));
    s = s + 1;
    end
end
string = detectword(n,ld.subject1.s);
else
 s = 1;
for i = 1:15:size(p2,2)
    if s<10
    n(1,s) = E(1,p2(1,i));
    n(2,s) = E(1,p2(1,i+1));
    s = s + 1;
    end
end
string = n;
end
end

function sout = detectword(word,alg)
for j = 1:size(word,2)
    n = word(1,j);
if strcmp(alg,'SC')
    switch n
        case 1
            string='A';
        case 2
            string='B';
        case 3
            string='C';
        case 4
            string='D';
        case 5
            string='E';
        case 6
            string='F';
        case 7
            string='G';
        case 8
            string='H';
        case 9
            string='I';
        case 10
            string='J';
        case 11
            string='K';
        case 12
            string='L';
        case 13
            string='M';
        case 14
            string='N';
        case 15
            string='O';
        case 16
            string='P';
        case 17
            string='Q';
        case 18
            string='R';
        case 19
            string='S';
        case 20
            string='T';
        case 21
            string='U';
        case 22
            string='V';
        case 23
            string='W';
        case 24
            string='X';
        case 25
            string='Y';
        case 26
            string='Z';
        case 27
            string='0';
        case 28
            string='1';
        case 29
            string='2';
        case 30
            string='3';
        case 31
            string='4';
        case 32
            string='5';
        case 33
            string='6';
        case 34
            string='7';
        case 35
            string='8';
        case 36
            string='9';
        otherwise
            string=[];
    end
else
    %n = sort(n)
    n1 = word(1,j)
    n2 = word(2,j)
    if(n1 == 7)
        switch n2
            case 1
                string='A';
            case 2
                string='B';
            case 3
                string='C';
            case 4
                string='D';
            case 5
                string='E';
            case 6
                string='F';
                
        end
    elseif (n1 == 8)
        switch n2
            case 1
                string='G';
            case 2
                string='H';
            case 3
                string='I';
            case 4
                string='J';
            case 5
                string='K';
            case 6
                string='L';
                
        end
    elseif (n1 == 9)
        switch n2
            case 1
                string='M';
            case 2
                string='N';
            case 3
                string='O';
            case 4
                string='P';
            case 5
                string='Q';
            case 6
                string='R';
                
        end
    elseif (n1 == 10)
        switch n2
            case 1
                string='S';
            case 2
                string='T';
            case 3
                string='U';
            case 4
                string='V';
            case 5
                string='W';
            case 6
                string='X';
                
        end
    elseif (n1 == 11)
        switch n2
            case 1
                string='Y';
            case 2
                string='Z';
            case 3
                string='0';
            case 4
                string='1';
            case 5
                string='2';
            case 6
                string='3';
                
        end
    elseif (n1 == 12)
        switch n2
            case 1
                string='4';
            case 2
                string='5';
            case 3
                string='6';
            case 4
                string='7';
            case 5
                string='8';
            case 6
                string='9';
        end
    end
    
end
sout(1,j) = string;
end

end

function [target_tim_train,non_target_tim_train] = IndexExtraction(subject)
r1 = find(subject.train(10,:)~=0);
t1 = subject.train(10,:);

n=[];
q=[];

for j=1:1:size(r1,2)
    if subject.train(11,r1(j)) == 0
        t1(1,r1(j)) = NaN;
    end
end
for j=1:1:size(r1,2)
    w = find(t1 == t1(1,r1(j)));
    sz = size(w,2);
    if sz >3
        n=[n,r1(j)];
        q=[q,t1(1,r1(j))];
        t1(w(1,1:4)) = NaN;
    end
end
target_tim_train(1,:) = q;
target_tim_train(2,:) = n;


r1 = find(subject.train(10,:)~=0);
t2 = subject.train(10,:);

n=[];
q=[];

for j=1:1:size(r1,2)
    if subject.train(11,r1(j))~=0
        t2(1,r1(j)) = NaN;
    end
end
for j=1:1:size(r1,2)
    w=find(t2 == t2(1,r1(j)));
    sz=size(w,2);
    if sz>3
        n=[n,r1(j)];
        q=[q,t2(1,r1(j))];
        t2(w(1,1:4))=NaN;
    end
end
non_target_tim_train(1,:) = q;
non_target_tim_train(2,:) = n;
end

function cattwo = findtarget(non_target_tim_train,target_tim_train)
%result = [target_tim_train(1,:) non_target_tim_train(1,:)];
cattwo = [target_tim_train(1,:) non_target_tim_train(1,:)];
%result = sort(result);
cattwo = sort(cattwo);

for i = 1:size(cattwo,2)
    %tt=ismember(result(i),target_tim_train(1,:));
    %tn=ismember(result(i),non_target_tim_train(1,:));
    
    %if(tt==1)
    %   r=find(target_tim_train(1,:) == result(i));
    %   result(i)=1;
    %else
    %   r=find(non_target_tim_train(1,:) == result(i));
    %  result(i)=0;
    %end
    if ismember(cattwo(1,i),target_tim_train(1,:)) == 1
        cattwo(1,i) = 1;
        %cattwo(2,i) = 0;
    else
        cattwo(1,i) = 0;
        %cattwo(2,i) = 1;
    end
end
end
