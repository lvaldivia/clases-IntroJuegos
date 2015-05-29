package  Code.objects{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy extends Sprite{
		
		private var skin:MovieClip;
		public function Enemy() {
			addEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
		}
		
		private function onAdded(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
			skin = new enemy();
			addChild(skin);
			if(Math.random()<0.5){
				x = -width/2;
			}else{
				x = stage.stageWidth+(width/2);
				scaleX = -1;
			}
			y = Math.random()*(stage.stageHeight-height/2);
		}
		
		public function move():void{
			if(scaleX == -1){
				x-=10;
			}else{
				x+=10;
			}
		}

	}
	
}
