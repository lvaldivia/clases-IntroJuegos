package  
{
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class Pregunta2 extends MovieClip 
	{
		private var circulo:Sprite;
		
		public function Pregunta2() 
		{
			super();
			
			circulo = new Sprite();
			circulo.graphics.beginFill(0x009900);
			circulo.graphics.lineStyle(1, 0x0);
			circulo.graphics.drawCircle(0, 0, 50);
			circulo.graphics.endFill();
			
			circulo.x = stage.stageWidth / 2;
			circulo.y = stage.stageHeight / 2;
			
			circulo.addEventListener(MouseEvent.CLICK, circuloClick);
			circulo.addEventListener(MouseEvent.MOUSE_OVER, circuloMouseOver);
			circulo.addEventListener(MouseEvent.MOUSE_OUT, circuloMouseOut);
			
			addChild(circulo);
		}
		
		private function circuloClick(e:MouseEvent):void 
		{
			TweenLite.to(circulo, 0.5, { y:"-2" } );
		}
		
		private function circuloMouseOver(e:MouseEvent):void 
		{
			TweenLite.to(circulo, 0.5, { scaleX:0.8, scaleY:0.8 } );
		}
		
		private function circuloMouseOut(e:MouseEvent):void 
		{
			TweenLite.to(circulo, 0.5, { scaleX:1, scaleY:1 } );
		}
		
	}

}