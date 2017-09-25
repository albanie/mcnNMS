function setup_mcnNMS()
%SETUP_MCNNMS Sets up mcnNMS, by adding its folders to the Matlab path

  root = fileparts(mfilename('fullpath')) ;
  addpath(root, [root '/matlab'], [root '/matlab/mex']) ;
