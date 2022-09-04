package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class insertFriendAssistData extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		public function insertFriendAssistData () 
		{
			
		}
		public function init () 
		{
			
			//_serverProvider.init("cmd=insertRating&uid="+globalParams.UID+"&buildingData="+ getBuildingData ()+"&workerMarketData=" + getWorkerMarketData () + "&rand=" + Math.ceil (Math.random()*10000), globalParams.INSERT_RATING);
			//_serverProvider.addEventListener(ServerProvider.COMPLETE, onInsertRating);
			//_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			
			var variables:URLVariables = new URLVariables();
            variables.cmd = "insertFriendAssistData"
            variables.uid = globalParams.UID
            variables.friendAssistData = getFriendAssistDataFn ()
            variables.rand = Math.ceil (Math.random()*10000)
			
			_serverProvider.initPost (variables, globalParams.INSERT_FRIENDS_ASSIST_DATA);
			_serverProvider.addEventListener(ServerProvider.COMPLETE, onInsertFriendAssistData);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
		}
		function getFriendAssistDataFn () {
			var req:Object = new Object ()
			req.faarr = globalParams.friendsAssistArray
			
			var saveLine:Object = {}
			saveLine = escape (JSON.encode(req))
			return saveLine
		}
		private function onInsertFriendAssistData(e:Event):void 
		{
			//globalParams.indexMc.systemMessage ("Получены данные с сервера - " + e.target.responseObj)
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onInsertFriendAssistData);
			
			var result:Object = {}
			result = JSON.decode(e.target.responseObj);
			
			globalParams.stageMc.recieveFriendsAssidtData ()
		}
		private function onServerProviderError(e:Event):void 
		{
			/*globalParams.indexMc.systemMessage ("onInsertFriendAssistData")
			_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);*/
		}
	}

}