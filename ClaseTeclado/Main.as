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
		private var contador:int;
		private var monstruos:Vector.<monstruo>;
		private var balas:Vector.<bala>;
		
		
		public function Main() {
			miHero=new heroe();
			addChildAt(miHero,0);
			miHero.y=miHero.height*2;
			leftPressed=false;
			rightPressed=false;
			contador=0;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionarTecla);
			stage.addEventListener(KeyboardEvent.KEY_UP,soltarTecla);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			timer=new Timer(1000,2);
			timer.addEventListener(TimerEvent.TIMER,crearMonstruos);
			//monstruos=new Array()
			balas=new Vector.<bala>();
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
				//if(i==1){
					monstruos[i].x-=5
				//}
				if(miHero.hitTestObject(monstruos[i])){
					if(monstruos[i].contador==0){
						trace("choque con "+i);
						monstruos[i].contador++;
					}
				}
			} 
			var numBlas:int=balas.length;
			for(var j:int;j<numBlas;j++){
				balas[j].x+=5;
				for(var i:int=0;i<hijos;i++){
					if(balas[j].hitTestObject(monstruos[i])){
						removeChild(balas[j]);
						removeChild(monstruos[i]);
						monstruos.splice(i,1);
						balas.splice(j,1);
						hijos--;
						numBlas--;
					}
				}
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
			if(e.keyCode==Keyboard.SPACE){
				var b:bala=new bala();
				b.scaleX=-1;
				b.x=miHero.x;
				b.y=miHero.y;
				balas.push(b);
				addChild(b);
			}
		}
	}
	
}
