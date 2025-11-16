package sphis.planet_monitoring;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Office extends FlxSprite
{
	public var state:String = '';

	var path_prefix = 'assets/images/office/';

	var transitioning:Bool = false;
	var animation_frame:Int = 0;

	override public function new()
	{
		super();

		idle();
	}

	public function idle()
	{
		if (transitioning)
			return;

		transitioning = false;
		animation_frame = 0;
		state = 'idle';
		loadGraphic(path_prefix + 'idle.png');
	}

	public function doorIntro()
	{
		if (transitioning)
			return;

		transitioning = true;
		animation_frame = 1;

		state = 'door-intro';
		new FlxTimer().start(1 / 24, t ->
		{
			loadGraphic(path_prefix + 'door-intro_' + ((animation_frame < 10) ? '0' + animation_frame : '' + animation_frame) + '.png');
			animation_frame++;

			if (animation_frame == 13)
				state = 'door';
		}, 12);
	}

	public function doorOutro()
	{
		if (transitioning)
			return;

		transitioning = true;
		animation_frame = 1;

		state = 'door-outro';
		new FlxTimer().start(1 / 24, t ->
		{
			loadGraphic(path_prefix + 'door-outro_' + ((animation_frame < 10) ? '0' + animation_frame : '' + animation_frame) + '.png');
			animation_frame++;

			if (animation_frame == 13)
				state = 'idle';
		}, 12);
	}
}
