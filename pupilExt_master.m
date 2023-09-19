% master pupil extraction

% Conver tiff files to avi
params.frameRate = 30;  % fps
params.quality   = 100; % 
filenameListToConvert = dir('D:\CLAstPFC\2021-03-03\2021-03-03_21104_p001\*.tif'); % list of all tiff files 
filenameConverted = 'D:\CLAstPFC\2021-03-03\2021-03-03_21104_p001'; % '.avi will be added in the function
tiff2avi_converter ( filenameListToConvert, filenameConverted,params)

