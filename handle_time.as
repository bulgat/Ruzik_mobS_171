package 
{
	import flash.display.MovieClip;


	public class handle_time
	{
		public function new_renderTime(num_obj)
		{
			if (num_obj is Number == false) {
						
					num_obj=globalParams.UnixTime_Global
			}
			return num_obj;
		}
		public function updateTime()
		{
			
			if (! globalParams.friendsParkTrigger)
			{
				++globalParams.globalTime.second;
				++globalParams.updateTimer;
				if (globalParams.updateTimer > 20)
				{
					globalParams.stageMc.updateServerTime();
					globalParams.updateTimer = 0;
				}
				if (globalParams.globalTime.second > 60)
				{
					globalParams.globalTime.second = 1;
					++globalParams.globalTime.minute;
				}
				if (globalParams.globalTime.minute > 60)
				{
					globalParams.globalTime.minute = 1;
					++globalParams.globalTime.hour;
				}
				if (globalParams.globalTime.hour > 23)
				{
					globalParams.globalTime.hour = 0;
					++globalParams.globalTime.day;
				}
			}
			var currDate:Date = new Date();
			globalParams.UnixTime_Global+=1;
			
		 //  trace("up_ok_  second",globalParams.globalTime.second,"________________UnixTime_Global = ",globalParams.UnixTime_Global," = ",currDate.time)
		}
		
		public function returnGlobalDataPhantom()
		{
			//дать объекту реальное время
			var newTime:Object = new Object ();
			newTime.year = globalParams.globalTime.year;
			newTime.month = globalParams.globalTime.month;
			newTime.day = globalParams.globalTime.day;
			newTime.hour = globalParams.globalTime.hour;
			newTime.minute = globalParams.globalTime.minute;
			newTime.second = globalParams.globalTime.second
			;
			return newTime;
		}
		
		public function pred_dataMinusTime(statusObject:Object):void
		{
			var dif2:Number = statusObject.repairInterval
			var dif1:Number = globalParams._handle_time.returnTimeDifference_new (statusObject.lrd, statusObject.sst)
			var tmpDif:Number = dif2 - Math.abs (dif1)
			if (dif2 > dif1) {
				//statusObject.sst = dataMinusTime (globalParams.globalTime, tmpDif)
				statusObject.sst = dataMinusTime_new (tmpDif)
			}
		
		
		
		}
		
		public function dataMinusTime_new(inTime:Number):Number
		{
			return inTime-globalParams.UnixTime_Global;
		
		}
		public function returnTimeDifference_new(first, second):Number
		{
			if (first is Object) {
				first=0
			}
			if (second is Object) {
				second=0
			}
			var retT:Number = second- first;
			return retT
		}
		/*
		public function dataMinusTime(_first:Object, inTime:Number):Object
		{
			//вычисляется для ремонта
			//сравнение времени объекта с цифрами
			//глобальное время - время ремонта(цифра)
			var first:Object = new Object ();
			first.year = _first.year;
			first.month = _first.month;
			first.day = _first.day;
			first.hour = _first.hour;
			first.minute = _first.minute;
			first.second = _first.second
			
			;
			inTime = Math.abs (inTime)
			;
			var _year:Number = 0;
			var _month:Number = 0;
			var _day:Number = 0;
			var _hour:Number = 0;
			var _minute:Number = 0;
			var _second:Number = 0;
			if (inTime > 31536000)
			{
				_year = Math.floor (inTime / 31536000);
				inTime = inTime - 31536000 * _year;
			}
			if (inTime > 2592000)
			{
				_month = Math.floor (inTime / 2592000);
				inTime = inTime - 2592000 * _month;
			}
			if (inTime > 86400)
			{
				_day = Math.floor (inTime / 86400);
				inTime = inTime - 86400 * _day;
			}
			if (inTime > 3600)
			{
				_hour = Math.floor (inTime / 3600);
				inTime = inTime - 3600 * _hour;
			}
			if (inTime > 60)
			{
				_minute = Math.floor (inTime / 60);
				inTime = inTime - 60 * _minute;
			}
			_second = inTime
			;
			if (first.second - _second < 1)
			{
				first.second = 60 - (_second - first.second);
				--first.minute;
			}
			else
			{
				first.second = first.second - _second;
			}
			if (first.minute - _minute < 1)
			{
				first.minute = 60 - (_minute - first.minute);
				--first.hour;
			}
			else
			{
				first.minute = first.minute - _minute;
			}

			if (first.hour - _hour < 1)
			{
				first.hour = 23 - (_hour - first.hour);
				--first.day;
			}
			else
			{
				first.hour = first.hour - _hour;
			}

			if (first.day - _day < 1)
			{
				first.day = 30 - (_day - first.day);
				--first.month;
			}
			else
			{
				first.day = first.day - _day;
			}


			return first;
		}
		*/
		public function returnTimeStr(profitTime:Number,first:Number):String
		{
			//текс вребя до прибыли, сколько осталось
			//время прибыли, время объектаб глобальное время
			var TimeNum:int = Math.ceil((profitTime - first));
			if (TimeNum<0)
			{
				TimeNum = 0;
			}

			var TimeStr:String = TimeNum + " сек.";
			return TimeStr;

		}
		
		public function returnTimeDifference(first:Object, second:Object):int
		{
			//trace(first,"_",second);

			if (first==null||second==null)
			{
				//анти завис (костыль)
				return critTimer=0;
			}
			//trace(first,second," returnTimeDifference = ",second.hour, "  = x = ",first.hour,"||||||| s =",second.minute ," f =", first.minute);
			//first время объекта
			//second - глобальное время
			var res:Number;
			var critTimer:Number = 0;
			if (second.year > first.year)
			{
				critTimer = critTimer + (second.year - first.year) * 31536000;
				critTimer = critTimer + (second.month - first.month) * 2592000;
				critTimer = critTimer + (second.day - first.day) * 86400;
				critTimer = critTimer + (second.hour - first.hour) * 3600;
				critTimer = critTimer + (second.minute - first.minute) * 60;
				critTimer = critTimer + (second.second - first.second);
			}
			if (critTimer == 0)
			{
				if (second.month > first.month)
				{
					critTimer = critTimer + (second.month - first.month) * 2592000;
					critTimer = critTimer + (second.day - first.day) * 86400;
					critTimer = critTimer + (second.hour - first.hour) * 3600;
					critTimer = critTimer + (second.minute - first.minute) * 60;
					critTimer = critTimer + (second.second - first.second);
				}
			}
			if (critTimer == 0)
			{
				if (second.day > first.day)
				{
					critTimer = critTimer + (second.day - first.day) * 86400;
					critTimer = critTimer + (second.hour - first.hour) * 3600;
					critTimer = critTimer + (second.minute - first.minute) * 60;
					critTimer = critTimer + (second.second - first.second);
				}
			}
			//hour
			if (critTimer == 0)
			{
				//if (second.hour > first.hour) {
				critTimer = critTimer + (second.hour - first.hour) * 3600;
				critTimer = critTimer + (second.minute - first.minute) * 60;
				critTimer = critTimer + (second.second - first.second);
				//}
			}
			//minute
			if (critTimer == 0)
			{
				//if (second.minute > first.minute) {
				critTimer = critTimer + (second.minute - first.minute) * 60;
				critTimer = critTimer + (second.second - first.second);
				//}
			}
			if (critTimer == 0)
			{
				//if (second.second > first.second) {
				critTimer = critTimer + (second.second - first.second);
				//}
			}
			return critTimer;
		}
		
		public function updateMinutes(objectsArray:Array)
		{
			//прибавить секунду во все здания парка
			globalParams.minuteTimer++;
			
			//var objectsArray:Array = globalParams.indexMc.objectsArray;
			if (globalParams.minuteTimer == 1800)
			{
				for (var i = 0; i < objectsArray.length; i++)
				{
					for (var j = 0; j < globalParams.attractionNameArray.length; j++)
					{
						if (objectsArray[i].type == globalParams.attractionNameArray[j])
						{
							objectsArray[i].prevProfit = objectsArray[i].profit;
							objectsArray[i].profit = 0;
						}
					}
					/*
					if (objectsArray[i].type == "enterBoth")
					{
						objectsArray[i].prevProfit = objectsArray[i].profit;
						objectsArray[i].profit = 0;
					}
					*/
				}
				globalParams.minuteTimer = 0;
			}
		}
		public function min_sek(time:int,No:Boolean=false):String
		{
			var timeLess:int;
			if (No==true) {
				timeLess = time;
			} else {
				timeLess = time-globalParams.UnixTime_Global
			}
			
			if (timeLess>60) {
				var time_min:int = timeLess/60
				var time_sek:int = timeLess%60
				return time_min+" мин "+time_sek+" сек"
			}
			return timeLess+"сек"
		}
		public function sek_timer(time:int):String
		{
			if (time<=0) {
				return "0"
			}
			var time_min:int;
			if (time>60) {
				time_min = time/60
				var time_sek:int = time%60
				if (time_min<=60) {
					return time_min+" мин "+time_sek+" с"
				}
			}
			if (time_min>60) {
				var time_hour:int = time_min/60
				time_min = time_hour%60
				return time_hour+" час "+time_min+" м"
			}
			return time+"сек"
		}
		public function Just_newTime():Object
		{
			var newTime:Object = new Object ();
			newTime.year = globalParams.globalTime.year;
			newTime.month = globalParams.globalTime.month;
			newTime.day = globalParams.globalTime.day;
			newTime.hour = globalParams.globalTime.hour;
			newTime.minute = globalParams.globalTime.minute;
			newTime.second = globalParams.globalTime.second;
			return newTime;
		}

	}

}