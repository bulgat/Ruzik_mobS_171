package windows
{


	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.events.IOErrorEvent;

	public class list_promo extends Sprite
	{
		var Server:String = globalParams.SERVER_shop + "/promo_user.php";
		//var Server:String=globalParams.SERVER_shop+"/_code.php";
		var user_id:String;
		var promo:String;
		var user_success:int;
		
		public function launch_promo(user_id_out:String,promo_out:String,user_success_out:Boolean):void
		{
			user_id = user_id_out;
			promo = promo_out;
			user_success = int(user_success_out);
			trace("@@@@@   list_promo__________user_id    ",user_id,"     promo = ",promo,"   user_success =",user_success);
			promoClickHandler();
		}



		public function promoClickHandler():void
		{
			//промокод ввод 
			var ldr:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest(Server);
			var v:URLVariables = new URLVariables();
			
			v.user_id = user_id;
			v.promo = promo;
			v.user_success = user_success;
			req.data = v;
			ldr.load(req);
			
			trace("Sending...\n");
			ldr.addEventListener(Event.COMPLETE,compete_Handler);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, urlLoaderIOError);
		}
		public function compete_Handler(e:Event):void
		{
			//куку за промокод
			trace("________ответ: ",(e.target).data);
			

		}
		public function urlLoaderIOError(e:IOErrorEvent):void
		{
			trace("############# error...");
		}

	}
}