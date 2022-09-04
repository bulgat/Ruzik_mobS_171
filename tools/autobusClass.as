package tools 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author ...
	 */
	public class autobusClass extends MovieClip
	{
		private var _autobusMc			:MovieClip,
					_autobusStationZnak	:MovieClip,
					_autobusStationZnak2:MovieClip;
					
		public function autobusClass()
		{
			//Создаем новый знак
			_autobusStationZnak = new autobusStationZnak ()
			//Устанавливаем координаты
			_autobusStationZnak.x = 315+77
			_autobusStationZnak.y = -110+39
			//добавляем
			addChild (_autobusStationZnak)
			
			//
			_autobusMc = new autobusMc();
			_autobusMc.x = +25 + 154*10
			_autobusMc.y = -230 + 77 * 10
			
			_autobusMc.x = -154 * 10
			_autobusMc.y = -230 - 77 * 10
			_autobusMc.gotoAndStop (1)
			addChild (_autobusMc)
			
			_autobusStationZnak2 = new autobusStationZnak2 ()
			_autobusStationZnak2.x = -29
			_autobusStationZnak2.y = -115
			addChild (_autobusStationZnak2)
		}
		private var sitTrigger:Boolean = false
		private var flyOutTrigger:Boolean = false
		private var sitTimer:Number = 0
		
		private var addBotTimer:Number = 0
		public function update () {
			var flyTrigger:Boolean = true
			var topPosition:uint
			if (!flyOutTrigger) {
				if (_autobusMc.x > 25 - 4 && _autobusMc.x < 25 + 4) {
					flyTrigger = false
					if (!sitTrigger) {
						sitTrigger = true
						_autobusMc.gotoAndPlay ("sit")
						sitTimer = 350
						
						topPosition = globalParams.indexMc.landscape.getChildIndex (globalParams.indexMc.offRoadArray[globalParams.indexMc.landWidth +45])
						globalParams.indexMc.landscape.setChildIndex(globalParams.indexMc._autobusClass, topPosition);
					}
				}
			}
			if (flyOutTrigger) {
				if (_autobusMc.x > 154 * 10) {
					flyOutTrigger = false
					_autobusMc.x = - 154*10
					_autobusMc.y = -230 - 77 * 10
				}
			}
			if (!sitTrigger) {
				if (sitTimer > 0) {
					sitTimer --
				}
			}
			if (flyTrigger) {
				_autobusMc.x = _autobusMc.x +4
				_autobusMc.y = _autobusMc.y +2
				
			}
			if (sitTrigger) {
				sitTimer --
				addBotTimer ++
				if (addBotTimer > 100) {
					addBotTimer = 0
					addBotFn ()
				}
				flyTrigger = false
				if (sitTimer < 0) {
					sitTrigger = false
					sitTimer = 25
					flyOutTrigger = true
					_autobusMc.gotoAndPlay ("up")
					
					topPosition = globalParams.indexMc.landscape.getChildIndex (globalParams.indexMc.offRoadArray[globalParams.indexMc.landWidth+45])
					globalParams.indexMc.landscape.setChildIndex(globalParams.indexMc._autobusClass, topPosition);
				}
			}
			
		}
		function addBotFn () {
			globalParams.indexMc.addBotToBusStation ()
		}
		
	}

}