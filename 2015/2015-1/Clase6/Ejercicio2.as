package 
{

	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;


	public class Ejercicio2 extends MovieClip
	{

		private var mHero:MovieClip;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var spacePress:Boolean;
		private var gravity:Number = 10;
		private var jumpPower:Number = -50;
		private var baseY:Number;

		public function Ejercicio2()
		{
			leftPress = false;
			rightPress = false;
			spacePress = false;
			mHero = new hero();
			addChild(mHero);
			mHero.x = stage.stageWidth / 2;
			mHero.y = stage.stageHeight / 2;
			baseY = mHero.y;
			mHero.scaleX = mHero.scaleY = 0.5;
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
				mHero.x -=  5;
			}
			else
			{
				if (rightPress)
				{
					mHero.x +=  5;
				}
			}
			if (mHero.x>=stage.stageWidth-(mHero.width/2))
			{
				mHero.x = stage.stageWidth-(mHero.width/2);
			}
			if (mHero.x < mHero.width / 2)
			{
				mHero.x = mHero.width / 2;
			}
			if(spacePress){
				mHero.y +=jumpPower;
				jumpPower +=gravity;
				if(mHero.y>=baseY){
					mHero.y = baseY;
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

					leftPress = true;
					mHero.scaleX = 0.5;

					break;
				case Keyboard.RIGHT :

					rightPress = true;
					mHero.scaleX = -0.5;
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
					break;
				case Keyboard.RIGHT :
					rightPress = false;
					break;

			}
		}

	}

}