package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	
	public class Ejercicio1 extends MovieClip {
		
		private var menuScreen:MovieClip;
		private var gameScreen:MovieClip;
		private var enemys:Sprite;
		private var timer:Timer;
		private var velocity:int;
		private var level:int;
		private var deads:int;
		private var lifeUser:int;
		public function Ejercicio1() {
			menuScreen = new menu();
			addChild(menuScreen);
			menuScreen.btnPlay.addEventListener(
												MouseEvent.CLICK,
												go);
			menuScreen.btnPlay.buttonMode = true;
		}
		
		private function go(e:MouseEvent):void{
			menuScreen.btnPlay.removeEventListener(
												MouseEvent.CLICK,
												go);
			velocity = 2;
			deads = 0;
			level = 1;
			lifeUser = 3;
			removeChild(menuScreen);
			gameScreen = new game_bg();
			addChild(gameScreen);
			enemys = new Sprite();
			addChild(enemys);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,
								   onTimer);
			timer.start();
			stage.addEventListener(Event.ENTER_FRAME,
								   loop);
		}
		private function onTimer(e:TimerEvent):void{
			var ene:MovieClip = new heroFly();
			enemys.addChild(ene);
			ene.x = 0;
			ene.y = Math.random()*(stage.stageHeight-ene.height);
			var life:Sprite = new Sprite();
			life.graphics.beginFill(0x00FF00);
			life.graphics.drawRect(0,0,ene.width,10);
			life.graphics.endFill();
			ene.addChild(life);
			life.name = 'life';
			life.y = ene.height;
			ene.tabIndex = 10;
			ene.mouseChildren = false;
			life.tabIndex = ene.tabIndex;
			ene.addEventListener(MouseEvent.CLICK,destroy);
		}
		
		private function destroy(e:MouseEvent):void{
			var mc:MovieClip = e.currentTarget as MovieClip;
			var life:Sprite = mc.getChildByName('life') as Sprite;
			mc.tabIndex--;
			var porcentaje:Number = mc.tabIndex/ life.tabIndex;
			life.scaleX = porcentaje;
			if(mc.tabIndex==0){
				enemys.removeChild(mc);
				deads++;
				if(deads%5 == 0){
					level++;
					velocity +=2;
					trace("level "+level);
				}
			}
			
		}
		
		private function loop(e:Event):void{
			for(var i:int =0; i<enemys.numChildren;i++){
				var mc:MovieClip = enemys.getChildAt(i) 
												as MovieClip;
				mc.x +=velocity;
				if(mc.x>stage.stageWidth-mc.width){
					enemys.removeChild(mc);
					lifeUser--;
					if(lifeUser==0){
						trace("gameover");
						timer.stop();
						stage.removeEventListener(Event.ENTER_FRAME,loop);
						enemys.removeChildren();
					}
				}
			}
		}
	}
	
}
