package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class Main extends MovieClip {
		
		
		public function Main() {
			for(var i:int = 0;i<6;i++){
				var cua:Sprite = new Sprite();
				cua.graphics.beginFill(Math.random()*0x00FF00);
				cua.graphics.drawRect(0,0,50,50);
				cua.graphics.endFill();
				cua.x = (cua.width+10)*i;
				cua.y = (cua.height+10)*i;
				cua.name = 'fila1';
				addChild(cua);
				
				var cua2:Sprite = new Sprite();
				cua2.graphics.beginFill(Math.random()*0x00FF00);
				cua2.graphics.drawRect(0,0,50,50);
				cua2.graphics.endFill();
				cua2.x = stage.stageWidth-((cua2.width+10)*i);
				cua2.y = (cua.height+10)*i;
				addChild(cua2);
				cua2.name = 'fila2';
			}
			
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			for(var i:int = 0; i<numChildren;i++){
				var mc:Sprite = getChildAt(i) as Sprite;
				if(mc.name == 'fila1'){
					mc.x+=1;
					if(mc.x>stage.stageWidth){
						mc.x = -mc.width;
						mc.y = -mc.height;
					}
				}
				else{
					mc.x-=1;
					if(mc.x<-mc.width){
						mc.x = stage.stageWidth;
						mc.y = -mc.height;
					}
				}
				mc.y+=1;
			}
		}
		
		
	}
	
}
