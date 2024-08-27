package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseSubState extends PlatSubState
{
	override function create()
	{
		super.create();

		var bg:PlatSprite = new PlatSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.5;
		add(bg);

		add(new FlxText(0, 0, 0, "Pause Game", 30));
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE) // close
			close();

		if (FlxG.keys.justPressed.ENTER) // return back to menu
		{
			close();
			PlatGame.switchState(new SelectStageState());
		}
	}
}