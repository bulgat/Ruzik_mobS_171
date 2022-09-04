package windows {
	import AS.encryption.MD5;
	//import vk.api.MD5;
	
	import classes.json.JSON;
	
	//import com.carlcalderon.arthropod.Debug;
	
	import fl.controls.NumericStepper;
	import fl.controls.TextInput;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.text.TextField;
		import flash.events.IOErrorEvent;
	import vk.APIConnection;
	import vk.events.CustomEvent;
	
	
	
	public class add_promokod_old extends Sprite {
		var Server:String=globalParams.SERVER_shop+"/checkcode.php";
		//var Server:String=globalParams.SERVER_shop+"/_code.php";
		var code_Txt_promo:String;
		var userCode:String;
		var userId:String;
		public function launch_promo(code_Txt_promo_out:String,userCode_out:String):void {
			code_Txt_promo=code_Txt_promo_out;
			userCode=userCode_out;
			userId =globalParams.UID;
		trace("___________add_promokod_old    ",code_Txt_promo,"     userCode = ",userCode,"   userId =",userId)
		promoClickHandler();
		}
		
		
		
		public function promoClickHandler():void {
			//промокод ввод 
			var ldr:URLLoader 		= new URLLoader();
				var req:URLRequest 	= new URLRequest(Server);
				var v:URLVariables 	= new URLVariables();
				req.method = URLRequestMethod.POST;
				var hash:String 		= MD5.hash(code_Txt_promo);
			//var hash:String 		= MD5.encrypt(code_Txt_promo);
			trace("@ = ",code_Txt_promo,"         serv = ",Server);
			//промокод ввели в текстовое поле и нажали ок
			if (code_Txt_promo=='') return;
			trace("@@@@@    у вас, батенька     hash = ",hash);
			trace ("Попытка: promo Add_kukubaks: "+code_Txt_promo);
			v.promoCipher = code_Txt_promo;
			v.code = hash;
			v.key = userCode;
			v.vkid = userId;
			req.data = v;
			ldr.load(req);
			trace("Проверка промокода... Это займет немного времени, пожалуйста, наберитесь терпения...");
			trace("  kukubaksi = ");
			//Debug.log("Sending...\n");
			ldr.addEventListener(Event.COMPLETE,compete_Handler);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, urlLoaderIOError);
		}
		public function compete_Handler(e:Event):void {
			//куку за промокод
			trace(                                           "у вас, батенька");
			trace("+++++++++________ответ: ",(e.target).data);
			if (String((e.target).data)=='Success') {
				
				trace("Промокод прошел проверку!");
				//(_root as Shop).calcUserCode("c");
				//oldMoney+=10;
				
				if (globalParams) {
					globalParams.indexMc.kukubaksi += 10;
					//globalParams.indexMc._lands_Interface.indicatorsMc.kukubaksLable.text = globalParams.indexMc.kukubaksi;
					globalParams.indexMc._lands_Interface.refresh_indicator()
					//save log
					globalParams.indexMc.add_log ("Add_kukubaks promo(+ 10) ^ "+code_Txt_promo+" ^ ");
					/*
					if ((_root as Shop).updatingAfterMainMenu) 
						(_root as Shop).mm.myMoneyTxt.text = String(globalParams.indexMc.kukubaksi);
					else (_root as Shop).mm.basketWindow.myMoneyTxt.text = String(globalParams.indexMc.kukubaksi);
					*/
				}
				/*
				if ((_root as Shop).updatingAfterMainMenu) 
					(_root as Shop).mm.myMoneyTxt.text = String(oldMoney);
				else (_root as Shop).mm.basketWindow.myMoneyTxt.text = String(oldMoney);
				*/
			dispatchEvent(new Event("ok_load_promokod"));
			} else {
				if (String((e.target).data)=='injected') {
					trace("+++++++++_______++++++++++++++++++++++++++_ответ: ",(e.target).data);
					dispatchEvent(new Event("duble_promokod"));
				} else {
					dispatchEvent(new Event("load_promokod"));
				}
				//увы ошибка
			
			
			}
			
			//if (String((e.target).data)=='Error') {
				//trace("#############   Встретилась неизвестная ошибка...");
			//}
			
		}
		public function urlLoaderIOError(e:IOErrorEvent):void {
			trace("############# error...");
		}
	
	}
}