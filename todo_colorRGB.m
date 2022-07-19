Image = imread("green.jpg");
figure;subplot(2,2,1);imshow(Image,[]);title("Original Image");

R=Image(:,:,1);
G=Image(:,:,2);
B=Image(:,:,3);


red = Image;
red(:,:,2)=0;
red(:,:,3)=0;


green = Image;
green(:,:,1)=0;
green(:,:,3)=0;

blue = Image;
blue(:,:,1)=0;
blue(:,:,2)=0;
 

subplot(2,2,2);imshow(red,[]);title("Red Image");
subplot(2,2,3);imshow(green,[]);title("Green Image");
subplot(2,2,4);imshow(blue,[]);title("Blue Image");


