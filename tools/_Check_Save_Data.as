package tools
{
	//import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;

	
	/**
	 * Класс для работы в сервером
	 
	 * На выходе Json преобразованный responseObj
	 * 
	
	 */
	//проверка корректности записи на сервкр
	public class Check_Save_Data extends EventDispatcher
	{
		private var 	_serverProvider:ServerProvider = new ServerProvider(),
						res;
		public var Basa_Check_Length:Array = ["buildings_data","workerMarketData","workersArray"];
		public var buildings_data:String;
		public var workerMarketData:String;
		public var workersArray:String;
		
		public function Check_Save_Data_(GET_RATING,buildings_data_,workerMarketData_,workersArray_)
		{
			trace(")))))))))))))))))))))   Check_Saved_Games  ((((((((((((((((((((( ");
			buildings_data=buildings_data_;
			workerMarketData=workerMarketData_;
			workersArray=workersArray_;
			
			
			//_serverProvider.init("cmd=updateRating&uid=" + globalParams.UID + "&rand=" + Math.ceil (Math.random() * 10000), globalParams.UPDATE_RATING);

			_serverProvider.init("cmd=getRating&uid=" + globalParams.UID + "&rand=" + Math.ceil (Math.random() * 10000), GET_RATING);

			_serverProvider.addEventListener(ServerProvider.COMPLETE, on_Get_Data);
			_serverProvider.addEventListener(ServerProvider.ERROR, on_Server_Error);
		}
		private function on_Server_Error(e:Event):void
		{
			trace("_ERROR");
		}
		private function on_Get_Data(e:Event):void
		{
			
			trace("____OK_____");
			//globalParams.indexMc.systemMessage ("Получены данные с сервера - " + e.target.responseObj)
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, on_Get_Data);

			var result:Object = [];
			result = JSON.decode(e.target.responseObj);

			if (result.error_code == "704")
			{


			}
			else
			{
			var Time_Complete:Date = new Date;
				
				if (Check_Data_Length(result)) {
					trace("       №№№№№№№№№№№№№№№   CorrectSave   №№№№№№№№№№№№№№№",Time_Complete);
					dispatchEvent(new Event("CorrectSave"));
					
				} else {
					trace("       |||||||||||||||InCorrectSave|||||||||||||||",Time_Complete);
					//запись не корректна, данные надо переписать
					dispatchEvent(new Event("InCorrectSave"));
				}

				//trace("  e.target.responseObj = ",e.target.responseObj,"  L = ",e.target.responseObj.length);


				

			}
		}
		public function Check_Data_Length(Result:Object):Boolean
		{
			trace("/////////////////////Check_Data_Length\\\\\\\\\\\\\\\\\\\\");
			var Check_L:Boolean;
			try {
				for (var BAmount:int=0; BAmount < Basa_Check_Length.length; BAmount++)
				{
					if (Result[0][Basa_Check_Length[BAmount]].length == this[Basa_Check_Length[BAmount]].length)
					{
						trace(" Yes = result[0].workersArray = ",Result[0][Basa_Check_Length[BAmount]].length,"  = ",this[Basa_Check_Length[BAmount]].length);
					}
					else
					{
						trace(" No = result[0].workersArray = ",Result[0][Basa_Check_Length[BAmount]].length,"  = ",this[Basa_Check_Length[BAmount]].length);
						return false;
					}
				}
			} catch(e:Error) {
				trace("     incorrect     Check_Data_Length");
				return false;
			}
			
			return true;
		}
		








	}

}