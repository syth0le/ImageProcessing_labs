function PositioningAndScalling(original, distorted, scale, angle)
    movingPoints = [151.52 164.79; 131.40 79.04];
    fixedPoints = [135.26 200.15; 170.30 79.30];
    cpselect(distorted,original,movingPoints,fixedPoints);
    
    Tform = fitgeotrans(movingPoints,fixedPoints,'nonreflectivesimilarity');
    sc = scale * cos(angle);
    ss = scale * sin(angle);
    Tinv = invert(Tform);
    TformInv = invert(Tform);
    Tinv = TformInv.T;
    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scale_recovered = sqrt(ss*ss + sc*sc);
    theta_recovered = atan2(ss,sc)*180/pi;
    distorted = imresize(original, scale);
    distorted = imrotate(distorted, angle); 
    
    Roriginal = imref2d(size(original));
    recovered = imwarp(distorted, Tform,'OutputView', Roriginal);
    montage({original,recovered});
end
% PositioningAndScalling(img, distorted, scale, angle);%