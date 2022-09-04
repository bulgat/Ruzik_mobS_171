package tools
{
	import AS.encryption.MD5;
	
	import classes.ServerProvider;
	import classes.json.JSON;
	
	import com.carlcalderon.arthropod.Debug;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
import flash.events.IOErrorEvent;

	/**
	 * ...
	 * @author Mutagen
	 */
	public class insertBillingInfo extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();

		public function insertBillingInfo()
		{

		}
		public var Value_Cost:int;
		public var Value_goal:String;
		public function init(value:int, goal:String) :void {
			
			Debug.log("Validating USER_CODE:"+globalParams.USER_CODE);
			trace("insertBillingInfo--------- goal = ",goal,"  -------------------- value =  ",value);
			if (!globalParams.alone) {
				Value_Cost = value;
				Value_goal = goal;
				//отправка данных на сервер  php  classes.ServerProvider.init
				
				globalParams.pendingNetworkOperation = true;
				var ldr:URLLoader = new URLLoader();
				var req:URLRequest = new URLRequest(globalParams.INSERT_BILLING_INFO);
				var v:URLVariables = new URLVariables();
				v.uid = globalParams.UID;
				v.paymentGoal = goal;
				v.paymentValue = value;
				v.rand = Math.ceil (Math.random()*10000);
				v.key = globalParams.USER_CODE;
				v.check = MD5.hash(String(value)+globalParams.USER_CODE);
				trace(" globalParams.USER_CODE = (",globalParams.USER_CODE,")");
				trace("   v.key = globalParams.USER_CODE = ",globalParams.USER_CODE," |||     v.check = MD5.hash(String(value)+globalParams.USER_CODE)=",v.check," =MD5.hash(",String(value),"+",globalParams.USER_CODE,")");
				req.data = v;
				req.method = URLRequestMethod.GET;
				
				ldr.addEventListener(Event.COMPLETE, onInsertBillingInfo);
				ldr.load(req);
				//_serverProvider.init("cmd=insertBillingInfo&uid="+globalParams.UID+"&paymentGoal="+ goal +"&="+ value + "&rand=" + Math.ceil (Math.random()*10000)+"&key="+globalParams.USER_CODE+"&check="+MD5.hash(String(value)+globalParams.USER_CODE), globalParams.INSERT_BILLING_INFO);
				//_serverProvider.addEventListener(ServerProvider.COMPLETE, onInsertBillingInfo);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			}
		}
		private function onInsertBillingInfo(e:Event):void
		{
			var resp:String = (e.target as URLLoader).data;
			Debug.log("Response:"+resp);
			trace("--onInsertBillingInf----------COMPLETE--------------");
			//_serverProvider.removeEventListener(ServerProvider.COMPLETE, onInsertBillingInfo);

			var result:Object = {};
			trace("-----------------|onInsertBillingInfo|--------------------",resp);
			try
			{
				result = classes.json.JSON.decode(resp);
			}
			catch (err:Error)
			{
				trace("-----------------|onInsertBillingInfo|-----error JSON");
				Debug.log("error JSON while adding money...");
			}
			
			globalParams.indexMc._getPaymentData.init();
			if (String(result['status'])=="1") globalParams.modifyApi("b"); else 
				trace("Error while adding money! Key isn't updated!", 0xffff0000);
			globalParams.pendingNetworkOperation = false;
		}
		private function onServerProviderError(e:Event):void
		{
			trace("error while adding money!");
			//return;
			_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
			init(Value_Cost, Value_goal);

		}
	}

}