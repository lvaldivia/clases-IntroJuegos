package  Code.objects{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class Hero extends Sprite{
		
		private var skin:MovieClip;
		public function Hero() {
			addEventListener(Event.ADDED_TO_STAGE,
							 added);
		}
		
		private function added(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,
							 added);
			skin = new char();
			addChild(skin);
		}

	}
	
}
