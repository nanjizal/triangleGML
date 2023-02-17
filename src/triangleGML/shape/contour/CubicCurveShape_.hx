package triangleGML.shape.contour;
import triangleGML.BasicShape;

@:structInit
abstract class CubicCurveShape_<DRAWTOOL,IMAGETOOL> extends BasicShape<DRAWTOOL,IMAGETOOL> {
    public var x1:      Float;
    public var y1:      Float;
    public var x2:      Float;
    public var y2:      Float;
    public var x3:      Float;
    public var y3:      Float;
    public var x4:      Float;
    public var y4:      Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x00000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , x1 = 0.
                        , y1 = 0.
                        , x2 = 0.
                        , y2 = 0.
                        , x3 = 0.
                        , y3 = 0.
                        , x4 = 0.
                        , y4 = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray );
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.x3 = x3;
        this.y3 = y3;
        this.x4 = x4;
        this.y4 = y4;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'x1':
                x1 = Std.parseFloat( value );
            case 'y1':
                y1 = Std.parseFloat( value );
            case 'x2':
                x2 = Std.parseFloat( value );
            case 'y2':
                y2 = Std.parseFloat( value );
            case 'x3':
                x3 = Std.parseFloat( value );
            case 'y3':
                y3 = Std.parseFloat( value );
            case 'x4':
                x4 = Std.parseFloat( value );
            case 'y4':
                y4 = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
}