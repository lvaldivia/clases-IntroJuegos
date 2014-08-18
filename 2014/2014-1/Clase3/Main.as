package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.greensock.TweenLite;
	import com.greensock.plugins.ColorMatrixFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	
	TweenPlugin.activate([ColorMatrixFilterPlugin]);
	
	public class Main extends MovieClip {
		
		private var timer:Timer;
		private var puntaje_txt:TextField;
		private var vidas_txt:TextField;
		
		private var puntos:int;
		private var vidas:int;
		private var inicio:MovieClip;
		
		public function Main() 
		{
			timer = new Timer(1500);
			timer.addEventListener(TimerEvent.TIMER, crearMonstruos);
			stage.addEventListener(Event.ENTER_FRAME, mover);
			timer.start();
		}
		
		private function mover(e:Event):void{
			var hijos:int = numChildren;
			if(hijos > 0)
			{
				for(var i:int = 0; i < hijos; i++)
				{
					var mc:MovieClip = getChildAt(i) as MovieClip;
					if(mc)
					{
						mc.x += 5;
						
						if(mc.x >= stage.stageWidth){
							vidas--;
							TweenLite.to(this, 0.5, {onComplete:regresarEstadoNormal,
										 			colorMatrixFilter:{colorize:0x000000, amount:0.5}});
							vidas_txt.text = "Vidas: " + vidas.toString();
							removeChild(mc);
							
							hijos--
						}
					}
					
				}
			}
		}
		
		private function regresarEstadoNormal():void{
			TweenLite.to(this, 0.5, {colorMatrixFilter:{colorize:0x000000, amount:0}});
		}
													 
		
		private function crearMonstruos(e:TimerEvent):void
		{
			var mod:int = timer.currentCount/2;
			
			var enemigo:MovieClip
			if(mod == 0)
			{
				enemigo = new enemigo1();
				enemigo.tabIndex = Math.random()*4;
				enemigo.name = "enemigo1";
			}
			else
			{
				enemigo = new enemigo2();
				enemigo.tabIndex = Math.random()*4;
				enemigo.name = "enemigo2";
			}
			enemigo.scaleX=-1;
			enemigo.x = 0;
			enemigo.y = Math.random()*stage.stageWidth;
			
			enemigo.addEventListener(MouseEvent.CLICK, matar);
			
			addChild(enemigo);
		}
		
		private function matar(e:MouseEvent):void
		{
			var mc:MovieClip = e.currentTarget as MovieClip;
			var nombre:String = mc.name;
			
			mc.tabIndex--;
			
			if(mc.tabIndex == 0)
			{
				mc.removeEventListener(MouseEvent.CLICK, matar);
				TweenLite.to(mc, 0.5, {alpha:0, onComplete:removeChild, onCompleteParams:[mc]});
				puntos++;
				puntaje_txt.text = "Puntaje: " + puntos.toString();
			}
			else
			{
				if(nombre == "enemigo1")
				{
					mc.scaleX = -1.5;
					mc.scaleY = 1.5;
					TweenLite.to(mc, 0.3, {x:"+50", scaleX:-1, scaleY:1});
				}
				else
				{
					mc.scaleX = -1.5;
					mc.scaleY = 1.5;
					TweenLite.to(mc, 0.3, {rotation:"+50", scaleX:-1, scaleY:1 });
				}
			}
		}
	}
	
}