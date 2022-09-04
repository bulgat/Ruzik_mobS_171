package tools
{
	import fl.motion.Motion;
	import flash.display.MovieClip;
	import flash.geom.*;
	/**
	 * ...
	 * @author ...
	 */
	public class botMenue extends MovieClip
	{
		public var mc:botEngine;
		
		
		public var prevAction:String = "";
		public function botMenue()
		{

		}
		public function init(_mc:botEngine)
		{
			if (_mc.botName == "Робокот")
			{
				trace("Робокот");
			
			
			} else {
				windowMc.botMenuRobocat.visible = false;
			}
			
			
			globalParams.indexMc._soundProcessor.playSnd("showWindow");
			mc = _mc
			;
			windowMc.headerText.text = _mc.botName;
			windowMc.actionText.text = _mc.getActionStatus();
			windowMc.mindText.text = "" + _mc.getMind(_mc.action.toString());//_mc.getMind ()
			windowMc.moneyText.text = _mc.mainMoney + "кр."
			
			;
			windowMc.hungerIndicator.preMask.scaleX =_mc.hunger /100
			windowMc.activityIndicator.preMask.scaleX =_mc.activity /100
			windowMc.funIndicator.preMask.scaleX =_mc.fun /100
			
			
			//windowMc.hungerIndicator.meter.x = 237* (_mc.hunger /100);
			//windowMc.activityIndicator.meter.x = 237* (_mc.activity /100);
			//windowMc.funIndicator.meter.x = 237* (_mc.fun / 100)
			;
			var tmpPoint:Point = globalParams.indexMc.globalPoint;
			var tmpPoint1:Point;
			tmpPoint1 = mc.botImage.localToGlobal(tmpPoint);
			this.x = tmpPoint1.x;
			this.y = tmpPoint1.y - 30;
			prevAction = mc.action;
			mc.action = "waitForCloseMenue";
			if (this.x > 480)
			{
				globalParams.indexMc.landscape.x = globalParams.indexMc.landscape.x - (this.x-480);
				this.x = 480;
			}
			if (this.x < 105)
			{
				globalParams.indexMc.landscape.x = globalParams.indexMc.landscape.x + (105 - this.x);
				this.x = 105;
			}
			if (this.y < 250)
			{
				globalParams.indexMc.landscape.y = globalParams.indexMc.landscape.y + (250 - this.y);
				this.y = 250;
			}
			if (this.y > 500)
			{
				globalParams.indexMc.landscape.y = globalParams.indexMc.landscape.y - (this.y-510);
				this.y = 500;
			}

		}
		
		public function updatePosition()
		{

		}
	}

}