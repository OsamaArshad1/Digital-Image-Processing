A = rgb2gray(imread("test.jpeg"));
[R, C] = size(A);
B = zeros(R,C);
a0=0;a1=0;a2=0;
b0=0;b1=0;b2=0;
for i=1:1:R
    for j=1:1:C
        [x, y, 1]=[a0 a1 a2; b0 b1 b2; 0 0 1 ]*[i; j; 0];
        B(x,y) = A(i,j);
    end
end
imshow(uint8(B))
