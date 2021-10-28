function [img, distorted] = scaling_img(imgPath, scale, angle)
    img = imread(imgPath);
    figure, imshow(img); % показываем исходное изображение
    distorted = imresize(img,scale); % Изменяет размер изображения
    distorted = imrotate(distorted,angle); % Изменяет угол наклона изображения
    figure, imshow(distorted); % Показываем измененное изображение
end

%call [img, distorted] = scaling_img('pic.jpg', 0.7, 0.8);%