package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;
	//import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import com.carlcalderon.arthropod.Debug;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class getBuildingData extends MovieClip
	{

		public function TotalCost_Building ():int 
		{
			var Cost_Old:int;
			for (var i:int = 0; i < globalParams.indexMc.objectsArray.length; i++)
			{
				if (globalParams.indexMc.objectsArray[i].type != "deleted")
				{
					if (globalParams.indexMc.objectsArray[i].type != "decoration") {
						Cost_Old += globalParams.onGetAdminTableArray[globalParams.indexMc.objectsArray[i].type].price/2;
						
					} else {
						Cost_Old += globalParams.onGetAdminTableArray["decoration"][globalParams.indexMc.objectsArray[i].productType].price;
						
					}
				
				}
			}
			return Cost_Old;
		}
		public function just_building_length():int
		{
			var building_length:int;
			for (var i_b:int = 0; i_b < globalParams.indexMc.objectsArray.length; i_b++)
			{
				if (globalParams.indexMc.objectsArray[i_b].type != "deleted")
				{
					building_length++
				}
			}
			
			return building_length;
		}
		public function single_BuildingData(unit:int):String
		{
			var single_BuildingArray:Object = new Object();
			single_BuildingArray.type = globalParams.indexMc.objectsArray[unit].type
			single_BuildingArray.productType = globalParams.indexMc.objectsArray[unit].productType
			single_BuildingArray.TypeFood = globalParams.indexMc.objectsArray[unit].TypeFood;
			single_BuildingArray.i = globalParams.indexMc.objectsArray[unit].i
			single_BuildingArray.j = globalParams.indexMc.objectsArray[unit].j
			single_BuildingArray.openTrigger = globalParams.indexMc.objectsArray[unit].openTrigger
			if (globalParams.indexMc.objectsArray[unit].statusObject != undefined)
			{
				/*
				var new_statusObject:Object= new Object();
				new_statusObject.rrd=globalParams.indexMc.objectsArray[unit].statusObject.rrd
				new_statusObject.ldr=globalParams.indexMc.objectsArray[unit].statusObject.ldr
				new_statusObject.sst=globalParams.indexMc.objectsArray[unit].statusObject.sst
				new_statusObject.status=globalParams.indexMc.objectsArray[unit].statusObject.status
				new_statusObject.repairtime=globalParams.indexMc.objectsArray[unit].statusObject.repairtime
				*/
				single_BuildingArray.statusObject = globalParams.indexMc.objectsArray[unit].statusObject
				//single_BuildingArray.statusObject = new_statusObject
				/*
				for (var detailN:* in  globalParams.indexMc.objectsArray[unit].statusObject) {
				trace(" хрень = ",detailN);
				}
				*/
			}
			single_BuildingArray.level = globalParams.indexMc.objectsArray[unit].level
			single_BuildingArray.worker = globalParams.indexMc.objectsArray[unit].worker
			single_BuildingArray.cc = globalParams.indexMc.objectsArray[unit].cc // показатель cash collected (собрано прибыли)
			if (globalParams.indexMc.objectsArray[unit].botSlot != undefined)
			{
				single_BuildingArray.botSlot = globalParams.indexMc.objectsArray[unit].botSlot
			}
			//var saveLine:String = JSON.encode(single_BuildingArray);
			var saveLine:String = JSON.stringify(single_BuildingArray);
			//saveLine = escape (JSON.encode(single_BuildingArray))
			return saveLine;
		}
		public function buildingData(outerSave:Boolean):Object
		{
			var req:Object = new Object();
			req.buy_time_energy =globalParams.buy_time_energy;
			req.buy_time_booster =globalParams.buy_time_booster;
			
			req.questTask_Mini=globalParams.questTask_Mini
			req.quest_historyBuild= globalParams.quest_historyBuild;
			
			req.ironPlanet =false;
			req.ironPlanet =globalParams.ironPlanet;
			req.celebrate =globalParams.indexMc.celebrate;
			
			req.transpositionPark = true;
			req.landWidth = globalParams.indexMc.ParkSize;
			req.landHeight = globalParams.indexMc.ParkSize;
			
			req.groundSkin = globalParams.indexMc.groundSkin;
			req.enterPosition = globalParams.indexMc.enterPosition;
			req.questNumber = globalParams.questNumber;

			req.user_energy = globalParams.user_energy;
			//req._time = globalParams._handle_time.Just_newTime();
			req._time = globalParams.UnixTime_Global;
			
			req.Allow_Robocat = globalParams.Allow_Robocat;
			req.Period_Robocat = globalParams.Period_Robocat;

			req.newSave = true;

			req.newSave_Length = just_building_length();

			req.Interdict_Litter = globalParams.Interdict_Litter;
			if (globalParams.Interdict_Litter == true)
			{
				req.Period_Interdict_Litter = globalParams.Period_Interdict_Litter;
			}
			else
			{
				req.Period_Interdict_Litter = 0;
			}

			req.New = true;
			req.user_exp = globalParams.user_exp;
			req.user_lvl = globalParams.user_lvl;
			req.user_cash = globalParams.user_cash;

			req.Trash = globalParams.indexMc.refuse_Array.length;

			
			//записать здания в один файл или нет?
			if (outerSave==false)
			{
				var tmpObjectsArray:Array = new Array();
				//запись данных по зданиям
				for (var i_b:int = 0; i_b < globalParams.indexMc.objectsArray.length; i_b++)
				{
					if (globalParams.indexMc.objectsArray[i_b].type != "deleted")
					{
						var n:int;
						n = tmpObjectsArray.length;
						tmpObjectsArray.push(new Object ());
						tmpObjectsArray[n].type = globalParams.indexMc.objectsArray[i_b].type;
						tmpObjectsArray[n].productType = globalParams.indexMc.objectsArray[i_b].productType;
						tmpObjectsArray[n].TypeFood = globalParams.indexMc.objectsArray[i_b].TypeFood;
						tmpObjectsArray[n].i = globalParams.indexMc.objectsArray[i_b].i;
						tmpObjectsArray[n].j = globalParams.indexMc.objectsArray[i_b].j;
						tmpObjectsArray[n].openTrigger = globalParams.indexMc.objectsArray[i_b].openTrigger;
						if (globalParams.indexMc.objectsArray[i_b].statusObject != undefined)
						{
							tmpObjectsArray[n].statusObject = globalParams.indexMc.objectsArray[i_b].statusObject;
						}
						tmpObjectsArray[n].level = globalParams.indexMc.objectsArray[i_b].level;
						tmpObjectsArray[n].worker = globalParams.indexMc.objectsArray[i_b].worker;
						tmpObjectsArray[n].cc = globalParams.indexMc.objectsArray[i_b].cc;// показатель cash collected (собрано прибыли)
						if (globalParams.indexMc.objectsArray[i_b].botSlot != undefined)
						{
							tmpObjectsArray[n].botSlot = globalParams.indexMc.objectsArray[i_b].botSlot;
						}
					}
				}
				req.objectsArray = tmpObjectsArray;
			}
			var tmpRoadsArray:Array = new Array();
			//запись данныхъ по дорогам
			for (var i_r:int = 0; i_r < globalParams.indexMc.roadsArray.length; i_r++)
			{
				n = tmpRoadsArray.length;
				tmpRoadsArray.push(new Object ());
				tmpRoadsArray[n].i = globalParams.indexMc.roadsArray[i_r].i;
				tmpRoadsArray[n].j = globalParams.indexMc.roadsArray[i_r].j;
			}

			req.roadsArray = tmpRoadsArray;
			trace("@@@@  buildingData                      req.roadsArray = ",req.roadsArray.length)
			req.random = Math.ceil(Math.random() * 100000);
			return req;

		}

	}

}