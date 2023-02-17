package triangleGML.shape.form;
import triangleGML.FillForm;

@:structInit
abstract class PolygonForm_<DRAWTOOL,IMAGETOOL> extends FillForm<DRAWTOOL,IMAGETOOL> {
    public var points:Null<Array<Float>>;
    public var rotation: Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , points = null
                        , rotation = 0.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.rotation = rotation;
        this.points = points;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ]; 
            case 'rotation':
                var degree = Std.parseFloat( value );
                rotation = ( degree == 0 )?0: Math.PI*degree/180;
            case _:
                super.setParameter( name, value );
        }
    }
}