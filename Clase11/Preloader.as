package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	public class Preloader extends MovieClip {
		
		
		public function Preloader() {
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completado);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progress);
			loader.load(new URLRequest("pantallas.swf"));
			progreso.cargando.scaleX=0;
		}
		
		private function completado(e:Event):void{
			addChild(e.currentTarget.content);
			removeChild(progreso);
		}
		
		private function progress(e:ProgressEvent):void{
			var porcentaje:Number=e.bytesLoaded/e.bytesTotal;
			progreso.cargando.scaleX=porcentaje;
		}
	}
	
}
