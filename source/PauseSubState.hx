package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseSubState extends PlatSubState
{
	var gameTxt:FlxText = new FlxText(20, 20, 0, "", 20);
	var randomText:Array<String> = [];

	override function create()
	{
		super.create();
		randomText = PlatUtil.parseArrayAsString(AssetPaths.someRandomText__txt);

		var bg:PlatSprite = new PlatSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.5;
		add(bg);

		gameTxt.setFormat(null, 28, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.BLACK);
		add(gameTxt);

		gameTxt.text = randomText[FlxG.random.int(0, randomText.length)];
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE) // close
		{
			close();
		}

		if (FlxG.keys.justPressed.ENTER) // return back to menu
		{
			close();
			PlatGame.switchState(new SelectStageState());
		}
	}
}