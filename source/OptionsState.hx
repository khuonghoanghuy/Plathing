package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	var inSection:String = "Adjust Setting";
	var inSectionTxt:FlxText = new FlxText(10, FlxG.height - 20, 0, "", 20);

	var fpsBar:PlatSprite;

	public function new()
	{
		super();
	}

	override function create()
	{
		super.create();
		inSectionTxt.text = inSection;
		add(inSectionTxt);
		adjustDataSection();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		inSectionTxt.text = inSection;

		var fps:Float = SaveData.data.framerate;
		var minFPS:Float = 60;
		var maxFPS:Float = 120;
		var scale:Float = (fps - minFPS) / (maxFPS - minFPS);
		scale = Math.max(0, Math.min(1, scale));
		fpsBar.scale.set(scale, 1);
	}

	function adjustDataSection()
	{
		fpsBar = new PlatSprite(40, 100);
		fpsBar.makeGraphic(100, 10, 0xFF000000);
		fpsBar.scale.set(0, 1);
		add(fpsBar);
	}
}