package  Code{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Game extends Sprite{
	
		private var presionaW:Boolean;
		private var presionaS:Boolean;
		private var presionaBarra:Boolean;
		private var hero:Hero;
		private var balas:Vector.<Bala>;
		private var timer:Timer;
		private var monstruos:Vector.<Monstrup>;
		
		public function Game() {
			super();
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			presionaS=false;
			timer=new Timer(1500);
			monstruos=new Vector.<Monstrup>();
			timer.start();
			timer.addEventListener(TimerEvent.TIMER,crearMonstruos);
			presionaW=false;
			balas=new Vector.<Bala>();
			presionaBarra=false;
			removeEventListener(Event.ADDED_TO_STAGE,agregar);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionar);
			stage.addEventListener(KeyboardEvent.KEY_UP,soltar);
			hero=new Hero();
			addChild(hero);
		}
		
		private function crearMonstruos(e:TimerEvent):void{
			if(timer.currentCount%2==0){
				if(timer.delay>500){
					timer.delay-=200;
				}
			}
			trace(timer.delay);
			var tmp:Monstrup=new Monstrup();
			addChild(tmp);
			tmp.y=Math.random()*stage.stageHeight;
			tmp.x=stage.stageWidth;
			monstruos.push(tmp);
		}
		
		private function presionar(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.W){
				presionaW=true;
			}
			if(e.keyCode==Keyboard.S){
				presionaS=true;
			}
			
			if(e.keyCode==Keyboard.SPACE){
				var tmp:Bala=new Bala();
				tmp.x=hero.x;
				tmp.y=hero.y;
				addChild(tmp);
				balas.push(tmp);
			}
		}
		
		private function soltar(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.W){
				presionaW=false;
			}
			if(e.keyCode==Keyboard.S){
				presionaS=false;
			}
		}
		
		private function loop(e:Event):void{
			if(presionaS){
				hero.y+=5;
			}
			if(presionaW){
				hero.y-=5;
			}
			for(var i:int;i<balas.length;i++){
				balas[i].x+=2;
			}
			for(var j:int;j<monstruos.length;j++){
				monstruos[j].x-=5;
			}
		}

	}
	
}
