package  {
	import com.greensock.easing.Linear;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.display.Shape;
	
	public class Pregunta1 extends MovieClip {

		private var circulo:Shape;
		
		public function Pregunta1() {
			super();
			
			circulo = new Shape();
			circulo.graphics.beginFill(0x009900);
			circulo.graphics.lineStyle(1, 0x0);
			circulo.graphics.drawCircle(0, 0, 50);
			circulo.graphics.endFill();
			
			circulo.x = stage.stageWidth / 2;
			circulo.y = stage.stageHeight / 2;
			
			addChild(circulo);
			
			TweenMax.to(circulo, 2, { x:50, delay:2 } );
			TweenMax.to(circulo, 5, { x:stage.stageWidth - 50, repeat: -1, yoyo:true, delay:4, ease:Linear.easeNone } );
			TweenMax.to(circulo, 0.5, { alpha:0.8, repeat: -1, yoyo:true, delay:4, ease:Linear.easeNone } );
			
		}

	}
	
}
