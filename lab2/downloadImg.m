function [trainImagesDir, trainImages] = downloadImg()
    imagesDir = 'food11_dataset\training';
    exts = {'.jpg','.bmp','.png'};
    
    trainImagesDir = fullfile(imagesDir,'images','02');
    trainImages = imageDatastore(imagesDir,'FileExtensions',exts);