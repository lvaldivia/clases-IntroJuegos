package  {
	
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.utils.setTimeout;

	
	
	public class Ejercicio1 extends MovieClip {
		
		private var loop:Sound;
		private var loopChannel:SoundChannel;
		private var aimPlayer:MovieClip;
		private var timer:Timer;
		private var dead:int=0;
		
		public function Ejercicio1() {
			loop = new Sound();
			loop.addEventListener(Event.COMPLETE,onComplete);
			loop.load(new URLRequest("sounds/MusicaRound1Loop.mp3"));
			stage.displayState = "fullScreen";
			createAim();
		}
		
		private function createAim():void{
			aimPlayer = new aim();
			aimPlayer.mouseEnabled = false;
			Mouse.hide();
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.start();
			addChild(aimPlayer);
			stage.addEventListener(MouseEvent.CLICK,click);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,
								   onAimMove);
		}
		
		private function click(e:MouseEvent):void{
			if(e.target is zombie){
				var mc:MovieClip = e.target as MovieClip;
				removeChild(mc);
				var txt:MovieClip = new txtCombo();
				txt.x = mc.x + (mc.width/2);
				txt.y = mc.y +(mc.height/2);
				addChild(txt);
				dead++;
				txt.txt.text = "x"+dead;
				setTimeout(function(){
						   removeChild(txt);
						   },400);
			}else{
				dead = 0;
			}
		}
		
		private function onTimer(e:TimerEvent):void{
			var mc:MovieClip = new zombie();
			addChild(mc);
			
			mc.x = Math.random()*(stage.stageWidth-mc.width);
			mc.y = Math.random()*(stage.stageHeight-mc.height);
			setChildIndex(aimPlayer,numChildren-1);
			//mc.addEventListener(MouseEvent.CLICK,destroy);
		}
		
		private function destroy(e:MouseEvent):void{
			var mc:MovieClip = e.currentTarget as MovieClip;
			var txt:MovieClip = new txtCombo();
			txt.x = mc.x + (mc.width/2);
			txt.y = mc.y +(mc.height/2);
			addChild(txt);
			dead++;
			txt.txt.text = "x"+dead;
			setTimeout(function(){
					   removeChild(txt);
					   },400);
			mc.removeEventListener(MouseEvent.CLICK,destroy);
			removeChild(mc);
		}
		
		private function onAimMove(e:MouseEvent):void{
			aimPlayer.x = mouseX;
			aimPlayer.y = mouseY;
		}
		
		private function onComplete(e:Event):void{
			if(e.currentTarget.hasEventListener(Event.COMPLETE)){
				e.currentTarget.removeEventListener(Event.COMPLETE,
													onComplete);
			}
			if(e.currentTarget.hasEventListener(Event.SOUND_COMPLETE)){
				e.currentTarget.removeEventListener(Event.SOUND_COMPLETE,
													onComplete);
			}
			loopChannel = loop.play();
			loopChannel.addEventListener(Event.SOUND_COMPLETE
										 ,onComplete);
		}
		
		private function soundComplete(e:Event):void{
			loopChannel = loop.play();
		}
	}
	
}
