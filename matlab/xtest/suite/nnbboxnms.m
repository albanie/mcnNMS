classdef nnbboxnms < nntest

  methods (Test)

    function compare_against_standard_nms(test)
      % The current NMS code is not differentiable, so we simply 
      % checkout outputs against a standard implementation which can 
      % be found in the fast_rcnn examples folder
      if ~exsit('bbox_nms', 'file')
        addpath(fullfile(vl_rootnn, 'examples/fast_rcnn/bbox_functions')) ;
      end
      
      numBoxes = 50000 ;
      boxes = rand(numBoxes, 4) ;
      boxes(:,3:4) = bsxfun(@minus, 1, boxes(:,1:2)) .* boxes(:,3:4) + boxes(:,1:2) ;
      overlap = single(0.3) ; 
      boxes = [single(round(boxes * sc)) rand(numBoxes, 1) ] ;
      overlap = rand(1, 'single') ;
      boxes = [single(round(boxes * sc)) rand(numBoxes, 1) ] ;

      [~,sIdx] = sort(boxes(:,5), 'descend') ; % vl_nnbboxnms expects sorted boxes
      boxes = boxes(sIdx,:) ;

      pick1 = bbox_nms(boxes, overlap) ;
      pick2 = vl_nnbboxnms(inBoxes, overlap) ;

      % NOTE: this may fail if any of the boxes share the same score, in which
      % case the outcome ordering is not defined and
      assert(isequal(pick1, pick2), 'nms functions did not match') ;
    end

  end
end
