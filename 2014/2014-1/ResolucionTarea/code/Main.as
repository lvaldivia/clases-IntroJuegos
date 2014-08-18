package code{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	
	public class Main extends MovieClip{
		
		private var hero:Sprite;
		private var totalBalas:int=5;
		private var misBalas:Vector.<Sprite>;
		private var spacePress:Boolean;
		private var canCrear:Boolean;
		private var monstruos:Vector.<Sprite>;
		private var timerMonstruos:Timer;
		private var actual:int;
		private var totalTiempo:Number;
		
		public function Main() {
			hero=new mario();
			hero.x=hero.width/2;
			canCrear=true;
			monstruos=new Vector.<Sprite>();
			hero.y=stage.stageHeight-hero.height;
			addChild(hero);
			totalTiempo=0;
			spacePress=false;
			actual=getTimer();
			//timerMonstruos=new Timer(1000);
			//timerMonstruos.addEventListener(TimerEvent.TIMER,crearMonstruos);
			//timerMonstruos.start();
			misBalas=new Vector.<Sprite>();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionar);
			stage.addEventListener(KeyboardEvent.KEY_UP,soltar);
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		/*private function crearMonstruos(e:TimerEvent):void{
			var reduce:int=timerMonstruos.currentCount%5;
			if(reduce==0){
				if(timerMonstruos.delay>400){
					timerMonstruos.delay-=200
				}
				trace(timerMonstruos.delay);
			}
			var m:Sprite=new monstruo();
			m.x=stage.stageWidth;
			m.tabIndex=(Math.random()*3)+1;
			m.y=hero.y;
			addChild(m);
			monstruos.push(m);
		}*/
		
		private function loop(e:Event):void{
			var dt:Number=(getTimer()-actual)*0.01;
			actual=getTimer();
			totalTiempo+=dt;
			if(totalTiempo>=1){
				totalTiempo=0;
				trace("crear monstruo");
			}
			//trace(dt);
			/*var balas:int=misBalas.length;
			var malos:int=monstruos.length;
			if(balas>0){
				for(var i:int;i<balas;i++){
					//misBalas[i].x+=5;
				}
			}
			if(malos>0){
				for(var j:int;j<malos;j++){
					monstruos[j].x-=5;
					for(var x:int=0;x<balas;x++){
						if(misBalas[x].hitTestObject(monstruos[j])){
							removeChild(misBalas[x]);
							misBalas.splice(x,1);
							balas--;
							if(monstruos[j].tabIndex>0){
								monstruos[j].tabIndex--;
								if(monstruos[j].tabIndex==0){
									removeChild(monstruos[j]);
									monstruos.splice(j,1);
									malos--;
								}
							}
						}
					}
				}
			}*/
		}
		
		private function soltar(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.SPACE){
				spacePress=false;
			}
		}
		
		private function presionar(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.SPACE){
				spacePress=true;
				if(canCrear){
					var tmp:Sprite=new bala();
					tmp.x=hero.x;
					tmp.y=hero.y;
					addChild(tmp);
					tmp.scaleX=-1;
					misBalas.push(tmp);
					if(misBalas.length%5==0){
						canCrear=false;
						setTimeout(cambiarCrear,300);
					}
				}
			}
		}
		
		private function cambiarCrear():void{
			canCrear=true;
		}

	}
	
}
