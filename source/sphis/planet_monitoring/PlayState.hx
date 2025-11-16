package sphis.planet_monitoring;

import flixel.FlxState;

class PlayState extends FlxState
{
	public var office:Office;

	override public function create()
	{
		super.create();
		office = new Office();
		add(office);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
