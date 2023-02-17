package triangleGML;

@:structInit
class RectangleWindow{
    public var x: Float;
    public var y: Float;
    public var width: Float;
    public var height: Float;
    inline
    public function new( x: Float, y: Float, width: Float, height: Float ){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    inline
    public static function minMax( x: Float, y: Float, maxX: Float, maxY: Float ): RectangleWindow {
        return new RectangleWindow( x, y, maxX-x, maxY-y );
    }
}