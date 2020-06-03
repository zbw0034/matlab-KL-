clear all; clc;
fid = fopen('D:\��ҵ\ý���ź������\YUVPlayer-YUV������\BasketballPass_416x240_50.yuv','rb');
img_y= fread(fid,[416,240],'uint8');
n=1;
B=zeros(8,8,1560);
x=zeros(1560,64);
dim=64;
%8x8չ����1x64�����ֵ��
%�ָ�ɿ�
for i=1:52
    for j=1:30
        B(1:8,1:8,n)=img_y(1+8*(i-1):8*i,1+8*(j-1):8*j);%8x8
        x(n,:)=reshape(B(:,:,n),1,[]);%1x64��ϳ�1560x64  
        n=n+1;
    end
end
r=cov(x);%�õ�Э����
[vv,d]=eig(r);
   %�����r��ȫ������ֵ�����ɶԽ���d������r��������������vv����������
%A=orth(vv)';%vv�Ƿ���Ҫ��64x64�仯Ϊ1x64^2
%CF=A*r*A';
dia = d;
index = zeros(1,dim);
for i=1:dim
    [x1, y1]=find(dia==max(max(dia)));
    index(1,i) = x1;
    dia(x1,y1) = -inf;
end
Q  = zeros(64,dim);
for i=1:dim         %����任����Q
    Q(:,i) = 1/sqrt(sum(vv(:,index(i)).^2)).*vv(:,index(i));
end
Qx=cov(Q);
flag=isdiag(Qx);
disp(Q);disp(Qx);

        

