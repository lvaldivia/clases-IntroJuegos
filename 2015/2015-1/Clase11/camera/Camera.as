package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import Code.objects.Background;
	import Code.objects.Hero;
	import Code.objects.Bullet;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Code.objects.Enemy;
	
	
	public class Camera extends MovieClip {
		
		private var background:Background;
		private var hero:Hero;
		private var left:Boolean;
		private var right:Boolean;
		private var up:Boolean;
		private var down:Boolean;
		private var viewPort:Rectangle;
		private var container:Sprite;
		private var spacePress:Boolean;
		private var bullets:Sprite;
		private var cool_down:int = 0;
		private var enemys:Sprite;
		private var timer:Timer;
		
		public function Camera() {
			container = new Sprite();
			addChild(container);
			background = new Background();
			container.addChild(background);
			hero = new Hero();
			hero.x = stage.stageWidth/2;
			hero.y = stage.stageHeight/2;
			container.addChild(hero);
			enemys = new Sprite();
			addChild(enemys);
			bullets = new Sprite();
			addChild(bullets);
			viewPort = new Rectangle(0,0,stage.stageWidth,
									 stage.stageHeight);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,
								   onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,
								   onUp);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void{
			var ene:Enemy = new Enemy();
			enemys.addChild(ene);
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
			/*if(left){
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
			}*/
			focusTo(hero.x,hero.y,container,viewPort);
			var angle:Number = Math.atan2(mouseY - hero.y,
										  mouseX - hero.x);
			hero.rotation = angle*180/Math.PI;
			cool_down++;
			if(spacePress){
				if(cool_down>=10){
					cool_down = 0;
					spacePress = false;
					var b:Bullet = new Bullet(angle);
					bullets.addChild(b);
					b.x = hero.x;
					b.y = hero.y;
					b.rotation = hero.rotation;
				}
			}
			for(var i:int = 0;i < bullets.numChildren;i++){
				var mc:Bullet = bullets.getChildAt(i) as Bullet;
				mc.move();
			}
			for(var j:int = 0; j<enemys.numChildren; j++){
				var ec:Enemy = enemys.getChildAt(j) as Enemy;
				ec.move();
				for(var a:int = 0; a<bullets.numChildren;a++){
					var mb:Bullet = bullets.getChildAt(a) 
										as Bullet;
					if(ec.hitTestObject(mb)){
						bullets.removeChild(mb);
						enemys.removeChild(ec);
					}
				}
			}
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
				case Keyboard.SPACE:
					spacePress = true;
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
				case Keyboard.SPACE:
					spacePress = false;
				break;
			}
		}
	}
	
}
