package classes 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;

	import classes.json.JSON;
	/**
	 * Класс для работы в сервером
	 * В класс передается requestVariables
	 * На выходе Json преобразованный responseObj
	 * 
	 * @author Mutagen
	 */
	public class ServerProvider extends EventDispatcher
	{
		public static var COMPLETE:String = "complete";
		public static var ERROR:String = "error";
		public var METHOD_GET = URLRequestMethod.GET;
		public var METHOD_POST = URLRequestMethod.POST;
		
		
		public var responseObj:Object = [];
		public var responseString:String;
		
		public function ServerProvider() 
		{
		}
		
		public function init(requestVariables:String, pathToServer:String):void
		{

			// запрос на LOAD
							// данные

			//var header:URLRequestHeader = new URLRequestHeader ("Content-type", "application/octet-stream");
			//urlReq.requestHeaders.push(header);
			var urlReq:URLRequest = new URLRequest(pathToServer);
			urlReq.method = URLRequestMethod.POST;
			urlReq.data = new URLVariables(requestVariables);	
			// отправка
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, urlLoaderComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, urlLoaderIOError);
			urlLoader.load(urlReq);	
		}
		
		//запись данных на сервер
		public function initPost(requestVariables, pathToServer:String):void
		{
			
			
			
			//запись данных на сервер
			var urlVariables:URLVariables = new URLVariables();
			urlVariables = requestVariables

			var urlRequest:URLRequest = new URLRequest(pathToServer);
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = urlVariables;

			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, urlLoaderComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, urlLoaderIOError);
			urlLoader.load(urlRequest);
			
		}
		
		private function urlLoaderIOError(e:IOErrorEvent):void 
		{
			//trace("urlLoaderComplete --> responseObj  ERROR");
			dispatchEvent(new Event(ServerProvider.ERROR));
		}
		
		private function urlLoaderComplete(e:Event):void 
		{
			//var Time_Complete:Date = new Date;
			
			responseObj = e.target.data;
			responseString = (e.target).data;
			//trace("OK save in server   urlLoaderComplete --> responseObj",responseObj,":______ L = ",responseObj.length);
			//trace("__ JSON = ",JSON.encode(responseObj),"__________________Length = ",JSON.encode(e.target.data).length," = ",JSON.encode(responseObj).length);
			
			dispatchEvent(new Event(ServerProvider.COMPLETE));
		}
	}

}