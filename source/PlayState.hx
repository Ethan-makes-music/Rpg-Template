package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Timer;

class PlayState extends FlxState
{
	var plr:FlxSprite;
	var dir:String = "down";

	var eastWest:Int = 0;
	var northSouth:Int = 0;

	var attacking:Bool = false;
	var sword:FlxSprite = new FlxSprite(0, 0);

	var enemy:FlxSprite;
	var enemyDead:Bool = false;

	var winSPR:FlxSprite = new FlxSprite(130, 330);

	// Kill shit
	var killsNeeded:Int = 1;
	var kills:Int = 0;
	var killNeededTXT:FlxText;

	override public function create()
	{
		super.create();
		plr = new Player();
		add(plr);

		enemy = new Enemy();

		sword.makeGraphic(64, 32, FlxColor.GREEN);

		killNeededTXT = new FlxText(0, 0, FlxG.width, "Kills needed: " + Std.string(killsNeeded), 20);
		add(killNeededTXT);

		winSPR.makeGraphic(64, 64, FlxColor.GREEN);
		add(winSPR);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		killNeededTXT.text = "Kills needed: " + Std.string(killsNeeded);

		direction();
		attackingFUNC();

		// Enemy shit
		if (plr.overlaps(enemy) && attacking == false)
		{
			endGame();
		}
		else if (enemy.overlaps(sword) && attacking == true)
		{
			enemy.destroy();
			enemy.x = 1000;
			enemy.y = 1000;
			enemyDead = true;
			killsNeeded = 0;
			kills = kills + 1;
		}

		if (eastWest == 0 && northSouth == 0 && enemyDead == false)
		{
			add(enemy);
		}
		else
		{
			remove(enemy);
		}

		if (enemyDead == true)
		{
			enemy.destroy();
		}

		if (plr.overlaps(winSPR) && killsNeeded == 0)
		{
			winGame();
		}

		// Sword Direction shit
		if (FlxG.keys.pressed.W)
		{
			sword.angle = -90;
			sword.x = plr.x;
			sword.y = plr.y - 30;
		}
		else if (FlxG.keys.pressed.D)
		{
			sword.angle = 0;
			sword.x = plr.x + 50;
			sword.y = plr.y + 20;
		}
		else if (FlxG.keys.pressed.S)
		{
			sword.angle = -90;
			sword.x = plr.x;
			sword.y = plr.y + 60;
		}
		else if (FlxG.keys.pressed.A)
		{
			sword.angle = 0;
			sword.x = plr.x - 50;
			sword.y = plr.y + 20;
		}

		// restart
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MainMenu());
		}
	}

	public function direction()
	{
		if (plr.x < -60)
		{
			eastWest = eastWest - 1;
			plr.x = 573;
		}
		else if (plr.x > 633)
		{
			eastWest = eastWest + 1;
			plr.x = -3;
		}

		if (plr.y < -60)
		{
			northSouth = northSouth + 1;
			plr.y = 420;
		}
		else if (plr.y > 474)
		{
			northSouth = northSouth - 1;
			plr.y = 4;
		}
	}

	public function attackingFUNC()
	{
		if (FlxG.keys.justReleased.SHIFT)
		{
			add(sword);
			attacking = true;
			wait(1000, removeSword);
		}
	}

	public function endGame()
	{
		FlxG.switchState(new LoseState());
	}

	public function winGame()
	{
		FlxG.switchState(new WinState());
	}

	public function removeSword()
	{
		remove(sword);
		attacking = false;
	}

	function wait(milliseconds:Int, callback:Void->Void):Void
	{
		Timer.delay(callback, milliseconds);
	}
}
// Made With Xerox
