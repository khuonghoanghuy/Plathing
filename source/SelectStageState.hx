package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Json;

class SelectStageState extends PlatState
{
	var titleText:FlxText;
	var titleTextBG:PlatSprite;
	var anotherTitleTextBG:PlatSprite;

	var textOnSelect:FlxText;
	var textOnString:String = "null";
	var curSection:Int = 0;
	var desctionTxt:FlxText;
	var desctionString:String = "null";
	var difficultString:String = "Very Easy";
	var bgOfThisLv:PlatSprite;

	var numLv:String = Std.string(AssetPaths.numLv__txt);
	var numDiff:Int = 0; // VERY EASY

	var jsonChart:Dynamic;

    override function create() {
		super.create();
		trace(numLv);
		numDiff = jsonChart.diff;

		titleTextBG = new PlatSprite(-203, -30);
		titleTextBG.makeGraphic(300, 150, FlxColor.GRAY);
		titleTextBG.angle = -10;
		titleTextBG.scale.set(5, 1);
		add(titleTextBG);

		titleText = new FlxText(30, 30, 0, "Choose a Level", 28);
		titleText.setFormat(null, 28, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		titleText.angle = -5;
		add(titleText);

		anotherTitleTextBG = new PlatSprite(-19, -453);
		anotherTitleTextBG.angle = 10;
		anotherTitleTextBG.makeGraphic(300, 150, FlxColor.GRAY);
		add(anotherTitleTextBG);

		textOnSelect = new FlxText(127, 196, 0, textOnString, 28);
		textOnSelect.setFormat(null, 28, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.BLACK);
		add(textOnSelect);

		desctionTxt = new FlxText(132, 236, 0, desctionString, 20);
		desctionTxt.setFormat(null, 20, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.BLACK);
		add(desctionTxt);
	}

	function changeDiff():Void
	{
		switch (numDiff)
		{
			case 0:
				difficultString = "Very Easy";
			case 1:
				difficultString = "Easy";
			case 2:
				difficultString = "Normall";
			case 3:
				difficultString = "Hard";
			default:
				difficultString = "Very Easy";
		}
	}

    override function update(elapsed:Float) {
        super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE)
		{
			PlatGame.switchState(new MenuState());
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			PlatGame.switchState(new PlayState());
		}
	}
}