package Code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Main2 extends MovieClip {
		
		private var bgs:Array;
		public function Main2() {
			bgs = new Array();
			for(var i:int ; i<3;i++){
				var b:MovieClip = new background();
				addChild(b);
				b.x = i *b.width;
				bgs.push(b);
			}
			addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			for(var j:int = 0;j<bgs.length;j++){
				bgs[j].x -=10;
				if(bgs[j].x<=-bgs[j].width){
					bgs[j].x += 2*bgs[j].width; 
				}
			}
		}
	}
	
}
