A=imread("test.jpeg");

Anew=rgb2gray(A);
[R, C]=size(Anew);
B=zeros(R,C);
figuresize = 3;
loopStart=double(uint8(figuresize/2));
loopControl=figuresize-loopStart;
for i=loopStart:1:R-loopControl
    for j=loopStart:1:C-loopControl
        temp=Anew(i-loopControl:i+loopControl,j-loopControl:j+loopControl);
        newtemp = reshape(temp,1,[]);
        stemp = sum(newtemp);
        value = stemp/(figuresize*figuresize);
        B(i,j)=value;
    end
end

edges = imsubtract(Anew,uint8(B)) ;
% edges = Anew - uint8(B);
sharpenedImage = Anew + edges;
figure;subplot(1,4,1);imshow(A);title("Original Image");
subplot(1,4,2);imshow(B,[]);title("Blurred Image");
subplot(1,4,3);imshow(edges,[]);title("Edges ");
subplot(1,4,4);imshow(sharpenedImage,[]);title("Sharpened Image ");
