package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	public class Main extends MovieClip {
		
		private var load:Loader;
		public function Main() {
			load=new Loader();
			load.contentLoaderInfo.addEventListener(Event.COMPLETE,cargarCompleta);
			load.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,preogreso);
			load.load(new URLRequest("juego.swf"));
			barra_cargador.cargando.scaleX=0;
		}
		
		private function cargarCompleta(e:Event):void{
			barra_cargador.visible=false;
			load.contentLoaderInfo.removeEventListener(Event.COMPLETE,cargarCompleta);
			load.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,preogreso);
			addChild(e.currentTarget.content);
		}
		
		private function preogreso(e:ProgressEvent):void{
			var porcentaje:int=(e.bytesLoaded/e.bytesTotal)*100;
			barra_cargador.cargando.scaleX=e.bytesLoaded/e.bytesTotal;
		}
	}
	
}
