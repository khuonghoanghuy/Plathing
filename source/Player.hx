package;

import flixel.FlxG;

class Player extends PlatSprite
{
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        makeGraphic(32, 32);
    }    

    override function update(elapsed:Float) {
        super.update(elapsed);
    
        if (FlxG.keys.anyPressed([LEFT, A])) {
            velocity.x = -50;
        } else if (FlxG.keys.anyPressed([RIGHT, D])) {
            velocity.x = 50;
        } else {
            velocity.x = 0;
        }

        if (FlxG.keys.anyPressed([UP, W])) {
            velocity.y = -50;
        } else if (FlxG.keys.anyPressed([DOWN, S])) {
            velocity.y = 50;
        } else {
            velocity.y = 0;
        }
    }
}