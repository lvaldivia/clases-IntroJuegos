package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var left:Boolean;
		private var right:Boolean;
		private var timer:Timer;
		private var bad:Array;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			left = false;
			right = false;
			hero = new Hero();
			addChild(hero);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			bad = new Array();
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			var ene:BadShip = new BadShip();
			ene.x = stage.stageWidth * Math.random();
			ene.y = 0;
			addChild(ene);
			bad.push(ene);
		}
		
		private function loop(e:Event):void
		{
			if (left) {
				hero.moveLeft();
			}
			if (right) {
				hero.moveRight();
			}
		}
		
		private function keyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = true;
				break;
				case Keyboard.RIGHT:
					right = true;
				break;
				default:
			}
		}
		
		private function keyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = false;
				break;
				case Keyboard.RIGHT:
					right = false;
				break;
				default:
			}
		}
	
	}

}
