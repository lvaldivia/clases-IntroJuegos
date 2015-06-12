package  src {
	
	import flash.display.MovieClip;
	
	
	public class Main extends MovieClip {
		
		private var game:Game;
		public function Main() {
			game  = new Game();
			addChild(game);
		}
	}
	
}
