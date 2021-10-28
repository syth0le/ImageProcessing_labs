function main
    image_path = 'image.jpg';
    scale = 0.7;
    angle = 20;

    [img, distorted] = scaling_img(image_path, scale, angle);

    PositioningAndScalling(img, distorted, scale, angle);
end

% call main();%