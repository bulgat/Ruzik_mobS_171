package tools 
{
	import AS.encryption.MD5;
	
	import classes.ServerProvider;
	//import classes.json.JSON;
	
	import com.carlcalderon.arthropod.Debug;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class updateUserData extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		
		public function save_init () 
		{
			
			
			var variables:URLVariables = new URLVariables();
           var planet:int = globalParams.G_PLANET
		trace("updateUserData__________________  planet",planet,".____######################## SAVE USER DATA   updatUserData.php")
		   if (!globalParams.alone) {
		   
				   variables.cmd = "updateUserData"
					variables.uid = globalParams.UID
					variables.user_exp = globalParams.user_exp
					variables.user_lvl = globalParams.user_lvl
					variables.user_cash = globalParams.user_cash;
					//variables.user_cash_Garantia = globalParams.indexMc.TotalCost_Building();
					
					variables.key = globalParams.USER_CODE;
					
					variables.check = MD5.hash(String(globalParams.user_exp) + String(globalParams.user_lvl) + String(globalParams.user_cash) + String(globalParams.USER_CODE));
					
					variables.user_settings = getUserSettingsLine ()
					variables.rand = Math.ceil (Math.random()*10000)
					variables.planet = planet;
					
					_serverProvider.initPost (variables, globalParams.UPDATE_USERDATA);
					_serverProvider.addEventListener(ServerProvider.COMPLETE, onUpdateUserData);
					_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
		   } else {
			   SaveShared.setUserData();
			}
		}
		public function getUserSettingsLine ():String {
			var req:Object = new Object ()
			req.quality = 1
			
			if (globalParams.stageMc.muteMusTrigger) {
				req.music = 1
			} else {
				req.music = 0
			}
			if (globalParams.stageMc.muteSndTrigger) {
				req.sound = 1
			} else {
				req.sound = 0
			}
			
			if (index_as.QUALITY_SET == index_as.HIGH_Q) {
				req.quality = 2
			}
			if (index_as.QUALITY_SET == index_as.MEDIUM_Q) {
				req.quality = 0
			}
			if (index_as.QUALITY_SET == index_as.LOW_Q) {
				req.quality = 0
			}
			var saveLine:String;
			saveLine = JSON.stringify(req);
			//saveLine = escape (JSON.encode(req))
			return saveLine
		}
		private function onUpdateUserData(e:Event):void {
			
			//trace("№№№№№№№№№№№№№№№№   onUpdateUserData   №№№№№№№№№№№№№№№№№№     SAVE USER DATA");
			
			//trace("UPDATE SUCCESS , data updated!   USER_Date = ",globalParams.USER_CODE," Data = ",globalParams.USER_Date_api_secret, "  CHECK(MD5.hash) = ",MD5.hash(String(globalParams.user_exp) + String(globalParams.user_lvl) + String(globalParams.user_cash) + String(globalParams.USER_CODE)));
			//trace("  COMPLETE    onUpdateUserData:              _api_secret = ",globalParams.USER_Date_api_secret);
			//trace("Response:"+e.target);
			
			//trace("Response str: "+e.target.responseString);
			//var result = JSON.decode(e.target.responseObj);
			//trace("====",result);
			//trace(" : "+int(e.target.responseString));
			var Bo:Boolean = int(e.target.responseString)==777;
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onUpdateUserData);
			if (Bo) {
				trace("====load key=====");
				//globalParams.stageMc.loadSecretKey();
				
			} else {
				trace(Bo,"====ok key=====");
				//globalParams.modifyApi("u");
			}
			
			
			
			
			if (globalParams.needToUpdateLevel) {
				
				globalParams.needToUpdateLevel = false;
				globalParams.indexMc._insertBillingInfo.init(2, 'levelUp');
			}
		}
		private function onServerProviderError(e:Event):void 
		{
			
			//trace("$$$$$$$$$$$$$$$$$$$$$$__   INCOMPLECT    _$$$$$$$$$$$$$$$$$$$$$$$$");
			//trace("INCOMPLECT  UPDATE   Error update USER_Date = ",globalParams.USER_CODE,"  _api_secret = ",globalParams.USER_Date_api_secret, "  CHECK(MD5.hash) = ",MD5.hash(String(globalParams.user_exp) + String(globalParams.user_lvl) + String(globalParams.user_cash) + String(globalParams.USER_CODE)));
			//trace("INCOMPLECT  UPDATE    e.target"+e.target);
			
			//trace("Response:"+e.target);
			//trace("RESPONSE: "+e.target.responseString);
			//trace(" : "+int(e.target.responseString));
			var Bo:Boolean = int(e.target.responseString)==777;
			if (Bo) {
				trace("====load key=====");
				//globalParams.stageMc.loadSecretKey();
			} else {
				trace(Bo,"====ok key=====");
			}
			//var result = JSON.decode(e.target.responseObj);
			//trace("====",result);
			
		}
	}

}