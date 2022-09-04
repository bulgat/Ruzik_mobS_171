package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class SaveError extends MovieClip
	{
		public var _serverProvider:ServerProvider = new ServerProvider();
		
	
		

		//public static var _check_save_data:Check_Save_Data = new Check_Save_Data();
		public var variables:URLVariables = new URLVariables();
		
		public function init_Save (UPDATE_RATING:String,typeError:String) 
		{
			trace("_____________________________________  SAVE ERROR  ____________________________   ");
			//throw new Error("opa");
			
			
				trace("___________  SAVE IN SERVER    _________");
				
				
				variables.type = typeError;
				
				variables.rand = Math.ceil (Math.random() * 10000)
							
				
				_serverProvider.initPost (variables, UPDATE_RATING);
				
				_serverProvider.addEventListener(ServerProvider.COMPLETE, COMPLETE_);
				_serverProvider.addEventListener(ServerProvider.ERROR, ERROR_);
							
		}

		
		private function COMPLETE_(e:Event):void 
		{
			//запись прошла успешно
			trace(" ServerProvider        COMPLETE")
			trace(e.target.responseObj);
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, COMPLETE_);
			
			
		}
		private function ERROR_(e:Event):void 
		{
			
			trace(" ServerProvider           Error")
			//_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
		}
	
	
	}

}