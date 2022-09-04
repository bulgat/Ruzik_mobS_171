package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class lands_globalLoad extends MovieClip
	{


		public function paramsLoad(dataObject:Object)
		{
			
			trace("_____@@@@@@@@@ dataObject._time=",dataObject._time,globalParams.UnixTime_Global)
			dataObject._time = globalParams._handle_time.new_renderTime(dataObject._time);
			trace("_____@@@@@@@@@ dataObject._time=",dataObject._time,globalParams.UnixTime_Global)
			if (isNaN(dataObject._time)) dataObject._time=0;
			if (isNaN(globalParams.UnixTime_Global)) globalParams.UnixTime_Global=0;
			var k:Number = dataObject.user_energy+(globalParams.UnixTime_Global-dataObject._time)/180;
			trace("@@@@@@@@@@@@@@@ k=",k,"dataObject.user_energy="+dataObject.user_energy+"||||  globalParams.G_PLANET   ",globalParams.G_PLANET,"     TIME   dataObject._time = ",dataObject._time+"_"+globalParams.UnixTime_Global);
			
			globalParams.user_energy=int(dataObject.user_energy)+(globalParams.UnixTime_Global-dataObject._time)/180;
			
			//globalParams.user_energy=k;
			if (globalParams.user_energy < 0)
			{
				globalParams.user_energy = 0;
			}
			//trace("_____globalParams.user_energy ",globalParams.user_energy,"   __ ",dataObject.user_energy,"  |",globalParams.UnixTime_Global,"-",dataObject._time,"=",globalParams.UnixTime_Global-dataObject._time);
			

			//введена 5 окт 2012 г. (отключтить проверку на наличие через 6 месяцев)
			trace("dataObject.Allow_Robocat = ",dataObject.Allow_Robocat,"________________dataObject.Period_Robocat = ",dataObject.Period_Robocat);
			trace(globalParams.Allow_Robocat,"_________________globalParams.globalTime__",globalParams.globalTime);
			globalParams.Period_Robocat = dataObject.Period_Robocat;
			if (dataObject.Period_Robocat != null)
			{
				//введено 1 июля 2013
				dataObject.Period_Robocat = globalParams._handle_time.new_renderTime(dataObject.Period_Robocat);
				
				if (globalParams.UnixTime_Global - dataObject.Period_Robocat > 259200)
				{
					globalParams.Allow_Robocat = false;
				}
				else
				{
					globalParams.Allow_Robocat = true;
				}

				if (globalParams.UnixTime_Global - dataObject.Period_Robocat == 0)
				{
					globalParams.Allow_Robocat = false;
				}


			}


			//добавлен 22 октября 2012 года  ЭКОЛОГ

			if (dataObject.Interdict_Litter == true)
			{
				globalParams.Period_Interdict_Litter = dataObject.Period_Interdict_Litter;

				if (dataObject.Period_Interdict_Litter != null)
				{
					trace("___b___",dataObject.Period_Interdict_Litter,"__",globalParams.globalTime);


					dataObject.Period_Interdict_Litter = globalParams._handle_time.new_renderTime(dataObject.Period_Interdict_Litter);
					trace("___b___",dataObject.Period_Interdict_Litter,"    ЭКОЛОГ    ",globalParams.UnixTime_Global-dataObject.Period_Interdict_Litter);
					if (globalParams.UnixTime_Global - dataObject.Period_Interdict_Litter > 259200)
					{
						globalParams.Interdict_Litter = false;
					}
					else
					{
						globalParams.Interdict_Litter = true;
					}
					trace("|||||||   globalParams.Interdict_Litter = ",globalParams.Interdict_Litter,"_____");
					if (globalParams.UnixTime_Global - dataObject.Period_Interdict_Litter == 0)
					{
						globalParams.Interdict_Litter = false;
					}


				}
			}

			//добавлен 27 марта 2013 года  постинг праздника
			trace("---постинг праздника---",dataObject.celebrate);
			if (dataObject.celebrate != undefined)
			{
				trace(globalParams.indexMc.holiday,globalParams.indexMc.currDate.date,"---постинг праздника---",dataObject.celebrate);
				if (globalParams.indexMc.holiday == globalParams.indexMc.currDate.date)
				{
					if (dataObject.celebrate == false)
					{
						globalParams.indexMc._post_image.post_launch("сегодня праздник, идет весна","holiday");
						globalParams.indexMc.celebrate = true;
					}

				}
				else
				{
					globalParams.indexMc.celebrate = false;
				}



			}

			//globalParams.global_Log.push(" dataObject.landWidth= ",dataObject.landWidth);
			globalParams.questNumber = dataObject.questNumber;

			if (dataObject.New == true)
			{


				//globalParams.user_exp = dataObject.user_exp
				//globalParams.user_lvl = dataObject.user_lvl 
				//globalParams.user_cash =  dataObject.user_cash


			}
			if (dataObject.ironPlanet != undefined)
			{
				globalParams.ironPlanet = dataObject.ironPlanet
			
			}
			if (dataObject.questTask_Mini != undefined)
			{
				globalParams.questTask_Mini = dataObject.questTask_Mini
				globalParams.quest_historyBuild= dataObject.quest_historyBuild;
			}
			if (dataObject.buy_time_energy!=undefined) {
				trace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!___eeee__",globalParams.UnixTime_Global);
				trace("energy",dataObject.buy_time_energy,"_____booster",dataObject.buy_time_booster,"__ ",dataObject.buy_time_booster+3600,">",globalParams.UnixTime_Global)
				trace("//////////////////////////////////////             ",dataObject.buy_time_booster+3600>globalParams.UnixTime_Global);
				if (dataObject.buy_time_energy+3600>globalParams.UnixTime_Global) {
					globalParams.buy_time_energy=dataObject.buy_time_energy
					globalParams.buy_energy=50;
					globalParams.buy_speed_energy=.001;
				}
				if (dataObject.buy_time_booster+3600>globalParams.UnixTime_Global) {
					globalParams.buy_time_booster=dataObject.buy_time_booster
					globalParams.buy_booster=2
				}
			
			
			}
		
		
		
		
		}


	}

}