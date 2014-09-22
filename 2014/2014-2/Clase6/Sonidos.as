package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class Sonidos extends MovieClip {
		
		private var snd1:Sound;
		private var snd2:Sound;
		public function Sonidos() {
			var a1:MovieClip = new neesan();
			addChild(a1);
			a1.x = 100;
			a1.y =100;
			var a2:MovieClip = new enemy();
			addChild(a2);
			a1.buttonMode = true;
			a2.buttonMode = true;
			a1.addEventListener(MouseEvent.CLICK,desaparece);
			a2.addEventListener(MouseEvent.CLICK,desaparece1);
		}
		
		private function desaparece(e:MouseEvent):void{
			snd1 = new Sound();
			snd1.load(new URLRequest('sonidos/neesan.mp3'));
			snd1.addEventListener(Event.COMPLETE,completeSnd);
		}
	
		private function desaparece1(e:MouseEvent):void{
			snd2 = new Sound();
			snd2.load(new URLRequest('sonidos/mega.mp3'));
			snd2.addEventListener(Event.COMPLETE,completeSnd);
		}
		
		private function completeSnd(e:Event):void{
			var sndTransform:SoundTransform = new SoundTransform();
			sndTransform.volume = 1;
			if(snd1!=null){
				if(snd1.bytesLoaded==snd1.bytesTotal){
					var sndChannel:SoundChannel = snd1.play();
					sndChannel.soundTransform = sndTransform;
				}
			}
			if(snd2!=null){
				if(snd2.bytesLoaded==snd2.bytesTotal){
					var sndChannel:SoundChannel = snd2.play();
				}
			}
			//sndChannel.addEventListener(Event.SOUND_COMPLETE,completeSound);
		}
		
		private function completeSound(e:Event):void{
			trace("termino sonido");
		}
		
	}
	
}
