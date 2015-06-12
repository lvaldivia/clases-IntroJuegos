package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class BadShip extends Sprite 
	{
		private var skin:MovieClip;
		private var vel:int;
		public function BadShip() 
		{
			vel  = 10;
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function move():Boolean 
		{
			y += vel;
			
			if (y  > stage.stageHeight) {
				return true;
			}
			return false;
		}
		
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			skin = new Enemy();
			addChild(skin);
		}
		
		
	}

}