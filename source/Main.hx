package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		addChild(new FlxGame(640, 480, LoadingState));
		addChild(new openfl.display.FPS(3, 3, 0xcdc9c9));
	}
}
