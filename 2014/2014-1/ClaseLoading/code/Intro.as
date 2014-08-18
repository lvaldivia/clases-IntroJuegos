package  code{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Intro extends MovieClip{

		public function Intro() {
			cerrar.addEventListener(MouseEvent.CLICK,cerrarModal);
		}
		
		private function cerrarModal(e:MouseEvent):void{
			cerrar.removeEventListener(MouseEvent.CLICK,cerrarModal);
			parent.removeChild(this);
		}

	}
	
}
