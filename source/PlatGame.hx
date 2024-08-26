package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class PlatGame
{
	public static function switchState(nextState:FlxState)
	{
		FlxTween.cancelTweensOf(FlxG.camera);
		FlxTween.tween(FlxG.camera, {zoom: 5}, 1, {
			ease: FlxEase.sineInOut,
			onStart: function(tween:FlxTween)
			{
				FlxG.camera.fade();
			},
			onComplete: function(tween:FlxTween)
			{
				FlxG.switchState(nextState);
			}
		});
	}

	public static function addCam(camera:FlxCamera, drawing:Bool = false)
		return FlxG.cameras.add(camera, drawing);
}