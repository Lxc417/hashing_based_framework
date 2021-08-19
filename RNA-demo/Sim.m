clear;clc;close all;
tic;
load('E:\²©ºó¿ÆÑÐ\fly_hash_zhangting_tanziyang\fly-hash-preprocess-master\fly-hash-preprocess-master\RNA-demo\data\Zeisel.mat');
[m,n]=size(in_X);
in_X=full(in_X);

k=500;
pm=0.3;
P = zeros(m,k);
p=round(m*pm);
P(1:p,:) = ones(p,k);
for i = 1:k
    perm(:,i) = randperm(m);
end
P = P(perm);
P(P==0)=-1;

Fingerprint=[];
for i=1:n
    tempWeight=in_X(:,i);
    tempSum=sum(tempWeight.*P,1);
    tempF=double(tempSum>0);
    Fingerprint=[Fingerprint;tempF];
end

[y]=tsne(Fingerprint);
toc;


