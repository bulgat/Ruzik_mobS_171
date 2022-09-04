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
	public class getFriendsAssistData extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		public function getFriendsAssistData () 
		{
			
		}
		public function init () 
		{
			_serverProvider.init("cmd=getAssistData&uid="+globalParams.UID+"&rand=" + Math.ceil (Math.random()*10000), globalParams.GET_FRIENDS_ASSIST_DATA);
			_serverProvider.addEventListener(ServerProvider.COMPLETE, onGetFriendsAssistData);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
		}
		private function onGetFriendsAssistData(e:Event):void 
		{
			//globalParams.indexMc.systemMessage ("Получены данные с сервера - " + e.target.responseObj)
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGetFriendsAssistData);
			
			var result:Object = {}
			result = JSON.decode(e.target.responseObj);
			
			if (result.error_code == "704") {
				//globalParams.indexMc.startNewGame ()
				globalParams.stageMc._insertFriendAssistData.init ()
			} else {
				globalParams.friendsAssistArray = result.friendAssistData
				globalParams.stageMc.recieveFriendsAssidtData ()
			}
		}
		private function onServerProviderError(e:Event):void 
		{
			//globalParams.indexMc.systemMessage ("onServerProviderError")
			//_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
		}
	}

}