package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;

	public class getSavedGames extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider(),
		res;

		public var Error_Load_Player:int = 0;
		public var dataObject:Object = [];
		public var load_New_UID:String;
		public var _SaveError:SaveError = new SaveError();
		
		var Basa_BackUp_Name:Array = [
		  globalParams.D_BACKUP_GET,
		  globalParams.BACKUP_GET,
		  ];

		public var _load_welcom_first:load_welcom_first = new load_welcom_first();
		public var _load_correct_data:load_correct_data = new load_correct_data();
		
		var backUp_get:int;
		public var G_planet:int;
		public function load_init(_UID:String,GET_RATING:String,backup:int,planet:int):void
		{

			globalParams.G_PLANET=G_planet=planet;
			globalParams.stageMc._getUserData.load_User();
			
			
			trace("              Load INFO UID=",_UID,"'''''''''''''''  |||||  path =    planet =",planet);
			backUp_get = backup;
			//backUp_get=1;
			if (!globalParams.alone) {
				_serverProvider.init("cmd=getRating&uid=" + _UID + " &planet="+planet+ "&rand=" + Math.ceil (Math.random() * 10000), GET_RATING);
	
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onGet_COMPLETE);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
				globalParams.stageMc.Add_Texter("Подождите немного.......... Идет загрузка данных игрока и генерация ландшафта",0);
				load_New_UID = _UID;
				globalParams.flag_load = true;
			} else {
				// ALONE game
				//Пользователь еще ни разу не играл в парк!
					trace("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   Пользователь еще ни разу не играл в парк!   ^^^ "+ globalParams.user_exp);
						if (globalParams.user_exp == 0) {
							globalParams.user_cash = 4000;
							globalParams.user_exp = 0;
							 globalParams.user_lvl = 1;
							
						}
					
					_load_welcom_first.Welcom_Full();
					
					
					Start_and_Decode(SaveShared.getSavedGames());
			}
		}

		public function launch_load_park():void
		{
			trace("  GET SAVED                 G_planet = ",G_planet);
			globalParams.indexMc.startLoadedGame(G_planet,dataObject);

		}
		private function Load_new_Get_Error(e:Event):void
		{
			trace("   error       Load_new_Get_Error  ");
		}
		private function onGet_COMPLETE(e:Event):void
		{

			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGet_COMPLETE);

			//создается result, куда сбрасываются загруженные данные с сервера, посредством ServerProvider;
			var result:Object = {};
			var fallaciously:Boolean;
			//trace("GET__decode___",e.target.responseObj,"  L = ",e.target.responseObj.length);
			try
			{
				trace("GET__decode___",e.target.responseObj,"   _______ Error_Load_Player = ",Error_Load_Player);
				result = JSON.parse(e.target.responseObj);
				//result = JSON.decode(e.target.responseObj);
				
				trace("ОШИБКИ НЕТУ!              " );
			}
			catch (e:Error)
			{
				//ошибка 

				trace("НЕКОРРЕКТНЫЕ ДАННЫЕ _______JSON.decode______error_______          result.error_code =  704");
				fallaciously = true;
				//result.error_code = "704";
				Load_Fail_Data();
				_SaveError.init_Save(globalParams.SERVER+"ErrorData.php","error_backUp");
			}
			// Чтение прошло нормально
			if (! fallaciously)
			{

				trace("!!!!!!!!!!!!!!!!  result.error_code = ",result.error_code,"______________G_planet",G_planet,"     Error_Load_Player=",Error_Load_Player,"    path:",Basa_BackUp_Name[Error_Load_Player]);
				//result.error_code = "704";
				if (result.error_code == "704")
				{
					trace("ERROR",result.error_code);
					//ошибка , дать пользователю возможность выбрать тип планеты
					//Пользователь еще ни разу не играл в парк!
					if (G_planet==0)
					{
						_load_welcom_first.Welcom_Full();
					}
					else
					{
						globalParams.stageMc.Remove_Texter();
						globalParams.indexMc.startNewGame(1);
					}
					trace("       Пользователь еще ни разу не играл в парк!        ");
					trace("       Пользователь еще ни разу не играл в парк!        ");
					trace("       Пользователь еще ни разу не играл в парк!        ");
				}
				else
				{
					
					Start_and_Decode(result);

				}

			}



		}
		// Старт
		private function Start_and_Decode(Code:Object):void
		{
			
			//try
			//{

				//Раскомментировать потом
				//декодирует строку в объект  globalParams.indexMc.groundSkin с помощью JSON

				load_personalMenue.analyseWorkersMarket(Code[0].workerMarketData);
				load_personalMenue.analyseWorkersArray(Code[0].workersArray);
				if (!globalParams.alone) {
					dataObject = JSON.parse(unescape(Code[0].buildings_data));
					//dataObject = JSON.decode(unescape(Code[0].buildings_data));
				} else {
					dataObject = Code[0].buildings_data;
				}
				//trace("__"+Code[0].buildings_data+" 00000###  Start_and_Decode   ### "+dataObject);
				
					//Загрузка с новыми типами данных
					//trace("BACKUP  __newSave_Length__",dataObject.newSave_Length,"       G_planet  =",G_planet);
					//globalParams.stageMc.Add_Texter("Подождите немного..........  Идет загрузка данных о строениях игрока. ",0);
					//trace(" 111 ###  Start_and_Decode   ### "+dataObject.newSave_Length);
					if (dataObject.newSave_Length == 0)
					{
						dataObject.newSave_Length = 1;
					}

					//dataObject.newSave_Length=21;
					//trace(dataObject.newSave,"__newSave_ L= _",dataObject.newSave_Length,"       G_planet  =",G_planet);
					if (!globalParams.alone) {
						var _load_building_data:load_building_data = new load_building_data();
						addChild(_load_building_data);
						_load_building_data.load_New(dataObject.newSave_Length,backUp_get,G_planet);
					} else {
						//globalParams.indexMc._getSavedGames.dataObject.objectsArray = Basa_Building_New;
						globalParams.stageMc.Remove_Texter();
						launch_load_park();
					}
				
				Error_Load_Player = 0;

/*
			}
			catch (e:Error)
			{

				//ошибка , дать пользователю возможность выбрать тип планеты
				//Данные пользователя повреждены
				if (!globalParams.alone) {
					trace("??????????????????????????????????????????????????????????");
					trace("??????????????????????????????????????????????????????????");
					trace("??????????????????????????????????????????????????????????");
					trace("  _____________________________JSON.decode   Error       ",Error_Load_Player);
	
					Load_Fail_Data();
					if (Error_Load_Player==3)
					{
						trace("BACKUP_3");
						globalParams.indexMc.systemMessage("Данные пользователя повреждены. Вы получаете страховку");
						//ошибка з, дать пользователю возможность выбрать тип планеты;
						trace("   user_cash_Garantia = ",globalParams.user_cash_Garantia);
						globalParams.user_cash +=  globalParams.user_cash_Garantia;
						_load_welcom_first.Welcom_Full();
						_SaveError.init_Save(globalParams.SERVER+"ErrorData.php","crash_Park");
					}
				}

			}

*/
		}
		private function Load_Fail_Data():void
		{

			if (Error_Load_Player<2)
			{
				load_init(globalParams.UID,Basa_BackUp_Name[Error_Load_Player],Error_Load_Player,0);
				Error_Load_Player++;
				trace("Подождите немного..........  файл поврежден. Идет загрузка данных игрока с файла № "+Error_Load_Player+" и генерация ландшафта. ");
				globalParams.stageMc.Add_Texter("Подождите немного..........  файл поврежден. Идет загрузка данных игрока с файла № "+Error_Load_Player+" и генерация ландшафта. ",0);
			}

			//load_init(globalParams.UID,Basa_BackUp_Name[2],2);
			//globalParams.stageMc.Add_Texter("Подождите немного..........  файл поврежден. Идет загрузка данных игрока с файла backUp. ",0)
		}

		private function onServerProviderError(e:Event):void
		{
			//Texter_mc.text = "ошибка загрузки данных и генерации ландшафта";
		}
	}

}