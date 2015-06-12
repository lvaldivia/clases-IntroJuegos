package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var map:Array;
		private var hero:Sprite;
		private var column:int;
		private var row:int;
		private var down:Boolean;
		private var up:Boolean;
		private var right:Boolean;
		private var left:Boolean;
		public function Main() 
		{
			map = new Array();
			map[0]=[1,1,1,1,1,1,1,1,1,1,1,1,1,1];
			map[1]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[2]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[3]=[1,0,0,0,0,0,0,0,0,0,1,1,1,1];
			map[4]=[1,0,0,0,0,0,0,0,0,0,1,0,0,1];
			map[5]=[1,0,0,0,0,0,0,0,0,0,1,0,0,1];
			map[6]=[1,0,0,0,0,0,0,0,0,0,1,0,0,1];
			map[7]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[8]=[1,0,1,0,1,1,0,1,1,0,1,0,0,1];
			map[9]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[10]=[1,0,0,1,0,0,1,0,0,0,0,0,0,1];
			map[11]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[12]=[1,0,0,0,1,1,1,0,0,0,0,0,0,1];
			map[13]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[14]=[1,0,0,0,0,0,0,0,0,0,0,0,0,1];
			map[15] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
			
			for (var i:int = 0; i < map.length; i++) 
			{
				for (var j:int = 0; j < map[i].length; j++) 
				{
					if (map[i][j] == 1) {
						var tmp:Sprite = new Sprite();
						tmp.graphics.beginFill(0);
						tmp.graphics.drawRect(0, 0, 50, 50);
						tmp.graphics.endFill();
						tmp.x = i * 50;
						tmp.y = j * 50;
						addChild(tmp);
					}
					
				}
			}
			row = 1;
			column = 1;
			hero = new Sprite();
			hero.graphics.beginFill(0x0000FF);
			hero.graphics.drawCircle(25, 25, 25);
			hero.graphics.endFill();
			hero.x = row * 50 ;
			hero.y = column * 50;
			addChild(hero);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onUp);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			var tRow:int = row;
			var tCol:int = column;
			if (left) {
				tRow--;
				if (map[tRow][tCol] == 0) {
					left = false;
					row = tRow;
					hero.x = row * 50;
				}
			}
			if (right) {
				tRow++;
				if (map[tRow][tCol] == 0) {
					right = false;
					row = tRow;
					hero.x = row * 50;
				}
			}
			if (down) {
				tCol++;
				if (map[tRow][tCol] == 0) {
					down = false;
					column = tCol;
					hero.y = column * 50;
				}
			}
			if (up) {
				tCol--;
				if (map[tRow][tCol] == 0) {
					up = false;
					column = tCol;
					hero.y = column * 50;
				}
			}
		}
		
		private function onUp(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = false;
				break;
				case Keyboard.RIGHT:
					right = false;
				break;
				case Keyboard.UP:
					up = false;
				break;
				case Keyboard.DOWN:
					down = false;
				break;
			}
		}
		
		private function onDown(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = true;
				break;
				case Keyboard.RIGHT:
					right = true;
				break;
				case Keyboard.UP:
					up = true;
				break;
				case Keyboard.DOWN:
					down = true;
				break;
			}
		}
		
	}
	
}