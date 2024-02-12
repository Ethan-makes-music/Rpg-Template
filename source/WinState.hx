package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class WinState extends FlxState
{
	var winText:FlxText = new FlxText(100, 50, FlxG.width, "You Win!!", 64);
	var restart:FlxText = new FlxText(100, 120, FlxG.width, "Press Enter to Restart!!", 32);

	override function create()
	{
		super.create();
		add(winText);
		add(restart);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new MainMenu());
		}
	}
}
