package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class LoadingState extends FlxState {
    var inSection:String = "Init Data"; // is should have more thing to cache
    var textCenter:FlxText;

    override function create() {
        super.create();

        textCenter = new FlxText(0, 0, 0, inSection, 32);
        textCenter.screenCenter();
        add(textCenter);

        initThing();
    }

    function initThing() {
        SaveData.init();
		PlatGame.getUpdate(SaveData.data.framerate);

        inSection = "Done";
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
        textCenter.text = inSection;
        if (inSection == "Done") {
            callToPressEnter();
        }
        if (inSection == "Done") {
            if (FlxG.keys.justPressed.ENTER) {
                FlxG.switchState(new MenuState());
            }
        }
    }

    function callToPressEnter() {
        var askToPressEnter:FlxText = new FlxText(10, FlxG.height - 20, 0, "Press Enter to Continue", 16);
        add(askToPressEnter);
    }
}