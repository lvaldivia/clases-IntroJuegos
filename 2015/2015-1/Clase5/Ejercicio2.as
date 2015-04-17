package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	
	
	public class Ejercicio2 extends MovieClip {
		
		private var enemy:MovieClip;
		public function Ejercicio2() {
			enemy = new zombie();
			addChild(enemy);
			enemy.x = stage.stageWidth/2;
			enemy.y = stage.stageHeight/2;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,down);
			stage.addEventListener(KeyboardEvent.KEY_UP,up);
		}
		
		private function down(e:KeyboardEvent){
			enemy.x += 2;
		}
		
		private function up(e:KeyboardEvent){
			
		}
	}
	
}
