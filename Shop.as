package {
	import AS.encryption.MD5;
	
	import classes.MainMenuShop;
	import classes.PopUpWindow;
	
	import com.carlcalderon.arthropod.Debug;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	
	import vk.APIConnection;
	import vk.events.CustomEvent;
	
	public class Shop extends Sprite {
		public static var mainClass:Shop;
		
		private var _server:String = '';
		public var mm:MainMenuShop;
		public var popUp:PopUpWindow = new PopUpWindow();
		private var _userId:String = '';
		private var _money:String = '';
		private var _dollars:String = '';
		
		private var _api_secret:String = "";
		private var _secretChars:String = "";
		
		public var userCode:String = "";
		
		public var statusTxt:TextField = new TextField();
		public var VK: APIConnection;
		
		public var updatingAfterMainMenu:Boolean = false;
		
		//temporary variables
		var sn:String = "";
		var m:int = 0;
		public var u:String = "";
		var d:int = 0;
		//
		
		public var gp;
		public var flashVars:Object = {};
		
		public function Shop(
			servName:String = 'http://5.9.149.107/ruzikland_pre_release/shopAdmin/updated',
			//servName:String = 'http://shop-admin.com',
							 yourMoney:int = 0, yourDollars:int = 0, 
							 uid:String = "1", GP = null) {
			mainClass = this;
			sn = servName;
			m = yourMoney;
			d = yourDollars;
			//m = 100000;
			//d = 5000000;
			u = uid;
			gp = GP;
			
			if (stage) init(); else 
				addEventListener(Event.ADDED_TO_STAGE,init);
		}
		public function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.server = sn;
			flashVars = Object(stage.loaderInfo.parameters); 
			
			Debug.log("Width:"+this.width+"\nHeight:"+this.height);
			
			if (flashVars.api_id) {
				Debug.log("\n// -- Your code for local testing:\n");
				Debug.log("flashVars['api_id'] = " + flashVars['api_id'] + ";");
				Debug.log("flashVars['viewer_id'] = " + flashVars['viewer_id'] + ";");
				Debug.log("flashVars['sid'] = \"" + flashVars['sid'] + "\";");
				Debug.log("flashVars['secret'] = \"" + flashVars['secret'] + "\";");
				Debug.log("// -- //\n\n");
			} 
			if (flashVars.api_id) {
				this._userId = String(flashVars.viewer_id);
				Debug.log("OK, VK loaded! ID:"+this.userId+"\n");
				//VK.api("users.get", {uids:"6513731"}, apiRequestSuccess, apiRequestFail);
			}
			else {
				//localtesting
				flashVars['api_id'] = 1867205;
				flashVars['viewer_id'] = 6513731;
				flashVars['sid'] = "3f5eaf4ed85f196a965226f7bcc9817b9abfdf0fe8a17f1335305d47f32c4c";
				flashVars['secret'] = "024f476445";
				//
				Debug.log("Error, in VK prop. Check if it is VK...");
				this._userId = "6513731";
				//VK = null;
			}
			VK = new APIConnection(flashVars);
			
			if (this.userId=='') {
				popUp.showPopUp(this,"Error, some problems occured...  Try to reload the page.",false);
				return;
			}
			//popUp = new PopUpWindow();
			popUp.showPopUp(this,"Please wait, loading...",false);
			getProtectedKey();
			//
		}
		public function getProtectedKey():void {
			var ldr:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest(this.server+"/getProtectedKey.php");
			var v:URLVariables = new URLVariables();
			v.id = this._userId;
			req.data = v;
			
			ldr.addEventListener(Event.COMPLETE, loadCompleteHandler);
			ldr.load(req);
		}
		public function calcUserCode(newChar:String):void {
			_api_secret += newChar;
			userCode = MD5.hash(_api_secret);
			Debug.log("==========================");
			Debug.log("new user code:"+userCode);
			Debug.log("new secret api:"+_api_secret);
		}
		public function loadCompleteHandler(e:Event):void {
			var ans:String = String((e.target).data);
			
			//var _secretChars:String = "";
			
			var uid:String = this.userId;
			for (var i:int = 0;i<uid.length;++i) {
				_secretChars+=String.fromCharCode(uid.charCodeAt(uid.length-i-1)+117);
			}
			_api_secret = _secretChars+ans;
			userCode = MD5.hash(_api_secret);
			Debug.log("==========================");
			Debug.log("user code:"+userCode);
			Debug.log("secret api:"+_api_secret);
			
			//Debug.log("code:"+_api_secret);
			//Debug.log("hash:"+userCode);
			this.money = String(m);
		}
		public function set server(s:String):void {
			_server = s;
		}
		public function get server():String
		{
			return _server;
		}
		public function get userId():String
		{
			return _userId;
		}
		public function get money():String
		{
			return _money;
		}
		public function get dollars():String {
			return _dollars;
		}
		public function set money(s:String):void {
			this._dollars = String(d);
			this._money = s;
			Debug.log("Money: "+s);
			if (mm) mm.destruct();
			mm = new MainMenuShop(this);
			popUp.hide();
			
			dispatchEvent(new Event("mainMenuCreated"));
		}
	}
}