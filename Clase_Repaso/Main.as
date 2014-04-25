package  {
	
	import flash.display.MovieClip;
	
	
	public class Main extends MovieClip {
		
		private var enemigo:Enemigo;
		public function Main() {
			enemigo=new Enemigo();
			addChild(enemigo);
		}
	}
	
}
