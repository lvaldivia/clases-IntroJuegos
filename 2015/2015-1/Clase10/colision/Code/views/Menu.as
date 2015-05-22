package Code.views {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	
	public class Menu extends Sprite{
		
		private var screen:MovieClip;
		public function Menu() {
			addEventListener(Event.ADDED_TO_STAGE,
							 	onAdded);
		}
		
		private function onAdded(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,
								onAdded);
			screen = new menu();
			addChild(screen);
			screen.y = -screen.height;
			TweenLite.to(screen,0.5,{y:0,delay:0.5
						 ,onComplete:startMovement});
			
			screen.btnPlay.buttonMode = true;
			screen.btnPlay.addEventListener(MouseEvent.CLICK,
											goPlay);
		}
		
		private function startMovement():void{
			TweenLite.to(screen.hero,0.5,{y:200
						 ,onComplete:endMovement});
		}
		
		private function endMovement():void{
			TweenLite.to(screen.hero,0.5,{y:0,
						 onComplete:startMovement});
		}
		
		private function goPlay(e:MouseEvent):void{
			screen.btnPlay.removeEventListener(MouseEvent.CLICK,
											goPlay);
			var game:Game = new Game();
			TweenLite.killTweensOf(screen.hero);
			parent.addChild(game);
			TweenLite.to(screen,0.5,{y:screen.height,
						 onComplete:remove});
		}
		
		private function remove():void{
			removeChild(screen);
			parent.removeChild(this);
		}

	}
	
}
