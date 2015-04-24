package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Ejercicio1 extends MovieClip {
		
		private var mHero:MovieClip;
		public function Ejercicio1() {
			mHero = new hero();
			addChild(mHero);
			mHero.x = stage.stageWidth/2;
			mHero.y = stage.stageHeight/2;
			mHero.scaleX = mHero.scaleY = 0.5;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,
								   down);
			stage.addEventListener(KeyboardEvent.KEY_UP,
								   up);
		}
		
		private function down(e:KeyboardEvent):void{
			if(e.keyCode == Keyboard.LEFT){
				mHero.x-=1;
				mHero.scaleX = 0.5;
			}
			if(e.keyCode == Keyboard.RIGHT){
				mHero.x+=1;
				mHero.scaleX = -0.5;
			}
		}
		
		private function up(e:KeyboardEvent):void{
			trace(e.keyCode);
		}
		
	}
	
}
