function mat2avi_converter ( filenameToConvert, filenameConverted,params)
% %mat2aviConverter ( path) %%
% creates an avi video from sequences of images saved as .mat
% INPUT:
%       filenameToConvert : filename for file to convert
%       filenameConverted : new name for converted .avi video
%       params            : frameRate and quality of video can be defined,
%       default frameRate =90Hz, quality =75%
%
% H Atilgan 06112020
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

temp = load(filenameToConvert);

newVideo = VideoWriter(save_video_name);  % Create the video object
newVideo.FrameRate =frameRate;     % Default 90 hz
newVideo.Quality = quality;        % Default 75%

open(newVideo);                           % Opem the video object

for ii = 1:length(temp)
    writeVideo(newVideo,temp{ii})      % Write each frame to the object
end
close(newVideo);                         % close the video object
end
