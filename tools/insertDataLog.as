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
	import flash.globalization.DateTimeFormatter;
	import flash.globalization.DateTimeStyle;
	
	
	public class insertDataLog extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		public function insertUserData ()
		{
			
		}
		public function insert_Data_Log (EventStr:String) 
		{
			
			if (!globalParams.alone) {
				var variables:URLVariables = new URLVariables();
				variables.cmd = "insertUserData"
				variables.uid = globalParams.UID
				 var Time_Complete:Date = new Date;
				//var time_new:String = ""+Time_Complete.date+" "+Time_Complete.fullYear
				var dtf:DateTimeFormatter = new DateTimeFormatter("en-US", DateTimeStyle.LONG, DateTimeStyle.LONG); 
				var longDate:String = dtf.format(Time_Complete); 
				
				var LogString:String="      \n  [Event: "+EventStr+"  Time: "+longDate+" Lv:"+globalParams.user_lvl.toString()+"  Exp:"+globalParams.user_exp.toString()+" cash: "+globalParams.user_cash.toString()+" kuku: "+globalParams.indexMc.kukubaksi+" Building: "+globalParams.indexMc.objectsArray.length+", Cost Building: "+globalParams.indexMc._getBuildingData.TotalCost_Building()+"    PLANET: "+globalParams.G_PLANET+" ],   ";
				trace(LogString);
				variables.dataLog = LogString;
											
				variables.rand = Math.ceil (Math.random()*10000)
				
				_serverProvider.initPost (variables, globalParams.INSERT_DATA_LOG);
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onInsertUserData);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			}
		}
		
		private function onInsertUserData (e:Event):void 
		{
			
			
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onInsertUserData);
			
			
			
		}
		private function onServerProviderError(e:Event):void 
		{
			
		}
	}

}