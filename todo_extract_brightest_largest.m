orgImage=rgb2gray(uint8(imread('start_test.png')));

[R,C]=size(orgImage);
avgImage = zeros(R,C);
subplot(1,4,1);imshow(orgImage);title("Original Image");
%% Applying Averaging Filter
figuresize = 15;
loopStart=double(uint8(figuresize/2));
loopControl=figuresize-loopStart;
for i=loopStart:1:R-loopControl
    for j=loopStart:1:C-loopControl
        temp=orgImage(i-loopControl:i+loopControl,j-loopControl:j+loopControl);
        newtemp = reshape(temp,1,[]);
        stemp = sum(newtemp);
        value = stemp/(figuresize*figuresize);
        avgImage(i,j)=value;
    end
end

avgImage = uint8(avgImage);
subplot(1,4,2);imtool(avgImage);imshow(uint8(avgImage));title("Averaged Image");
%% Applying Thresholding

[R,C]= size(avgImage);
thresholdImage = zeros(R,C);
for i=1:1:R
    for j=1:1:C
         if (avgImage(i,j))>100
             thresholdImage(i,j)=255;
        end
    end
end

subplot(1,4,3);imshow(thresholdImage,[]);title("Thresholding Img");

%% Dot Multiplication for extraction of largest image and brightest image

[R,C]=size(orgImage);
dotImage = zeros(R,C);
for i=1:1:R
    for j=1:1:C
        dotImage(i,j)= (orgImage(i,j)).*(thresholdImage(i,j));         
    end
end

subplot(1,4,4);imshow(uint8(dotImage));title("Dot Multiplication")