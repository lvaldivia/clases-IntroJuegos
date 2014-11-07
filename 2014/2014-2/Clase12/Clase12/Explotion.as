package Clase12{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Explotion extends MovieClip{
		
		public var fn:Function;
		public function Explotion() {
			addEventListener(Event.ADDED_TO_STAGE,added);
		}
		
		private function added(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,added);
			addFrameScript(0,playSound);
			addFrameScript(totalFrames-1,stopExplotion);
		}
		
		private function playSound():void{
			trace("playSound");
		}
		
		private function stopExplotion():void{
			stop();
			fn();
			visible = false;
			parent.removeChild(this);
		}

	}
	
}
