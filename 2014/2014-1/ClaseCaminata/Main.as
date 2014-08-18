package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	
	public class Main extends MovieClip {
		
		private var caminante:MovieClip;
		private var presioneDer:Boolean;
		private var presioneIzq:Boolean;
		private var velocidad:int;
		private var presioneSpace:Boolean;
		private var estaSaltando:Boolean;
		private var posicionPiso:int=200;
		private var poderSalto:int=20;
		private var animacion:MovieClip;
		
		public function Main() {
			caminante=new Walkers();
			addChild(caminante);
			caminante.x=100;
			animacion=new explosion();
			animacion.gotoAndStop(1);
			animacion.visible=false;
			animacion.addFrameScript(animacion.totalFrames-1,pararAnimacion);
			addChild(animacion);
			caminante.y=posicionPiso;
			caminante.scaleX=0.5;
			velocidad=2;
			presioneDer=false;
			presioneIzq=false;
			presioneSpace=false;
			estaSaltando=false;
			caminante.scaleY=0.5;
			caminante.gotoAndStop(1);
			//caminante.addFrameScript(caminante.totalFrames-1,pintarTrace);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionarTecla);
			stage.addEventListener(KeyboardEvent.KEY_UP,soltarTecla);
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function pararAnimacion():void{
			animacion.stop();
			animacion.visible=false;
		}
		
		private function loop(e:Event):void{
			if(presioneDer){
				caminante.x+=velocidad;
			}
			if(presioneIzq){
				caminante.x-=velocidad;
			}
			if(presioneSpace){
				if(!estaSaltando){
					estaSaltando=true;
					poderSalto=20;
					animacion.visible=true;
					animacion.play();
					animacion.x=caminante.x;
					animacion.y=posicionPiso;
				}
			}
			if(estaSaltando){
				caminante.y-=poderSalto;
				poderSalto-=2;
				if(caminante.y>=posicionPiso){
					caminante.y=posicionPiso;
					estaSaltando=false;
				}
				
			}
		}
		
		private function soltarTecla(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.RIGHT){
				presioneDer=false;
				caminante.gotoAndStop(1);
			}
			if(e.keyCode==Keyboard.LEFT){
				presioneIzq=false;
				caminante.gotoAndStop(1);
			}
			if(e.keyCode==Keyboard.SHIFT){
				velocidad=2;
			}
			if(e.keyCode==Keyboard.SPACE){
				presioneSpace=false;
			}
		}
		
		private function presionarTecla(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.RIGHT){
				presioneDer=true;
				caminante.scaleX=0.5;
				caminante.play()
			}
			if(e.keyCode==Keyboard.LEFT){
				presioneIzq=true;
				caminante.play()
				caminante.scaleX=-0.5;
			}
			if(e.keyCode==Keyboard.SHIFT){
				velocidad=6;
			}
			if(e.keyCode==Keyboard.SPACE){
				presioneSpace=true;
			}
		}
	}
	
}
