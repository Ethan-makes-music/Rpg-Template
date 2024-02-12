package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class MainMenu extends FlxState
{
	var title:FlxText = new FlxText(100, 50, FlxG.width, "Game Title", 64);
	var pressXToStart:FlxText = new FlxText(100, 120, FlxG.width, "Press Enter to Start!!", 32);

	override public function create()
	{
		super.create();

		add(title);
		add(pressXToStart);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}
	}
}
