package;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PlayState extends PlatState
{
	public static var tS:PlayState = null;

	var player:Player = new Player(20, 20);
	var map:FlxTilemap = new FlxTilemap();
	var curLv:Int = 1;

	// var coin:PlatSprite = new PlatSprite(50, 20);
	var coins:FlxTypedGroup<Coins> = new FlxTypedGroup<Coins>();

	override public function create()
	{
		tS = this;
		super.create();
		map.loadMapFromGraphic('assets/images/lv/$curLv.png', false, // invert
			1, // scale
			null, // colorMap
			FlxGraphic.fromClass(GraphicAutoFull),
			16, // tile_width
			16, // tile_height
			FULL, // autoTile
			0, // startingIndex
			1 // drawIndex)
		);
		add(map);
		Hscript.getFile("assets/data/lv/coins/" + curLv + ".hxc");

		add(player);
		add(coins);
	}

	public function addCoin(x:Float = 0, y:Float = 0)
		return coins.add(new Coins(x + 4, y + 4));

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, map);

		if (FlxG.keys.justPressed.ESCAPE)
			openSubState(new PauseSubState());
		FlxG.overlap(player, coins, function(player:Player, coins:PlatSprite)
		{
			FlxTween.tween(coins, {alpha: 0}, 0.3, {
				ease: FlxEase.sineInOut,
				onStart: function(tween:FlxTween)
				{
					coins.animation.play("getCoin");
				},
				onComplete: function(tween:FlxTween)
				{
					coins.exists = false;
				}
			});
		});
	}
}
