package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class Main extends MovieClip {
		
		private var total_vidas:int;
		private var current_vidas:int;
		private var monstruo:Sprite;
		private var vidaMonstruo:MovieClip;
		
		public function Main() {
			total_vidas=5;
			current_vidas=total_vidas;
			
			/*monstruo=new Sprite();
			monstruo.graphics.beginFill(0x00FF00);
			monstruo.graphics.moveTo(50,0);
			monstruo.graphics.lineTo(75,50);
			monstruo.graphics.lineTo(0,50);
			monstruo.graphics.lineTo(50,0);
			monstruo.graphics.endFill();
			monstruo.x=stage.stageWidth/2;
			monstruo.y=stage.stageHeight/2;
			monstruo.addEventListener(MouseEvent.CLICK,click);
			addChild(monstruo);*/
			for(var i:int=0;i<5;i++){
				var enemigo:Enemigo=new Enemigo();
				addChild(enemigo);
			}
			stage.addEventListener(Event.ENTER_FRAME,move);
		}
		
		private function click(e:MouseEvent):void{
			
		}
		
		private function move(e:Event):void{
			for(var i:int;i<numChildren;i++){
				var mc:Enemigo=getChildAt(i)as Enemigo;
				mc.x+=1;
			}
		}
	}
	
}
