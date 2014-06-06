package  Code{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Hero extends Sprite{
		private var vidas:int=5;
		public function Hero() {
			super();
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,agregar);
			graphics.beginFill(0xFF00FF);
			graphics.drawRect(0,0,50,50);
			graphics.endFill();
		}

	}
	
}
