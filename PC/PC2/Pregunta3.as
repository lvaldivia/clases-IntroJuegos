package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.ColorTransformPlugin;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	
	public class Pregunta3 extends MovieClip 
	{
		private var misVidas:MovieClip;
		private var puntos_txt:TextField;
		private var conteo_txt:TextField;
		
		private var barraSuperior:Sprite;
		private var contenedor:Sprite;
		
		private var vidas:int = 4;
		private var puntos:int = 0;
		private var conteo:int = 0;
		
		private var crono:Timer;
		private var au:Sound;
		
		public function Pregunta3() 
		{
			super();
			
			au = new Sound(new URLRequest("audio/au.mp3"));
			
			TweenPlugin.activate([TintPlugin, ColorTransformPlugin]);
			
			barraSuperior = new Sprite();
			barraSuperior.graphics.beginFill(0x000066,0.8);
			barraSuperior.graphics.drawRect(0, 0, stage.stageWidth, 40);
			barraSuperior.graphics.endFill();
			
			misVidas = new VidasUsuario() as MovieClip;
			misVidas.gotoAndStop(vidas);
			misVidas.height = 40;
			misVidas.scaleX = misVidas.scaleY;
			barraSuperior.addChild(misVidas);
			
			puntos_txt = new TextField();
			puntos_txt.defaultTextFormat = new TextFormat("Arial", 18, 0xAAAA00, null, null, null, null, null, TextFormatAlign.CENTER);
			puntos_txt.autoSize = TextFieldAutoSize.CENTER;
			puntos_txt.text = "00";
			puntos_txt.selectable = false;
			puntos_txt.x = stage.stageWidth / 2;
			puntos_txt.y = 20 - (puntos_txt.textHeight / 2);
			
			barraSuperior.addChild(puntos_txt);
			
			conteo_txt = new TextField();
			conteo_txt.defaultTextFormat = new TextFormat("Arial", 18, 0xAAAA00, null, null, null, null, null, TextFormatAlign.RIGHT);
			conteo_txt.autoSize = TextFieldAutoSize.RIGHT;
			conteo_txt.text = "0000";
			conteo_txt.selectable = false;
			conteo_txt.x = stage.stageWidth - conteo_txt.textWidth - 10;
			conteo_txt.y = 20 - (puntos_txt.textHeight / 2);
			
			barraSuperior.addChild(conteo_txt);
			
			addChild(barraSuperior);
			
			contenedor = new Sprite();
			contenedor.y = 40;
			contenedor.x = stage.stageWidth / 2;
			addChild(contenedor);
			
			
			
			crono = new Timer(500);
			crono.addEventListener(TimerEvent.TIMER, cronoTimer);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			crono.start();
			
			stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function cronoTimer(e:TimerEvent):void{
			var nave:Enemigo = new Enemigo();
			
			var lado:int = Math.random() * 2;
			if(lado == 0){
				nave.x = stage.width * -0.5;
			}
			else{
				nave.x = stage.width * 0.5;
				nave.scaleX = -1;
			}
			
			nave.y = (nave.height / 2) + ((Math.random() * int.MAX_VALUE) % (stage.stageHeight - (40 + (nave.height))));
			nave.vidas = Math.floor((Math.random() * int.MAX_VALUE) % 4) + 1;
			nave.indicador.gotoAndStop(nave.vidas);
			nave.addEventListener(MouseEvent.CLICK, naveClick);
			
			contenedor.addChild(nave);
		}
		
		private function enterFrame(e:Event):void{
			var cantidad:int = contenedor.numChildren;
			var mc:MovieClip;
			for(var i:int = 0; i < cantidad; i++)
			{
				mc = contenedor.getChildAt(i) as MovieClip;
				
				if(mc.x > 1){
					mc.x -= 0.5;
				}
				else if( mc.x < -1 ){
					mc.x += 0.5;
				}
				else{
					mc.removeEventListener(MouseEvent.CLICK, naveClick);
					contenedor.removeChild(mc);
					vidas--;
					cantidad--;
					if(vidas > 0){
						misVidas.gotoAndStop(vidas);
					}
					else{
						misVidas.visible = false;
						crono.stop();
						stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
						
						removeChild(contenedor);
						
						var f:MovieClip = new Fin() as MovieClip;
						f.y = -f.height;
						addChildAt(f, 0);
						TweenLite.to(f, 0.5, {y:0});
						
					}
				}
			}
		}
		
		private function naveClick(e:MouseEvent):void{
			var nave:Enemigo = e.currentTarget as Enemigo;
			trace(nave.vidas);
			if(nave.vidas > 0){
				nave.vidas--;
				nave.indicador.gotoAndStop(nave.vidas);
				if(nave.vidas == 0)
				{
					TweenLite.to(nave, 0.3, {
							 colorTransform:{tint: 0xff0000, tintAmount:0.5},
							 onComplete:muere,
							 onCompleteParams: [nave]
						});
				}
			}
		}
		
		private function muere(n:Enemigo){
			n.removeEventListener(MouseEvent.CLICK, naveClick);
			contenedor.removeChild(n);
			au.play();
			
			puntos += 100;
			conteo +=1;
			
			puntos_txt.text = puntos.toString();
			conteo_txt.text = conteo.toString();
		}
		
	}

}