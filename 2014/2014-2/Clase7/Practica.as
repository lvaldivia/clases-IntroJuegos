package  {
	
	import flash.display.MovieClip;
	
	public class Practica extends MovieClip {
		
		private var timer:Timer;
		public function Practica() {
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER,create);
			stage.addEventListener(Event.ENTER_FRAME,move);
		}
		private function move():void{
			
		}
		
		private function create():void{
			var mc:MovieClip ;
			if(timer.currentCount%2){
				mc = new A();
			}else{
				mc = new B();
			}
			addChild(mc);
			mc.y = mc.width/2;
		}
	}
	
}
