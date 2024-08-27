package;

class Coins extends PlatSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic(AssetPaths.coin__png, true, 16, 16);
		animation.add("idle", [0, 1, 2, 1, 0], 12, true);
		animation.add("getCoin", [2, 3, 4, 5, 6], 12);
	}
}