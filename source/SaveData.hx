package;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

@:structInit class Data {
    public var antialiasing:Bool = false;
	public var keyMap:Array<FlxKey> = [LEFT, DOWN, UP, RIGHT, A, S, W, D];
}

class SaveData {
    public static var data:Data = {};

	public static function init() {
		for (key in Reflect.fields(data))
			if (Reflect.field(FlxG.save.data, key) != null)
				Reflect.setField(data, key, Reflect.field(FlxG.save.data, key));
	}

	public static function saveSettings() {
		for (key in Reflect.fields(data))
			Reflect.setField(FlxG.save.data, key, Reflect.field(data, key));

		FlxG.save.flush();

		trace('settings saved!');
	}
}