package mod;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;


#if windows
import Discord.DiscordClient;
#end

using StringTools;

class FreeMod extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	var curSelected:Int = 0;
	var curDifficulty:Int = 1;

	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;
  var bg:FlxSprite;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];

	override function create()
	{
		var initSonglist = CoolUtil.coolTextFile(Paths.txt('freeModSonglist'));

		
		for (i in 0...initSonglist.length)
		{
			var data:Array<String> = initSonglist[i].split(':');
			songs.push(new SongMetadata(data[0], Std.parseInt(data[2]), data[1]));
		}
		

		
			if (FlxG.sound.music != null)
			{
				if (!FlxG.sound.music.playing)
          FlxG.sound.music.stop();
					FlxG.sound.playMusic(Paths.music('freakyModMenu'));
			}
		 

		 #if windows
		 // Updating Discord Rich Presence
		 DiscordClient.changePresence("In the Freeplay Menu (Mods)", null);
		 #end

		var isDebug:Bool = false;

		#if debug
		isDebug = true;
		#end

		// LOAD MUSIC

		// LOAD CHARACTERS
    //wea del color 1
    bg = new FlxSprite().loadGraphic(Paths.image('modBGDesat'));
        add(bg);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);

			// songText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// songText.screenCenter(X);
		}

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		// scoreText.autoSize = false;
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		// scoreText.alignment = RIGHT;

		var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 6, 0).makeGraphic(Std.int(FlxG.width * 0.35), 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		add(diffText);

		add(scoreText);

		changeSelection();
		changeDiff();

		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);
		selector = new FlxText();

		selector.size = 40;
		selector.text = ">";
		// add(selector);

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));
			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;
			FlxG.stage.addChild(texFel);
			// scoreText.textField.htmlText = md;
			trace(md);
		 */

		#if mobileC
		addVirtualPad(FULL, A_B);
		#end

		super.create();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String)
	{
		songs.push(new SongMetadata(songName, weekNum, songCharacter));
	}

	public function addWeek(songs:Array<String>, weekNum:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);

			if (songCharacters.length != 1)
				num++;
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
		

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;

		scoreText.text = "PERSONAL BEST:" + lerpScore;
    //wea del color 2, la secuela
		switch (songs[curSelected].songName.toLowerCase())        
		{            
			case 'tutorial': 
				bg.color = FlxColor.fromRGB(158, 24, 73);            
			case 'lo-fight' | 'overhead': 
				bg.color = FlxColor.fromRGB(29, 30, 53);          
			case 'ballistic' | 'ballistic-old': 
				bg.color = FlxColor.fromRGB(206, 0, 44);
			case 'remorse': 
				bg.color = FlxColor.fromRGB(225, 225, 225);
      case 'parish' | 'worship': 
				bg.color = FlxColor.fromRGB(245, 145, 197);
			case 'zavodila': 
				bg.color = FlxColor.fromRGB(151, 138, 166);
			case 'gospel': 
				bg.color = FlxColor.fromRGB(218, 49, 125);
			case 'casanova': 
				bg.color = FlxColor.fromRGB(151, 38, 81);
			case 'foolhardy': 
				bg.color = FlxColor.fromRGB(188, 124, 66);
			case 'light-it-up' | 'ruckus' | 'target-practice' | 'sporting' | 'boxing-match' | 'fisticuffs' | 'wind-up' | 'deathmatch' | 'king-hit' | 'tko' | 'wind-up-fanmade': 
				bg.color = FlxColor.fromRGB(255, 136, 2);
			case 'king-hit-fefe': 
				bg.color = FlxColor.fromRGB(161, 161, 161);
			case 'en-garde' | 'sword-fight' | 'combat' | 'final-showdown': 
				bg.color = FlxColor.fromRGB(246, 160, 51);
			case 'popipo' | 'aishite' | 'siu' | 'chug': 
				bg.color = FlxColor.fromRGB(50, 205, 204);
			case 'disappearence': 
				bg.color = FlxColor.fromRGB(61, 252, 251);
			case 'carol-roll' | 'body' | 'boogie': 
				bg.color = FlxColor.fromRGB(102, 102, 153);
			case 'hellroll': 
				bg.color = FlxColor.fromRGB(255, 148, 0);
			case 'wife-forever' | 'sky': 
				bg.color = FlxColor.fromRGB(156, 110, 204);
			case 'manifest': 
				bg.color = FlxColor.fromRGB(255, 0, 0);
			case 'wocky' | 'beathoven' | 'hairball' | 'nyaw' | 'fuzzy-distortion': 
				bg.color = FlxColor.fromRGB(118, 113, 158);
			case 'field-of-hopes-and-dreams' | 'rude-buster': 
				bg.color = FlxColor.fromRGB(201, 22, 143);
			case 'stare': 
				bg.color = FlxColor.fromRGB(117, 101, 131);
			case 'stare-down': 
				bg.color = FlxColor.fromRGB(85, 21, 141);
			case 'screenplay', 'parasite', 'a.g.o.t.i': 
				bg.color = FlxColor.fromRGB(186, 30, 36);
			case 'headache', 'nerves', 'release', 'fading': 
				bg.color = FlxColor.fromRGB(0, 255, 144);
   //nota mental, la mierda de agoti
		}         

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.LEFT_P)
			changeDiff(-1);
		if (controls.RIGHT_P)
			changeDiff(1);

		if (controls.BACK)
		{
			FlxG.switchState(new mod.CustomWeek());
		}

		if (accepted)
		{
			var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);

			trace(poop);

			PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty;
			PlayState.loadRep = false;
			PlayState.storyWeek = songs[curSelected].week;
			trace('CUR WEEK' + PlayState.storyWeek);
			LoadingState.loadAndSwitchState(new PlayState());
		}
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 2;
		if (curDifficulty > 2)
			curDifficulty = 0;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		#end

		switch (curDifficulty)
		{
			case 0:
				diffText.text = "EASY";
			case 1:
				diffText.text = 'NORMAL';
			case 2:
				diffText.text = "HARD";
		}
	}

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent('Fresh');
		#end

		// NGio.logEvent('Fresh');
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		// lerpScore = 0;
		#end

		/*
		#if PRELOAD_ALL
		FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		#end
		*/

		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";

	public function new(song:String, week:Int, songCharacter:String)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
	}
}
