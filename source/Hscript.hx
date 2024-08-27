package;

import hscript.Interp;
import hscript.Parser;

class Hscript
{
	public static var interp:Interp = new Interp();
	public static var parser:Parser = new Parser();

	public static function getFile(file:String)
	{
		interp.variables.set("game", PlayState.tS);
		parser.allowTypes = true;
		var program = parser.parseString(PlatUtil.parseTextAsString(file));
		interp.execute(program);
	}
}