package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class Main extends MovieClip {
		
		private var miHero:MovieClip;
		private var leftPressed:Boolean;
		private var rightPressed:Boolean;
		private var direccion:int;
		private var timer:Timer;
		//private var monstruos:Array;
		private var monstruos:Vector.<monstruo>;
		
		public function Main() {
			miHero=new heroe();
			addChildAt(miHero,0);
			miHero.y=miHero.height*2;
			leftPressed=false;
			rightPressed=false;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionarTecla);
			stage.addEventListener(KeyboardEvent.KEY_UP,soltarTecla);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			timer=new Timer(1000,1);
			timer.addEventListener(TimerEvent.TIMER,crearMonstruos);
			
			monstruos=new Vector.<monstruo>();
			timer.start();
		}
		
		private function crearMonstruos(e:TimerEvent):void{
			var bowser:monstruo=new monstruo();
			addChildAt(bowser,0);
			bowser.x=stage.stageWidth;
			bowser.y=miHero.y;
			monstruos.push(bowser);
		}
		
		private function loop(e:Event):void{
			
			if(rightPressed)
			{
				if (miHero.x<=stage.stageWidth)
				{
					miHero.x+=5;
					miHero.scaleX=1;
					direccion=-1;
				}
			}
			if(leftPressed){
				if (miHero.x>=0)
				{
					miHero.x-=5;
					miHero.scaleX=-1;
					direccion=1;
				}
			}
			var hijos:int=monstruos.length;
			for(var i:int=0;i<hijos;i++){
				monstruos[i].x-=5
			}
		}
		
		private function soltarTecla(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.LEFT){
				leftPressed=false;
			}
			if(e.keyCode==Keyboard.RIGHT){
				rightPressed=false;
			}
		}
		
		private function presionarTecla(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.LEFT){
				leftPressed=true;
			}
			if(e.keyCode==Keyboard.RIGHT){
				rightPressed=true;
			}
		}
	}
	
}
