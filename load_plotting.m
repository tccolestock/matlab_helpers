function load_plotting()
%
% Add the 'plotting' helper package to the Path
%

[fpath, name, ext] = fileparts(mfilename('fullpath'))
addpath(fullfile(fpath, 'plotting'));

end