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
		private var boom:MovieClip;
		public function BadShip() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			skin = new Enemy();
			addChild(skin);
			boom = new explosion();
			addChild(boom);
			boom.addFrameScript(boom.totalFrames - 1, stopAnimation);
		}
		
		private function stopAnimation():void 
		{
			boom.stop();
		}
		
	}

}