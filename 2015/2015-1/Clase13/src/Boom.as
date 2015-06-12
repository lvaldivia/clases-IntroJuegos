package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class Boom extends Sprite 
	{
		private var skin:MovieClip;
		
		public function Boom() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			skin = new explosion();
			addChild(skin);
			skin.addFrameScript(skin.totalFrames - 1, stopAnimation);
		}
		
		private function stopAnimation():void 
		{
			skin.stop();
			parent.removeChild(this);
		}
		
	}

}