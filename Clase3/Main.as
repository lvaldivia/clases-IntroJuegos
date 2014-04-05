package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Sprite;
	
	public class Main extends MovieClip {
		
		private var timer:Timer;
		private var vidas:int;
		private var conteo:int;
		private var txtVidas:TextField;
		private var txtPuntaje:TextField;
		private var contenedor:Sprite;
		
		public function Main() {
			timer=new Timer(500);
			txtVidas=new TextField();
			addChild(txtVidas);
			txtPuntaje=new TextField();
			addChild(txtPuntaje);
			txtPuntaje.x=300;
			txtPuntaje.y=60;
			contenedor=new Sprite();
			addChild(contenedor);
			var format:TextFormat=new TextFormat();
			format.size=30;
			format.color=0xFFFF00;
			txtPuntaje.setTextFormat(format);
			txtVidas.setTextFormat(format);
			txtPuntaje.text="Puntaje :";
			txtVidas.text="Vidas ";
			vidas=3;
			conteo=0;
			timer.addEventListener(TimerEvent.TIMER,crearMonstruos);
			timer.start();
			stage.addEventListener(Event.ENTER_FRAME,mover);
		}
		
		private function mover(e:Event):void{
			if(vidas==0){
				trace("gameOver");
				for(var a:int=0;a<contenedor.numChildren;a++){
					var mc1:MovieClip=contenedor.getChildAt(a) as MovieClip;
					mc1.removeEventListener(MouseEvent.CLICK,morir);
				}
				stage.removeEventListener(Event.ENTER_FRAME,mover);
			}
			else{
				var hijos:int=contenedor.numChildren;
				if(hijos>0){
					for(var i:int=0;i<hijos;i++){
						var mc:MovieClip=contenedor.getChildAt(i) as MovieClip;
						mc.y+=1;
						if(mc.y>=stage.stageHeight){
							vidas--;
							timer.stop();
							contenedor.removeChild(mc);
							hijos--;
						}
					}
				}
			}
		}
		
		private function crearMonstruos(e:TimerEvent):void{
			var mod:int=timer.currentCount%3;
			var enemigo:MovieClip;
			if(mod==0){
				enemigo=new enemigo2();
				enemigo.tabIndex=4;
				enemigo.name='enemigo2';
			}else{
				enemigo=new enemigo1();
				enemigo.tabIndex=2;
				enemigo.name='enemigo1';
			}
			enemigo.x=Math.random()*stage.stageWidth;
			enemigo.addEventListener(MouseEvent.CLICK,morir);
			enemigo.y=10;
			contenedor.addChild(enemigo);
		}
		
		private function morir(e:MouseEvent):void{
			if(vidas>0){
				var mc:MovieClip=e.currentTarget as MovieClip;
				var nombre:String=mc.name;
				if(mc.tabIndex>0){
					mc.tabIndex--;
					if(mc.tabIndex==0){
						TweenLite.to(mc,0.5,{alpha:0,onComplete:removeScena,onCompleteParams:[mc]});
					}else{
						if(nombre=='enemigo1'){
							TweenLite.to(mc,0.1,{x:mc.x+10});
						}else{
							TweenLite.to(mc,0.1,{rotation:mc.rotation+10,x:mc.x+10,alpha:0.9});
						}
					}
				}
			}
		}
		
		private function removeScena(mc:MovieClip):void{
			conteo++;
			contenedor.removeChild(mc);
		}
		
	}
}
