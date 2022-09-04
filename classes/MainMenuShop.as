package classes {
	import AS.encryption.MD5;
	
	import windows.AddMoneyWindow;
	
	import com.carlcalderon.arthropod.Debug;
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.Strong;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextField;
	
	public class MainMenuShop extends Sprite {
		
		public var needToStudy:Boolean = true;
		
		//public var addMoneyBtn	:Sprite = new Sprite();
		public var myMoneyTxt:TextField = new TextField();
		public var myDollarMoneyTxt:TextField = new TextField();
		//public var addMoneyBtn:Sprite = new Sprite();
		public var backArrow:Sprite = new Sprite();
		public var forwArrow:Sprite = new Sprite();
		//public var myOrdersBtn:Sprite = new Sprite();
		public var closeBtn:Sprite = new Sprite();
		//
		public var presents:Sprite = new Sprite();
		public var numOfPresents:int = 0;
		//
		public var ldr:URLLoader = new URLLoader();
		public var getDBReq:URLRequest = new URLRequest();
		//
		private var _root:Sprite = new Sprite();
		private var _server:String = '';
		private var _data:Array = new Array();
		private var presOrder:Array = new Array();
		public var basketWindow:BasketWindow;
		public var basketWindowNeedsStudy:Boolean = true;
		public var t:PreviewWindow;
		public var addM:AddMoneyWindow;
		private var _pres:Object = {};
		private var _presNames:Array = new Array();
		private var exceptions:Array = new Array();
		
		public var needOnlyMoney:Boolean = false;
		//public var needOnlyMoney:Boolean = true;
		//
		public var screens:int = 0;
		public var currentScreen:int = 0;
		public var ani:Tween;
		
		public function MainMenuShop(r:Sprite) {
			super();
			//root.stage.scaleMode = StageScaleMode.NO_SCALE;
			_root = r;
			
			r.addChild(this);
			setEventListeners();
			trace("MAIN_MENU_SHOP = ",(_root as Shop).server);
			
			this._server = (_root as Shop).server;
			Debug.log(_server);
			loadData();
			//this.x = (stage.stageWidth - this.width)/2;
			//this.y = (stage.stageHeight - this.height)/2;
			myOrdersBtn.addEventListener(MouseEvent.CLICK,createBasketWindow);
			myOrdersBtn.label ="мои заказы";
			myMoneyTxt.text = (_root as Shop).money;
			myDollarMoneyTxt.text = (_root as Shop).dollars;
			addMoneyBtn.addEventListener(MouseEvent.CLICK, createMoneyWindow);
			myOrdersBtn.buttonMode = closeBtn.buttonMode = true;
			myOrdersBtn.useHandCursor = closeBtn.useHandCursor = true;
		}
		public function createMoneyWindow(e:MouseEvent = null):void {
			(_root as Shop).updatingAfterMainMenu = true;
			//addM = new windows.AddMoneyWindow(_root, (_root as Shop).userId, true, (_root as Shop).VK);
			addM = new windows.AddMoneyWindow(_root, (_root as Shop).userId, true);
			addM.serverLink = (_root as Shop).server;
		}
		//--> end test
		public function createBasketWindow(e:MouseEvent = null):void {
			//
			var x:Array = new Array();
			var y:Array = presOrder;
			for (var i:int = 0;i<presOrder.length;++i) {
				var t:Array = String(presOrder[i].name).split(new RegExp(/_/g));
				x.push(_data[t[1]]);
				
			}
			basketWindow = new BasketWindow(_root,x,y,this.myMoneyTxt.text,this.myDollarMoneyTxt.text, basketWindowNeedsStudy);
			basketWindowNeedsStudy = false;
			this.visible = false;
		}
		
		public function updateAfterBasket(e:Array):void {
			Debug.log("recieved array after basket:");
			exceptions = new Array();
			for (var t:int = 0;t<e.length;++t) Debug.log("name:"+e[t].name);
			for (var i:int = 0;i<_data.length;++i) {
				var name:String = "pres_"+i;
				//(_pres[name] as PresCell).chooseBtn.enabled = true;
			(_pres[name] as PresCell).chooseBtn.alpha = 1;
			}
			presOrder = e;
			//Debug.log("recieved array in presOrder:");
			//for (var t:int = 0;t<e.length;++t) Debug.log("name:"+presOrder[t].name);
			for (i = 0;i<presOrder.length;++i) {
				name = presOrder[i].name;
				//(_pres[name] as PresCell).chooseBtn.enabled = false;
			(_pres[name] as PresCell).chooseBtn.alpha = .5;
			}
			myMoneyTxt.text = basketWindow.myMoneyTxt.text;
			myDollarMoneyTxt.text = basketWindow.myDollarMoneyTxt.text;
			this.visible = true;
			checkAbilityToBuy();
		}
		
		public function setEventListeners():void {
			closeBtn.addEventListener(MouseEvent.CLICK,function():void {destruct();});
		}
		
		public function loadData():void {
			getDBReq = new URLRequest(_server+'/loaddata.php');
			var v:URLVariables = new URLVariables();
			v.code = (_root as Shop).userCode;
			v.vkid = (_root as Shop).userId;
			getDBReq.data = v;
			getDBReq.method = URLRequestMethod.POST;
			ldr.load(getDBReq);
			ldr.addEventListener(Event.COMPLETE,loadCompleteHandler);
		}
		public function loadCompleteHandler(e:Event):void {
			ldr.removeEventListener(Event.COMPLETE,loadCompleteHandler);
			var s:XML = new XML(ldr.data);
			
			var r:Object = {};
			var sum:int = 0;
			var recievedCode:String = "";
			
			for each(var x:XML in s.children()) {
				if (String(x).indexOf("<")!=-1) {
					trace("url",x['url']);
					r = {name:x['name'],price:x['price'],isNew:x['new'],isAvail:x['avail'],url:x['url'],desc:x['desc'],gamePrice:x['gamePrice']};
					_data.push(r);
					sum += parseInt(r.price) + parseInt(r.gamePrice);
				} else recievedCode = String(x);
			}
			Debug.log("comparing...");
			Debug.log("Recieved code:"+recievedCode);
			var newCode:String = MD5.hash(String(sum));
			Debug.log("Counted code:"+newCode);
			//if (newCode==recievedCode) {
				Debug.log("codes are equal!");
				(_root as Shop).calcUserCode("L");
				createPresents();
			//}
			//else {
				//var pw:PopUpWindow = new PopUpWindow();
				//pw.showPopUp(this, "Nice try, cheater!", false);
			//}
		}
		public function place(num:int,obj:Object):void {
			var e:PresCell = obj as PresCell;
			e.x = int(num/8)*510+(num%4)*130;
			e.y = (num%8<4)?0:170;
		}
		public function createPresents():void {
			var q:Boolean;
			//presents.
			for (var i:int = 0;i<_data.length;++i) {
				//for (var t:String in _data[i]) Debug.log(t,_data[i][t]);
				q = (_data[i].isAvail==1);
				if (q) {
					q = (_data[i].isNew==1);
					var name:String = "pres_"+numOfPresents;
					_pres[name] = new PresCell(_data[i].url,_data[i].price,q,name,_data[i].gamePrice);
					place(numOfPresents,_pres[name]);
					_pres[name].addEventListener(MouseEvent.CLICK,imgClickHandler);
					presents.addChild(_pres[name]);
					_presNames.push(name);
					++numOfPresents;
				}
				
			}
			screens = int(numOfPresents/8);
			currentScreen = 0;
			if (screens>0) enableSlideAnimation();
			
			checkAbilityToBuy();
		}
		
		public function imgClickHandler(e:MouseEvent):void {
			var s:Array = String(e.currentTarget.name).split(new RegExp(/_/g));
			Debug.log(s);
			if (e.target.name!='chooseBtn' && (t==null || !t.created)) {
				var y:PresCell = e.currentTarget as PresCell;
				var url :String = y.imgUrl;
				t = new PreviewWindow(_root,_data[s[1]].desc,url);
				Debug.log(e.currentTarget.name,e.target.name);
				this.alpha = .5;
			}
			if (e.target.name=='chooseBtn' && (t==null || !t.created)) {
				Debug.log('detected');
				e.target.enabled = false;
				for (var i:int = 0;i<presOrder.length;++i)
				{
					var x:PresCell = presOrder[i] as PresCell;
					if (x.name==e.currentTarget.name)
					{
						Debug.log("present already in order!");
						return;	
					}
				}
				
				for (i = 0; i<exceptions.length; ++i) {
					x = exceptions[i] as PresCell;
					if (x.name==e.currentTarget.name) {
						Debug.log("present is unavailable!");
						return;	
					}
				}
				presOrder.push(e.currentTarget);
				var pw:PopUpWindow = new PopUpWindow();
				if (this.needToStudy) {
					this.needToStudy = false;
					pw.showPopUp(this, "Вы положили первый товар в корзину. Чтобы посмотреть товары в корзине, нажмите кнопку \"Мои заказы\"", true, "ok");
				}
				
				Debug.log("added!");
			}
			//t.x = 0;
			//t.y = 0;
			
		}
		public function slideLeft(e:MouseEvent):void {
			slide("left");
			//trace("clicked");
		}
		public function slideRight(e:MouseEvent):void {
			slide("right");
		}
		public function enableSlideAnimation():void {
			if (!backArrow.hasEventListener(MouseEvent.CLICK)) backArrow.addEventListener(MouseEvent.CLICK,slideLeft);
			if (!forwArrow.hasEventListener(MouseEvent.CLICK)) forwArrow.addEventListener(MouseEvent.CLICK,slideRight);
		}
		public function disableSlideAnimation():void {
			if (backArrow.hasEventListener(MouseEvent.CLICK)) backArrow.removeEventListener(MouseEvent.CLICK,slideLeft);
			if (forwArrow.hasEventListener(MouseEvent.CLICK)) forwArrow.removeEventListener(MouseEvent.CLICK,slideRight);
		}
		public function slide(direction:String):void {
			var a:Tween;
			var b:Tween;
			disableSlideAnimation();
			if (direction=="right") {
				++currentScreen;
				if (currentScreen>screens) {
					currentScreen = 0;
					a = new Tween(presents,"x", Strong.easeInOut, presents.x,presents.x - 510,5);
					a.start();
					a.addEventListener(TweenEvent.MOTION_FINISH,function():void {
						b = new Tween(presents,"x",Strong.easeOut,520,61,5);
						b.start();
						b.addEventListener(TweenEvent.MOTION_FINISH, function():void {enableSlideAnimation();});
						
					});
					Debug.log("current screen:"+currentScreen+"; total:"+screens+"; x:"+presents.x);
					return;
				}
				a = new Tween(presents,"x",Strong.easeInOut,presents.x,presents.x - 510,10);
				a.start();
				Debug.log("current screen:"+currentScreen+"; total:"+screens+"; x:"+presents.x);
				a.addEventListener(TweenEvent.MOTION_FINISH, function():void {enableSlideAnimation();});
			}
			if (direction=="left") {
				--currentScreen;
				if (currentScreen<0) {
					currentScreen = screens;
					a = new Tween(presents,"x",Strong.easeInOut,presents.x,presents.x + 510,5);
					a.start();
					a.addEventListener(TweenEvent.MOTION_FINISH,function():void {
						b = new Tween(presents,"x",Strong.easeOut,(screens+1)*-510+61,(screens*-510)+61,5);
						b.start();
						b.addEventListener(TweenEvent.MOTION_FINISH, function():void {enableSlideAnimation();});
					});
					Debug.log("current screen:"+currentScreen+"; total:"+screens+"; x:"+presents.x);
					return;
				}
				a = new Tween(presents,"x",Strong.easeInOut,presents.x,presents.x + 510,10);
				a.start();
				Debug.log("current screen:"+currentScreen+"; total:"+screens+"; x:"+presents.x);
				a.addEventListener(TweenEvent.MOTION_FINISH, function():void {enableSlideAnimation();});
			}
		}
		/*public function updateMoney(newMoney:String):void {
			//myMoneyTxt.text = newMoney;
			try
			{
				var t:int = parseInt(myMoneyTxt.text)+parseInt(newMoney);
			
				myMoneyTxt.text = String(t);
				if ((_root as Shop).gp) {
					(_root as Shop).gp.indexMc.kukubaksi = t;
					(_root as Shop).gp.indexMc.indicatorsMc.kukubaksLable.text = (_root as Shop).gp.indexMc.kukubaksi;
					(_root as Shop).gp.indexMc._insertBillingInfo.init(parseInt(newMoney), "Promocode");
				}
				for (var i:int = 0;i<_data.length;++i) {
					var name:String = "pres_"+i;
					(_pres[name] as PresCell).chooseBtn.enabled = true;
				}
				exceptions = new Array();
				checkAbilityToBuy();
				refreshMoney(t);
			}
			catch (e:Error)
			{
				t = parseInt(myMoneyTxt.text)+parseInt(newMoney);
			
				myMoneyTxt.text = String(t);
				if ((_root as Shop).gp) {
					(_root as Shop).gp.indexMc.kukubaksi = t;
					(_root as Shop).gp.indexMc.indicatorsMc.kukubaksLable.text = (_root as Shop).gp.indexMc.kukubaksi;
					(_root as Shop).gp.indexMc._insertBillingInfo.init(parseInt(newMoney), "Promocode");
				}
			}
			
			
		}*/
		public function refreshMoney(x:int):void {
			//server money refreshing
			//don't forget to refresh money in globalParams!
		}
		public function destruct():void {
			_root.removeChild(this);
			_root = new Sprite();
			numOfPresents = 0;
			presents = new Sprite();
		}
		
		public function checkAbilityToBuy():void {
			for (var i:int = 0;i<numOfPresents;++i) {
				var name:String = "pres_"+i;
				if ((parseInt((_pres[name] as PresCell).priceTxt.text)>parseInt(myMoneyTxt.text))
					||(parseInt((_pres[name] as PresCell).inGamePriceTxt.text)>parseInt(myDollarMoneyTxt.text))) {
					exceptions.push(_pres[name]);
					//_pres[name].chooseBtn.enabled = false;
					_pres[name].chooseBtn.alpha = .5;
				}
			}
		}
	}
}