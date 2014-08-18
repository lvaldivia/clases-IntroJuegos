package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	public class Isometria extends MovieClip {
		
		private var hero:Sprite;
		private var izqPress:Boolean;
		private var derPress:Boolean;
		private var upPress:Boolean;
		private var downPress:Boolean;
		private var angulo1:Number;
		private var angulo2:Number;
		private var obj:Object;
		
		public function Isometria() {
			hero=new Sprite();
			hero.graphics.beginFill(0xFF00FF);
			hero.graphics.drawRect(0,0,200,200);
			hero.graphics.endFill();
			angulo1=45*Math.PI/180;
			angulo2=30*Math.PI/180;
			addChild(hero);
			izqPress=false;
			derPress=false;
			downPress=false;
			upPress=false;
			obj={x:0,y:0,z:0,lonsa:10};
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionar);
			stage.addEventListener(KeyboardEvent.KEY_UP,soltar);
			stage.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		private function renderizar():void{
			var p:Point=convertirIso(obj.x,obj.y,obj.z);
			hero.x=p.x;
			hero.y=p.y;
		}
		
		private function loop(e:Event):void{
			if(izqPress){
				obj.x-=2;
			}
			if(derPress){
				obj.x+=2;
			}
			if(upPress){
				obj.z-=2;
			}
			if(downPress){
				obj.z-=2;
			}
			renderizar();
		}
		
		private function convertirIso(_x:Number,_y:Number,_z:Number):Point{
			var posY:Number=_y;
			var posX:Number=_x*Math.cos(angulo1)+_z*Math.sin(angulo1);
			var posZ:Number=_z*Math.cos(angulo1)-_x*Math.sin(angulo1);
			var vY:Number=posY*Math.cos(angulo2)-posZ*Math.sin(angulo2);
			return new Point(posX,vY);
		}
		
		private function soltar(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					izqPress=false;
				break;
				case Keyboard.RIGHT:
					derPress=false;
				break;
				case Keyboard.UP:
					upPress=false;
				break;
				case Keyboard.DOWN:
					downPress=false;
				break;
			}
		}
		
		private function presionar(e:KeyboardEvent):void{
			switch(e.keyCode){
				case Keyboard.LEFT:
					izqPress=true;
				break;
				case Keyboard.RIGHT:
					derPress=true;
				break;
				case Keyboard.UP:
					upPress=true;
				break;
				case Keyboard.DOWN:
					downPress=true;
				break;
			}
		}
	}
	
}
