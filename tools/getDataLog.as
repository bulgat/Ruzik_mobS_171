package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.IOErrorEvent;
	
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class getDataLog extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		var loader:URLLoader 	= new URLLoader();
			//server:String 		= 'http://188.93.210.206/ruzikland_pre_release/scr/';
		
		public function getUserData () 
		{
			
		}
		public function init () 
		{
			if (!globalParams.alone) {
			var req	:URLRequest = new URLRequest(globalParams.SERVER + 'getDataLog.php'),
				v	:URLVariables = new URLVariables();
				
				v.uid = globalParams.UID;
				v.rand = Math.ceil(Math.random()*10000);
				req.data = v;
				
				loader.load(req);
				loader.addEventListener(Event.COMPLETE, onGetUserData);
				loader.addEventListener(IOErrorEvent.IO_ERROR, onServerProviderError);
			}
		}
		public function onGetUserData (e:Event = null):void 
		{
			_serverProvider.removeEventListener(Event.COMPLETE, onGetUserData);
			globalParams.HistoryPlayer = loader.data;
			
			
		}
		private function onServerProviderError(e:Event):void 
		{
		init ();
		}
	}

}