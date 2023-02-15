# triangleGML
  
XML Markup Language - Just Shape defined nodes.
Initially Abstract Classes with Generic ```<DRAWTOOL,IMAGETOOL>``` provides XML attibute parsing without reflection or macros.
Concept intitally for PixelimageXY, currently no implementation included.
  
Implementation of `render` potentially will be extended for `cornerContour`, and perhaps `fl` api's, `svg`, `canvas`.
  
Only 3 abstract node shapes included so far, lots more to come.
  
- ArrowShape_
- LineGridShape_
- LineShape_

More to be included from `pixelimage`.

`TriangleGML_` abstract class is used to parse and create shapes, a target will need to implement the render and provide this method with the list of supported shapes.
  
```getTriangleGML( nodeName: String )```
  
will be clearer when `pixelimageXY` has an implementation included.
