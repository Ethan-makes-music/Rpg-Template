package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Enemy extends FlxSprite
{
	var direction = "left";

	public function new()
	{
		super(340, 120);
		this.makeGraphic(64, 64, FlxColor.RED);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (direction == "left")
		{
			this.x = this.x - 5;
		}
		else if (direction == "right")
		{
			this.x = this.x + 5;
		}

		if (this.x < -60 && direction == "left")
		{
			direction = "right";
		}
		else if (this.x > 633 && direction == "right")
		{
			direction = "left";
		}
	}
}
