clf;
%% 图像初步处理
luhan=imread('luhan.jpg');
imshow(luhan);
%figure;
%mesh(luhan(:,:,1));
%% 马赛克
% degreeofma=100;
% [row,col]=size(luhan);
% numrow=floor(row/degreeofma);
% numcol=floor(col/degreeofma);
% luhan_masai=0*luhan;
% for i=1:numrow
%     for j=1:numcol
%         sumofcolor=zeros(1,3);
%         for m=1:degreeofma-1
%             for n=1:degreeofma-1
%                 sumofcolor(1)=sumofcolor(1)+luhan((i-1)*degreeofma+m,(j-1)*degreeofma+n);
%                 sumofcolor(2)=sumofcolor(2)+luhan((i-1)*degreeofma+m,(j-1)*degreeofma+n);
%                 sumofcolor(3)=sumofcolor(3)+luhan((i-1)*degreeofma+m,(j-1)*degreeofma+n);
%             end
%         end
%         for m=1:degreeofma
%             for n=1:degreeofma
%                 luhan_masai((i-1)*degreeofma+m,(j-1)*degreeofma+n,1)=sumofcolor(1)/degreeofma/degreeofma;
%                 luhan_masai((i-1)*degreeofma+m,(j-1)*degreeofma+n,2)=sumofcolor(2)/degreeofma/degreeofma;
%                 luhan_masai((i-1)*degreeofma+m,(j-1)*degreeofma+n,3)=sumofcolor(3)/degreeofma/degreeofma;
%             end
%         end
%         imshow(luhan_masai);
%         drawnow;
%     end
% end
% imshow(luhan_masai);
%% 灰度图
luhan_gray=rgb2gray(luhan);
figure;
imshow(luhan_gray);
%% 去除RGB
luhan_noR=luhan;
luhan_noG=luhan;
luhan_noB=luhan;
luhan_noR(:,:,1)=0;
luhan_noG(:,:,2)=0;
luhan_noB(:,:,3)=0;
figure
imshow(luhan_noR);
figure
imshow(luhan_noG);
figure
imshow(luhan_noB);
%% 边界识别
imcontour(luhan_gray);
%% 