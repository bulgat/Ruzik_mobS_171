package classes {
	import AS.encryption.MD5;
	
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
	
	public class MakeOrderWindow extends Sprite {
		
		public var surnameTxt:TextInput = new TextInput();
		public var nameTxt:TextInput = new TextInput();
		public var fathernameTxt:TextInput = new TextInput();
		public var addressTxt:TextInput = new TextInput();
		public var cityTxt:TextInput = new TextInput();
		public var indexTxt:TextInput = new TextInput();
		public var streetTxt:TextInput = new TextInput();
		public var houseTxt:TextInput = new TextInput();
		public var blockTxt:TextInput = new TextInput();
		public var buildTxt:TextInput = new TextInput();
		public var flatTxt:TextInput = new TextInput();
		public var emailTxt:TextInput = new TextInput();
		public var phoneTxt:TextInput = new TextInput();
		
		//public var acceptBtn:Sprite = new Sprite();
		//public var rejectBtn:Sprite = new Sprite();
		
		public var successTxt:TextField = new TextField();
		public var presents:String = '';
		public var numPresents:String = '';
		
		public var popUp:PopUpWindow = new PopUpWindow();
		private var _root:Sprite = new Sprite();
		
		private var _savedRequest:URLRequest;
		private var _savedLdr:URLLoader;
		private var _savedMD5String:String = "";
		private var _savedVars:URLVariables;
		
		public var presentsCost:int = 0;
		public var presentsCostKB:int = 0;
		
		public function MakeOrderWindow(r:Sprite,pres:String,numPres:String) {
			
			super();
			acceptBtn.addEventListener(MouseEvent.CLICK,collectAndSend);
			acceptBtn.label = "принять"
			successTxt.visible = false;
			_root = r;
			_root.addChild(this);
			presents = pres;
			numPresents = numPres;
			rejectBtn.addEventListener(MouseEvent.CLICK,closeHandler);
			rejectBtn.label = "назад к призам"
			acceptBtn.buttonMode = rejectBtn.buttonMode = true;
			acceptBtn.useHandCursor = rejectBtn.useHandCursor = true;
		
		}
		public function closeHandler(e:MouseEvent):void {
			this.destruct("Cancel");
		}
		public function collectAndSend(e:MouseEvent):void {
			if (surnameTxt.text=='' || nameTxt.text=='' || fathernameTxt.text=='') return;
			var fullName:String = surnameTxt.text + " " + nameTxt.text+ ' ' + fathernameTxt.text;
			
			if (addressTxt.text=='') return;
			var addr:String = addressTxt.text;
			Debug.log(addr);
			if (cityTxt.text=='' || indexTxt.text=='' || streetTxt.text=='' || houseTxt.text=='') return;
			var fullAddr:String = cityTxt.text+', '+indexTxt.text+', '+streetTxt.text+', д.'+houseTxt.text;
			if (blockTxt.text!='') fullAddr+=', к.'+blockTxt.text;
			if (buildTxt.text!='') fullAddr+=', стр.'+buildTxt.text;
			if (flatTxt.text!='') fullAddr+=', кв.'+flatTxt.text;
			Debug.log(fullAddr);
			if (emailTxt.text=='') return;
			var email:String = emailTxt.text;
			if (phoneTxt.text=='') return;
			var phone:String = phoneTxt.text;
			Debug.log(email);
			Debug.log(phone);
			var ldr:URLLoader = new URLLoader();
			//var req:URLRequest = new URLRequest((_root as Shop).server+"/sendOrder.php");
			var req:URLRequest = new URLRequest(globalParams.SERVER_shop+"/sendOrder.php");
			
			var v:URLVariables = new URLVariables();
			v.fullname = fullName;
			v.fulladdress = fullAddr;
			v.address = addr;
			v.email = email;
			v.phone = phone;
			v.presents = presents;
			v.numpres = numPresents;
			v.userid = (_root as Shop).userId;
			//v.verify = MD5.hash();
			//Debug.log(v.toString());
			//req.data = v;
			//ldr.load(req);
			_savedRequest = req;
			_savedLdr = ldr;
			_savedVars = v;
			_savedMD5String = presents+numPresents;
			
			if (rejectBtn.hasEventListener(MouseEvent.CLICK)) rejectBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
			popUp.showPopUp(this,"Please, wait while checking ability to buy...",false);
			ldr = new URLLoader();
			req = new URLRequest((_root as Shop).server+"/secureCheck.php");
			
			v = new URLVariables();
			v.id = (_root as Shop).userId;
			v.code = (_root as Shop).userCode;
			v.kb = presentsCostKB;
			v.dolls = presentsCost;
			v.check = MD5.hash(String(presentsCostKB) + String(presentsCost) + (_root as Shop).userCode);
			trace(v.check);
			
			req.data = v;
			ldr.addEventListener(Event.COMPLETE, secureCheckAnswer);
			trace('####################   sending...',presents,"!!!!");
			Debug.log('sending...');
			ldr.load(req);
		}
		public function secureCheckAnswer(e:Event):void {
			Debug.log('got answer!');
			Debug.log("answer:"+String((e.target).data));
			trace("  magazin  SECURE ",String((e.target).data));
			//if (String((e.target).data)=='true') {
				(_root as Shop).calcUserCode("#");
				sendRequest();
			//}
			//else popUp.showPopUp(this,"Some errors occured; It seems like your balance don't have enough money to proceed checkout.",true, "ok");
		
		}
		public function compressString(oldString:String):String {
			var res:String = "";
			for (var i:int = 0;i<oldString.length;++i) 
				res+=String(oldString.charCodeAt(i));
			return res;
		}
		public function sendRequest():void {
			popUp.showPopUp(this,"Please wait, sending request...",false);
			_savedMD5String = compressString(_savedMD5String);
			trace("String:"+_savedMD5String);
			_savedVars.code = (_root as Shop).userCode;
			_savedVars.verify = MD5.hash(_savedMD5String);
			trace("MD5 String:"+_savedVars.verify);
			
			_savedRequest.data = _savedVars;
			
			_savedLdr.load(_savedRequest);
			_savedLdr.addEventListener(Event.COMPLETE, responseTransactionSuccess);
		}
		public function responseTransactionSuccess(e:Event):void {
			var response:String = (e.target as URLLoader).data;
			trace();
			trace();
			trace("#########################################################################");
			trace((_root as Shop).server,"______________________Response: "+response);
			
			if (response.slice(0,7)=='Success') {
				(_root as Shop).calcUserCode("%");
				decreaseNetworkCost();
				popUp.showPopUp(this,"Request sent. You will recieve an e-mail in few time.",true, "ok");
				popUp.okBtn.addEventListener(MouseEvent.CLICK, function():void {
					destruct("Success");
				});
			} else {
				popUp.showPopUp(this,"Some errors occured, contact the administrator to resolve the issue.",true, "ok");
				popUp.okBtn.addEventListener(MouseEvent.CLICK, function():void {
					destruct("Cancel");
				});
			}
		}
			/*ldr.addEventListener(Event.COMPLETE, function():void {
				decreaseNetworkCost();
				if (acceptBtn.hasEventListener(MouseEvent.CLICK)) acceptBtn.removeEventListener(MouseEvent.CLICK,collectAndSend);
				successTxt.visible = true;
				var t:Timer = new Timer(1000,3);
				t.start();
				t.addEventListener(TimerEvent.TIMER, function():void {
					successTxt.text = "Запрос успешно отправлен! \n(это окно закроется через "+(3-t.currentCount).toString()+" секунды)";
				});
				t.addEventListener(TimerEvent.TIMER_COMPLETE, function():void {
					destruct("Success");
				});
			});*/
		//}
		public function decreaseNetworkCost():void {
			trace("decreaseNetworkCost",(_root as Shop).gp,"__");
			if ((_root as Shop).gp) {
				trace("##########################  presentsCostKB =",presentsCostKB);
				var oldMoneyKB:int = parseInt(String((_root as Shop).gp.indexMc.kukubaksi));
				(_root as Shop).gp.indexMc.kukubaksi = oldMoneyKB-presentsCostKB;
				
				//(_root as Shop).gp.indexMc.indicatorsMc.kukubaksLable.text = String((_root as Shop).gp.indexMc.kukubaksi);
				(_root as Shop).gp.indexMc._lands_Interface.refresh_indicator();
				(_root as Shop).gp.indexMc.currentMoneyFn(-presentsCost);
				(_root as Shop).gp.indexMc._insertBillingInfo.init(-presentsCostKB, "payment");
			} else Debug.log("You are not in game, or some errors occured...");
		}
		public function destruct(res:String):void {
			(_root as Shop).mm.basketWindow.reload(res);
			_root.removeChild(this);
		}
	}
}