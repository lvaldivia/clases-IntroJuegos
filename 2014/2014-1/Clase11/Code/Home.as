package Code{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import com.greensock.TweenLite;
	
	public class Home extends MovieClip{

		public function Home() {
			y=-600;
			TweenLite.to(this,0.5,{y:0});
			jugar.addEventListener(MouseEvent.CLICK,clickJugar);
			instrucciones.addEventListener(MouseEvent.CLICK,clickInstrucciones);
		}
		
		private function clickJugar(e:MouseEvent):void{
			
		}
		
		private function clickInstrucciones(e:MouseEvent):void{
			jugar.removeEventListener(MouseEvent.CLICK,clickJugar);
			instrucciones.removeEventListener(MouseEvent.CLICK,clickInstrucciones);
			var intro:Instrucciones=new Instrucciones();
			intro.completeTween=remover;
			parent.addChild(intro);
		}
		
		private function remover():void{
			trace("elimino");
			parent.removeChild(this);
		}

	}
	
}
