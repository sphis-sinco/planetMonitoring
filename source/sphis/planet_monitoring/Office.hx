package sphis.planet_monitoring;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Office extends FlxSprite
{
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
		loadGraphic(path_prefix + 'idle.png');
	}

	public function doorIntro()
	{
		if (transitioning)
			return;

		transitioning = true;
		animation_frame = 1;

		new FlxTimer().start(1 / 24, t ->
		{
			loadGraphic(path_prefix + 'door-intro_' + ((animation_frame < 10) ? '0' + animation_frame : '' + animation_frame) + '.png');
			animation_frame++;
		}, 12);
	}

	public function doorOutro()
	{
		if (transitioning)
			return;

		transitioning = true;
		animation_frame = 1;

		new FlxTimer().start(1 / 24, t ->
		{
			loadGraphic(path_prefix + 'door-outro_' + ((animation_frame < 10) ? '0' + animation_frame : '' + animation_frame) + '.png');
			animation_frame++;
		}, 12);
	}
}
