package;

import flixel.FlxG;

class Player extends PlatSprite
{
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
		makeGraphic(16, 16);
	}

	public var holdShift(default, set):Int = 1;
	public var isJumping:Bool = false;

    override function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.anyPressed([LEFT, A])) {
			velocity.x = -20 * holdShift;
        } else if (FlxG.keys.anyPressed([RIGHT, D])) {
			velocity.x = 20 * holdShift;
        } else {
            velocity.x = 0;
        }

        if (FlxG.keys.anyPressed([UP, W])) {
			velocity.y = -20 * holdShift;
        } else if (FlxG.keys.anyPressed([DOWN, S])) {
			velocity.y = 20 * holdShift;
        } else {
            velocity.y = 0;
        }
		set_holdShift(1);
	}

	function set_holdShift(value:Int):Int
	{
		if (FlxG.keys.pressed.SHIFT)
		{
			value = 2;
		}
		else
		{
			value = 1;
		}
		return holdShift = value;
    }
}