package  
{
	
	
	import flash.display.*;
	import flash.display.Stage;
	import flash.events.*;
	import flash.external.*;
	import flash.net.*;
	import flash.system.Security;
	import flash.system.System;
	import flash.utils.*;
	
	
	public class protectKey extends MovieClip
	{
		
		
		
		public function launch(_intent:String,get_ProtectedKey:String):void {
			//trace(" Launch key",_intent,"           get_ProtectedKey = ",get_ProtectedKey);
			
			loadSecretKey(_intent,get_ProtectedKey);
		}
		var intent:String
		public function loadSecretKey(_intent:String,get_ProtectedKey:String):void {
			//throw new ("ZZZZZZZZZ")
			
			var ldr:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest(globalParams.SERVER+get_ProtectedKey);
			//trace(" loadSecretKey   SERVER: "+globalParams.SERVER+globalParams.getProtectedKey);
						
			var v:URLVariables = new URLVariables();
			v.vkid = globalParams.UID;
			
			req.data = v;
			intent = _intent;
			ldr.addEventListener(Event.COMPLETE, loadKeyComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, loadKey_Error);
			ldr.load(req);
		
		}
		private function loadKey_Error(e:Event):void {
			
			//Add_Texter("Не могу установить соединение с сервером.....  :( ",0);
			trace("Не могу установить соединение с сервером.....  :( ");
		}
		private function loadKeyComplete(e:Event):void {
			
			
			globalParams.create_clue(intent,String((e.target).data));
			//globalParams["USER_CODE"]="___100";
			
			//trace("globalParams.",intent," = ",globalParams[intent]);
			//Add_Texter("Подождите немного.......... Идет загрузка данных игрока и генерация ландшафта",0);
		}
		
		
		
		
		
		
		
		
		
	}

}

