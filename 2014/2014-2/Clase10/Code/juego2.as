package Code {
	
	import flash.display.MovieClip;
	import Code.Characters.Hero;
	import Code.Characters.Enemy;
	
	
	public class juego2 extends MovieClip {
		
		private var zero:Hero;
		public function juego2() {
			zero = new Hero();
			addChild(zero);
			zero.x = 100;
			zero.y = 100;
			zero.scaleX = 4;
			zero.scaleY = 4;
		}
	}
	
}
