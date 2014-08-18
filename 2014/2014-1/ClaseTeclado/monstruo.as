package  {
	import flash.display.Sprite;
	
	public class monstruo extends Sprite{

		private var bg:Sprite;
		public var contador:int;
		public function monstruo() {
			super();
			bg=new enemigo();
			addChild(bg);
			contador=0;
		}
		
		

	}
	
}
