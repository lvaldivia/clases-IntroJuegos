package Code.Characters {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class Hero extends Sprite{
		
		private var content:MovieClip;
		public function Hero() {
			addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		private function onAdded(e:Event):void{
			content = new hero();
			content.gotoAndStop(1);
			addChild(content);
		}

	}
	
}
