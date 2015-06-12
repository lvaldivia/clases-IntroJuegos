package  src{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class Hero extends Sprite{

		private var skin:MovieClip;
		public function Hero() {
			addEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
		}
		
		public function moveLeft():void 
		{
			x -= 2;
			if (x < width/2) {
				x = width/2;
			}
		}
		
		public function moveRight():void 
		{
			x += 2;
			if (x>stage.stageWidth-(width/2)) {
				x = stage.stageWidth - (width / 2);
			}
		}
		
		private function onAdded(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,
							 onAdded); 
			skin = new Ship();
			addChild(skin);
			x = stage.stageWidth/2;
			y = stage.stageHeight - (height / 2);
			trace(y, stage.stageHeight);
		}

	}
	
}
