package sphis.planet_monitoring;

import flixel.FlxG;
import flixel.FlxState;

using StringTools;

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

		var calculation:Float = 0.0;
		if (office.state == 'door-intro')
			calculation = (office.animation_frame / 13);
		else if (office.state == 'door-outro')
		{
			var frame = (12 - office.animation_frame);
			trace(frame);
			calculation = (frame / 12);
		}
		else if (office.state == 'door')
		{
			calculation = 1.0;
		}

		if (office.state == 'idle')
		{
			while (calculation > 0)
			{
				calculation = 0;
				trace(calculation);
			}
		}

		office.x += 200 * calculation;
		office.y += 100 * calculation;

		if (FlxG.keys.justReleased.LEFT && office.state == 'idle')
			office.doorIntro();
		if (FlxG.keys.justReleased.RIGHT && office.state == 'door')
			office.doorOutro();
	}
}
