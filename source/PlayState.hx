package;

import flixel.FlxG;

class PlayState extends PlatState
{
	var player:Player = new Player(20, 20);

	override public function create()
	{
		super.create();
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
			openSubState(new PauseSubState());
	}
}
