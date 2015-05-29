package Code.objects {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class Bullet extends Sprite {
		
		private var skin:MovieClip;
		private var vx:Number;
		private var vy:Number;
		public var angle:Number;
		
		public function Bullet(_angle:Number) {
			angle = _angle;
			vx = 0;
			vy = 0;
			addEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
		}
		
		public function move():void{
			x += Math.cos(angle)*10;
			y += Math.sin(angle)*10;
		}
		
		
		
		private function onAdded(e:Event):void{
			
			removeEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
			skin = new bullet();
			addChild(skin);
		}

	}
	
}
