package  Code.objects{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Background extends Sprite{
		
		private var skin:MovieClip;
		public function Background() {
			addEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
		}
		
		private function onAdded(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
			skin = new bg();
			addChild(skin);
		}

	}
	
}
