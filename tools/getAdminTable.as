package  tools
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * Получение XML параметров зданий (продажа, прибыль, название и т.д)
	 */
	public class getAdminTable extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		public function getAdminTable () 
		{
			
		}
		//Получение XML параметров зданий (продажа, прибыль, название и т.д)
		public function init () 
		{
			//throw new ("#### getAdminTable")
			//получить с сервера php  classes.ServerProvider.init
			//загрузка данных игрока
			
			if (!globalParams.alone) {
				trace("##@@@@@@@@@@@## getAdminTable");
				_serverProvider.init("cmd=getAdminTable&rand=" + Math.ceil (Math.random() * 10000), globalParams.GET_ADMIN_TABLE);
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onGetAdminTable);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			} else {
				trace(globalParams.alone,"#### getAdminTable");
				dispatchEvent (new Event (Event.COMPLETE))
			}
		}
		private function onGetAdminTable (e:Event):void 
		{
			// Получение XML параметров зданий (продажа, прибыль, название и т.д)
			globalParams.onGetAdminTableInformation = e.target.responseObj
			globalParams.onGetAdminTableArray = new Array ()
			
			var result:Object ={};
			try {
				result = JSON.parse(e.target.responseObj);
				//result = JSON.decode(e.target.responseObj);
			} catch(e:Error) {
				
				trace("))))))Error((((((((JSON не читает ");
			}

			
			globalParams.onGetAdminTableArray = new Array ()
			for (var i = 0; i < result.length; i++) {
				
				if (result[i].type != "decoration") {
					var type:String = result[i].type
					//trace("onGetAdminTableArray_",result[i].type);
					globalParams.onGetAdminTableArray[type] = new Object ()
					globalParams.onGetAdminTableArray[type].price = int (result[i].price)
					globalParams.onGetAdminTableArray[type].buildExp = int (result[i].experience)
					globalParams.onGetAdminTableArray[type].profitTime = int (result[i].profitTime)
					globalParams.onGetAdminTableArray[type].maxProfit = int (result[i].maxProfit)
					globalParams.onGetAdminTableArray[type].repairtime = int (result[i].repairtime)
					globalParams.onGetAdminTableArray[type].russianName = result[i].russianName
					globalParams.onGetAdminTableArray[type].productType = result[i].sub_type
					globalParams.onGetAdminTableArray[type].level = int (result[i].level)
				//trace("onGetAdminTableArray_",result[i].type,globalParams.onGetAdminTableArray[type]);
				
				} else {
					if (globalParams.onGetAdminTableArray[result[i].type] == undefined) {
						globalParams.onGetAdminTableArray[result[i].type] = new Array ()
					}
					var tmpObject:Object = new Object ()
					tmpObject.price = int (result[i].price)
					tmpObject.buildExp = int (result[i].experience)
					tmpObject.profitTime = int (result[i].profitTime)
					tmpObject.maxProfit = int (result[i].maxProfit)
					tmpObject.repairtime = int (result[i].repairtime)
					tmpObject.russianName = result[i].russianName
					tmpObject.productType = result[i].sub_type
					tmpObject.level = int (result[i].level)
					
					globalParams.onGetAdminTableArray[result[i].type][result[i].sub_type] = tmpObject
				}
			}
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGetAdminTable);
			dispatchEvent (new Event (Event.COMPLETE))
			
			
			if (result.error_code == "704") {
				//_insertBillingInfo.init (10, "startup")
			} else {
				//globalParams.indexMc.getPaymentsDataFn (result)
			}
		}
		private function onServerProviderError(e:Event):void 
		{
			//trace("  ^^^^^^  cellClick_Friends  " )
			_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
		}
	}

}