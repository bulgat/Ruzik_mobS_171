package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import tools.insertBillingInfo
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class getPaymentData extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		private var _insertBillingInfo:insertBillingInfo = new insertBillingInfo();
		
		public function getPaymentData () 
		{
			
		}
		public function init () 
		{
			if (!globalParams.alone) {
			//сохранить данные (отправка) на сервер php  classes.ServerProvider.init
			_serverProvider.init("cmd=getPaymentData&uid="+globalParams.UID+"&rand=" + Math.ceil (Math.random()*10000), globalParams.GET_PAYMENT_DATA);
			_serverProvider.addEventListener(ServerProvider.COMPLETE, onPayment);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			}
		}
		private function onPayment (e:Event):void 
		{
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onPayment);
			
			var result:Object = {}
			result = JSON.parse(e.target.responseObj);
			//result = JSON.decode(e.target.responseObj);
			if (result.error_code == "704") {
				trace("        getPaymentData",e.target.responseObj);
				_insertBillingInfo.init (10, "startup")
			} else {
				globalParams.indexMc.getPaymentsDataFn (result)
			}
		}
		private function onServerProviderError(e:Event):void 
		{
			//globalParams.indexMc.systemMessage ("onServerProviderError")
			//_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);
		}
	}

}