package  Code{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Monstrup extends Sprite{

		public function Monstrup() {
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,agregar);
			graphics.beginFill(0x000000);
			graphics.drawRect(0,0,25,25);
			graphics.endFill();
		}

	}
	
}
