package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	
	public class Cargador extends MovieClip {
		private var cargador:Loader;
		public function Cargador() {
			cargador=new Loader();
			cargador.contentLoaderInfo.addEventListener(Event.COMPLETE,cargaCompleta);
			cargador.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progreso);
			cargador.load(new URLRequest("juego.swf"));
		}

		
		private function progreso(e:ProgressEvent):void{
			var porcentaje:int=Math.round((e.bytesLoaded/e.bytesTotal)*100);
			txtPorcentaje.text=porcentaje.toString()+"%";
		}
		
		private function cargaCompleta(e:Event):void{
			cargador.contentLoaderInfo.removeEventListener(Event.COMPLETE,cargaCompleta);
			cargador.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progreso);
			addChild(e.currentTarget.content);
		}
	}
	
}
