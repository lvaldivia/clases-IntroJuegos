package  Code{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	
	public class Instrucciones extends MovieClip{
		public var completeTween:Function;
		public function Instrucciones() {
			y=600;
			//completeTween=complete;
			TweenLite.to(this,0.5,{y:0,onComplete:completarTween});
			jugar.addEventListener(MouseEvent.CLICK,clickJugar);
			regresar.addEventListener(MouseEvent.CLICK,clickRegresar);
		}
		
		private function completarTween():void{
			completeTween();
		}
		
		private function clickJugar(e:MouseEvent):void{
			
		}
		
		private function clickRegresar(e:MouseEvent):void{
			jugar.removeEventListener(MouseEvent.CLICK,clickJugar);
			regresar.removeEventListener(MouseEvent.CLICK,clickRegresar);
			var myhome:Home=new Home();
			parent.addChild(myhome)
			parent.removeChild(this);
		}

	}
	
}
