package Mobile {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class juego3 extends MovieClip {
		
		private var zero:MovieClip;
		private var leftPress:Boolean = false;
		private var rightPress:Boolean = false;
		public function juego3() {
			addZero();
			addButtons();
		}
		
		private function addButtons():void{
			var btn1:Sprite = new Sprite();
			btn1.graphics.beginFill(0x00FF00);
			btn1.graphics.drawCircle(0,0,50);
			btn1.graphics.endFill();
			addChild(btn1);
			btn1.x = btn1.width;
			btn1.y = stage.stageHeight-btn1.height;
			btn1.buttonMode = true;
			var btn2:Sprite = new Sprite();
			btn2.graphics.beginFill(0x00FF00);
			btn2.graphics.drawCircle(0,0,50);
			btn2.graphics.endFill();
			addChild(btn2);
			btn2.x = stage.stageWidth-btn2.width;
			btn2.y = stage.stageHeight-btn2.height;
			btn2.buttonMode = true;
			btn1.addEventListener(MouseEvent.MOUSE_DOWN,leftDown);
			
			btn2.addEventListener(MouseEvent.MOUSE_DOWN,rightDown);
			
			stage.addEventListener(MouseEvent.MOUSE_UP,upMouse);
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			if(leftPress){
				zero.x -= 5;
				if(zero.currentFrame!=2){
					zero.gotoAndStop(2);
				}
			}
			if(rightPress){
				zero.x += 5;
				if(zero.currentFrame!=2){
					zero.gotoAndStop(2);
				}
			}
		}
		
		private function rightDown(e:MouseEvent):void{
			rightPress = true;
			zero.scaleX = 4;
		}
		
		private function leftDown(e:MouseEvent):void{
			leftPress = true;
			zero.scaleX = -4;
		}
		
		
		private function upMouse(e:MouseEvent):void{
			rightPress = false;
			leftPress = false;
			zero.gotoAndStop(1)
		}
		
		private function addZero():void{
			zero = new hero();
			addChild(zero);
			zero.x = 100;
			zero.y = 100;
			zero.gotoAndStop(1);
			zero.scaleX = zero.scaleY = 4;
		}
	}
	
}
