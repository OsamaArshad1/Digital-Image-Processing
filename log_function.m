A = double(imread('test.jpg'));
A_new = rgb2gray(A);

[R, C] = size(A_new);
B = zeros(R,C,3);

for i=1 : 1 : R
    for j=1 : 1 : C
        for k =1:1:3
            B(i,j,k) = log(1+A(i,j,k));
        end
    end
end

imshow(B,[])