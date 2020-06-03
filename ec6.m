clear all; clc;
fid = fopen('D:\作业\媒体信号与编码\YUVPlayer-YUV播放器\BasketballPass_416x240_50.yuv','rb');
img_y= fread(fid,[416,240],'uint8');
n=1;
B=zeros(8,8,1560);
x=zeros(1560,64);
dim=64;
%8x8展开成1x64，求均值，
%分割成块
for i=1:52
    for j=1:30
        B(1:8,1:8,n)=img_y(1+8*(i-1):8*i,1+8*(j-1):8*j);%8x8
        x(n,:)=reshape(B(:,:,n),1,[]);%1x64组合成1560x64  
        n=n+1;
    end
end
r=cov(x);%得到协方差
[vv,d]=eig(r);
   %求矩阵r的全部特征值，构成对角阵d，并求r的特征向量构成vv的列向量。
%A=orth(vv)';%vv是否需要从64x64变化为1x64^2
%CF=A*r*A';
dia = d;
index = zeros(1,dim);
for i=1:dim
    [x1, y1]=find(dia==max(max(dia)));
    index(1,i) = x1;
    dia(x1,y1) = -inf;
end
Q  = zeros(64,dim);
for i=1:dim         %计算变换矩阵Q
    Q(:,i) = 1/sqrt(sum(vv(:,index(i)).^2)).*vv(:,index(i));
end
Qx=cov(Q);
flag=isdiag(Qx);
disp(Q);disp(Qx);

        

