A = imread('test.jpg');
A_new = rgb2hsv(A);
intensity_hsv = A_new(:,:,3);


%figure; imshow(A_new,[])
[R, C] = size(intensity_hsv);
B = zeros(R,C);

myhisto = zeros(1,256);
myNhisto = zeros(1,256);

for i=1 : 1 : R 
    for j=1 : 1 : C
        myhisto(intensity_hsv(i,j)+1) = myhisto(intensity_hsv(i,j)+1) + 1;
    end
end

figure; plot(myhisto)


myNhisto = myhisto./(R*C);
figure; plot(myNhisto)

myCDF = zeros(1,256);
myCDF(1) = myNhisto(1);
for i=2:256
    
    myCDF(i) = myCDF(i) + myNhisto(i);
end

myLUT = round(myCDF.*255);

figure; plot(myLUT)

for i=1 : 1 : R 
    for j=1 : 1 : C
        B(i,j) = myLUT(intensity_hsv(i,j)+1);
    end
end

hsvimg = hsv2rgb(B);
figure; imshow(hsvimg,[])


