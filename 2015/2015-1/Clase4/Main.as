package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.media.SoundChannel;
	
	public class Main extends MovieClip {
		
		private var rectangle:Sprite;
		private var timer:Timer;
		private var snd:Sound;
		public function Main() {
			trace("Hola esta es mi clase ");
			rectangle = new Sprite();
			rectangle.graphics.beginFill(0xF00FF00);
			rectangle.graphics.drawRect(0,0,50,50);
			rectangle.graphics.endFill();
			addChild(rectangle);
			rectangle.x = (stage.stageWidth/2)-(rectangle.width/2);
			rectangle.y = (stage.stageHeight/2)-(rectangle.height/2);
			rectangle.addEventListener(MouseEvent.CLICK,startGame);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
		}
		
		private function startGame(e:MouseEvent):void{
			rectangle.removeEventListener(MouseEvent.CLICK,startGame);
			removeChild(rectangle);
			timer.start();
			snd = new Sound();
			snd.load(new URLRequest("sonidos/bite.mp3"));
			snd.addEventListener(Event.COMPLETE,onComplete);
		}
		
		private function onComplete(e:Event):void{
			var sndChannel:SoundChannel = snd.play();
		}
		
		private function onTimer(e:TimerEvent):void{
			var mc:MovieClip = new honguito();
			addChild(mc);
			mc.x = Math.random()*stage.stageWidth;
			mc.y = Math.random()*stage.stageHeight;
			mc.addEventListener(MouseEvent.CLICK,destroy);
		}
		
		private function destroy(e:MouseEvent):void{
			var mc:MovieClip = e.currentTarget as MovieClip;
			mc.removeEventListener(MouseEvent.CLICK,destroy);
			removeChild(mc);
		}
	}
	
}
