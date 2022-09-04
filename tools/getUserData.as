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
	 * // Получени денег, опыта и уровня игрока.
	 */
	public class getUserData extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		private var loader:URLLoader 	= new URLLoader();
			
		
		public function load_User () 
		{
			// Получени денег, опыта и уровня игрока.
		
		
		
			var planet:int=globalParams.G_PLANET;
			var GET_adress:String=globalParams.SERVER + 'getUserData.php';
			trace("########### load_User ############# ");
			trace("######################## ");
			trace("######################## ");
			
			//trace("getUserData__________________  planet",planet,".____######################## ",GET_adress)
			
			
			if (!globalParams.alone) {
				_serverProvider.init("cmd=getRating&uid=" + globalParams.UID + " &planet="+planet+ "&rand=" + Math.ceil (Math.random() * 10000), GET_adress);
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onGetUserData);
				//_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			} else {
				
				trace(globalParams.stageMc+"######################## getUserData");
				SaveShared.getUserData();
				
				globalParams.stageMc._getDataInfo.init ()
				globalParams.stageMc.setQuality ();
			}
		}
		private function onGetUserData (e:Event = null):void 
		{
			// Получени денег, опыта и уровня игрока.
			_serverProvider.removeEventListener(Event.COMPLETE, onGetUserData);
			
			var result:Object = {}
			result = JSON.parse(e.target.responseObj);
			//result = JSON.decode(e.target.responseObj);
			
			if (result.error_code == "704") {
				trace('ошибка    704  ')
				if (globalParams.G_PLANET==0) {
						
            		globalParams.user_cash = 4000;
					globalParams.stageMc._getDataInfo.init ()
				}
				globalParams.user_exp = 0;
           		 globalParams.user_lvl = 1;
			
			} else {
				// Все идет нормально.
				globalParams.user_exp = result[0].user_exp
				globalParams.user_lvl = result[0].user_lvl
				globalParams.user_cash = result[0].user_cash
				
				globalParams.lastUpdate = result[0].lastUpdate
				globalParams.lastPresent = result[0].lastPresent
				
				globalParams.stageMc._getDataInfo.init ()
				var jres:Object = JSON.parse (unescape (result[0].user_settings))
				//var jres:Object = JSON.decode (unescape (result[0].user_settings))
				if (jres.quality == 2) {
					index_as.QUALITY_SET = index_as.HIGH_Q
				}
				if (jres.quality == 1) {
					index_as.QUALITY_SET = index_as.MEDIUM_Q
				}
				if (jres.quality == 0) {
					index_as.QUALITY_SET = index_as.LOW_Q
				}
				if (jres.music != undefined) {
					if (jres.music == 1) {
						globalParams.stageMc.muteMusTrigger = true
					} else {
						globalParams.stageMc.muteMusTrigger = false
					}
					if (jres.sound == 1) {
						globalParams.stageMc.muteSndTrigger = true
					} else {
						globalParams.stageMc.muteSndTrigger = false
					}
				}
				globalParams.stageMc.setQuality ()
			}
		}
		private function on_UserData():void 
		{
			
			
		}
		
		private function onServerProviderError(e:Event):void 
		{
			
		}
	}

}