package Code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import flash.display.Sprite;
	
	
	public class Main extends MovieClip {
		
		private var zero:Hero;
		private var upPress:Boolean;
		private var downPress:Boolean;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var bullets:Array;
		private var angle:Number;
		private var txtBullets:TextField;
		private var formatBullets:TextFormat;
		private var layer1:Sprite;
		private var layer2:Sprite;
		
		
		public function Main() {
			zero = new Hero();
			zero.x = 150;
			zero.y = 150;
			upPress = rightPress = leftPress = downPress = false;
			zero.scaleX = zero.scaleY = 4;
			zero.gotoAndStop(1);
			bullets = new Array();
			layer1 = new Sprite();
			addChild(layer1);
			layer2 = new Sprite();
			addChild(layer2);
			layer1.addChild(zero);
			angle = 0;
			//Mouse.hide();
			txtBullets = new TextField();
			txtBullets.x = 100;
			txtBullets.y = 100;
			txtBullets.text = "Deberia salir texto";
			txtBullets.width = 800;
			formatBullets = new TextFormat();
			formatBullets.size = 50;
			txtBullets.setTextFormat(formatBullets);
			layer2.addChild(txtBullets);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUp);
		}
		
		private function loop(e:Event):void{
			if(upPress){
				zero.y-=5;
			}
			if(downPress){
				zero.y+=5;
			}
			if(leftPress){
				zero.x-=5;
			}
			if(rightPress){
				zero.x+=5;
			}
			var dx:Number = mouseX - zero.x;
			var dy:Number = mouseY - zero.y;
			angle = Math.atan2(dy,dx);
			zero.rotation = angle/Math.PI*180;
			var count:int = bullets.length;
			if(count>0){
				for(var i:int = 0;i<count;i++){
					bullets[i].move();
					if(bullets[i].x>stage.stageWidth
					   || bullets[i].y>=stage.stageHeight
					   || bullets[i].y<0
					   ||bullets[i].x<0
					   ){
						layer1.removeChild(bullets[i]);
						bullets.splice(i,1);
						count--;
					}
					
				}
			}
		}
		
		private function keyDown(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.UP:
					upPress = true;
				break;
				case Keyboard.DOWN:
					downPress = true;
				break;
				case Keyboard.LEFT:
					leftPress = true;
				break;
				case Keyboard.RIGHT:
					rightPress = true;
				break;
				case Keyboard.SPACE:
					var b:Bullet =new Bullet(angle);
					layer1.addChild(b);
					bullets.push(b);
					b.x = zero.x;
					b.y = zero.y;
					//setChildIndex(txtBullets,numChildren-1);
				break;
			}
		}
		
		private function keyUp(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.UP:
					upPress = false;
				break;
				case Keyboard.DOWN:
					downPress = false;
				break;
				case Keyboard.LEFT:
					leftPress = false;
				break;
				case Keyboard.RIGHT:
					rightPress = false;
				break;
			}
		}
	}
	
}
