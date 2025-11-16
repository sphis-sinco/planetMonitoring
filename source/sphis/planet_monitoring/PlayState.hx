package sphis.planet_monitoring;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var office:Office;

	override public function create()
	{
		super.create();

		office = new Office();
		office.updateHitbox();
		add(office);
	}

	var time:Float = 0.0;
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		time += elapsed;
		office.x = 0 - Math.sin((time) * 2) * 5;
		office.y = 0 + Math.cos((time) * 2) * 5;
	}
}
