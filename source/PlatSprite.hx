package;

import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;

class PlatSprite extends FlxSprite
{
    public function new(x:Float, y:Float, ?path:FlxGraphic) {
        super(x, y, path);
        antialiasing = SaveData.data.antialiasing;
    }    
}