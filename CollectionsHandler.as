package  {
	
	import flash.net.*;
	import flash.events.Event;
	import flash.display.MovieClip;
	import com.adobe.serialization.json.*;
	
	public class CollectionsHandler extends MovieClip 
	{
public var collectionsArray:Object;
		
		var loader			:URLLoader 	= new URLLoader();
			//server			:String 	= "http://188.93.210.206/ruzikland_pre_release/scr/";
			var server:String = "http://5.9.97.118/ruzikland_pre_release/scr/";
			//var testCollection	:CollectionWindow = new CollectionWindow();
			
private var _collection	:String = "",
			_uid		:String; 

		public function CollectionsHandler(uid:String)
		{
			_uid = uid;
		}
		
		public function getCollections():void
		{
			if (!globalParams.alone) {
				if (_collection == "")
				{
					var req	:URLRequest 	= new URLRequest(globalParams.SERVER + "getCollections.php"),
						v	:URLVariables 	= new URLVariables;
					
					v.uid 		= _uid;
					v.rand		= int(Math.random() * 1000);
					req.data 	=  v;
					
					loader.load(req)
					loader.addEventListener(Event.COMPLETE, completeHandler);
					
					return;
				}
				
				dispatchEvent(new Event("gotCollection"));
			} 
			else 
			{
				Full_Collection();
				dispatchEvent(new Event("gotCollection"));
			}
		}
		
		public function completeHandler(e:Event):void
		{
			
			if (loader.data == '0')
			{
				Full_Collection();
			}
			else
			{
				try {
					collectionsArray = JSON.parse(loader.data);
					//collectionsArray = JSON.decode(loader.data);
				} catch(e:Error) {
					
					Full_Collection();
				}
				
				dispatchEvent(new Event("gotCollection"));
				loader.removeEventListener(Event.COMPLETE, completeHandler);
			}
		}
		public function Full_Collection():void
		{
			
			collectionsArray = [];
			for(var i = 0; i < 2 *  5; i++)
			{
				
				collectionsArray.push(0);
			}
			
		}
		public function get Collection():String
		{
			return _collection;
		}
		
		public function setCollection():void
		{
			var req	:URLRequest 	= new URLRequest(globalParams.SERVER + "insertCollections.php"),
				v	:URLVariables 	= new URLVariables;
				
			v.uid 			= _uid;
			v.rand			= int(Math.random() * 1000);
			v.collection	= '[' + globalParams.indexMc.collectionsArray.toString() + ']';
			
			req.data 	= v;
			req.method 	= URLRequestMethod.POST;
			
			trace("Отправил данные на обрабтку");
			loader.load(req);
		}

	}
	
}
