package Code.views {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import com.greensock.TweenLite;
	
	public class Game extends Sprite{
		
		private var screen:MovieClip;
		private var tempo:int=0;
		private var bgs:Sprite;
		private var hero:MovieClip;
		private var enemys:Sprite;
		public function Game() {
			addEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
		}
		
		private function onAdded(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,
							 onAdded);
			screen = new game_bg();
			screen.width = stage.stageWidth;
			bgs = new Sprite();
			addChild(bgs);
			bgs.addChild(screen);
			var tmp:MovieClip = new game_bg();
			tmp.width = stage.stageWidth;
			tmp.x = stage.stageWidth;
			bgs.addChild(tmp);
			y = -stage.stageHeight;
			
			TweenLite.to(this,0.5,{y:0,
						 onComplete:start});
		}
		
		private function start():void{
			stage.addEventListener(Event.ENTER_FRAME,
								   loop);
			enemys = new Sprite();
			addChild(enemys);
			hero = new heroFly();
			addChild(hero);
			hero.y = stage.stageHeight/2;
			hero.x = hero.width/2;
		}
		
		private function loop(e:Event):void{
			bgs.x -= 5;
			if(bgs.x<-stage.stageWidth){
				bgs.x = 0;
			}
			tempo++;
			if(tempo >=48){
				tempo = 0;
				var enemy:MovieClip = new cupcake();
				enemys.addChild(enemy);
				enemy.y = stage.stageHeight/2;
				enemy.x = stage.stageWidth;
			}
			var t:int = enemys.numChildren;
			for(var i:int = 0;i<t;i++){
				var ene:MovieClip = enemys.getChildAt(i)
								as MovieClip;
				ene.x -=3;
				if(ene.hitTestObject(hero)
				   && ene.visible == true
				   ){
					ene.visible = false;
				}
				if(ene.x<0){
					enemys.removeChild(ene);
					t--;
				}
			}
				  
		}

	}
	
}
