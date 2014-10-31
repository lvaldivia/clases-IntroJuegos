package Code{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Hero extends MovieClip{

		public function Hero() {
			addEventListener(Event.ADDED_TO_STAGE,added);
		}
		
		private function added(e:Event):void{
			
		}

	}
	
}
