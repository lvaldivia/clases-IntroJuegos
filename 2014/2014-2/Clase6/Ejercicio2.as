package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	
	public class Ejercicio2 extends MovieClip {
		
		private var mc:MovieClip;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var isJumping:Boolean;
		private var power:Number;
		private var gravity:Number=10;
		
		public function Ejercicio2() {
			mc = new hero();
			power = 0;
			addChild(mc);
			mc.gotoAndStop(4);
			leftPress = false;
			isJumping = false;
			mc.scaleX = -1;
			mc.x = 100;
			mc.y = 250;
			rightPress = false;
			mc.addEventListener(MouseEvent.CLICK,click);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			if(leftPress){
				mc.scaleX  = 1;
				mc.x-=5;
			}
			if(rightPress){
				mc.x+=5;
				mc.scaleX  = -1;
			}
			if(isJumping){
				mc.y +=power;
				power += gravity;
				if(mc.y>=250){
					isJumping= false;
					mc.y=250;
				}
			}
		}
		
		private function keydown(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					leftPress = true;
					
				break;
				case Keyboard.RIGHT:
					rightPress = true;
				break;
				case Keyboard.SPACE:
					if(!isJumping){
						isJumping =true;
						power = -50;
					}
				break;
			}
		}
		
		private function keyup(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					leftPress = false;
				break;
				case Keyboard.RIGHT:
					rightPress = false;
				break;
			}
		}
		
		private function click(e:MouseEvent):void{
			if(e.currentTarget.currentFrame
			   		<e.currentTarget.totalFrames){
				e.currentTarget.nextFrame();
			}else{
				e.currentTarget.gotoAndStop(1)
			}
		}
	}
	
}
