package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.*; 
	import com.greensock.plugins.*;
	
	public class Enemigo extends Sprite{

		private var contenido:MovieClip;
		private var barra:MovieClip;
		private var vidas:int;
		private var total_vidas:int;
		
		public function Enemigo() {
			super();
			TweenPlugin.activate([TintPlugin]);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			total_vidas=3;
			vidas=total_vidas;
			trace("agregar escena");
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			contenido=new almohada();
			addChild(contenido);
			contenido.x=150;
			contenido.y=150;
			contenido.scaleX=0.3;
			contenido.addEventListener(MouseEvent.CLICK,golpear);
			contenido.scaleY=0.3;
			barra=new barra_vida();
			TweenLite.to(barra.bg,0.1,{tint:0xFFFF00});
			TweenLite.to(barra.vidas,0.1,{tint:0x0000FF});
			addChild(barra);
		}
		
		private function golpear(e:MouseEvent):void{
			if(vidas>0){
				vidas--;
				actualizarVida();
			}
		}
		
		private function actualizarVida():void{
			var porcentaje:Number=vidas/total_vidas;
			
			//TweenLite.to(barra.vidas, 0.1, {tint:0xcc0000});
			//TweenLite.to(barra.vidas, 0.1, {tint:0xff3333});
			TweenLite.to(barra.vidas,0.1,{scaleX:porcentaje,tint:0xff3333});
		}
		
		

	}
	
}
