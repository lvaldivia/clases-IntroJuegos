package Code {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import Code.Characters.Hero;
	
	
	public class juego extends MovieClip {
		
		//private var zero:MovieClip;
		private var zero:Hero;
		private var leftPressed:Boolean = false;
		private var rightPressed:Boolean = false;
		
		public function juego() {
			zero = new Hero();
			addChild(zero);
			/*zero = new hero();
			addChild(zero);
			zero.x = 100;
			zero.y = 100;
			zero.scaleX = zero.scaleY = 4;
			zero.gotoAndStop(1);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUp);
			stage.addEventListener(Event.ENTER_FRAME,loop);*/
		}
		
		/*private function loop(e:Event):void{
			if(leftPressed){
				if(zero.currentFrame!=2){
					zero.gotoAndStop(2);
				}
				zero.x -=4;
			}
			if(rightPressed){
				if(zero.currentFrame!=2){
					zero.gotoAndStop(2);
				}
				zero.x +=4;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					leftPressed = true;
					zero.scaleX = -4;
				break;
				case Keyboard.RIGHT:
					rightPressed = true;
					zero.scaleX = 4;
				break;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					leftPressed = false;
					zero.gotoAndStop(1);
				break;
				case Keyboard.RIGHT:
					rightPressed = false;
					zero.gotoAndStop(1);
				break;
			}
		}*/
	}
	
}
