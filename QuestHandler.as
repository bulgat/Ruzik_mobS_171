package {
	import flash.net.*;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.IOErrorEvent;
	public class QuestHandler extends MovieClip {
		
		var loader		:URLLoader 	= new URLLoader(),
			server		:String 	= "http://188.93.210.206/ruzikland_pre_release/scr/";
			
private var _questNumber:String = "",
			_uid		:String; 

		public function QuestHandler(uid:String)
		{
			_uid = uid;
		}
		
		public function getQuest():void
		{
			if (_questNumber == "")
			{
				var req	:URLRequest 	= new URLRequest(server + "getQuestNumber.php"),
					v	:URLVariables 	= new URLVariables,
					rand:int			= Math.random() * 1000;
				
				v.uid 		= _uid;
				v.rand		= rand;
				req.data 	=  v;
				
				loader.load(req)
				loader.addEventListener(Event.COMPLETE, completeHandler);
				loader.addEventListener(IOErrorEvent.IO_ERROR, complete_IOError);
				return;
			}
			
			dispatchEvent(new Event("gotQuestNumber"));
			
		}
		private function complete_IOError(e:IOErrorEvent):void 
		{
			loader.removeEventListener(IOErrorEvent.IO_ERROR, complete_IOError);
			trace("  --> responseObj  ERROR");
			
		}
		public function completeHandler(e:Event):void
		{
			_questNumber = loader.data;
			dispatchEvent(new Event("gotQuestNumber"));
			loader.removeEventListener(Event.COMPLETE, completeHandler);
		}
		
		public function get questNumber():String
		{
			return _questNumber;
		}
		
		public function setQuest():void
		{
			var req	:URLRequest 	= new URLRequest(server + "insertQuestNumber.php"),
				v	:URLVariables 	= new URLVariables;
				
			v.uid 		= _uid;
			v.quest		=  globalParams.questNumber;
			
			req.data 	=  v;
			req.method 	= URLRequestMethod.POST;
			
			loader.load(req);
		}

	}
	
}
