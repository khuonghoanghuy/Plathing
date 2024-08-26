package;

class PlayState extends PlatState
{
	var player:Player = new Player(20, 20);

	override public function create()
	{
		super.create();
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
