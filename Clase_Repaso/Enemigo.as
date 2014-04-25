package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class Enemigo extends Sprite{

		private var contenido:MovieClip;
		private var barra:MovieClip;
		
		public function Enemigo() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			trace("agregar escena");
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			contenido=new almohada();
			addChild(contenido);
			contenido.x=150;
			contenido.y=150;
			contenido.scaleX=0.3;
			contenido.scaleY=0.3;
			barra=new barra_vida();
			addChild(barra);
		}

	}
	
}
