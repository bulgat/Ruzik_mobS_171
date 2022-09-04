package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class secureCheck extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		public function secureCheck() 
		{
			
		}
		public function init (UID:String, money:Number) 
		{
			_serverProvider.init("cmd=secureCheck&uid=" + UID + "&price=" + money + "&rand=" + Math.ceil (Math.random() * 10000), "http://ydvp.ru/ydvp/ruzikLand_rd5/scr/checkCash.php");
			_serverProvider.addEventListener(ServerProvider.COMPLETE, onGetAdminTable);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
		}
		private function onGetAdminTable (e:Event):void 
		{
			var result:Object
			result = JSON.decode(e.target.responseObj);
			
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGetAdminTable);
			
			
			
			if (result.error_code == "704") {
				//_insertBillingInfo.init (10, "startup")
				dispatchEvent (new Event (Event.CANCEL))
			} else {
				//globalParams.indexMc.getPaymentsDataFn (result)
				
				dispatchEvent (new Event (Event.COMPLETE))
			}
		}
		private function onServerProviderError(e:Event):void 
		{
			_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
		}
	}

}