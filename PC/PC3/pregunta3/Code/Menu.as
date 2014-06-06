package  Code{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class Menu extends MovieClip{

		public function Menu() {
			super();
			trace("no agregado "+stage);
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,agregar);
			jugar.addEventListener(MouseEvent.CLICK,irJugar);
		}
		
		private function irJugar(e:MouseEvent):void{
			var intro:Instrucciones=new Instrucciones();
			parent.addChild(intro);
			parent.removeChild(this);
		}

	}
	
}
