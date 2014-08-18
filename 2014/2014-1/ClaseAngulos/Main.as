package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	
	public class Main extends MovieClip {
		
		private var angulo:Number;
		private var balas:Vector.<Bala>;
		public function Main() {
			angulo=0;
			balas=new Vector.<Bala>();
			addEventListener(Event.ADDED_TO_STAGE,agregar);
			
		}
		
		private function presionar(e:KeyboardEvent):void{
			if(e.keyCode==Keyboard.SPACE){
				if(angulo*(180/Math.PI)<5 
			   		&& (angulo*(180/Math.PI)>-180)){
					var vX:Number=10*Math.cos(angulo);
					var vY:Number=10*Math.sin(angulo);
					var tmp:Bala=new Bala(vX,vY);
					tmp.rotation=tanque.mcbar.rotation;
					var point:Point=new Point(0,0);
					var polar:Point=Point.polar(85,angulo);
					var padrePos:Point=tanque.mcbar.localToGlobal(point);
					tmp.x=padrePos.x+polar.x;
					tmp.y=padrePos.y+polar.y;
					addChild(tmp);
					balas.push(tmp);
				}
			}
		}
		
		private function agregar(e:Event):void{
			stage.addEventListener(Event.ENTER_FRAME,loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,presionar);
		}
		
		private function loop(e:Event):void{
			angulo=calcularAngulo(tanque.x,tanque.y,this.mouseX ,this.mouseY)
			if(angulo*(180/Math.PI)<5 
			   		&& (angulo*(180/Math.PI)>-180)){
				tanque.mcbar.rotation=(180/Math.PI)*angulo;
			}
			for(var i:int=0;i<balas.length;i++){
				balas[i].move();
			}
		}
		
		private function calcularAngulo(posX1:Number,posY1:Number,posX2:Number,posY2:Number):Number
		{
			var dx:int=posX2-posX1;
			var dy:int=posY2-posY1;
			return Math.atan2(dy,dx);
		}
	}
	
}
