A=im2gray(imread("imagetest.jpg"));
figure;imshow(A);title("Original Image");
[Row, Col] = size(A);
for i=1:1:Row
    for j=1:1:Col
%         A(i,j) = 255 - A(i,j);
%           A(i,j) = A(i,j)*1; Identity Filter
    end

end
figure;imshow(A);
