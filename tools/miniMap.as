package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class miniMap extends MovieClip
	{
		
		public function miniMap(_stageMc:MovieClip) 
		{
			stageMc = _stageMc
		}
		private var stageMc:MovieClip
		private var miniLanscapeArray:Array
		private var map_mc:MovieClip
		public function generateMinimap (_X:Number, _Y:Number, _lanscapeArray:Array) {
			map_mc = new MovieClip ()
			miniLanscapeArray = new Array ()
			for (var i = 1 ; i <= _X; i++) {
				miniLanscapeArray[i] = new Array ()
				for (var j = 1 ; j <= _Y; j++) {
					miniLanscapeArray[i][j] = new MovieClip ()
					var tmpMc:MovieClip = new mini_grass ()
					tmpMc.gotoAndStop (1)
					miniLanscapeArray[i][j].gr = tmpMc
					miniLanscapeArray[i][j].addChild (tmpMc)
					
					miniLanscapeArray[i][j].x = (i - 1)*6 + (j-1)*6
					miniLanscapeArray[i][j].y = (i - 1)*3 - (j-1)*3 + _Y*3
					
					map_mc.addChild (miniLanscapeArray[i][j])
				}
			}
			map_mc.x = 26
			map_mc.y = 20
			addChild (map_mc)
			map_mc.addEventListener (MouseEvent.CLICK, mapClick)
			mapWidth = map_mc.width - 64
			mapHeight = map_mc.height - 38
			var square:MovieClip = new MovieClip();
			addChild(square);
			
			square.graphics.lineStyle(1,0x00ff00);
			square.graphics.drawRect(map_mc.x - 15, map_mc.y - 10, map_mc.width + 20, map_mc.height + 20);
			square.graphics.endFill();
			
			addEventListener (Event.ENTER_FRAME, OEF)
			
			cursor = new MovieClip();
			map_mc.addChild(cursor);
			
			cursor.graphics.lineStyle(1,0xffffff);
			cursor.graphics.drawRect(-32,-19,64, 38);
			cursor.graphics.moveTo (0, 0)
			cursor.graphics.lineTo (32, 0)
			cursor.graphics.endFill();
			this.width = 200
			this.scaleY = this.scaleX
		}
		public function updateMinimap (_X:Number, _Y:Number, _lanscapeArray:Array) {
			for (var i = 1 ; i <= _X; i++) {
				for (var j = 1 ; j <= _Y; j++) {
					if (_lanscapeArray[i][j].cellType == "road") {
						miniLanscapeArray[i][j].gr.gotoAndStop (2)
					}
					if (_lanscapeArray[i][j].cellType == "enterBoth") {
						miniLanscapeArray[i][j].gr.gotoAndStop (3)
					}
					
				}
			}
		}
		private var mapWidth:Number
		private var mapHeight:Number
		private var cursor:MovieClip
		private var leftBorder:Number
		private var rightBorder:Number
		
		private var topBorder:Number
		private var bottomBorder:Number
		function OEF (e:Event) {
			
			
			leftBorder = (stageMc.landscape.width / 2 + 76)
			rightBorder = ( -stageMc.landscape.width / 2 + 800 - 76)
			topBorder = (stageMc.landscape.height / 2 + 36)
			bottomBorder = ( -stageMc.landscape.height / 2 - 36 + 500)
			
			cursor.x = mapWidth - (mapWidth) * ((stageMc.landscape.x - rightBorder) / (leftBorder - rightBorder)) + 26
			cursor.y = mapHeight - (mapHeight) * ((stageMc.landscape.y - bottomBorder)/(topBorder - bottomBorder)) + 20
		}
		private function mapClick (e:MouseEvent) {
			cursor.x = this.mouseX - 26
			cursor.y = this.mouseY - 20
			stageMc.landscape.x = rightBorder - ((cursor.x - mapWidth - 26) / (mapWidth)) * (leftBorder - rightBorder)
			stageMc.landscape.y = bottomBorder - ((cursor.y - mapHeight - 20) / (mapHeight)) * (topBorder - bottomBorder)
			stageMc.updatePosition (stageMc.landscape.x, stageMc.landscape.y)
		}
	}

}