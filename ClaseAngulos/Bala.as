package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Bala extends Sprite{
		private var _vx:Number;
		private var _vy:Number;
		public function Bala(vx:Number,vy:Number) {
			super();
			_vx=vx;
			_vy=vy;
			addEventListener(Event.ADDED_TO_STAGE,agregar);
		}
		
		private function agregar(e:Event):void{
			graphics.beginFill(0x0000FF);
			graphics.drawCircle(0,0,20);
			graphics.endFill();
		}
		
		public function move():void{
			x+=_vx;
			y+=_vy;
			if(x>stage.stageWidth){
				
			}
			if(x<0){
				
			}
			if(y>stage.stageHeight){
				
			}
			if(y<0){
				
			}
		}

	}
	
}
