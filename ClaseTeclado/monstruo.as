package  {
	import flash.display.Sprite;
	
	public class monstruo extends Sprite{

		private var bg:Sprite;
		public function monstruo() {
			super();
			bg=new enemigo();
			addChild(bg);
		}

	}
	
}
