package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;
	public var altAnim:String = "";
	public var anim:String = "";

	function jointex(frames1:FlxAtlasFrames, frames2:FlxAtlasFrames) {
		for (frame in frames2.frames){
			frames1.pushFrame(frame);
		}
		return frames1;
	}


	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;


		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE

				var tex = Paths.getSparrowAtlas('gf/GF_assets');

				switch PlayState.curStage.toLowerCase() {
					case 'spooky':
						tex = jointex(tex, Paths.getSparrowAtlas('gf/GF_assets_week2'));
					case 'stage':
						if (PlayState.SONG.song.toLowerCase() == 'tutorial')
						{
							tex = jointex(tex, Paths.getSparrowAtlas('gf/GF_assets_tutorial'));
						}
					case 'philly':
						tex = jointex(tex, jointex(Paths.getSparrowAtlas('gf/GF_assets_blowing'), Paths.getSparrowAtlas('gf/GF_ass_sets_landing')));

				}

				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('idle');

			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -20, 26);
				addOffset("singRIGHT", -130, -14);
				addOffset("singLEFT", 130, -10);
				addOffset("singDOWN", -50, -130);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -30, -40);
	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 

				playAnim('idle');
				case 'monster-christmas':
					tex = Paths.getSparrowAtlas('characters/monsterChristmas');
					
					var tex2 = Paths.getSparrowAtlas('characters/monsterChristmas2');
					var tex3 = Paths.getSparrowAtlas('characters/monsterChristmas3');
	
	
					tex = jointex(tex, jointex(tex2, tex3));
	
					frames = tex;
					animation.addByPrefix('idle', 'monster idle', 24, false);
					animation.addByPrefix('singUP', 'monster up note', 24, false);
					animation.addByPrefix('singDOWN', 'monster down', 24, false);
					animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
					animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);
	
					addOffset('idle');
					addOffset("singUP", -20, 50);
					addOffset("singRIGHT", -51);
					addOffset("singLEFT", -30);
					addOffset("singDOWN", -40, -94);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 
					playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -68, -7);
				addOffset("singLEFT", 65, 9);
				addOffset("singDOWN", 200, -70);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');
	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 
				flipX = true;


				case 'tankman':
					tex = Paths.getSparrowAtlas('week7/tankmanCaptain');
					frames = tex;
					animation.addByPrefix('idle', "Tankman Idle Dance instance 1", 24);
					animation.addByPrefix('singUP', 'Tankman UP note instance 1', 24, false);
					animation.addByPrefix('singDOWN', 'Tankman DOWN note instance 1', 24, false);
							animation.addByPrefix('oldSingDOWN', 'Tankman DOWN note ', 24, false);
							animation.addByPrefix('oldSingUP', 'Tankman UP note ', 24, false);
					animation.addByPrefix('ugh', 'TANKMAN UGH', 24, false);
					animation.addByPrefix('good', 'PRETTY GOOD', 24, false);
					if (isPlayer)
					{
						animation.addByPrefix('singLEFT', 'Tankman Note Left instance 1', 24, false);
						animation.addByPrefix('singRIGHT', 'Tankman Right Note instance 1', 24, false);
						animation.addByPrefix('singRIGHTmiss', 'Tankman Right Note instance 1', 24, false);
						animation.addByPrefix('singLEFTmiss', 'Tankman Note Left instance 1', 24, false);
							animation.addByPrefix('oldSingDOWN', 'Tankman DOWN note ', 24, false);
							animation.addByPrefix('oldSingUP', 'Tankman UP note ', 24, false);
						animation.addByPrefix('ugh', 'TANKMAN UGH', 24, false);
						animation.addByPrefix('good', 'PRETTY GOOD', 24, false);
					}
					else
					{
						// Need to be flipped! REDO THIS LATER!
						animation.addByPrefix('singLEFT', 'Tankman Note Left instance 1', 24, false);
						animation.addByPrefix('singRIGHT', 'Tankman Right Note instance 1', 24, false);
						animation.addByPrefix('singRIGHTmiss', 'Tankman Right Note instance 1', 24, false);
						animation.addByPrefix('singLEFTmiss', 'Tankman Note Left instance 1', 24, false);
							animation.addByPrefix('oldSingDOWN', 'Tankman DOWN note ', 24, false);
							animation.addByPrefix('oldSingUP', 'Tankman UP note ', 24, false);
						animation.addByPrefix('ugh', 'TANKMAN UGH', 24, false);
						animation.addByPrefix('good', 'PRETTY GOOD', 24, false);
					}
	
					addOffset('idle');
					addOffset("singUP", 24, 56);
					addOffset("singRIGHT", -1, -7);
					addOffset("singLEFT", 100, -14);
					addOffset("singDOWN", 98, -90);
					addOffset("singUPmiss", -19, 67);
					addOffset("singRIGHTmiss", -60, 41);
					addOffset("singLEFTmiss", 62, 64);
					addOffset("singDOWNmiss", 210, -28);
					addOffset("oldSingDOWN", 98, -90); // deja de crashear hijo de puta
					addOffset("ugh", 45, 0);
					addOffset("good", 45, 20);
	
					playAnim('idle');
		
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 
					flipX = true;
	
				case 'bf':
					var tex = Paths.getSparrowAtlas('bf/BOYFRIEND');
					frames = tex;
					animation.addByPrefix('idle', 'BF idle dance', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
					animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
					animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
					animation.addByPrefix('hey', 'BF HEY', 24, false);
	
					animation.addByPrefix('scared', 'BF idle shaking', 24);
	
					addOffset('idle', -5);
					addOffset("singUP", -29, 27);
					addOffset("singRIGHT", -38, -7);
					addOffset("singLEFT", 12, -6);
					addOffset("singDOWN", -10, -50);
					addOffset("singUPmiss", -29, 27);
					addOffset("singRIGHTmiss", -30, 21);
					addOffset("singLEFTmiss", 12, 24);
					addOffset("singDOWNmiss", -11, -19);
					addOffset("hey", 7, 4);
					addOffset('scared', -4);
	
					playAnim('idle');
		
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 
					flipX = true;
				case 'bfdead':
					var tex = Paths.getSparrowAtlas('bf/Muertes');
					frames = tex;
					animation.addByPrefix('idle', 'BF Dead Loop', 24, false);
					animation.addByPrefix('firstDeath', "BF dies", 24, false);
					animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
					animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	
					addOffset('idle', -5);
					addOffset('firstDeath', 37, 11);
					addOffset('deathLoop', 37, 5);
					addOffset('deathConfirm', 37, 69);
	
					playAnim('firstDeath');
		
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 
					flipX = true;
	
				case 'bf-holding-gf':
					var tex = Paths.getSparrowAtlas('bf/bfAndGF');
					frames = tex;
					animation.addByPrefix('idle', 'BF idle dance w gf', 24, false);
					animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
					animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
					animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
					animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
					animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
					animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
					animation.addByPrefix('hey', 'BF HEY', 24, false);
	
					animation.addByPrefix('scared', 'BF idle shaking', 24);
	
					addOffset('idle', -5);
					addOffset("singUP", -29, 27);
					addOffset("singRIGHT", -38, -7);
					addOffset("singLEFT", 12, -6);
					addOffset("singDOWN", -10, -50);
					addOffset("singUPmiss", -29, 27);
					addOffset("singRIGHTmiss", -30, 21);
					addOffset("singLEFTmiss", 12, 24);
					addOffset("singDOWNmiss", -11, -19);
					addOffset("hey", 7, 4);
					addOffset('scared', -4);
	
					playAnim('idle');
		
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}
 
					flipX = true;
	
				case 'bfHoldingGF-DEAD':
					var tex = Paths.getSparrowAtlas('bf/bfHoldingGF-DEAD');
					frames = tex;
					animation.addByPrefix('idle', 'BF Dead with GF Loop', 24, false);
					animation.addByPrefix('firstDeath', "BF Dies with GF", 24, false);
					animation.addByPrefix('deathLoop', "BF Dead with GF Loop", 24, true);
					animation.addByPrefix('deathConfirm', "RETRY confirm holding gf", 24, false);
	
					addOffset('idle', -5);
					addOffset('firstDeath', 37, 11);
					addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
	
					if (!PlayStateChangeables.Antialiasing)
						{
							antialiasing = false;
						}

				playAnim('firstDeath');

				flipX = true;

		case 'bf-christmas':
			var tex = Paths.getSparrowAtlas('characters/bfChristmas');
			frames = tex;
			animation.addByPrefix('idle', 'BF idle dance', 24, false);
			animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
			animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
			animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
			animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
			animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
			animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
			animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
			animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
			animation.addByPrefix('hey', 'BF HEY', 24, false);

			addOffset('idle', -5);
			addOffset("singUP", -29, 27);
			addOffset("singRIGHT", -38, -7);
			addOffset("singLEFT", 12, -6);
			addOffset("singDOWN", -10, -50);
			addOffset("singUPmiss", -29, 27);
			addOffset("singRIGHTmiss", -30, 21);
			addOffset("singLEFTmiss", 12, 24);
			addOffset("singDOWNmiss", -11, -19);
			addOffset("hey", 7, 4);

					if (!PlayStateChangeables.Antialiasing)
						{
							antialiasing = false;
						}

			playAnim('idle');

			flipX = true;
		case 'bf-car':
			var tex = Paths.getSparrowAtlas('characters/bfCar');
			frames = tex;
			animation.addByPrefix('idle', 'BF idle dance', 24, false);
			animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
			animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
			animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
			animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
			animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
			animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
			animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
			animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

			addOffset('idle', -5);
			addOffset("singUP", -29, 27);
			addOffset("singRIGHT", -38, -7);
			addOffset("singLEFT", 12, -6);
			addOffset("singDOWN", -10, -50);
			addOffset("singUPmiss", -29, 27);
			addOffset("singRIGHTmiss", -30, 21);
			addOffset("singLEFTmiss", 12, 24);
			addOffset("singDOWNmiss", -11, -19);
			playAnim('idle');

					if (!PlayStateChangeables.Antialiasing)
						{
							antialiasing = false;
						}

			flipX = true;
		case 'bf-pixel':
			frames = Paths.getSparrowAtlas('characters/bfPixel');
			animation.addByPrefix('idle', 'BF IDLE', 24, false);
			animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
			animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
			animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
			animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
			animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
			animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
			animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
			animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

			addOffset('idle');
			addOffset("singUP");
			addOffset("singRIGHT");
			addOffset("singLEFT");
			addOffset("singDOWN");
			addOffset("singUPmiss");
			addOffset("singRIGHTmiss");
			addOffset("singLEFTmiss");
			addOffset("singDOWNmiss");

			setGraphicSize(Std.int(width * 6));
			updateHitbox();

			playAnim('idle');

			width -= 100;
			height -= 100;

			antialiasing = false;

			flipX = true;
		case 'bf-pixel-dead':
			frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
			animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
			animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
			animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
			animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
			animation.play('firstDeath');

			addOffset('firstDeath');
			addOffset('deathLoop', -37);
			addOffset('deathConfirm', -37);
			playAnim('firstDeath');
			// pixel bullshit
			setGraphicSize(Std.int(width * 6));
			updateHitbox();
			antialiasing = false;
			flipX = true;

		case 'senpai':
			frames = Paths.getSparrowAtlas('characters/senpai');
			animation.addByPrefix('idle', 'Senpai Idle', 24, false);
			animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
			animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
			animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
			animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

			addOffset('idle');
			addOffset("singUP", 5, 37);
			addOffset("singRIGHT");
			addOffset("singLEFT", 40);
			addOffset("singDOWN", 14);

			playAnim('idle');

			setGraphicSize(Std.int(width * 6));
			updateHitbox();

			antialiasing = false;
		case 'gfpico':
			tex = Paths.getSparrowAtlas('week7/gf-pico');
			frames = tex;
			animation.addByIndices('singUP', 'GF Dancing Beat', [0], "", 24, false);
			animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
			animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
				false);

			addOffset('danceLeft', 0);
			addOffset('danceRight', 0);

			playAnim('danceRight');
		case 'senpai-angry':
			frames = Paths.getSparrowAtlas('characters/senpai');
			animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
			animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
			animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
			animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
			animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

			addOffset('idle');
			addOffset("singUP", 5, 37);
			addOffset("singRIGHT");
			addOffset("singLEFT", 40);
			addOffset("singDOWN", 14);
			playAnim('idle');

			setGraphicSize(Std.int(width * 6));
			updateHitbox();

			antialiasing = false;

		case 'spirit':
			frames = Paths.getPackerAtlas('characters/spirit');
			animation.addByPrefix('idle', "idle spirit_", 24, false);
			animation.addByPrefix('singUP', "up_", 24, false);
			animation.addByPrefix('singRIGHT', "right_", 24, false);
			animation.addByPrefix('singLEFT', "left_", 24, false);
			animation.addByPrefix('singDOWN', "spirit down_", 24, false);

			addOffset('idle', -220, -280);
			addOffset('singUP', -220, -240);
			addOffset("singRIGHT", -220, -280);
			addOffset("singLEFT", -200, -280);
			addOffset("singDOWN", 170, 110);

			setGraphicSize(Std.int(width * 6));
			updateHitbox();

			playAnim('idle');

			antialiasing = false;

			case 'picogf':
				frames = Paths.getPackerAtlas('picoSpeaker', 'shared');
				animation.addByPrefix('idle', "Pico shoot 1", 24, false);
				animation.addByPrefix('singUP', "Pico shoot 2", 24, false);
				animation.addByPrefix('singRIGHT', "Pico shoot 3", 24, false);
				animation.addByPrefix('singLEFT', "Pico shoot 4", 24, false);
				animation.addByPrefix('singDOWN', "Pico shoot 1", 24, false);

				addOffset('idle', 0, 0);
				addOffset('singUP', -1, -128);
				addOffset("singRIGHT", 412, -64);
				addOffset("singLEFT", 439, -19);
				addOffset("singDOWN", 0, 0);
	
					if (!PlayStateChangeables.Antialiasing)
						{
							antialiasing = false;
						}

				playAnim('idle');


			case 'picoSpeaker':

						tex = Paths.getSparrowAtlas('picoSpeaker', 'shared');
						frames = tex;
						
						animation.addByIndices('idle', 'Pico shoot 1', [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], "", 24, true);
		
						animation.addByIndices('shoot1', 'Pico shoot 1', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, true);
						animation.addByIndices('shoot2', 'Pico shoot 2', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
						animation.addByIndices('shoot3', 'Pico shoot 3', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
						animation.addByIndices('shoot4', 'Pico shoot 4', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
						
						addOffset('shoot1', 0, 0);
						addOffset('shoot2', -1, -128);
						addOffset('shoot3', 412, -64);
						addOffset('shoot4', 439, -19);
		
						playAnim('shoot1');
		
						
					if (!PlayStateChangeables.Antialiasing)
						{
							antialiasing = false;
						}
					


			case 'gf-tankmen':
				
				 
				frames = Paths.getSparrowAtlas('gfTankmen','shared');
				animation.addByPrefix('cheer', 'GF Dancing at Gunpoint', 24, false);
				animation.addByPrefix('singLEFT', 'GF Dancing at Gunpoint', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Dancing at Gunpoint', 24, false);
				animation.addByPrefix('singUP', 'GF Dancing at Gunpoint', 24, false);
				animation.addByPrefix('singDOWN', 'GF Dancing at Gunpoint', 24, false);
				animation.addByIndices('sad', 'GF Crying at Gunpoint ', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing at Gunpoint', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing at Gunpoint', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				
				addOffset('cheer');
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('sad', -2, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);
				
				playAnim('danceRight');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

 // mods y etcetera
		  case 'whitty':

			tex = Paths.getSparrowAtlas('whitty/whitty', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Idle', 24);
			animation.addByPrefix('singUP', 'Sing Up', 24);
			animation.addByPrefix('singRIGHT', 'Sing Right', 24);
			animation.addByPrefix('singDOWN', 'Sing Down', 24);
			animation.addByPrefix('singLEFT', 'Sing Left', 24);

			addOffset('idle', 0,0 );
			addOffset("singUP", -6, 50);
			addOffset("singRIGHT", 0, 27);
			addOffset("singLEFT", -10, 10);
			addOffset("singDOWN", 0, -30);

 			playAnim('idle');

	case 'whitty-ballistic':

			tex = Paths.getSparrowAtlas('whitty/whitty_ballistic', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Whitty idle dance', 24);
			animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24);
			animation.addByPrefix('singRIGHT', 'whitty sing note right', 24);
			animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24);
			animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24);

			addOffset('idle', 50);
			addOffset("singUP", 50, 85);
			addOffset("singRIGHT", 100, -75);
			addOffset("singLEFT", 50);
			addOffset("singDOWN", 75, -150);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		  case 'updike':

			tex = Paths.getSparrowAtlas('whitty/updike', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'updingdong idle', 24);
			animation.addByPrefix('singUP', 'updingdong up note', 24);
			animation.addByPrefix('singRIGHT', 'updingdong right note', 24);
			animation.addByPrefix('singDOWN', 'updingdong down note', 24);
			animation.addByPrefix('singLEFT', 'updingdong left note', 24);

			addOffset('idle', 0,0 );
			addOffset("singUP", -6, 50);
			addOffset("singRIGHT", 0, 27);
			addOffset("singLEFT", -10, 10);
			addOffset("singDOWN", 0, -30);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'sarvente':
			tex = Paths.getSparrowAtlas('sarvente/sarvente','shared');
			frames = tex;

			animation.addByPrefix('idle', "SarventeIdle", 24);
			animation.addByPrefix('singUP', "SarventeUp", 24);
			animation.addByPrefix('singDOWN', "SarventeDown", 24);
			animation.addByPrefix('singLEFT', 'SarventeLeft', 24);
			animation.addByPrefix('singRIGHT', 'SarventeRight', 24);
			

			addOffset('idle');
			addOffset("singUP");
			addOffset("singRIGHT");
			addOffset("singLEFT");
			addOffset("singDOWN");

				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'sarvente-stressed':
			tex = Paths.getSparrowAtlas('sarvente/sarvente_stressed', 'shared');
			frames = tex;

			animation.addByPrefix('idle', "SarvDarkIdle", 24);
			animation.addByPrefix('singUP', "SarvDarkUp", 24);
			animation.addByPrefix('singDOWN', "SarvDarkDown", 24);
			animation.addByPrefix('singLEFT', 'SarvDarkLeft', 24);
			animation.addByPrefix('singRIGHT', 'SarvDarkRight', 24);

			addOffset('idle');
			addOffset("singUP");
			addOffset("singRIGHT");
			addOffset("singLEFT");
			addOffset("singDOWN");
			
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}


			playAnim('idle');

		case 'sarvente-lucifer':
			tex = Paths.getSparrowAtlas('sarvente/sarvente_lucifer', 'shared');
			frames = tex;
			animation.addByPrefix('idle', "LuciferSarvIdle", 24);
			animation.addByPrefix('singUP', "LuciferSarvUp", 24);
			animation.addByPrefix('singDOWN', "LuciferSarvDown", 24);
			animation.addByPrefix('singLEFT', 'LuciferSarvLeft', 24);
			animation.addByPrefix('singRIGHT', 'LuciferSarvRight', 24);

			addOffset('idle');
			addOffset("singUP");
			addOffset("singRIGHT");
			addOffset("singLEFT");
			addOffset("singDOWN");

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'ruv':
			tex = Paths.getSparrowAtlas('sarvente/ruv','shared');
			frames = tex;
			animation.addByPrefix('idle', "RuvIdle", 24);
			animation.addByPrefix('singUP', "RuvUp", 24);
			animation.addByPrefix('singDOWN', "RuvDown", 24);
			animation.addByPrefix('singLEFT', 'RuvLeft', 24);
			animation.addByPrefix('singRIGHT', 'RuvRight', 24);

			addOffset('idle');
			addOffset("singUP");
			addOffset("singRIGHT");
			addOffset("singLEFT");
			addOffset("singDOWN");

				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'selever':
			frames = Paths.getSparrowAtlas('sarvente/selever','shared');
			animation.addByPrefix('idle', "SelIdle", 24);
			animation.addByPrefix('singUP', "SelUp", 24);
			animation.addByPrefix('singDOWN', "SelDown", 24);
			animation.addByPrefix('singLEFT', 'SelLeft', 24);
			animation.addByPrefix('singRIGHT', 'SelRight', 24);

			addOffset('idle');
			addOffset("singUP");
			addOffset("singRIGHT");
			addOffset("singLEFT");
			addOffset("singDOWN");

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

/* this shit is outdated
		case 'zardy':
			tex = Paths.getSparrowAtlas('zardy/zardy', 'shared');
			frames = tex;
      iconColor = 'FFBA7B41'; 
			animation.addByPrefix('idle', 'Idle', 24);
			animation.addByPrefix('singUP', 'Sing Up', 24);
			animation.addByPrefix('singRIGHT', 'Sing Right', 24);
			animation.addByPrefix('singDOWN', 'Sing Down', 24);
			animation.addByPrefix('singLEFT', 'Sing Left', 24);

			addOffset('idle');
			addOffset("singUP", -6, 50);
			addOffset("singRIGHT", 0, 27);
			addOffset("singLEFT", -10, 10);
			addOffset("singDOWN", 0, -30);


					if (!PlayStateChangeables.Antialiasing)
						{
							antialiasing = false;
						}


			playAnim('idle');
*/

			case 'zardy':
			tex = Paths.getSparrowAtlas('zardy/zardy', 'shared');
			frames = tex;
				animation.addByPrefix('idle', 'Idle', 14);
				animation.addByPrefix('singUP', 'Sing Up', 24);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24);
				animation.addByPrefix('singDOWN', 'Sing Down', 24);
				animation.addByPrefix('singLEFT', 'Sing Left', 24);

				addOffset('idle');
				addOffset("singUP", -80, -10);
				addOffset("singRIGHT", -65, 5);
				addOffset("singLEFT", 130, 5);
				addOffset("singDOWN", -2, -26);

				playAnim('idle');

		case 'matt':
			tex = Paths.getSparrowAtlas('matt/matt', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'matt idle', 24);
			animation.addByPrefix('singUP', 'matt up note', 24);
			animation.addByPrefix('singRIGHT', 'matt right note', 24);
			animation.addByPrefix('singDOWN', 'matt down note', 24);
			animation.addByPrefix('singLEFT', 'matt left note', 24);

			addOffset("idle", -10, -15);
			addOffset("singUP", -10, -15);
			addOffset("singRIGHT", -10, -15);
			addOffset("singLEFT", 10, -15);
			addOffset("singDOWN", -10, -15);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'matt-angry':
			tex = Paths.getSparrowAtlas('matt/matt_angry', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'matt idle', 24);
			animation.addByPrefix('singUP', 'matt up note', 24);
			animation.addByPrefix('singRIGHT', 'matt right note', 24);
			animation.addByPrefix('singDOWN', 'matt down note', 24);
			animation.addByPrefix('singLEFT', 'matt left note', 24);

			addOffset("idle", -10, -15);
			addOffset("singUP", -10, -15);
			addOffset("singRIGHT", -10, -15);
			addOffset("singLEFT", 10, -15);
			addOffset("singDOWN", -10, -15);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

			case 'matt-boxing':
				tex = Paths.getSparrowAtlas('matt/matt_boxing', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Matt Boxing Idle', 24);
				animation.addByPrefix('singUP', 'Matt Boxing Up', 24);
				animation.addByPrefix('singRIGHT', 'Matt Boxing Right', 24);
				animation.addByPrefix('singDOWN', 'Matt Boxing Down', 24);
				animation.addByPrefix('singLEFT', 'Matt Boxing Left', 24);

				addOffset('idle');
				addOffset("singUP", 0, 20);
				addOffset("singRIGHT", -4, 0);
				addOffset("singLEFT", 2, -1);
				addOffset("singDOWN", -7, 3);

				if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

				playAnim('idle');

			case 'matt-chill':
				tex = Paths.getSparrowAtlas('matt/matt_chill', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Matt Chill Idle', 24);
				animation.addByPrefix('singUP', 'Matt Chill Up', 24);
				animation.addByPrefix('singRIGHT', 'Matt Chill Right', 24);
				animation.addByPrefix('singDOWN', 'Matt Chill Down', 24);
				animation.addByPrefix('singLEFT', 'Matt Chill Left', 24);
				animation.addByPrefix('snap', 'Matt Chill Snap', 24, false);

				addOffset('idle');
				addOffset("singUP", -9, 50);
				addOffset("singRIGHT", 16, -22);
				addOffset("singLEFT", -30, -24);
				addOffset("singDOWN", 15, -40);
				addOffset("snap", 0, -1);

				if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

				playAnim('idle');

			case 'matt-tko':
				tex = Paths.getSparrowAtlas('matt/matt_tko', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Matt Tko Idle', 24);
				animation.addByPrefix('singUP', 'Matt Tko Up', 24);
				animation.addByPrefix('singRIGHT', 'Matt Tko Right', 24);
				animation.addByPrefix('singDOWN', 'Matt Tko Down', 24);
				animation.addByPrefix('singLEFT', 'Matt Tko Left', 24);

				addOffset('idle');
				addOffset("singUP", -9, 11);
				addOffset("singRIGHT", 16, -22);
				addOffset("singLEFT", -30, -24);
				addOffset("singDOWN", 0, -1);

				if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

				playAnim('idle');

		case 'matt-troll':
			tex = Paths.getSparrowAtlas('matt/matt_troll', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'mart idle', 24);
			animation.addByPrefix('singUP', 'mart up', 24);
			animation.addByPrefix('singRIGHT', 'mart right', 24);
			animation.addByPrefix('singDOWN', 'mart down', 24);
			animation.addByPrefix('singLEFT', 'mart left', 24);
				animation.addByPrefix('troll', 'mart troll', 24, false);

			addOffset("idle", -10, -15);
			addOffset("singUP", -3, 27);
			addOffset("singRIGHT", -51, -10);
			addOffset("singLEFT", 22, 1);
			addOffset("singDOWN", -14, -36);
      addOffset("troll", -3, 27);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'matt-fight':
			tex = Paths.getSparrowAtlas('matt/matt_fight', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Matt FightIdle', 24);
			animation.addByPrefix('singUP', 'Matt FightUp', 24);
			animation.addByPrefix('singRIGHT', 'Matt FightRight', 24);
			animation.addByPrefix('singDOWN', 'Matt FightDown', 24);
			animation.addByPrefix('singLEFT', 'Matt FightLeft', 24);

			addOffset("idle", -10, -15);
			addOffset("singUP", -10, -15);
			addOffset("singRIGHT", -10, -15);
			addOffset("singLEFT", 10, -15);
			addOffset("singDOWN", -10, -15);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

			case 'matt-hurt':
			tex = Paths.getSparrowAtlas('matt/matt_hurt', 'shared');
			frames = tex;
			animation.addByPrefix('idle', "Matt HurtIdle", 24);
			animation.addByPrefix('singUP', 'Matt HurtUp', 24, false);
			animation.addByPrefix('singDOWN', 'Matt HurtDown', 24, false);
			animation.addByPrefix('singLEFT', 'Matt HurtLeft', 24, false);
			animation.addByPrefix('singRIGHT', 'Matt HurtRight', 24, false);

			addOffset('idle');
			addOffset("singUP", -3, 50);
			addOffset("singRIGHT", -55, 10);
			addOffset("singLEFT", 0, 10);
			addOffset("singDOWN", 0, -20);

					
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'matt-hurt-b':
 			tex = Paths.getSparrowAtlas('matt/matt_hurtb', 'shared');
			frames = tex;
			animation.addByPrefix('idle', "Matt Hurt2Idle", 24);
			animation.addByPrefix('singUP', 'Matt Hurt2Up', 24, false);
			animation.addByPrefix('singDOWN', 'Matt Hurt2Down', 24, false);
			animation.addByPrefix('singLEFT', 'Matt Hurt2Left', 24, false);
			animation.addByPrefix('singRIGHT', 'Matt Hurt2Right', 24, false);
			
			addOffset('idle');
			addOffset("singUP", -3, 50);
			addOffset("singRIGHT", -55, 10);
			addOffset("singLEFT", 0, 10);
			addOffset("singDOWN", 0, -20);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'miku':
			tex = Paths.getSparrowAtlas('miku/miku');
			frames = tex;
			animation.addByPrefix('idle', 'Miku idle dance', 24);
			animation.addByPrefix('singUP', 'Miku Sing Note UP', 24);
			animation.addByPrefix('singRIGHT', 'Miku Sing Note RIGHT', 24);
			animation.addByPrefix('singDOWN', 'Miku Sing Note DOWN', 24);
			animation.addByPrefix('singLEFT', 'Miku Sing Note LEFT', 24);

			addOffset('idle');
			addOffset("singUP", 10, 48);
			addOffset("singRIGHT", -20, 27);
			addOffset("singLEFT", 25, 7);
			addOffset("singDOWN", -16, -36);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'miku-mad':
		tex = Paths.getSparrowAtlas('miku/miku_mad');
		frames = tex;
		animation.addByPrefix('idle', 'Miku idle dance', 24, false);
		animation.addByPrefix('singUP', 'Miku Sing Note UP', 24, false);
		animation.addByPrefix('singDOWN', 'Miku Sing Note DOWN', 24, false);
		animation.addByPrefix('singLEFT', 'Miku Sing Note LEFT', 24, false);
		animation.addByPrefix('singRIGHT', 'Miku Sing Note RIGHT', 24, false);

		addOffset('idle');
		addOffset("singUP", 2, -1);
		addOffset("singRIGHT", -23, -1);
		addOffset("singLEFT", 40, -1);
		addOffset("singDOWN", 11, -2);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'carol':
			tex = Paths.getSparrowAtlas('carol/carol', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'Dad idle dance', 24);
			animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
			animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
			animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
			animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

			addOffset('idle');
			addOffset("singUP", -6, 50);
			addOffset("singRIGHT", 0, 27);
			addOffset("singLEFT", -10, 10);
			addOffset("singDOWN", 0, -30);


				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

		case 'carol-angel':
			tex = Paths.getSparrowAtlas('carol/carol_angel', 'shared');
			frames = tex;
			animation.addByPrefix('idle', 'carol idle', 24, false);
			animation.addByPrefix('singUP', 'carol up', 24, false);
			animation.addByPrefix('singDOWN', 'carol down', 24, false);
			animation.addByPrefix('singLEFT', 'carol left', 24, false);
			animation.addByPrefix('singRIGHT','carol right', 24, false);

		addOffset('idle');
		addOffset("singUP", 2, -1);
		addOffset("singRIGHT", -23, -1);
		addOffset("singLEFT", 40, -1);
		addOffset("singDOWN", 11, -2);

				
				playAnim('idle');	
			
			if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

				case 'sky':
					tex = Paths.getSparrowAtlas('sky/normal/skyn1', 'shared');
						
					var tex2 = Paths.getSparrowAtlas('sky/normal/skyn2', 'shared');
	
					tex = jointex(tex, tex2);
	
					frames = tex;
					animation.addByIndices('danceRight', 'sky idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
					animation.addByIndices('danceLeft', 'sky idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
					animation.addByPrefix('singUP', 'sky up', 24, false);
					animation.addByPrefix('singDOWN', 'sky down', 24, false);
					animation.addByPrefix('singLEFT', 'sky left', 24, false);
					animation.addByPrefix('singRIGHT', 'sky right', 24, false);
					
					addOffset('danceRight');
					addOffset('danceLeft');
					addOffset("singUP");
					addOffset("singRIGHT");
					addOffset("singLEFT");
					addOffset("singDOWN");
	
	
							if (!PlayStateChangeables.Antialiasing)
								{
									antialiasing = false;
								}
	
									playAnim('danceRight');
					
				case 'sky-annoyed':
					tex = Paths.getSparrowAtlas('sky/annoyed/sky1', 'shared');
						
					var tex2 = Paths.getSparrowAtlas('sky/annoyed/sky2', 'shared');
					var tex3 = Paths.getSparrowAtlas('sky/annoyed/sky3', 'shared');
	
					tex = jointex(tex, jointex(tex2, tex3));
	
					frames = tex;
					animation.addByIndices('danceLeft', 'sky annoyed idle0', [8, 9, 10, 11, 12, 13, 14, 15], "", 24);
					animation.addByIndices('danceRight', 'sky annoyed idle0', [0, 1, 2, 3, 4, 5, 6, 7], "", 24);
					animation.addByPrefix('singUP', 'sky annoyed up', 24);
					animation.addByPrefix('singDOWN', 'sky annoyed down', 24);
					animation.addByPrefix('singLEFT', 'sky annoyed left', 24);
					animation.addByPrefix('singRIGHT', 'sky annoyed right', 24);
					
					animation.addByPrefix('oh', 'sky annoyed oh', 24);
					animation.addByPrefix('grr', 'sky annoyed grr', 24);
					animation.addByPrefix('huh', 'sky annoyed huh', 24);
					animation.addByPrefix('ugh', 'sky annoyed ugh', 24);
					animation.addByPrefix('manifest', 'sky annoyed manifest', 24);
					
					animation.addByIndices('danceRight-alt', 'sky annoyed alt idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24);
					animation.addByIndices('danceLeft-alt', 'sky annoyed alt idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24);
					animation.addByPrefix('singUP-alt', 'sky annoyed alt up', 24);
					animation.addByPrefix('singDOWN-alt', 'sky annoyed alt down', 24);
					animation.addByPrefix('singLEFT-alt', 'sky annoyed alt left', 24);
					animation.addByPrefix('singRIGHT-alt', 'sky annoyed alt right', 24);
					
					addOffset('danceRight');
					addOffset('danceLeft');
					addOffset("singUP");
					addOffset("singRIGHT");
					addOffset("singLEFT");
					addOffset("singDOWN");
					
					addOffset("oh");
					addOffset("grr");
					addOffset("huh");
					addOffset("ugh");
					addOffset("manifest");
					
					addOffset('danceRight-alt');
					addOffset('danceLeft-alt');
					addOffset("singUP-alt");
					addOffset("singRIGHT-alt");
					addOffset("singLEFT-alt");
					addOffset("singDOWN-alt");
					
					
					playAnim('danceRight');

	case 'sky-manifest':
		
					tex = Paths.getSparrowAtlas('sky/sky_manifest', 'shared');
					frames = tex;
				animation.addByIndices('danceRight', 'sky mad idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft', 'sky mad idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'sky mad up', 24, false);
				animation.addByPrefix('singDOWN', 'sky mad down', 24, false);
				animation.addByPrefix('singLEFT', 'sky mad left', 24, false);
				animation.addByPrefix('singRIGHT', 'sky mad right', 24, false);
				
				animation.addByIndices('danceRight-alt', 'sky mad idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft-alt', 'sky mad idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP-alt', 'sky mad up', 24, false);
				animation.addByPrefix('singDOWN-alt', 'sky mad down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'sky mad left', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'sky mad right', 24, false);
				
				addOffset('danceRight-alt');
				addOffset('danceLeft-alt');
				addOffset("singUP-alt");
				addOffset("singRIGHT-alt");
				addOffset("singLEFT-alt");
				addOffset("singDOWN-alt");
				
				addOffset('danceRight');
				addOffset('danceLeft');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				
				playAnim('danceRight');
	
							if (!PlayStateChangeables.Antialiasing)
								{
									antialiasing = false;
								}
	
									playAnim('idle');
	
			case 'kapi':
			tex = Paths.getSparrowAtlas('kapi/kapi', 'shared');
			frames = tex;
				animation.addByIndices('idle', 'Dad idle dance', [2, 4, 6, 8, 10, 0], "", 12, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('meow', 'Dad meow', 24, false);
				animation.addByPrefix('stare', 'Dad stare', 24, false);
				
				addOffset('idle');
				
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				addOffset("stare");
				addOffset("meow");

			  playAnim('idle');	
				
				if (!PlayStateChangeables.Antialiasing)
					{
						antialiasing = false;
					}

			case 'kapi-angry':
			tex = Paths.getSparrowAtlas('kapi/kapi_angry', 'shared');
			frames = tex;
				animation.addByIndices('idle', 'Dad idle dance', [2, 4, 6, 8, 10, 0], "", 12, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('meow', 'Dad meow', 24, false);

				
				addOffset('idle');
				
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				addOffset("meow");
			  playAnim('idle');	
				
				if (!PlayStateChangeables.Antialiasing)
					{
						antialiasing = false;
					}

			//case 'mr-game-and-watch':
			//tex = Paths.getSparrowAtlas('kapi/mr_game_and_watch', 'shared');
			//frames = tex;
				//animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				//animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				//animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				//animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				//animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				//addOffset('danceRight');

				//addOffset("singUP", 0, 0);
				//addOffset("singRIGHT", 0, 0);
				//addOffset("singLEFT", 0, 0);
				//addOffset("singDOWN", 0, 0);

			  //playAnim('danceRight');	
				
				//if (!PlayStateChangeables.Antialiasing)
					//{
						//antialiasing = false;
					//}

			case 'kris':
				tex = Paths.getSparrowAtlas('kris/kris', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'krisidle', 24);
				animation.addByPrefix('singUP', 'krisupnote', 24);
				animation.addByPrefix('singRIGHT', 'krisrightnote', 24);
				animation.addByPrefix('singDOWN', 'krisdownnote', 24);
				animation.addByPrefix('singLEFT', 'krisleftnote', 24);

				addOffset('idle', 0, -225);
				addOffset("singUP", 225, -225);
				addOffset("singRIGHT", 0, -225);
				addOffset("singLEFT", 0, -225);
				addOffset("singDOWN", 0, -225);

				playAnim('idle');

				setGraphicSize(Std.int(width * 0.95));
				
				flipX = true;

		case 'starecrown':
				tex = Paths.getSparrowAtlas('starecrown/starecrown', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Starecrown Idle', 24);
				animation.addByPrefix('singUP', 'Starecrown Up', 24);
				animation.addByPrefix('singRIGHT', 'Starecrown Right', 24);
				animation.addByPrefix('singDOWN', 'Starecrown Down', 24);
				animation.addByPrefix('singLEFT', 'Starecrown Left', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

				playAnim('idle');

			case 'staredown':
				tex = Paths.getSparrowAtlas('starecrown/staredown', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Staredown Idle', 24);
				animation.addByPrefix('singUP', 'Staredown Up', 24);
				animation.addByPrefix('singRIGHT', 'Staredown Right', 24);
				animation.addByPrefix('singDOWN', 'Staredown Down', 24);
				animation.addByPrefix('singLEFT', 'Staredown Left', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				if (!PlayStateChangeables.Antialiasing)
				{
					antialiasing = false;
				}

				playAnim('idle');

			case 'agoti':
				tex = Paths.getSparrowAtlas('agoti/agoti', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Agoti_Idle', 24);
				animation.addByPrefix('singUP', 'Agoti_Up', 24);
				animation.addByPrefix('singRIGHT', 'Agoti_Right', 24);
				animation.addByPrefix('singDOWN', 'Agoti_Down', 24);
				animation.addByPrefix('singLEFT', 'Agoti_Left', 24);

				addOffset('idle', 0, 140);
				addOffset("singUP", 90, 220);
				addOffset("singRIGHT", 130, 90);
				addOffset("singLEFT", 240, 170);
				addOffset("singDOWN", 70, -50);

				playAnim('idle');

			case 'garcello':
				tex = Paths.getSparrowAtlas('garcello/garcello_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);

				playAnim('idle');

		case 'garcellotired':
				tex = Paths.getSparrowAtlas('garcello/garcellotired_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'garcellotired idle dance', 24, false);
				animation.addByPrefix('singUP', 'garcellotired Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'garcellotired Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'garcellotired Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'garcellotired Sing Note LEFT', 24, false);

				animation.addByPrefix('singUP-alt', 'garcellotired Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'garcellotired Sing Note RIGHT', 24, false);
				animation.addByPrefix('singLEFT-alt', 'garcellotired Sing Note LEFT', 24, false);
				animation.addByPrefix('singDOWN-alt', 'garcellotired cough', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
				addOffset("singUP-alt", 0, 0);
				addOffset("singRIGHT-alt", 0, 0);
				addOffset("singLEFT-alt", 0, 0);
				addOffset("singDOWN-alt", 0, 0);

				playAnim('idle');

			case 'garcellodead':
				tex = Paths.getSparrowAtlas('garcello/garcellodead_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);

				animation.addByPrefix('garTightBars', 'garcello coolguy', 15);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
				addOffset("garTightBars", 0, 0);

				playAnim('idle');

			case 'garcelloghosty':
				tex = Paths.getSparrowAtlas('garcello/garcelloghosty_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);

				animation.addByPrefix('garFarewell', 'garcello coolguy', 15);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
				addOffset("garTightBars", 0, 0);

				playAnim('idle');

			case 'character-a':
				tex = Paths.getSparrowAtlas('customweek/character_a', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Up', 24);
				animation.addByPrefix('singRIGHT', 'Right', 24);
				animation.addByPrefix('singDOWN', 'Down', 24);
				animation.addByPrefix('singLEFT', 'Left', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}

			case 'character-b':
				tex = Paths.getSparrowAtlas('customweek/character_b', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Up', 24);
				animation.addByPrefix('singRIGHT', 'Right', 24);
				animation.addByPrefix('singDOWN', 'Down', 24);
				animation.addByPrefix('singLEFT', 'Left', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

	
						if (!PlayStateChangeables.Antialiasing)
							{
								antialiasing = false;
							}

		dance();
				}
		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

					case 'sky' | 'sky-annoyed':
						if(anim != "oh" || anim != "huh"|| anim != "grr"|| anim != "ugh"){
						danced = !danced;
						
							if (danced){
								playAnim('danceRight'+altAnim);
							}else{
								playAnim('danceLeft' + altAnim);
							}
						}
					case 'gf-tankmen':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
	
							if (danced)
								playAnim('danceRight');
							else
								playAnim('danceLeft');
						}
					case 'picoSpeaker':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
	
							if (danced)
								playAnim('idle');
							else
								playAnim('idle');
						}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
