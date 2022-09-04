package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.events.EventDispatcher;


	public class get_Load extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider(),
		res;
		private var UID:String;
		private var backup:int = 0;
		private var NumFile:int;
		private var G_planet:int = 0;
		public var _SaveError:SaveError = new SaveError();
		public var Num:int;
		public var Build:Object = [];

		public function LoadFile(_UID:String,_backup:int,Num:int,planet:int):void
		{
			UID = _UID;
			backup = _backup;
			NumFile = Num;
			G_planet = planet;
			
			_serverProvider.init("cmd=getRating&uid=" + _UID + "&backup="+_backup+"&planet="+planet+"&cell="+Num+"&rand=" + Math.ceil (Math.random() * 10000), globalParams.new_GET_Data);

			_serverProvider.addEventListener(ServerProvider.COMPLETE, Load_new_Get);
			_serverProvider.addEventListener(ServerProvider.ERROR, Load_new_Get_Error);


		}

		private function Load_new_Get(e:Event):Boolean
		{
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, Load_new_Get);

			trace(NumFile,"___////////////////////////////////__decode___//////////////////////////////");

			//trace("                   e.target.responseObj=",e.target.responseObj);

			var k_building:String = "[" + e.target.responseObj + "]";

			//trace(NumFile,"                   k_building = ",k_building);

			var result:Object = [];
			try
			{
				result = JSON.parse(k_building);
				//result = JSON.decode(k_building);
			}
			catch (e:Error)
			{
				trace("_______JSON.decode______error_______e.target.data");
				//MovieClip(parent).Create_Basa_Building(NumFile,undefined);


				_SaveError.init_Save(globalParams.SERVER+"ErrorData.php","crash_Attraction");
				Num = NumFile;
				Build = undefined;
				dispatchEvent(new Event("getOne"));
				return false;
			}
			//trace("result[0].data = ",result[0].data);
			if (result[0].data != undefined)
			{
				//trace("__________________  result[0].data = ",result[0].data.length,"   = ");

				try
				{
					var dataObject:Object = JSON.parse(unescape(result[0].data));
					//var dataObject:Object = JSON.decode(unescape(result[0].data));
					//MovieClip(parent).Create_Basa_Building(NumFile,dataObject);
					Num = NumFile;
					Build = dataObject;
					//trace("  load = ",result[0].data)
					dispatchEvent(new Event("getOne"));
				}
				catch (e:Error)
				{
					Num = NumFile;
					Build = undefined;
					dispatchEvent(new Event("getOne"));

					//MovieClip(parent).Create_Basa_Building(NumFile,undefined);
				}


				//trace(dataObject.type,"/////////////////////////////// PUSH   /////////////////////// splice = ",NumFile);
			}
			else
			{
				trace("///////////////////////////////////     undefined     /////////////////////////////");
				_SaveError.init_Save(globalParams.SERVER+"ErrorData.php","crash_Attraction");
				//MovieClip(parent).Create_Basa_Building(NumFile,undefined);

				Num = NumFile;
				Build = undefined;
				dispatchEvent(new Event("getOne"));
			}




			//globalParams.indexMc._getSavedGames.Basa_Building_New.splice(NumFile,1,result);

			return true;
		}

		private function Load_new_Get_Error(e:Event):void
		{
			trace("   error       Load_new_Get_Error  ");
			LoadFile(UID,backup,NumFile,G_planet);
			//globalParams.indexMc._getSavedGames.Create_Basa_Building(NumFile,undefined);
		}





	}

}