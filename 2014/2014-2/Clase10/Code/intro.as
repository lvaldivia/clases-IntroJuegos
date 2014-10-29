package Code {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	public class intro extends MovieClip {
		
		private var loader:Loader;
		public function intro() {
			barra_mc.gotoAndStop(1);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,complete);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progress);
			loader.load(new URLRequest("swf/juego.swf"));
		}
		
		private function complete(e:Event):void{
			trace("complete");
		}
		
		private function progress(e:ProgressEvent):void{
			var frame:Number = Math.round((e.bytesLoaded/e.bytesTotal)*100);
			barra_mc.gotoAndStop(frame);
		}
		
		
	}
	
}
