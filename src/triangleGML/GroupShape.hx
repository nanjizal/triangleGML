package triangleGML;

import triangleGML.hitTest.IhitObj;

@:structInit
abstract class GroupShape<DRAWTOOL,IMAGETOOL> implements ShapeInterface<DRAWTOOL,IMAGETOOL> {
    var isDirty = true; // TODO: <-- potentially remove
    public var visibility: Bool;
    public var opacity:    Float;
    public var offX:       Float = 0.;
    public var offY:       Float = 0.;
    public var hitObj:     Null<IhitObj<DRAWTOOL>> = null;

    public function new( opacity = 1., visibility = true ){
        this.visibility = visibility;
        this.opacity = opacity;
    }
    public function setParameter( name: String, value: String ){
        switch( name ){
            case 'visibility':
                visibility = ( value.toLowerCase() == 'true' )? true: false;
            case 'opacity':
                opacity = Std.parseFloat( value );
            case _:
                trace( 'property not found ' + name );
        }
    }
    abstract public function setImage( name: String, imageTool: IMAGETOOL ):IMAGETOOL;
    public function translate( x: Float, y: Float ){
        offX = x;
        offY = y;
    }
    abstract public function render( drawTool: DRAWTOOL ): DRAWTOOL;
    abstract public function clear( drawTool: DRAWTOOL, color: Int ): DRAWTOOL;
    public function hit( x: Float, y: Float ): Bool {
        return if( hitObj == null ){
            false;
        } else {
            hitObj.hit( x, y );
        }
    }
}