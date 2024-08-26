package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	var inSection:String = "Adjust Setting";
	var inSectionTxt:FlxText = new FlxText(10, FlxG.height - 20, 0, "", 16);

	var fpsBar:FlxBar;
	var fpsTxt:FlxText;

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

		if (FlxG.keys.anyJustPressed([A]))
		{
			fpsUpdater(-10);
		}

		if (FlxG.keys.anyJustPressed([D]))
		{
			fpsUpdater(10);
		}
	}

	function adjustDataSection()
	{
		fpsBar = new FlxBar(0, 0, LEFT_TO_RIGHT, FlxG.width - 50, 50, this, "SaveData.data.framerate", 60, 120);
		fpsBar.value = SaveData.data.framerate;
		fpsBar.screenCenter(XY);
		fpsBar.createFilledBar(FlxColor.GRAY, FlxColor.WHITE, true, FlxColor.BLACK);
		add(fpsBar);
		fpsTxt = new FlxText(0, 0, 0, "FPS: " + SaveData.data.framerate, 28);
		fpsTxt.setFormat(null, 28, FlxColor.WHITE, CENTER, OUTLINE);
		fpsTxt.screenCenter();
		add(fpsTxt);
	}

	function fpsUpdater(value:Int = 0)
	{
		if (SaveData.data.framerate == 60) {}
		else
		{
			SaveData.data.framerate += value;
			fpsBar.value = SaveData.data.framerate;
		}
		Framerate.getUpdate(SaveData.data.framerate);
		trace("fps was update into " + value);
	}
}