package windows {
	
	import com.carlcalderon.arthropod.Debug;
	
	import fl.controls.TextInput;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.events.IOErrorEvent;
	public class send_mail extends Sprite {
		
		
		public var acceptBtn:Sprite = new Sprite();
		public var rejectBtn:Sprite = new Sprite();
		
		public var successTxt:TextField = new TextField();
		public var presents:String = '';
		public var numPresents:String = '';
		

		private var _root:Sprite = new Sprite();
		
		private var _savedRequest:URLRequest;
		private var _savedLdr:URLLoader;
		private var _savedMD5String:String = "";
		private var _savedVars:URLVariables;
		
		public var presentsCost:int = 0;
		public var presentsCostKB:int = 0;
		
		
		var my_loader:URLLoader = new URLLoader();
		public function _Mail(fullName:String,Order_Str:String):void {
			var my_vars:URLVariables = new URLVariables();
	
			my_vars.name = " Луна-парк Рузик: "+fullName;
			my_vars.message = " Поступил заказ на товар.  "+Order_Str;
	
			var my_url:URLRequest = new URLRequest(globalParams.SERVER_shop+"/mail_send.php");
			my_url.method = URLRequestMethod.POST;
			my_url.data = my_vars;
			
	
	
			
			my_loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			my_loader.addEventListener(Event.COMPLETE, Check_Answer);
			
			
			_savedRequest = my_url;
			_savedLdr = my_loader;
			_savedVars = my_vars;
			
			my_loader.load(my_url);
			
			
			
			trace(fullName,"+++++++++++++++++++++++++++++Message Sent++++++++++++++++++++++++++++");
			
			
		}
		
		public function Check_Answer(e:Event):void {
			
			my_loader.removeEventListener(Event.COMPLETE, Check_Answer);
			trace(" ");
			trace("COMPLETE  ____________ Answer ______________",(e.target).data);
			
			
		
			
		}
			
		
		
	}
}