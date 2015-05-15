package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	
	
	public class Loading extends MovieClip {
		
		private var loader:Loader;
		private var barra:Sprite;
		public function Loading() {
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(
								Event.COMPLETE,onComplete);
			loader.contentLoaderInfo.addEventListener(
						IOErrorEvent.IO_ERROR,onError);
			loader.load(new URLRequest("Ejercicio1.swf"));
			loader.contentLoaderInfo.addEventListener(
							ProgressEvent.PROGRESS,onProgress);
			barra = new Sprite();
			barra.graphics.beginFill(0xFF00FF);
			barra.graphics.drawRect(0,0,200,50);
			barra.graphics.endFill();
			addChild(barra);
			barra.x = (stage.stageWidth-barra.width)/2;
			barra.y = (stage.stageHeight-barra.height)/2;
			barra.scaleX = 0;
		}
		
		private function onProgress(e:ProgressEvent):void{
			var scale:Number = e.bytesLoaded/e.bytesTotal;
			barra.scaleX = scale;
		}
		
		private function onComplete(e:Event):void{
			addChild(loader);
		}
		
		private function onError(e:IOErrorEvent):void{
			
		}
	}
	
	
}
