package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	
	public class Ejercicio3 extends MovieClip {
		
		
		public function Ejercicio3() {
			var mEnemy:MovieClip = new enemy();
			addChild(mEnemy);
			mEnemy.x = 150;
			mEnemy.y = 150;
			mEnemy.tabIndex = 5;
			var life:Sprite = new Sprite();
			life.graphics.beginFill(0x0FF000);
			life.graphics.drawRect(0,0,150,50);
			life.graphics.endFill();
			mEnemy.addChild(life);
			life.y = -(life.height+10);
			life.tabIndex = mEnemy.tabIndex;
			life.x = (mEnemy.width-life.width)/2;
			life.name = 'life';
			mEnemy.addEventListener(MouseEvent.CLICK,
									destroy);
		}
		
		private function destroy(e:MouseEvent):void{
			var mc:MovieClip = e.currentTarget as MovieClip;
			mc.tabIndex--;
			var life:Sprite = mc.getChildByName('life') as Sprite;
			var reduce:Number = mc.tabIndex/life.tabIndex;
			life.scaleX = reduce;
			if(mc.tabIndex==0){
				removeChild(mc);
			}
		}
	}
	
}
