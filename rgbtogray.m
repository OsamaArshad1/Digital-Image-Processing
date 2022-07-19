A = double(imread('test.jpeg'));

[R, C] = size(A);
B = zeros(R,C,3);

B = (A(:,:,1) + A(:,:,2) + A(:,:,3))/3;

imshow(B,[])


