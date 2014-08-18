package  Code{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Instrucciones extends MovieClip{

		public function Instrucciones() {
			super();
			trace("no agregado "+stage);
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,agregar);
			jugar.addEventListener(MouseEvent.CLICK,irJugar);
		}
		
		private function irJugar(e:MouseEvent):void{
			var game:Game=new Game();
			parent.addChild(game);
			parent.removeChild(this);
		}

	}
	
}
