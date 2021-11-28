function [output]=averageFiltering(image,y,x,radiusy,radiusx)
    [row, col] = size(image);
    top = max(floor(y),1);
    bot = min(floor(y+radiusy*2),row);
    left = max(floor(x),1);
    right = min(floor(x+radiusx*2),col);

    h = fspecial('average', 21);
    template=double(image(top:bot, left:right, :));
    blurIm=imfilter(template, h, 'replicate');
    output=image;
    output(top:bot, left:right, :)=blurIm;
% For efficiency we used the fspecial to generate the mask in the end
%     for j=top:bot
%         for i=left:right
%             A=zeros(21,21,1);
%             B=zeros(21,21,1);
%             C=zeros(21,21,1);
%             for m=1:21
%                 for n=1:21
%                     A=image(j-10:j+10,i-10:i+10,1);
%                     B=image(j-10:j+10,i-10:i+10,2);
%                     C=image(j-10:j+10,i-10:i+10,3);
%                 end
%             end
%             red=mean(A,'all');
%             green=mean(B,'all');
%             blue=mean(C,'all');
%             blurIm(j-top+1,i-left+1,1)=red;
%             blurIm(j-top+1,i-left+1,2)=green;
%             blurIm(j-top+1,i-left+1,3)=blue;
%         end
%     end
%     output=image;
%     output(top:bot, left:right,:)=blurIm;
end