function test_mcnNMS
% ------------------------
% run tests for NMS module
% ------------------------

% add tests to path
addpath(fullfile(fileparts(mfilename('fullpath')), 'matlab/xtest')) ;
addpath(fullfile(vl_rootnn, 'matlab/xtest/suite')) ;

% run basic tests
run_nms_tests('command', 'nn') ;
