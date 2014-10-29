package Code.Characters {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Enemy extends Sprite{

		public function Enemy() {
			addEventListener(Event.ADDED_TO_STAGE,added);
		}
		
		private function added(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,added);
		}

	}
	
}
