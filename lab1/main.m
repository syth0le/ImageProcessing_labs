function main
    image_path = 'царь1.jpg';
    scale = 0.9;
    angle = 30;

    [img, distorted] = scaling_img(image_path, scale, angle);

    PositioningAndScalling(img, distorted, scale, angle);
end

% call main();%