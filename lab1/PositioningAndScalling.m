function PositioningAndScalling(original, distorted, scale, angle)
    movingPoints = [151.52  164.79; 131.40 79.04];
    fixedPoints = [135.26  200.15; 170.30 79.30];
    %movingPoints = [1501.52 1060.79; 1030.40 709.04; 151.52  164.79; 131.40 79.04];
    %fixedPoints = [1305.26 2000.15; 1070.30 709.30; 135.26  200.15; 170.30 79.3];
    %cpselect(distorted,original,movingPoints,fixedPoints);
    
    Tform = fitgeotrans(movingPoints,fixedPoints,'nonreflectivesimilarity'); %Подходящее геометрическое преобразование к парам контрольной точки
    sc = scale * cos(angle);
    ss = scale * sin(angle);
    Tinv = invert(Tform);
    TformInv = invert(Tform);
    Tinv = TformInv.T;
    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scale_recovered = sqrt(ss*ss + sc*sc);
    theta_recovered = atan2(ss,sc)*180/pi;
    
    distorted = imresize(original, scale); % Изменяет размер изображения
    distorted = imrotate(distorted, angle); % Изменяет угол наклона изображения
    
    Roriginal = imref2d(size(original)); % устанавливает дополнительный ImageSize свойство.
    recovered = imwarp(distorted, Tform,'OutputView', Roriginal);
    figure, montage({original,recovered});
end

% call PositioningAndScalling(img, distorted, scale, angle);%