a=imread('luhan.jpg');  
figure(1),subplot(1,2,1);imshow(a);title('原图像');  
degreeofma=10;
[row,col]=size(a);
for b=1:3  
    I=a(:,:,b);  
    for i=1:degreeofma:row-degreeofma+1
        for j=1:degreeofma:col-degreeofma+1
        B=I(i:i+degreeofma-1,j:j+degreeofma-1);  
        average=floor(sum(sum(B))/degreeofma/degreeofma);  
            for k=0:degreeofma-1  
                for g=0:degreeofma-1  
                I(j+k,i+g)=average;  
                end  
            end  
        end  
    end  
    gary(:,:,b)=I;  
    %imshow(I);
    %drawnow;
    %pause;
end  
figure(1),subplot(1,2,2);imshow(uint8(gary));title('马赛克图像'); 