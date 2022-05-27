A = rgb2gray(imread('test.jpeg'));
A = imnoise(A,'salt & pepper');
figure;imshow(A);
[R, C] = size(A);
B = zeros(R,C);     
for i=2:1:R-1
    for j=2:1:C-1
       temp = A(i-1:i+1,j-1:j+1);
       sortedtemp = sort(reshape(temp,1,[]));
%        stemp = max(sortedtemp);
%        stemp = min(sortedtemp);
       stemp = median(sortedtemp);
%        disp(stemp)
       B(i,j)= stemp;

    end
end
figure;
imshow(B,[]);