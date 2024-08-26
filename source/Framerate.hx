package;

import openfl.Lib;

class Framerate
{
	public static function getUpdate(value:Int)
		return Lib.current.stage.frameRate = value;
}