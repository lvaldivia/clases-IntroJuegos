package Clase12 {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	
	
	public class MouseAim extends MovieClip {
		
		private var aim_mouse:MovieClip;
		private var timer:Timer;
		private var rotation_aim:Number;
		public function MouseAim() {
			aim_mouse = new aim();
			aim_mouse.mouseEnabled = false;
			aim_mouse.mouseChildren = false;
			rotation_aim = 10;
			addChild(aim_mouse);
			Mouse.hide();
			stage.addEventListener(MouseEvent.MOUSE_MOVE,updatePosition);
			stage.addEventListener(Event.ENTER_FRAME,rotate);
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void{
			var c:Sprite = new Sprite();
			c.graphics.beginFill(Math.random()*0x0FF000);
			c.graphics.drawCircle(0,0,20);
			c.graphics.endFill();
			c.x = Math.random()*stage.stageWidth;
			c.y = Math.random()*stage.stageHeight;
			c.addEventListener(MouseEvent.CLICK,die);
			c.addEventListener(MouseEvent.MOUSE_OVER,over);
			c.addEventListener(MouseEvent.MOUSE_OUT,out);
			addChild(c);
			setChildIndex(aim_mouse,numChildren-1);
		}
		
		private function die(e:MouseEvent):void{
			var c:Sprite = e.currentTarget as Sprite;
			c.removeEventListener(MouseEvent.CLICK,die);
			c.removeEventListener(MouseEvent.MOUSE_OVER,over);
			c.removeEventListener(MouseEvent.MOUSE_OUT,over);
			removeChild(c);
		}
		
		private function over(e:MouseEvent):void{
			rotation_aim = -20;
			aim_mouse.scaleX = aim_mouse.scaleY = 2;
		}
		
		private function out(e:MouseEvent):void{
			rotation_aim = 10;
			aim_mouse.scaleX = aim_mouse.scaleY = 1;
		}
		
		private function updatePosition(e:MouseEvent):void{
			aim_mouse.x = mouseX;
			aim_mouse.y = mouseY;
		}
		
		private function rotate(e:Event):void{
			aim_mouse.rotation += rotation_aim;
		}
	}
	
}
