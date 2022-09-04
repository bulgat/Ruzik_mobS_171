package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
import flash.geom.Point;
	//import flash.geom.Rectangle;
	import tools.*;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class screen_border_vis extends MovieClip
	{
		public function checkVisibility ():void {
			var tmpPoint:Point
			var tmpPoint1:Point
			//Если детали ландшафта уходят за границу экрана, то их не видно
			for (var i = 1 ; i <= globalParams.indexMc.landWidth; i++) {
				//lanscapeArray[i] = new Array ()
				for (var j = globalParams.indexMc.landHeight ; j >= 1; j--) {
					tmpPoint = new Point(0, 0)
					tmpPoint1 = globalParams.indexMc.lanscapeArray[i][j].localToGlobal (tmpPoint)
					
					if (tmpPoint1.x < - 200 - (globalParams.indexMc.stage.stageWidth-800)/2 || tmpPoint1.x > 1000 + (globalParams.indexMc.stage.stageWidth-800)/2 || tmpPoint1.y < - 200 -(globalParams.indexMc.stage.stageHeight-600)/2|| tmpPoint1.y > 700+(globalParams.indexMc.stage.stageHeight-600)/2) {
						globalParams.indexMc.lanscapeArray[i][j].visible = false
					} else {
						if (globalParams.indexMc.lanscapeArray[i][j].visibleTrigger == true) {
							globalParams.indexMc.lanscapeArray[i][j].visible = true
						}
					}
				}
			}
			//Если детали дороги уходят за границу экрана, то их не видно
			for (i = 0 ; i < globalParams.indexMc.offRoadArray.length; i++) {
				tmpPoint = new Point(0, 0)
				tmpPoint1 = globalParams.indexMc.offRoadArray[i].localToGlobal (tmpPoint)
				
				if (tmpPoint1.x < - 300-(globalParams.indexMc.stage.stageWidth-800)/2 || tmpPoint1.x > 1000+(globalParams.indexMc.stage.stageWidth-800)/2 || tmpPoint1.y < - 300-(globalParams.indexMc.stage.stageHeight-600)/2 || tmpPoint1.y > 700+(globalParams.indexMc.stage.stageHeight-600)/2) {
					globalParams.indexMc.offRoadArray[i].visible = false
				} else {
					if (globalParams.indexMc.offRoadArray[i].visibleTrigger == true) {
						globalParams.indexMc.offRoadArray[i].visible = true
					}
				}
			}
		}


	}

}