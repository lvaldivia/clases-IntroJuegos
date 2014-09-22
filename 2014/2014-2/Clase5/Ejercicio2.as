package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	import flash.events.Event;
	
	
	public class Ejercicio2 extends MovieClip {
		
		private var snd:Sound;
		public function Ejercicio2() {
			var a:MovieClip = new hero();
			addChild(a);
			var b:MovieClip = new zombie();
			addChild(b);
			b.x=250;
			a.addEventListener(MouseEvent.CLICK,sound1);
			b.addEventListener(MouseEvent.CLICK,sound2);
		}
		
		private function sound1(e:MouseEvent):void{
			snd = new Sound();
			snd.load(new URLRequest("sonidos/Bite-SoundBible.com-2056759375.mp3"));
			snd.addEventListener(Event.COMPLETE,complete);
		}
		
		private function complete(e:Event):void{
			trace("snd");
			var sndChannel:SoundChannel = snd.play();
		}
		
		private function sound2(e:MouseEvent):void{
			
		}
	}
	
}
