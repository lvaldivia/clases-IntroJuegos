package  Code{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Bullet extends Sprite{
		private var angle:Number;
		public function Bullet(angle_zero:Number) {
			angle = angle_zero;
			addEventListener(Event.ADDED_TO_STAGE,added);
		}
		
		private function added(e:Event):void{
			graphics.beginFill(0xFF00FF);
			graphics.drawCircle(0,0,25);
			graphics.endFill();
		}
		
		
		public function move():void{
			x +=Math.cos(angle)*20;
			y +=Math.sin(angle)*20;
			
		}

	}
	
}
