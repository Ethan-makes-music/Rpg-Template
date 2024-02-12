package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	var sprint:Bool = false;
	var moveAmt:Int = 3;

	public function new()
	{
		super();
		this.makeGraphic(64, 64, FlxColor.WHITE);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.SPACE)
		{
			moveAmt = 5;
		}
		else if (!FlxG.keys.pressed.SPACE)
		{
			moveAmt = 3;
		}

		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
		{
			this.y = this.y - moveAmt;
		}
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
		{
			this.y = this.y + moveAmt;
		}
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
		{
			this.x = this.x - moveAmt;
		}
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
		{
			this.x = this.x + moveAmt;
		}
	}
}
