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
	public class getDataInfo extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		public var _load_time:load_time = new load_time();
		public function getDataInfo() 
		{
			
		}
		public function init () 
		{
			trace(" ###   %%%%  getDataInfo%%%   init ");
			//получить данные (отправка) на сервер php  classes.ServerProvider.init
			
			if (!globalParams.alone) {
				_serverProvider.init("cmd=getDataInfo&rand=" + Math.ceil (Math.random()*10000), globalParams.GET_DATA_INFO);
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onGetDataInfo);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			} else {
				globalParams.stageMc.updateTime ("");
			}
			_load_time.init ()
		}
		private function onGetDataInfo (e:Event):void 
		{
			
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGetDataInfo);
			var req = JSON.parse (e.target.responseObj)
			//var req = JSON.decode (e.target.responseObj)
			var timeString:String = req[0]["from_unixtime(unix_timestamp(), '%Y, %e, %c, %k, %i, %s')"]
			//trace(req," TIME  %%%%getDataInfo%%%   onGetDataInfo  e=",e.target.responseObj,"      timeString=",timeString);
			globalParams.stageMc.updateTime (timeString)
		}
		private function onServerProviderError(e:Event):void 
		{
			//globalParams.indexMc.systemMessage ("onServerProviderError")
			//_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
		}
	}

}