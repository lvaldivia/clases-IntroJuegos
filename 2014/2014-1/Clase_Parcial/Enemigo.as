package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemigo extends Sprite{

		private var vidas:int;
		private var total_vidas:int=5;
		private var monstruo:Sprite;
		private var barraVidas:MovieClip;
		
		public function Enemigo() {
			super();
			vidas=total_vidas;
			addEventListener(Event.ADDED_TO_STAGE,onAdeed);
		}
		
		private function onAdeed(e:Event):void{
			monstruo=new Sprite();
			monstruo.graphics.beginFill(0x00FF00);
			monstruo.graphics.moveTo(50,0);
			monstruo.graphics.lineTo(75,50);
			monstruo.graphics.lineTo(0,50);
			monstruo.graphics.lineTo(50,0);
			monstruo.graphics.endFill();
			addChild(monstruo);
			barraVidas=new barra();
			addChild(barraVidas);
			
			barraVidas.scaleX=0.2;
			
			monstruo.x=Math.random()*350;
			monstruo.y=Math.random()*300;
			barraVidas.x=monstruo.x;
			barraVidas.y=monstruo.y-50;
			monstruo.addEventListener(MouseEvent.CLICK,click);
		}
		
		
		private function click(e:MouseEvent):void{
			if(vidas>0){
				vidas--;
				var porcentaje:Number=vidas/total_vidas;
				barraVidas.vida.scaleX=porcentaje;
				trace("% "+porcentaje);
			}
		}

	}
	
}
