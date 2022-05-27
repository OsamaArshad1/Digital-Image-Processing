A=imread("test.jpeg");
%imshow(A);
Anew=rgb2gray(A);
[R, C]=size (Anew);
B=zeros(R,C);
for i=1:1:R
    for j=1:1:C
        B(i,j)=255-Anew(i,j); 
        %B(i,j)=Anew(i,j)/2;
    end
end
figure;
%imshow(Anew);
imshow(uint8(B));


