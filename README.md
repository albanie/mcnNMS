### Non-Maximum Suppression (NMS)

This directory contains CPU and GPU implementations of non-maximum supression, based on Shaoqing Ren's [code](https://github.com/ShaoqingRen/faster_rcnn/tree/master/functions/nms).

### Installation

The easiest way to use this module is to install it with the vl_contrib package manager. 
`mcnNMS` can be installed with the following commands from the root directory of your MatConvNet installation:

```
vl_contrib('install', 'mcnNMS') ;
vl_contrib('compile', 'mcnNMS') ;
vl_contrib('setup', 'mcnNMS') ;
vl_contrib('test', 'mcnNMS') ;
```

### Notes

If you are working with MATLAB on the CPU, you can't really do better than Tomasz Malisiewicz's vectorised [nms_fast](http://www.computervisionblog.com/2011/08/blazing-fast-nmsm-from-exemplar-svm.html) function.  However, if you have access to a GPU, it is possible to compute the overlaps between boxes in parallel before picking indices in a single pass over the inputs. This can yield a dramatic speed up when processing large numbers of boxes, and it is the approach taken in object detection frameworks like [Faster R-CNN](https://arxiv.org/abs/1506.01497) which perform this operation on every forward pass for region proposal.  The code in this repo is a direct port of Shaoqing Ren's nms mex code.



