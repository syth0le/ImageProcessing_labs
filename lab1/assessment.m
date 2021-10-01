function assessment(img, scale, angle, movingPoints, fixedPoints)
    Tform = fitgeotrans(movingPoints,fixedPoints,'nonreflectivesimilarity');
    sc = scale * cos(angle);
    ss = scale * sin(angle);
    Tinv = invert(tform);
    tformInv = invert(tform);
    Tinv = tformInv.T;
    ss = Tinv(2,1);
    sc = Tinv(1,1);
    scale_recovered = sqrt(ss*ss + sc*sc);
    theta_recovered = atan2(ss,sc)*180/pi;
    distorted = imresize(img, scale);
    distorted = imrotate(distorted, angle); 
    
    Roriginal = imref2d(size(img));
    recovered = imwarp(distorted, tform,'OutputView', Roriginal);
    montage({original,recovered});
end