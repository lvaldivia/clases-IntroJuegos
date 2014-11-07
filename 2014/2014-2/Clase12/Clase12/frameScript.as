package Clase12 {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class frameScript extends MovieClip {
		
		private var mc:Explotion;
		public function frameScript() {
			stage.addEventListener(MouseEvent.CLICK,click);
		}
		
		private function click(e:MouseEvent):void{
			var mc:Explotion = new Explotion();
			mc.fn = createRect;
			addChild(mc);
			mc.x = mouseX;
			mc.y = mouseY;
		}
		
		private function createRect():void{
			var c:Sprite = new Sprite();
			c.graphics.beginFill(Math.random()*0xFF00FF);
			c.graphics.drawRect(0,0,50,20);
			c.graphics.endFill();
			c.x = Math.random()*stage.stageWidth;
			c.y = Math.random()*stage.stageHeight;
			addChild(c);
		}
	}
	
}
