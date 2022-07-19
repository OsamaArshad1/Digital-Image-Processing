%% Function to Read Image
function orgImg= fa19_bcs_066(image)
%% Display and Save Original Image
orgImg= imread(image);
figure;
imshow(image);
title('Original Image'); 
imwrite(orgImg,'original_image.bmp')

%% Convert to Grayscale Image
grayImg = rgb2gray(orgImg);

%% Applying Salt and Pepper
noisyImage = imnoise(grayImg,'salt & pepper', 0.3);
figure;
imshow(uint8(noisyImage));
title("Salt and Pepper Img");

%% Applying Averaging Filter

[R, C]=size(grayImg);
blurredImg=zeros(R,C);
figuresize = 5;
loopStart=double(uint8(figuresize/2));
loopControl=figuresize-loopStart;
for i=loopStart:1:R-loopControl
    for j=loopStart:1:C-loopControl
        temp=grayImg(i-loopControl:i+loopControl,j-loopControl:j+loopControl);
        newtemp = reshape(temp,1,[]);
        stemp = sum(newtemp);
        value = stemp/(figuresize*figuresize);
        blurredImg(i,j)=value;
    end
end

figure;
blurredImg=uint8(blurredImg);
imshow(blurredImg);
imwrite(blurredImg, "averaging.jpeg");
title("Averaging Filter Output Image")

%% Construction of 2nd order Laplacian filter isotropic at 45
laplacianFilter =[1 1 1; 1 -8 1; 1 1 1];
convolutionImage=blurredImg;
[R,C]=size(convolutionImage);
blurredEdges=zeros(R,C);
for i=2:1:R-1
    for j=2:1:C-1
        temp=convolutionImage(i-1:i+1,j-1:j+1);
        dotmultiply= double(temp).*double(laplacianFilter);
        sdotmultiply = sum(reshape(dotmultiply, 1, []));
        blurredEdges(i, j) = sdotmultiply;
    end
end
figure;
blurredEdges = uint8(blurredEdges);
imshow(blurredEdges);
title('Laplacain filter on Blurred Image')
imwrite(blurredEdges, "averaging_edges.png");

%% Convolution of Laplacian to Original Image
[R,C]=size(grayImg);
original_edges=zeros(R,C);
for i=2:1:R-1
    for j=2:1:C-1
        temp=grayImg(i-1:i+1,j-1:j+1);
        dotmultiply= double(temp).*double(laplacianFilter);
        sdotmultiply = sum(reshape(dotmultiply, 1, []));
        original_edges(i, j) = sdotmultiply;
    end
end
figure;
original_edges=uint8(original_edges);
imshow(original_edges);
title('Laplacain filter on Original Image')
imwrite(original_edges, "original_edges.png");

%% Sharpened Image
 
orgSharpenedImage = uint8(grayImg)+uint8(original_edges);
figure;
orgSharpenedImage =uint8(orgSharpenedImage);
imshow(orgSharpenedImage);
title("Original Sharpened Image");
imwrite(orgSharpenedImage, "original_sharpened_image.jpeg");


blurSharpenedImage = uint8(grayImg)+uint8(blurredImg);
figure;
blurSharpenedImage=uint8(blurSharpenedImage);
imshow(blurSharpenedImage);
title("Blurred Sharpened Image");
imwrite(blurSharpenedImage, "averaged_sharpened_image.jpeg");


