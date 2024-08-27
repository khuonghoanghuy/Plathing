package;

import lime.utils.Assets;

using StringTools;

class PlatUtil {
    public static function parseArrayAsString(file:String):Array<String> {
        var string:Array<String> = Assets.getText(file).trim().split('\n');
        return string;
    }
	public static function parseTextAsString(file:String):String
	{
		var string:String = Assets.getText(file).trim();
		return string;
	}
}