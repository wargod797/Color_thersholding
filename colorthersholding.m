% color thersholding
%cd('G:\matlab')%specifing the path
%a =imread('input.jpg');%reading the image
webcamlist %shows the name of the webcam and pixel specification
cam = webcam('EasyCamera'); %open the webcam and shows the complete specification but your camera name on bracket
preview(cam);
cam.resolution='1280x720';
a=snapshot(cam); %take the selfie
imshow(a);%displaying the image
red = a(:,:,1); green = a(:,:,2); blue = a(:,:,3);% displaying the image in only in red, green and blue array
figure
imshow(red)% showing only red array image
figure
imshow(green)%showing only green array image
figure
imshow(blue)% showing only blue array image
d = impixel(a);% this command gets minimum and maximum rgb values of
%perticular color regiopn
out = red > 100 & green > 25 & green < 60 & blue < 80; %condition for specific color
figure
imshow(out)
out2 = imfill(out,'holes'); % correct the missing holes in pixels
figure
imshow(out2)
out3 = bwmorph(out2,'erode'); % correct the cornor pixels
figure
imshow(out3)
figure
imshow(out2)
out3 = bwmorph(out2,'dilate',10);
figure
imshow(out3)
out4 = imfill(out3,'holes');
figure
imshow(out4)
stats = regionprops(out4); %shows the x and y values of the image
figure
imshow(out4)
%doc regionprops
clear('cam');