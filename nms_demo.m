function nms_demo(varargin)
% NMS_DEMO a short demo for the vl_nnbboxnms function

  opts.gpu = 1 ;
  opts = vl_argparse(opts, varargin) ;

  % randomly generate some boxes (ensuring that they are valid)
  numBoxes = 5000 ; overlapThresh = 0.3 ; 
  bb = rand(4, numBoxes) ; sc = 100 ;
  bb(3:4,:) = bsxfun(@minus, 1, bb(1:2,:)) .* bb(3:4,:) + bb(1:2,:) ;
  bb = [single(round(bb * sc)) ; rand(1, numBoxes) ] ;

  % load data to gpu if needed
  if ~isempty(opts.gpu), gpuDevice(opts.gpu) ; bb = gpuArray(bb) ; end

  % vl_nnbboxnms expects boxes to be in the shape 5 x N, sorted by descending
  % score, where the rows have the format [xmin ymin xmax ymax score]'
  [~,sIdx] = sort(bb(5,:), 'descend') ; 
  bb = bb(:,sIdx) ;

  % run nms
  pick = vl_nnbboxnms(bb, overlapThresh) ;
  fprintf('%d boxes were selected\n', numel(pick)) ;

