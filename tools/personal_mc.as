package tools
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class personal_mc extends MovieClip
	{
		public var newFormat:TextFormat = new TextFormat();
		public function personal_mc(_workerName:String,worker:Object,Time_X:String,profit_cc:String,maxProfit_cc:String):void
		{
			workerName.text = _workerName;
			//открыто или закрыто помещение  targetObject.openTrigger

			if (worker != null)
			{
				statusMc.gotoAndStop(1);
			}
			else
			{
				statusMc.gotoAndStop(2);
				newFormat.color = 0xFF0000;
				levelExp.setTextFormat(newFormat);
				levelExp.text = "Наймите сотрудника."
			}
			freePlaces.text = Time_X + "h";
			minuteProfit.text = profit_cc + "/" + maxProfit_cc;



		}
	}

}