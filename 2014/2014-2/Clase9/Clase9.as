package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.BlurFilterPlugin;
	
	public class Clase9 extends MovieClip {
		
		private var screen1:MovieClip;
		private var screen2:MovieClip;
		public function Clase9() {
			screen1 = new menu();
			addChild(screen1);
			TweenPlugin.activate([BlurFilterPlugin]);
			screen1.x = -screen1.width;
			TweenLite.to(screen1,0.5,{x:0,blurFilter:{blurX:20}});
			screen1.btnPlay.addEventListener(MouseEvent.CLICK,goGame);
			screen1.btnIntro.addEventListener(MouseEvent.CLICK,goIntro);
			screen1.btnPlay.buttonMode = true;
			screen1.btnIntro.buttonMode = true;
		}
		
		private function goGame(e:MouseEvent):void{
			
		}
		
		private function goIntro(e:MouseEvent):void{
			TweenLite.to(screen1,1,{x:screen1.width,onComplete:removeMenu});
			addIntro();
		}
		
		private function addIntro():void{
			screen2 = new intro();
			addChild(screen2);
			screen2.x = -screen2.width;
			TweenLite.to(screen2,0.5,{x:0});
		}
		
		private function removeMenu():void{
			screen1.btnPlay.removeEventListener(MouseEvent.CLICK,goGame);
			screen1.btnIntro.removeEventListener(MouseEvent.CLICK,goIntro);
			removeChild(screen1);
		}
		
	}
	
}
