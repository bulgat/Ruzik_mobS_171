package tools 
{
	import AS.encryption.MD5;
	
	import classes.ServerProvider;
	import classes.json.JSON;
	
	import com.carlcalderon.arthropod.Debug;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class insertPromoLog extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		public function insertUserData ()
		{
			
		}
		public function insert_Promo_Log ():void 
		{
			trace("__insert_Promo_Log__");
			
			var variables:URLVariables = new URLVariables();
            variables.cmd = "insertUserData"
            variables.uid = globalParams.UID
        	variables.id = globalParams.UID
			var Time_Complete:Date = new Date;
			
			
			variables.pcode = "000123";
			variables.code = "000123";            
            variables.rand = Math.ceil (Math.random()*10000)
			
			_serverProvider.initPost (variables, globalParams.INSERT_DATA_LOG);
			_serverProvider.addEventListener(ServerProvider.COMPLETE, onInsertUserData);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
		}
		
		private function onInsertUserData (e:Event):void 
		{
			trace(" PROMO ok")
			
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onInsertUserData);
			
			
			
		}
		private function onServerProviderError(e:Event):void 
		{
			trace("ERROR PROMO")
		}
	}

}