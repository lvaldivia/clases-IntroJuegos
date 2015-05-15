package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.greensock.TweenLite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.utils.getDefinitionByName;
	
	
	public class Ejercicio1 extends MovieClip {
		
		private var menuScreen:MovieClip;
		private var gameScreen:MovieClip;
		private var hero:MovieClip;
		private var bgs:Sprite;
		private var enemyInfo:Array;
		private var timer:Timer;
		private var enemys:Sprite;
		public function Ejercicio1() {
			addMenuScreen();
		}
		
		private function addMenuScreen():void{
			menuScreen = new menu();
			addChild(menuScreen);
			menuScreen.btnPlay.addEventListener(MouseEvent.CLICK,
												goGame);
			menuScreen.btnPlay.buttonMode = true;
			menuScreen.hero.x = -menuScreen.hero.width;
			TweenLite.to(menuScreen.hero,0.5,
						 {x:0,delay:0.5,onComplete:startMovement});
		}
		
		private function goGame(e:MouseEvent):void{
			e.currentTarget.removeEventListener(MouseEvent.CLICK,
												goGame);
			
			gameScreen = new game_bg();
			gameScreen.x = stage.stageWidth;
			bgs = new Sprite();
			enemyInfo = new Array();
			enemyInfo.push("bomba","wafer",
						   "torta","cupcake");
			
			bgs.addChild(gameScreen);
			addChild(bgs);
			TweenLite.to(menuScreen,0.5,{x:-menuScreen.width,
						 onComplete:removeMenu});
			TweenLite.to(gameScreen,0.5,{x:0});
			
		}
		
		private function removeMenu():void{
			TweenLite.killTweensOf(menuScreen.hero);
			removeChild(menuScreen);
			var bg:MovieClip = new game_bg();
			bg.x = stage.stageWidth;
			bgs.addChild(bg);
			stage.addEventListener(Event.ENTER_FRAME,
								   loop);
			hero = new heroFly();
			addChild(hero);
			hero.x = 150;
			hero.y = 150;
			enemys = new Sprite();
			addChild(enemys);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,create);
			timer.start();
			
		}
		
		private function create(e:TimerEvent):void{
			var index:int = generateRandom();
			var c:Class = getDefinitionByName(
								enemyInfo[index]) as Class;
			var mc:MovieClip = new c();
			enemys.addChild(mc);
			mc.x = stage.stageWidth;
			mc.y = Math.random()*stage.stageHeight;
		}
		
		private function loop(e:Event):void{
			hero.y = mouseY;
			if(hero.y<hero.height){
				hero.y = hero.height;
			}
			if(hero.y>stage.stageHeight){
				hero.y = stage.stageHeight;
			}
			bgs.x -=5;
			if(bgs.x<-stage.stageWidth){
				bgs.x = 0;
			}
			var t:int = enemys.numChildren;
			for(var i:int=0;i<t;i++){
				var mc:MovieClip = 
						enemys.getChildAt(i) as MovieClip;
				mc.x -=10;
				if(mc.x<-mc.width/2){
					enemys.removeChild(mc);
					t--;
				}else{
					if(hero.hitTestObject(mc)){
						enemys.removeChild(mc);
						t--;
					}
				}
				
			}
		}
		
		private function startMovement():void{
			TweenLite.to(menuScreen.hero,0.5,
						 {y:200,alpha:0.5, onComplete:upMovement});
		}
		
		private function upMovement():void{
			TweenLite.to(menuScreen.hero,0.5,
						 {y:0,alpha:1,onComplete:startMovement});
		}
		
		private function generateRandom():int{
			return Math.ceil(Math.random()
							 *enemyInfo.length-1);
		}
											  
	}
	
}
