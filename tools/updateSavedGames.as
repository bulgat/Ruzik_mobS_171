package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	 //import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class updateSavedGames extends MovieClip
	{
		public var _serverProvider:ServerProvider = new ServerProvider();
		
		public function updateSavedGames () 
		{
			
		}
		
		
		
		//public var Basa_Check_Length:Array = ["buildings_data","workerMarketData","workersArray"];
		//public var buildings_data:String;
		//public var workerMarketData:String;
		//public var workersArray:String;
		//public static var _check_save_data:Check_Save_Data = new Check_Save_Data();
		public var variables:URLVariables = new URLVariables();
		var G_planet:int
		public function init_Save (UPDATE_RATING:String,importance:Boolean):void
		{
			trace(globalParams.friendsParkTrigger,globalParams.flag_load,"__ _alone_____ ___  SAVE IN SERVER    _________________ _updateSavedGames  = ",UPDATE_RATING," Save_Time_Int ",Save_Time_Int);
			//throw new Error("opa");
			var planet:int
			if (globalParams.indexMc.groundSkin=='green') {
				 planet= G_planet =0
			} else {
				planet = G_planet =1
			
			}
			
			
			//не давать записать данные, если игрок зашел в парк другу, или идет загрузка игры
			if (!globalParams.friendsParkTrigger&&!globalParams.flag_load) {
				//не давать записать данные игроку в течение 2 сек
				if (!globalParams.alone) { 
				trace("___________  SAVE IN SERVER    _________");
					if (Save_Time_Int>60) {
						
						variables.cmd = "updateRating"
						variables.uid = globalParams.UID
						variables.buildingData =getBuildingData()
						variables.workerMarketData =getWorkerMarket ()
						variables.workersArray =getWorkerArray ()
						variables.user_exp = globalParams.user_exp
						variables.user_lvl = globalParams.user_lvl
						variables.user_cash = globalParams.user_cash;
						variables.newSave = true;
						variables.planet = planet
						//
						//var SumLength:int = getBuildingData().length+getWorkerMarket ().length+getWorkerArray ().length;
						
						variables.rand = Math.ceil (Math.random() * 10000)
						_serverProvider.initPost (variables, UPDATE_RATING);
						_serverProvider.addEventListener(ServerProvider.COMPLETE, COMPLETE_onUpdateRating);
						_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
						
						Save_Time_Int=0
						addEventListener (Event.ENTER_FRAME, Save_Time);
						//save backup
							if (importance==true) {
								init_Save (globalParams.BACKUP_SAVE,false);
								Save_single_building (3,planet);
							}
						
						Save_single_building (0,planet);
					}
				} else {
					
					SaveShared.setSavedGames()
					
				}
			}
		}
		public var Basa_Save:Array = [];
		public function Save_single_building (backup:int,planet:int):void
		{
			if (!globalParams.friendsParkTrigger&&!globalParams.flag_load) {
				reset_Basa();
				var build_length:int = globalParams.indexMc._getBuildingData.just_building_length();
				
				trace("  Save_single_building     build_length = ",build_length);
				var NumCount:int;
				for (var i_b:int = 0; i_b < globalParams.indexMc.objectsArray.length; i_b++)
				{
					if (globalParams.indexMc.objectsArray[i_b].type != "deleted")
					{
						//trace("  SAVE ",i_b,"i____Build:@@@@@@@_",globalParams.indexMc._getBuildingData.single_BuildingData(i_b),"_@@@@@@@@   ",NumCount,"   ___",globalParams.indexMc.objectsArray[i_b].type,"   ");
						var _set_Save:set_Save = new set_Save();
						_set_Save.Save_Cells(backup,planet,NumCount,globalParams.indexMc._getBuildingData.single_BuildingData(i_b));
						
						NumCount++;
						Basa_Save.push(_set_Save);
					} else {
						trace("  NOOOOOOO   Save_single_building     build_length = ");
					}
					
				}
				
			}
				
		}
		
		public function reset_Basa():void
		{
			for (var i_b:int = 0; i_b < Basa_Save.length; i_b++)
			{
				Basa_Save[i_b]=null;
			}
			Basa_Save =[];
		}
		
		var Save_Time_Int:int=6000;
		public function Save_Time(e:Event)
		{
			Save_Time_Int++
			
			if (Save_Time_Int==600) {
				trace("11111111111111111111111   Save_Time   11111111111111111111111");
				if (Math.ceil (Math.random() * globalParams.Random_backUp_N_1)==1) {
					_serverProvider.initPost (variables, globalParams.C_BACKUP_SAVE);
					Save_single_building (1,G_planet);
				}
				
			}
			
			
			if (Save_Time_Int==1200) {
				/*
				if (Math.ceil (Math.random() * globalParams.Random_backUp_N_2)==1) {
					_serverProvider.initPost (variables, globalParams.D_BACKUP_SAVE);
					Save_single_building (2);
				}
				*/
				removeEventListener (Event.ENTER_FRAME, Save_Time);
				trace("save 2222222222222222222222   Save_Time   2222222222222222222____",Save_Time_Int);
			}
			
			
		}
		
		
		
		
		
		
		public static function getBuildingData () {
			var req:Object = globalParams.indexMc._getBuildingData.buildingData (true)
var saveLine:String = JSON.stringify (JSON.stringify(req))

			//var saveLine:String = escape (JSON.encode(req))
			
			return saveLine
		}
		public static function getWorkerArray ():String {
			//personalMenue.analyseWorkersMarket (null)
			var req:Object = new Object ()
			
			req.workersArray = globalParams.workersArray
		
			var saveLine:String = JSON.stringify (req)
			//saveLine = escape (JSON.encode(req))
			return saveLine
		}
		public static function getWorkerMarket ():String {
			//запись биржи труда, свободные работники
			var req:Object = new Object ()
			req.marketTime = globalParams.UnixTime_Global
			req.workersMarket = globalParams.workersMarket
			
			//var saveLine:String = JSON.stringify (JSON.stringify(req))
			var saveLine:String = JSON.stringify (req);
			//saveLine = escape (JSON.encode(req))
			return saveLine
		}
		private function COMPLETE_onUpdateRating(e:Event):void 
		{
			//запись прошла успешно
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, COMPLETE_onUpdateRating);
			
		}
		
		
		private function onServerProviderError(e:Event):void 
		{
			
			/*globalParams.indexMc.systemMessage ("onServerProviderError")
			_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);*/
		}
	}

}