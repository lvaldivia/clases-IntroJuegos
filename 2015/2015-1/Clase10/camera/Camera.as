package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	
	
	public class Camera extends MovieClip {
		
		private var background:MovieClip;
		private var hero:MovieClip;
		private var left:Boolean;
		private var right:Boolean;
		private var up:Boolean;
		private var down:Boolean;
		private var viewPort:Rectangle;
		private var container:Sprite;
		
		public function Camera() {
			container = new Sprite();
			addChild(container);
			background = new bg();
			container.addChild(background);
			hero = new char();
			hero.x = stage.stageWidth/2;
			hero.y = stage.stageHeight/2;
			container.addChild(hero);
			viewPort = new Rectangle(0,0,stage.stageWidth,
									 stage.stageHeight);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,
								   onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,
								   onUp);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			
		}
		
		private function focusTo(_x:Number,
								 _y:Number,
								 canvas:Sprite,
								 view:Rectangle
								 ):void{
			var xx:Number = _x;
			var yy:Number = _y;
			var lx:Number = stage.stageWidth/2;
			var ly:Number = stage.stageHeight/2;
			if(xx-view.left<lx){
				xx = view.left+lx;
			}
			if(yy-view.top<ly){
				yy = view.top+ly;
			}
			
			if(xx>background.width-280){
				xx = background.width-280;
			}
			if(yy>background.height-200){
				yy = background.height-200;
			}
			
			var nX:Number = (stage.stageWidth*0.5)-xx;
			var nY:Number = (stage.stageHeight*0.5)-yy;
			
			canvas.x = nX;
			canvas.y = nY;
		}
		
		private function loop(e:Event):void{
			if(left){
				hero.x -=8;
			}
			if(right){
				hero.x +=8;
			}
			if(down){
				hero.y +=8;
			}
			if(up){
				hero.y -=8;
			}
			focusTo(hero.x,hero.y,container,viewPort);
		}
		
		private function onDown(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					left = true;
				break;
				case Keyboard.RIGHT:
					right = true;
				break;
				case Keyboard.DOWN:
					down = true;
				break;
				case Keyboard.UP:
					up = true;
				break;
			}
		}
		
		private function onUp(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					left = false;
				break;
				case Keyboard.RIGHT:
					right = false;
				break;
				case Keyboard.DOWN:
					down = false;
				break;
				case Keyboard.UP:
					up = false;
				break;
			}
		}
	}
	
}
