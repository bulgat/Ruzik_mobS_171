package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;

	import flash.events.MouseEvent;
import flash.events.EventDispatcher;
	public class load_building_data extends MovieClip
	{
		public var Basa_load:Array = [];
		public var Basa_Building_New:Object;
		public var Basa_Building_Count:int;
		public var Num_load_length:int;
		var G_planet:int
		var start_load_Game:Boolean
		public function load_New(Num_length:int,backUp_get:int,planet:int):void
		{
			reset_load();
			Basa_Building_New = [];
			Basa_Building_Count = 0;
			Num_load_length = Num_length;
			 G_planet=planet
			//формирование пустого массива
			for (var i_:int = 0; i_ < Num_length; i_++)
			{
				Basa_Building_New.push(null);
				var _get_Load:get_Load = new get_Load();
				_get_Load.addEventListener("getOne", Create_Basa_Building);
			//addChild(_get_Load)
				_get_Load.LoadFile(globalParams.indexMc._getSavedGames.load_New_UID,backUp_get,i_,planet);
				Basa_load.push(_get_Load);
			
			}
			//создание набора подпрограмм, ответственных за получение данных;
			
			start_load_Game=true
		}
		public function reset_load():void
		{
			//обнулить массив и отправить подпрограммы в мусор, по идее должны туда отправится
			for (var i_s:int = 0; i_s < Basa_load.length; i_s++)
			{
				Basa_load[i_s] = null;
			}
			Basa_load = [];
		}
		public function Create_Basa_Building(e:Event):void
		{
			trace("ppppppppppppppppppppppppppppppppppp",e.target.Num,e.target.Build)
			removeEventListener("getOne", Create_Basa_Building);
			var Num:int = e.target.Num
			var Build:Object =e.target.Build
			Basa_Building_New.splice(Num,1,Build);
			Basa_Building_Count++;
			//trace(" L= ",Basa_Building_New.length,"__________[",Basa_Building_New,"]                  Num_load_length = ",Num_load_length);
			globalParams.stageMc.Add_Texter("Подождите немного идет загрузка зданий ....."+int(Basa_Building_Count*100/Num_load_length)+" %",Basa_Building_Count,Num_load_length);
			if (Basa_Building_Count>=Num_load_length)
			{
				trace();
				trace("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} OK   {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{",start_load_Game);
				trace();
				if (start_load_Game==true) {
				globalParams.indexMc._getSavedGames.dataObject.objectsArray = Basa_Building_New;
				globalParams.stageMc.Remove_Texter();
				if (check_correct_park())
				{
					globalParams.indexMc._getSavedGames.launch_load_park();

				}
				start_load_Game=false
				parent.removeChild(this);
				}
			}
			else
			{
				//var _get_Load:get_Load = new get_Load();
				//_get_Load.LoadFile(globalParams.indexMc._getSavedGames.load_New_UID,globalParams.indexMc._getSavedGames.Error_Load_Player,Basa_Building_Count,G_planet);
			}



		}
		public function check_correct_park():Boolean
		{
			var SavBuild:int = globalParams.indexMc._getSavedGames.dataObject.newSave_Length
			var GetBuild:int;
			for (var i_:int = 0; i_ < globalParams.indexMc._getSavedGames.dataObject.objectsArray.length; i_++)
			{
				if (globalParams.indexMc._getSavedGames.dataObject.objectsArray[i_] == undefined) {
					trace("данные здания некорректно сохранились",globalParams.indexMc._getSavedGames.dataObject.objectsArray[i_])
				} else {
					trace(" корректно - ",i_,"____",globalParams.indexMc._getSavedGames.dataObject.objectsArray[i_])
					GetBuild++;
				}
				
				
			}
			
			if (SavBuild >= GetBuild+4) {
				//Пришли неправильные данные;
				
				globalParams.indexMc._getSavedGames._load_correct_data.option_load();
				
				//globalParams.indexMc.systemMessage(" Количество зданий, поврежденных при загрузке прeвысило критическую велечину. ");
				return false;
			}
		
			return true;
		}
	}

}