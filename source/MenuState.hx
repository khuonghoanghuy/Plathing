package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends PlatState
{
    var grpText:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
	var controlsString:Array<String> = ["Play", "Options", "Quit"];
    var curSelected:Int = 0;

    override function create() {
        super.create();
        add(grpText);
        for (i in 0...controlsString.length) {
			var text:FlxText = new FlxText(30, 100 + (i * 30), 0, controlsString[i], 20);
            text.ID = i;
            grpText.add(text);
        }
        changeSelection();
	}

    override function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.anyJustPressed([UP, W])) {
            changeSelection(-1);
        }

        if (FlxG.keys.anyJustPressed([DOWN, S])) {
            changeSelection(1);
        }

        if (FlxG.keys.justPressed.ENTER) {
            switch (controlsString[curSelected]) {
                case "Play":
					PlatGame.switchState(new SelectStageState());
				case "Options":
					PlatGame.switchState(new OptionsState());
                case "Quit":
					PlatGame.quitGame();
            }
        }
    }

    function changeSelection(change:Int = 0) {
        curSelected += change;
        
        if (curSelected < 0)
			curSelected = grpText.length - 1;

		if (curSelected >= grpText.length)
			curSelected = 0;

		grpText.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});
    }
}