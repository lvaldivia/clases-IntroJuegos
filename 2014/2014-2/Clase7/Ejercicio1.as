package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	
	public class Ejercicio1 extends MovieClip {
		
		private var hero:MovieClip;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var spacePress:Boolean;
		private var timer:Timer;
		private var enemies:Array;
		private var bullets:Array;
		
		public function Ejercicio1() {
			hero = new pikachu();
			addChild(hero);
			enemies = new Array();
			bullets = new Array();
			spacePress = false;
			hero.y = stage.stageHeight- (hero.width/2);
			hero.x = stage.stageWidth/2;
			leftPress = rightPress = false;
			stage.addEventListener(KeyboardEvent.KEY_DOWN,down);
			stage.addEventListener(KeyboardEvent.KEY_UP,up);
			stage.addEventListener(Event.ENTER_FRAME,loop);
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,create);
			timer.start();
		}
		
		private function create(e:TimerEvent):void{
			var mc:MovieClip = new charizard();
			addChild(mc);
			var max:Number = stage.stageWidth - (mc.width/2);
			var min:Number = mc.width/2;
			mc.x = (Math.random()*(max-min))+min;
			enemies.push(mc);
		}
		
		private function loop(e:Event):void{
			if(leftPress){
				hero.x -=5;
			}
			if(rightPress){
				hero.x +=5;
			}
			if(spacePress){
				addBullets(hero.x,hero.y);
			}
			var bChild:int = bullets.length;
			for(var x:int=0;x<bChild;x++){
					var bu:Sprite = bullets[x];
					bu.y-=5;
					/*if(hero.hitTestObject(bu)){
						removeChild(ch);
						enemies.splice(i,1);
						childs--;
					}*/
				}
			var childs:int = enemies.length;
			if(childs>0){
				for(var i:int=0;i<childs;i++){
					var ch:MovieClip = enemies[i];
					ch.y+=5;
					if(hero.hitTestObject(ch)){
						removeChild(ch);
						enemies.splice(i,1);
						childs--;
					}
				}
			}
		}
		
		private function addBullets(posX:Number,posY:Number):void{
			var b:Sprite = new Sprite();
			b.graphics.beginFill(0xFF00FF);
			b.graphics.drawCircle(0,0,20)
			
			b.graphics.endFill();
			addChild(b);
			b.x = posX;
			b.y = posY;
			bullets.push(b);
		}
		
		private function down(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					leftPress = true;
				break;
				
				case Keyboard.RIGHT:
					rightPress = true;
				break;
				case Keyboard.SPACE:
					spacePress = true;
				break;
			}
		}
		
		private function up(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					leftPress = false;
				break;
				
				case Keyboard.RIGHT:
					rightPress = false;
				break;
				
				case Keyboard.SPACE:
					spacePress = false;
				break;
			}
		}
	}
	
}
