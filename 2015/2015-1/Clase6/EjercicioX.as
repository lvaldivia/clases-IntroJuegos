package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class EjercicioX extends MovieClip {
		
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var spacePress:Boolean;
		private var gravity:Number = 10;
		private var jumpPower:Number = -50;
		private var baseY:Number;
		private var hero:MovieClip;
		public function EjercicioX() {
			hero = new mega0();
			addChild(hero);
			hero.gotoAndStop(1);
			hero.x = stage.stageWidth/2;
			hero.y = stage.stageHeight/2;
			baseY = hero.y;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,
			   down);
			stage.addEventListener(KeyboardEvent.KEY_UP,
			   up);
			stage.addEventListener(Event.ENTER_FRAME,
			   loop);
		}
		
		private function loop(e:Event):void
		{
			if (leftPress)
			{
				hero.x -=  5;
				if(hero.currentFrame!=2){
					hero.gotoAndStop(2);
				}
			}
			else
			{
				if (rightPress)
				{
					hero.x +=  5;
					if(hero.currentFrame!=2){
						hero.gotoAndStop(2);
					}
				}
			}
			if (hero.x>=stage.stageWidth-(hero.width/2))
			{
				hero.x = stage.stageWidth-(hero.width/2);
			}
			if (hero.x < hero.width / 2)
			{
				hero.x = hero.width / 2;
			}
			if(spacePress){
				hero.y +=jumpPower;
				jumpPower +=gravity;
				if(hero.y>=baseY){
					hero.y = baseY;
					jumpPower = -50;
					spacePress = false;
				}
			}
		}

		private function down(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT :
					//hero.gotoAndStop(2);
					leftPress = true;
					hero.scaleX = -1;
					break;
					
				case Keyboard.RIGHT :
					//hero.gotoAndStop(2);
					rightPress = true;
					hero.scaleX = 1;
					break;
				case Keyboard.SPACE:
					spacePress = true;
					break;
			}
		}

		private function up(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT :
					leftPress = false;
					hero.gotoAndStop(1);
					break;
				case Keyboard.RIGHT :
					rightPress = false;
					hero.gotoAndStop(1);
					break;

			}
		}
	}
	
}
