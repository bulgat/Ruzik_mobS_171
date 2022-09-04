package windows {
	import AS.encryption.MD5;
	
	import classes.AddMoneyEvent;
	import classes.PopUpWin_;
	import classes.json.JSON;
	
	import com.carlcalderon.arthropod.Debug;
	
	import fl.controls.NumericStepper;
	import fl.controls.TextInput;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import fl.controls.NumericStepper;
	//import vk.APIConnection;
	//import vk.events.CustomEvent;
	
	public class AddMoneyWindow extends Sprite {
		//visual elements
		
		public var closeBtn:Sprite = new Sprite();
		public var codeTxt:TextInput = new TextInput();
		public var statusTxt:TextField = new TextField();
		//public var VK:APIConnection;
		public var totalVotesNS:NumericStepper = new NumericStepper();
		
		public var windowBG:Sprite = new Sprite();
		
		public var exportBtn:Sprite = new Sprite();
		
		//old variables
		public var oldMoney:int = 0;
		public var votesTransferred:Number = 0;
		
		//new variables
		public var serverEnabled:Boolean = false;
		public var popUp:PopUpWin_ = new PopUpWin_();
		public var useExistingKey:Boolean = true;
		private var _serverLink:String = "";
		private var _uid:String = "";
		private var _api_secret:String = "";
		public var userCode:String = "";
		public var transactionHistory:String = "";
		
		//consts
		public static const NEW_SECURE_KEY:String = "getProtectedKey.php";
		public static const GET_SECURE_KEY:String = "getExistingProtectedKey.php";
		//public static const promocod_SEND_CODE:String = "sendPromocode.php";
		public static const promocod_SEND_CODE:String = "checkcode.php";
		
		private var _root:Sprite = new Sprite();
		/**
		 * AddMoneyWindow (constructor)
		 * r - root sprite, on which you want to place this window
		 * vk - api to vk.com, needed to transfer votes
		 * uid - user id
		 * useExistingKey - flag, true if you load this window from Shop classes
		 */
		public var _add_promokod_old:add_promokod_old = new add_promokod_old();
		//public var _send_mail:send_mail = new send_mail();
		public var _list_promo:list_promo = new list_promo();
		
		public function AddMoneyWindow(r:Sprite = null, uid:String = "6513731", useExistingKey:Boolean = true) {
			//, existingAPI:APIConnection = null
			this.useExistingKey = useExistingKey;
			this._uid = uid;
			addVKVotesBtn.useHandCursor = enterPromoCodeBtn.useHandCursor = closeBtn.useHandCursor =  true;
			addVKVotesBtn.buttonMode = enterPromoCodeBtn.buttonMode = closeBtn.buttonMode =  true;
			addVKVotesBtn.label = "добавить"
			closeBtn.addEventListener(MouseEvent.CLICK, function():void {destruct();});
			//initVK(existingAPI);
			if (r) {
				trace("Started amw from constructor!");
				_root = r;
				_root.addChild(this);
				initSecureKeysConnection();
				if (serverEnabled) processPromos();
				this.allowInput.text="";
				if (r.stage.displayState != null)
				{
					if ("fullScreen"==r.stage.displayState.toString())
					{
						this.allowInput.text="(выйдите из полноэкранного режима, что бы ввести промокод)";
					}
				}
			
			}
						
			totalVotesNS.visible = false;
			
			//addVKVotesBtn.visible = false;
			addVKVotesBtn.addEventListener(MouseEvent.CLICK, getVotes);
		num_st.addEventListener(Event.CHANGE,num_st_change);
		}
		var rate:int=1
		public function num_st_change(e:Event):void
		{
			var nsTarget:NumericStepper = e.target as NumericStepper;
			rate = nsTarget.value;
			globalParams.indexMc._soundProcessor.playSnd ("click");
			//MovieClip(root).MusicOut('Moneyout');
		}
		public function start(r:Sprite):void {
			Debug.log("Started amw!");
			_root = r;
			_root.addChild(this);
			initSecureKeysConnection();
			if (serverEnabled) processPromos();
		}
		
		private function getVotes(e:MouseEvent):void {
			trace("  add GOLOS",rate);
			globalParams.global_Log.push(" \n add GOLOS @@@@@@@@@@")
			globalParams.indexMc._lands_Interface._Friend_API.add_Votes(rate);
			//VK.callMethod("showOrderBox", {type:'votes', votes:totalVotesNS.value});
		}
		
		private function successWithdrawHandler(e:Object):void {
			Debug.log("Success!", Debug.GREEN);
			for (var s:String in e) {
				Debug.log(String(s)+":"+String(e[s]));
			}
			Debug.log("Event dispatched!", Debug.BLUE);
			
			var evt:AddMoneyEvent = new AddMoneyEvent(AddMoneyEvent.MONEY_ADDED);
			evt.moneyAdded = 2*totalVotesNS.value;
			_root.dispatchEvent(evt);
			
			popUp.showPopUp(this, "Transaction successful!", true, "ok");
		}
		//-----------------------------------------------
		//------------------- Promos part of code
		
		//code to start own server secure keys system
		public function initSecureKeysConnection():void {
			if (serverEnabled) {
				Debug.log("Loading key...");
				var link:String = _serverLink;
				if (this.useExistingKey) link+=AddMoneyWindow.GET_SECURE_KEY; 
					else link+=AddMoneyWindow.NEW_SECURE_KEY;
				var req:URLRequest = new URLRequest(link);
				var v:URLVariables = new URLVariables();
				v.id = this._uid;
				req.data = v;
				var ldr:URLLoader = new URLLoader();
				ldr.addEventListener(Event.COMPLETE, loadCompleteHandler);
				ldr.load(req);
			}
		}
		
		public function calcNewCode(newChar:String):void {
			transactionHistory += newChar;
			userCode = MD5.hash(_api_secret+transactionHistory);
			Debug.log("==========================");
			Debug.log("new user code:"+userCode);
			Debug.log("new secret api:"+_api_secret+transactionHistory);
			Debug.log("--------------------------");
		}
		public function initKey(s:String):void {
			_api_secret = s;
			userCode = MD5.hash(_api_secret);
			Debug.log("==========================");
			Debug.log("secret api:"+_api_secret);
			Debug.log("user code:"+userCode);
			Debug.log("--------------------------");
		}
		public function loadCompleteHandler(e:Event):void {
			var ans:String = String((e.target).data);
			var uid:String = this._uid;
			var _secretChars:String = "";
			for (var i:int = 0;i<uid.length;++i) {
				_secretChars+=String.fromCharCode(uid.charCodeAt(uid.length-i-1)+117);
			}
			initKey(_secretChars+ans);
		}
		//------------------------------------------------
		public function processPromos():void {
			enterPromoCodeBtn.addEventListener(MouseEvent.CLICK, sendPromocodeData);
			enterPromoCodeBtn.label = "принять"
		}
		
		
		
		
		
		
		//послать промокод
		public function sendPromocodeData(e:MouseEvent):void {
			if (codeTxt.text=='') {
				popUp.showPopUp(this, "Никаго промокода не обнаружено.", true, "ok");
			return;}
			popUp.showPopUp(this, "Подождите, идет проверка промокода...", false);
			addChild(_add_promokod_old);
			_add_promokod_old.launch_promo(codeTxt.text,userCode);
			_add_promokod_old.addEventListener("load_promokod",_load_promokod);
			_add_promokod_old.addEventListener("ok_load_promokod",_ok_load_promokod);
			_add_promokod_old.addEventListener("duble_promokod",_duble_promokod);
			/*
			if (userCode=='') return;
			var req:URLRequest = new URLRequest(_serverLink + promocod_SEND_CODE);
			var v:URLVariables = new URLVariables();
			v.uid = this._uid;
			v.code = MD5.hash(codeTxt.text);
			v.check = userCode;
			req.data = v;
			var ldr:URLLoader = new URLLoader();
			ldr.addEventListener(Event.COMPLETE, promoResponseHandler);
			ldr.load(req);
		*/
		//_send_mail._Mail(globalParams.UID,codeTxt.text);
		}
		public function _load_promokod(e:Event):void 
		{
			popUp.showPopUp(this, "Ваш промо-код требует проверки модератором, которое будет проведена в течение 2 дней... ", true, "ok");
			_list_promo.launch_promo(globalParams.UID,codeTxt.text,false)
			
		}
		public function _ok_load_promokod(e:Event):void 
		{
			popUp.showPopUp(this, "Ваш промокод прошел проверку и зачислен на ваш счет.", true, "ok");
			_list_promo.launch_promo(globalParams.UID,codeTxt.text,true)
			
		}
		public function _duble_promokod(e:Event):void 
		{
			popUp.showPopUp(this, "Этот промокод уже вводили.", true, "ok");
			_list_promo.launch_promo(globalParams.UID,codeTxt.text,false)
			
		}
		public function promoResponseHandler(e:Event):void {
			var response:String = (e.target as URLLoader).data;
			var obj:Object = JSON.parse(response);
			//var obj:Object = JSON.decode(response);
			if (obj.status == 1) {
				popUp.showPopUp(this, "Transaction successful!", true, "ok");
				calcNewCode("$");
				
				Debug.log("Event dispatched!", Debug.BLUE);
				
				var evt:AddMoneyEvent = new AddMoneyEvent(AddMoneyEvent.MONEY_ADDED);
				evt.moneyAdded = 10;
				_root.dispatchEvent(evt);
			} else {
				popUp.showPopUp(this, "Errors occured while trying to add money!", true, "ok");
			}
			trace(response);
		}
		//------------------------------------------------
		public function destruct():String {
			Debug.log("AddMoneyWindow destructed, transactions:"+transactionHistory);
			_root.removeChild(this);
			_root.visible = true;
			_root.alpha = 1;
			
			var evt:AddMoneyEvent = new AddMoneyEvent(AddMoneyEvent.DEFAULT);
			evt.transactionHistory = transactionHistory;
			_root.dispatchEvent(evt);
			
			return transactionHistory;
		}
		
		public function set serverLink(link:String):void {
			_serverLink = link+"/";
			serverEnabled = true;
			initSecureKeysConnection();
			processPromos();
		}
	}
}