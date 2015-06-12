package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class Bullet extends Sprite 
	{
		private var skin:MovieClip;
		
		public function Bullet() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		public function move():Boolean
		{
			y -= 5;
			if (y < 0) {
				return true;
			}
			return false;
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			skin = new bullet();
			addChild(skin);
		}
		
	}

}