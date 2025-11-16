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
		office.scale.set(.75, .75);
		office.updateHitbox();
		add(office);
	}

	var time:Float = 0.0;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		time += elapsed;

		office.screenCenter();

		office.x -= Math.sin((time) * 2) * 5;
		office.y += Math.cos((time) * 2) * 5;

		if (FlxG.keys.justReleased.LEFT && office.state == 'idle')
			office.doorIntro();
		if (FlxG.keys.justReleased.RIGHT && office.state == 'door')
			office.doorOutro();
	}
}
