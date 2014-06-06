package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class Parallax extends MovieClip {
		
		private var m1:Sprite;
		private var montanas:Vector.<Sprite>;
		private var nubes:Vector.<Sprite>;
		public function Parallax() {
			montanas=new Vector.<Sprite>();
			nubes=new Vector.<Sprite>();
			for(var i:int=0;i<2;i++){
				var tmp:Sprite=new mountain();
				tmp.y=309;
				montanas.push(tmp);
				tmp.x=tmp.width*i;
				trace(tmp.x);
				addChild(tmp);
				var n:Sprite=new cloud();
				n.x=n.width*i;
				addChild(n);
				nubes.push(n);
			}
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function loop(e:Event):void{
			var hijo:int=montanas.length;
			for(var j:int=0;j<nubes.length;j++){
				if(nubes[j].x<=-nubes[j].width){
					nubes[j].x=(stage.stageWidth);
				}else{
					nubes[j].x-=3;
				}
			}
			for(var i:int=0;i<hijo;i++){
				if(montanas[i].x<=-montanas[i].width){
					montanas[i].x=(stage.stageWidth);
				}else{
					montanas[i].x-=5;
				}
			}
		}
	}
	
}
