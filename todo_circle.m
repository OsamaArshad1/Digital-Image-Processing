A=imread('imagetest.jpg');
figure; imshow(A)
%Anew=rgb2gray(A);
B=zeros(100,100);
Cx=50;Cy=50;
myRad=50;
for i=1:1:100
    for j=1:1:100
        if sqrt((i-Cx)^2+(j-Cy)^2) <= sqrt(myRad)^2
            B(i,j)=255;
        end
    end
end
figure;imshow(B)
       
