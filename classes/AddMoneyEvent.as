package classes {
	import flash.events.Event;
	
	public class AddMoneyEvent extends Event {
		public var transactionHistory:String = "";
		
		public var moneyAdded:int = 0;
		
		public static var DEFAULT:String = "addMoney";
		public static var MONEY_ADDED:String = "moneyAdded";
		
		public function AddMoneyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
	}
}