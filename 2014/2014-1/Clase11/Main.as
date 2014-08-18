package  {
	
	import flash.display.MovieClip;
	import Code.Home;
	
	
	
	public class Main extends MovieClip {
		
		private var home:Home;
		public function Main() {
			home=new Home();
			//home.y=-stage.stageHeight;
			addChild(home);
			
		}
	}
	
}
