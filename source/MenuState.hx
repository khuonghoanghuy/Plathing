package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
    var grpText:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
    var controlsString:Array<String> = PlatUtil.parseArrayAsString(AssetPaths.MenuString__txt);
    var curSelected:Int = 0;

    override function create() {
        super.create();
        add(grpText);
        for (i in 0...controlsString.length) {
            var text:FlxText = new FlxText(20, 50 + (i * 30), 0, controlsString[i], 20);
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
                case "Options":
                case "Quit":
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