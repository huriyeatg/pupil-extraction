function tiff2avi_converter ( filenameToConvert, filenameConverted,params)
% %tiff2avi_converter (filenameToConvert, filenameConverted,params) %%
% creates an avi video from sequences of images saved as .tiff
% INPUT:
%       filenameToConvert : filename for file to convert
%       filenameConverted : new name for converted .avi video
%       params            : frameRate and quality of video can be defined,
%       default frameRate =90Hz, quality =75%
%
% H Atilgan 06032021
%%
if exist('params','var') && isfield(params,'frameRate')
    frameRate = params.frameRate;
else
    frameRate = 90;
end

if exist('params','var') && isfield(params,'quality')
    quality = params.quality;
else
    quality = 90;
end

save_video_name = [filenameConverted,'.avi']; % Video name

newVideo = VideoWriter(save_video_name);  % Create the video object
newVideo.FrameRate =frameRate;     % Default 90 hz
newVideo.Quality = quality;        % Default 75%

open(newVideo);                           % Opem the video object

for i = 1:length(filenameToConvert)
    temp = im2double(imread(fullfile( filenameToConvert(i).folder,filenameToConvert(i).name)));
    writeVideo(newVideo,temp)      % Write each frame to the object
end
close(newVideo);                         % close the video object
end
