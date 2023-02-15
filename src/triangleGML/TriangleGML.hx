package triangleGML;

import triangleGML.*;


abstract class TriangleGML_<DRAWTOOL,IMAGETOOL> {
    var drawTool: DRAWTOOL;
    var xml: Xml;
    var offX: Float;
    var offY: Float;
    public var shapes: Array<ShapeInterface<DRAWTOOL,IMAGETOOL>>;
    public var imageResource = new haxe.ds.StringMap<IMAGETOOL>();

    public function addImage( name: String, imageTool: IMAGETOOL ): IMAGETOOL {
        var lowerName = name.toLowerCase();
        imageResource.set( lowerName, imageTool );
        return imageTool;
    }

    public function new( drawTool: DRAWTOOL, xml: Xml, x: Float = 0., y: Float = 0. ){
        this.drawTool = drawTool;
        this.xml = xml;
        this.offX = x;
        this.offY = y;
        process();
    }
    public function addShape( str: String, x: Float = 0., y: Float = 0. ): TriangleGML_<DRAWTOOL,IMAGETOOL> {
        xml = Xml.parse( '<node>'+str+'</node>' ).firstElement(); 
        this.offX = x;
        this.offY = y;
        process();
        return this;
    }
    
    function process(){
        //trace( xml );
        for( e in xml.elements() ) processShape( e );
    }
    
    function processShape( x: Xml ){
        var name: String = x.nodeName;
        var s = getTriangleGML( name );
        for( att in x.attributes() ){
            trace( att + ' ' + x.get(att) );
            if( att.substr( 0, 'image'.length ) == 'image' ){
                // use image resource
                s.setImage( att.toLowerCase(), imageResource.get( x.get(att) ) );
            } else {
                s.setParameter( att, x.get( att ) );
            }
        }
        if( offX != 0. || offY != 0. ){
            s.translate( offX, offY );
        }
        s.render( drawTool );
        if( shapes == null ) shapes = [];
        shapes.push( s );
    }

    abstract public function getTriangleGML( nodeName: String ): ShapeInterface<DRAWTOOL,IMAGETOOL>;
}

// Reconsider...
enum abstract TriangleGMLname ( String ) to String {
    /* contour */
    var ARROW_SHAPE                 = 'ArrowShape';
	var CUBIC_CURVE_SHAPE           = 'CubicCurveShape';
    var LINE_GRID_SHAPE             = 'LineGridShape';
    var LINE_SHAPE                  = 'LineShape';
    var POLY_LINE_SHAPE             = 'PolyLineShape';
    var QUAD_CURVE_SHAPE            = 'QuadCurveShape';
    var QUAD_SHAPE                  = 'QuadShape';
    var QUAD_SOFT_SHAPE             = 'QuadSoftShape';
    var QUINT_SHAPE                 = 'QuintShape';
    var SOFT_ELLIPSE_SHAPE          = 'SoftEllipseShape';
    var THRU_CURVE_SHAPE            = 'ThruCurveShape';
    var TRIANGLE_SOFT_SHAPE         = 'TriangleSoftShape';
    /* gradient */
    var ARROW_THICK_GRADIENT        = 'ArrowThickGradient';
    var ELLIPSE_RADIAL_GRADIENT     = 'EllipseRadialGradient';
    var PATH_ELEMENT_THICK_GRADIENT = 'PathElementThickGradient';
    var QUAD_GRADIENT               = 'QuadGradient';
    var TRIANGLE_GRADIENT           = 'TriangleGradient';
    /* gradientContour */
    var LINE_GRADIENT               = 'LineGradient';
    var POLY_LINE_GRADIENT          = 'PolyLineGradient';
    /* patternContour */  
    var CUBIC_CURVE_PATTERN         = 'CubicCurvePattern';
    var LINE_PATTERN                = 'LinePattern';
    var QUAD_PATTERN                = 'QuadPattern';
    var TRIANGLE_PATTERN            = 'TrianglePattern';
    // patternShape
    var ARC_PATTERN                 = 'ArcPattern';
    var CIRCLE_PATTERN              = 'CirclePattern';
    var ELLIPSE_PATTERN             = 'EllipsePattern';
    var PATH_ELEMENT_PATTERN        = 'PathElementPattern';
    var PATH_SOFT_ELEMENT_PATTERN   = 'PathSoftElementPattern';
    var QUADRILATERAL_PATTERN       = 'QuadrilateralPattern';
    var RECTANGLE_PATTERN           = 'RectanglePattern';
    var SQUARE_PATTERN              = 'SquarePattern';
    // shape
    var ARC_SHAPE                   = 'ArcShape';
    var CIRCLE_SHAPE                = 'CircleShape';
    var ELLIPSE_SHAPE               = 'EllipseShape';
    var PATH_ELEMENT_SHAPE          = 'PathElementShape';
    var QUADRILATERAL_SHAPE         = 'QuadrilateralShape';
    var RECTANGLE_SHAPE             = 'RectangleShape';
    var SQUARE_SHAPE                = 'SquareShape';
    var STAR6_SHAPE                 = 'Star6Shape';
    var TRIANGLE_SHAPE              = 'TriangleShape';
    var VE_PATH_ELEMENT_SHAPE       = 'VePathElementShape';
}