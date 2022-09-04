package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import tools.dataObjectTranslator
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class load_time extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		private var currDate:Date = new Date();
		
		public function init () 
		{
			trace(currDate.time," load_time TIME   init "+globalParams.UnixTime_Global);
			
			
			//получить данные (отправка) на сервер php  classes.ServerProvider.init
			
			if (!globalParams.alone) {
				_serverProvider.init("cmd=load_time&rand=" + Math.ceil (Math.random()*10000), globalParams.LOAD_TIME);
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onGetDataInfo);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			} else {
				
			}
		}
		private function onGetDataInfo (e:Event):void 
		{
			
			
			//trace(" TIME=",currDate.time);
			//var kol:Number = int(e.target.responseObj)*1000
			
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGetDataInfo);
			globalParams.UnixTime_Global = int(e.target.responseObj)*1000;
			globalParams.UnixTime_Global = int(e.target.responseObj);
			//trace("  globalParams.UnixTime_Global",globalParams.UnixTime_Global);
			
		}
		
		
		
		private function onServerProviderError(e:Event):void 
		{
			
		}
	}

}