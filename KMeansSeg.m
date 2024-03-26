function [sg,normMuDiff]=KMeansSeg(img,k,Mu,eps)
normMuDiff=[];
m=size(img,1);
n=size(img,2);
img=double(img);
M=reshape(img,m*n,size(img,3));
% index=randperm(m*n);
% Mu=M(index(1:k),:);
flag=1;
Cov=repmat(eye(size(img,3)),1,1,k); %k个聚类的协方差
Label=zeros(m*n,1);
 
iter=1;
figure;
while flag
    old_Mu=Mu;
    Num=zeros(1,k);
    ClassedPixs=zeros(m*n,size(img,3),k); %分到k个类中的像素值
    w=zeros(m*n,k); %各像素点对于聚类的权重矩阵
    C=zeros(size(img,3),size(img,3),k);
    for j=1:k
        invCov=inv(Cov(:,:,j));
        C(:,:,j)=invCov/norm(invCov);%使用Mahalanobis距离(即马氏距离)度量
    end
    for i=1:m*n
        dis=zeros(k,1);
        for j=1:k
            dis(j)=(M(i,:)-Mu(j,:))*C(:,:,j)*(M(i,:)-Mu(j,:))'; 
        end
        maxIdx=find(dis==min(dis));
        label=maxIdx(1);
        Label(i)=label;
        Num(label)=Num(label)+1;
        ClassedPixs(Num(label),:,label)=M(i,:);
        w(Num(label),label)=1/(sqrt(min(dis))+1); %避免被0除的情况
    end
    w=w./repmat(sum(w),m*n,1); %权重归一化
    % 更新协方差Cov
    for j=1:k
        PixsThisClass=ClassedPixs(1:Num(j),:,j);
        if Num(j)~=0      
            Cov(:,:,j)=cov(PixsThisClass)+0.01*rand(size(img,3)); %加随机量以防止矩阵奇异
            Mu(j,:)=sum(repmat(w(1:Num(j),j),1,size(img,3)).*PixsThisClass);
        end
    end
    normDiff=norm(old_Mu-Mu);
    if  normDiff<eps
        flag=0;
    end
    normMuDiff=[normMuDiff;normDiff];
    sg=reshape(Label,m,n);
    
    % 录制gif
    imshow(mat2gray(sg));
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if iter == 1
        imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);
    end
    iter=iter+1;
end