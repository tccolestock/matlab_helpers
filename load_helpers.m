function load_helpers()
%
% General loader to add the 'matlab_helpers' directory/package to the Path.
%
% This function needs to be copied to a location that's on the path. 
% For example, the default directory that's on path is:
%   C:/User_Name/Documents/MATLAB/
% This "Helpers" package should be stored as
%   C:/User_Name/Documents/MATLAB/matlab_helpers/
% Then this file should be copied to:
%   C:/User_Name/Documents/MATLAB/load_helpers.m
% * An alternative is to permanantly add this folder and all subfolders to
% the Path.
%

[fpath, name, ext] = fileparts(mfilename('fullpath'));
addpath(fullfile(fpath, 'matlab_helpers'));

end