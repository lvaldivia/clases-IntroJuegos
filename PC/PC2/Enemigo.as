package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemigo extends MovieClip 
	{
		public var indicador:MovieClip;
		public var vidas:int;
		
		public function Enemigo() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			indicador.stop();
		}
		
	}

}