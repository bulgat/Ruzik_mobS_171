package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.*;
	import flash.net.SharedObject;
	import tools.updateSavedGames;
	import classes.json.JSON;

	public class SaveShared extends MovieClip
	{
		private static var my_so:SharedObject;
		private static var planet:int = 0;

		public function SaveShared():void
		{

			my_so = SharedObject.getLocal("W_GameSave");

		}
		public static function Next_Handler():void
		{


			var Data_Save:Date = new Date();
			my_so = SharedObject.getLocal("W_GameSave");
			my_so.data.myVar = "  " + Data_Save.day + " " + Data_Save.date + " " + Data_Save.hours + " час " + Data_Save.minutes + " min, " + Data_Save.fullYear + " г.";
		}
		// Получени денег, опыта и уровня игрока.
		public static function getUserData():void
		{
			//globalParams.user_exp = my_so.data.user_exp;
			//globalParams.user_lvl = my_so.data.user_lvl;
			globalParams.user_cash = my_so.data.user_cash + 600;

			globalParams.lastUpdate = my_so.data.lastUpdate;
			globalParams.lastPresent = my_so.data.lastPresent;

			if (globalParams.G_PLANET == 1)
			{
				globalParams.user_exp = my_so.data.user_1_exp;
				globalParams.user_lvl = my_so.data.user_1_lvl;
			}
			else
			{
				globalParams.user_exp = my_so.data.user_0_exp;
				globalParams.user_lvl = my_so.data.user_0_lvl;

			}


			trace(" LOAD "+my_so.data.user_cash);
		}
		// updateUserData
		public static function setUserData():void
		{
			//my_so.data.user_exp = globalParams.user_exp;
			//my_so.data.user_lvl = globalParams.user_lvl;
			my_so.data.user_cash = globalParams.user_cash;

			my_so.data.lastUpdate = globalParams.lastUpdate;
			my_so.data.lastPresent = globalParams.lastPresent;
			if (globalParams.G_PLANET == 1)
			{
				my_so.data.user_1_exp = globalParams.user_exp;
				my_so.data.user_1_lvl = globalParams.user_lvl;
			}
			else
			{
				my_so.data.user_0_exp = globalParams.user_exp;
				my_so.data.user_0_lvl = globalParams.user_lvl;
			}

			trace(" SAVE "+my_so.data.user_cash);
		}
		//updateSavedGames ()
		public static function createPlanet():void
		{
			//my_so.data.buildingData_1_ar = [];
			//my_so.data.workerMarketData_1_ar = [];
			//my_so.data.workersArray_1_ar = [];
			globalParams.indexMc.RemovePark();
			globalParams.indexMc.startNewGame(1);
		}
		public static function setSavedGames():void
		{

			if (globalParams.G_PLANET == 1)
			{
				planet = 1;
				my_so.data.buildingData_1_ar = globalParams.indexMc._getBuildingData.buildingData(false);
				my_so.data.workerMarketData_1_ar = updateSavedGames.getWorkerMarket();
				my_so.data.workersArray_1_ar = updateSavedGames.getWorkerArray();
			}
			else
			{
				planet = 0;
				my_so.data.buildingData_0_ar = globalParams.indexMc._getBuildingData.buildingData(false);
				my_so.data.workerMarketData_0_ar = updateSavedGames.getWorkerMarket();
				my_so.data.workersArray_0_ar = updateSavedGames.getWorkerArray();
			}
			/*
			var planet_ar:Array = [{},{}];
			
			planet_ar[planet].buildingData= globalParams.indexMc._getBuildingData.buildingData(false);
			planet_ar[planet].workerMarketData= updateSavedGames.getWorkerMarket();
			planet_ar[planet].workersArray = updateSavedGames.getWorkerArray();
			my_so.data.planet_arr = escape (JSON.encode(planet_ar));
			*/
			/*
			my_so.data.buildingData_ar[planet] = globalParams.indexMc._getBuildingData.buildingData(false);
			my_so.data.workerMarketData_ar[planet] = updateSavedGames.getWorkerMarket();
			my_so.data.workersArray_ar[planet] = updateSavedGames.getWorkerArray();
			*/
			/*
			my_so.data.buildingData_ar[planet] = globalParams.indexMc._getBuildingData.buildingData(false);
			my_so.data.workerMarketData_ar[planet] = updateSavedGames.getWorkerMarket();
			my_so.data.workersArray_ar[planet] = updateSavedGames.getWorkerArray();
			*/



			my_so.data.user_exp = globalParams.user_exp;
			my_so.data.user_lvl = globalParams.user_lvl;
			my_so.data.user_cash = globalParams.user_cash;
			my_so.data.UnixTime_Global = globalParams.UnixTime_Global;
			my_so.data.planet = planet;
			trace("save globalParams.G_PLANET="+globalParams.G_PLANET);
			trace(" ________________load_time TIME   init "+globalParams.UnixTime_Global);
			trace("######## getSavedGames  000="+my_so.data.buildingData_0_ar);
			trace("######## getSavedGames  111="+my_so.data.buildingData_1_ar);
		}
		public static function getSavedGames():Object
		{
			var Result:Object = [{}];
			if (globalParams.G_PLANET == 1)
			{
				planet = 1;
				Result[0].workerMarketData = my_so.data.workerMarketData_1_ar;
				Result[0].workersArray = my_so.data.workersArray_1_ar;
				Result[0].buildings_data = my_so.data.buildingData_1_ar;
			}
			else
			{
				planet = 0;
				Result[0].workerMarketData = my_so.data.workerMarketData_0_ar;
				Result[0].workersArray = my_so.data.workersArray_0_ar;
				Result[0].buildings_data = my_so.data.buildingData_0_ar;
			}
			trace("@@@@@@@@@@@@@@@save globalParams.G_PLANET="+globalParams.G_PLANET);
			trace("getSavedGames  000="+my_so.data.buildingData_0_ar);
			trace("getSavedGames  111="+my_so.data.buildingData_1_ar);
			//var planet_ar:Object = JSON.decode(my_so.data.planet_arr);
			/*
			Result[0].workerMarketData =planet_ar[planet].workerMarketData;
			Result[0].workersArray =planet_ar[planet].workersArray;
			Result[0].buildings_data =planet_ar[planet].buildingData;
			*/
			/*
			Result[0].workerMarketData = my_so.data.workerMarketData_ar[planet];
			Result[0].workersArray = my_so.data.workersArray_ar[planet];
			Result[0].buildings_data = my_so.data.buildingData_ar[planet];
			*/

			globalParams.UnixTime_Global = my_so.data.UnixTime_Global;
			return Result;
		}




	}

}