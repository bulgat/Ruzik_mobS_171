package {
	
	import flash.net.*;
	import flash.events.Event;
	import flash.display.MovieClip;
	import vk.api.serialization.json.*;
	
	public class ParkLoader extends MovieClip {

		var loader		:URLLoader 	= new URLLoader(),
			server		:String 	= "http://188.93.210.206/ruzikland_pre_release/scr/",
			answer		:String,
			uid;
		
		public function ParkLoader(UID) {
			uid = UID;
			loadParkData();
		}
		
		public function loadParkData():void
		{
			var req	:URLRequest 	= new URLRequest(server + "getSavedGamesData.php"),
				v	:URLVariables 	= new URLVariables;
				
				v.uid 		= uid;
				req.data 	= v;
				
				loader.load(req);
				loader.addEventListener(Event.COMPLETE, completeHandler);
		}
		
		public function completeHandler(e:Event):void
		{
			loader.removeEventListener(Event.COMPLETE, completeHandler);
			
			answer = loader.data;
			
			dispatchEvent(new Event("parkLoaded"));
		}

	}
	
}
