package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	public class loading extends MovieClip {
		
		private var bar:Sprite;
		private var loader:Loader;
		
		public function loading() {
			bar = new Sprite();
			bar.graphics.beginFill(0x00FF0F);
			bar.graphics.drawRect(0,0,stage.stageWidth,50);
			bar.graphics.endFill();
			bar.y = 50;
			addChild(bar);
			bar.scaleX = 0;
			initLoaders();
		}
		
		private function initLoaders():void{
			loader =new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgress);
			loader.load(new URLRequest("http://cdn.jkanime.net/assets/images/animes/image/saint-seiya.jpg"));
		}
		
		private function onProgress(e:ProgressEvent):void{
			var porcent:Number = e.bytesLoaded/e.bytesTotal;
			bar.scaleX = porcent;
			txt.text = Math.round(porcent*100)+"%"
		}
		
		private function onComplete(e:Event):void{
			removeChild(bar);
			removeChild(txt);
			addChild(loader);
		}
	}
	
}
