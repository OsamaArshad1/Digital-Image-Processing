image=zeros(200,200,3); 
image(1:100,1:100,1)=0.5;
image(1:100,1:100,2)=0.5;
image(1:100,1:100,3)=0.5;

image(1:100,100:200,2)=1;   %Green (maximum value)
image(100:200,1:100,1)=1;   %Red (maximum value)
image(100:200,100:200,3)=1;   %Blue (maximum value)


figure, imshow(image);

