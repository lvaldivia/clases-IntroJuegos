package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var left:Boolean;
		private var right:Boolean;
		private var timer:Timer;
		private var bad:Vector.<BadShip>;
		private var isDown:Boolean;
		private var bullets:Vector.<Bullet>;
		private var coolDown:int = 0;
		
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
			bullets = new Vector.<Bullet>();
			addChild(hero);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			bad = new Vector.<BadShip>();
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, down);
			stage.addEventListener(MouseEvent.MOUSE_UP, up);
			isDown = false;
		}
		
		private function up(e:MouseEvent):void 
		{
			isDown = false
		}
		
		private function down(e:MouseEvent):void 
		{
			isDown = true;
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
			hero.x = mouseX;
			if (hero.x - hero.width / 2 < 0) {
				hero.x = hero.width / 2;
			}
			if (hero.x + hero.width/2 > stage.stageWidth) {
				hero.x = stage.stageWidth - hero.width/2;
			}
			var t:int = bad.length;
			for (var i:int = 0; i < t; i++) 
			{
				if (bad[i].move()) {
					removeChild(bad[i]);
					bad.splice(i,1);
					t--;
				}
			}
			coolDown++;
			if (isDown) {
				if (coolDown >= 10) {
					coolDown = 0;
					var b:Bullet = new Bullet();
					addChild(b);
					b.x = hero.x-hero.width/2;
					bullets.push(b);
					b.y = hero.y;
					var b:Bullet = new Bullet();
					addChild(b);
					b.x = hero.x+hero.width/2;
					bullets.push(b);
					b.y = hero.y;
				}
			}
			var tB:int = bullets.length;
			for (var j:int = 0; j < tB; j++) 
			{
				if (bullets[j].move()) {
					removeChild(bullets[j]);
					bullets.splice(j, 1);
					tB--;
				}else {
					for (var k:int = 0; k < t; k++) 
					{
						if (bullets[j].hitTestObject(bad[k])) {
							var expl:Boom = new Boom();
							addChild(expl);
							expl.x = bad[k].x;
							expl.y = bad[k].y;
							removeChild(bullets[j]);
							removeChild(bad[k]);
							bullets.splice(j, 1);
							tB--;
							bad.splice(k, 1);
							t--;
						}
					}
				}
			}
		}
	
	}

}
