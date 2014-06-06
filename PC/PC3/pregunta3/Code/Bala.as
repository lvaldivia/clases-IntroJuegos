package  Code{
	import flash.display.Sprite;
	import flash.events.Event;
	public class Bala extends Sprite{

		public function Bala() {
			super();
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,agregar);
			graphics.beginFill(0x0000FF);
			graphics.drawRect(0,0,25,25);
			graphics.endFill();
		}
	}
	
}
