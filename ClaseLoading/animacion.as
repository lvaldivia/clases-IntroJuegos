package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	public class animacion extends MovieClip {
		
		private var loader:Loader;
		public function animacion() {
			barra_mc.gotoAndStop(1);
			loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,complete);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progreso);
			loader.load(new URLRequest("http://2.bp.blogspot.com/-bQuicHBNwes/Twx1ArSQpkI/AAAAAAAAAmo/Yzz_Ek7yOOY/s1600/naruto.jpg?"+Math.random()*500));  
		}
		
		private function complete(e:Event):void{
			trace("completo carga");
			barra_mc.stop();
		}
		
		private function progreso(e:ProgressEvent):void{
			var porcentaje:int=(e.bytesLoaded/e.bytesTotal)*100;
			barra_mc.gotoAndStop(porcentaje);
		}
	}
	
}
