function [img, distorted] = scaling_img(imgPath, scale, angle)
    img = imread(imgPath);
    imshow(img);
    distorted = imresize(img,scale);
    distorted = imrotate(distorted,angle);
    figure, imshow(distorted);
end

%call [img, distorted] = scaling_img('царь1.jpg', 0.7, 0.8);%