package code {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Home extends MovieClip{

		public function Home() {
			x=100;
			jugar.txt.text='Jugar';
			intro.txt.text='Intro';
			jugar.addEventListener(MouseEvent.CLICK,irJugar);
			intro.addEventListener(MouseEvent.CLICK,irIntro);
		}
		
		private function irJugar(e:MouseEvent):void{
			jugar.removeEventListener(MouseEvent.CLICK,irJugar);
			intro.removeEventListener(MouseEvent.CLICK,irIntro);
			var game:Game=new Game();
			parent.addChild(game);
			parent.removeChild(this);
		}
		
		private function irIntro(e:MouseEvent):void{
			var intro:Intro=new Intro();
			addChild(intro);
		}

	}
	
}
