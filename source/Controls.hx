package;

import flixel.FlxG;
import flixel.input.FlxInput.FlxInputState;
import flixel.input.keyboard.FlxKey;

class Controls
{
	public static var actionMap:Map<String, FlxKey> = [
		"left" => SaveData.data.keyMap[0],
		"down" => SaveData.data.keyMap[1],
		"up" => SaveData.data.keyMap[2],
		"right" => SaveData.data.keyMap[3],
		"accept" => SaveData.data.keyMap[4],
		"exit" => SaveData.data.keyMap[5],
		"space" => SaveData.data.keyMap[6]
	];

	public function is(action:String, ?state:FlxInputState = JUST_PRESSED, ?exact:Bool = false):Bool
	{
		if (!exact)
		{
			if (state == PRESSED && is(action, JUST_PRESSED))
				return true;
			if (state == RELEASED && is(action, JUST_RELEASED))
				return true;
		}

		return (actionMap.exists(action)) ? FlxG.keys.checkStatus(actionMap.get(action), state) : FlxG.keys.checkStatus(FlxKey.fromString(action), state);
	}

	public function get(action:String):FlxInputState
	{
		if (is(action, JUST_PRESSED))
			return JUST_PRESSED;
		if (is(action, PRESSED))
			return PRESSED;
		if (is(action, JUST_RELEASED))
			return JUST_RELEASED;

		return RELEASED;
	}
}