package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Ejercicio1 extends MovieClip {
		
		private var b:MovieClip;
		private var mc1:MovieClip;
		private var b1:MovieClip;
		private var mc:MovieClip;
		private var vidas:int = 3;
		public function Ejercicio1() {
			mc = new hero();
			mc.addEventListener(MouseEvent.CLICK,die);
			addChild(mc);
			b = new lifeBar();
			addChild(b);
			b.y=150;
			trace(b.life);
			mc1 = new zombie();
			addChild(mc1);
			mc1.y=250;
			b1 = new lifeBar();
			addChild(b1);
			b1.y = mc1.y;
			mc1.name= 'z';
			mc1.addEventListener(MouseEvent.CLICK,die);
			mc.name = 'm';
			mc.tabIndex = 3;
			mc1.tabIndex = 5;
		}
		
		private function die(e:MouseEvent):void{
			var m:MovieClip = e.currentTarget as MovieClip;
			var p:Number = 0;
			if(m.tabIndex>0){
				m.tabIndex--;
				if(m.name =='z'){
					p = m.tabIndex/5;
					b1.life.scaleX=p;
				}
				if(m.name == 'm'){
					p = m.tabIndex/3;
					b.life.scaleX=p;
				}
			}
			//trace("vidas "+vidas);
		}
	}
	
}
