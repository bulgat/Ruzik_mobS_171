package classes {
	/**
	 * @author dark wizard
	 **/
	import AS.encryption.MD5;
	
	import com.carlcalderon.arthropod.Debug;
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;

	public class BasketWindow extends Sprite {
		
		public var needToStudy:Boolean = true;
		
		public var myMoneyTxt	:TextField = new TextField();
		public var myDollarMoneyTxt	:TextField = new TextField();
		public var sumTxt		:TextField = new TextField();
		public var sumDollsTxt	:TextField = new TextField();
		//public var backBtn		:Sprite = new Sprite();
		//public var makeOrderBtn	:Sprite = new Sprite();
		//public var addMoneyBtn	:Sprite = new Sprite();
		public var closeBtn		:Sprite = new Sprite();
		
		public var popup:PopUpWindow;
		
		public var pres			:Sprite = new Sprite(); 
		
		private var _root		:Sprite = new Sprite();
		private var presents	:Array = new Array();
		private var rootNames	:Array = new Array();
		private var cont		:Object = {};
		//<!--test part of code
		public var scrollMC		:Sprite = new Sprite();
		
		public const MASK_HEIGHT:int = 230;
		public var oldY			:int = 0;
		
		public var bounds		:Rectangle;
		public var scrolling	:Boolean = false;
		
		public var globalParams	:Object = {};
		//-->end test part
		
		public var sendPresArray:String = "";
		public var sendNumArray:String = "";
		
		public var emptyTextTxt:TextField = new TextField();
		public function BasketWindow(par:Sprite,arr:Array,names:Array,money:String,dollMoney:String, study:Boolean = false) {
			super();
			this.needToStudy = study;
			_root = par;
			_root.addChild(this);
			//_root.visible = false;
			sumTxt.text = '0';
			sumDollsTxt.text = '0';
			presents = arr;
			myMoneyTxt.text = money;
			myDollarMoneyTxt.text = dollMoney;
			rootNames = names;
			for (var i:int = 0;i<names.length;++i) Debug.log("name"+i+":"+rootNames[i].name);
			
			genPresentsList(presents);
			addHandlers();
			bounds = new Rectangle(scrollMC.x,scrollMC.y,0,230);
			
			//<!--test part
			//Listen when the user is holding the mouse down on the scrollMC
			scrollMC.addEventListener(MouseEvent.MOUSE_DOWN, startScroll);
			
			//Listen when the user releases the mouse button
			stage.addEventListener(MouseEvent.MOUSE_UP, stopScroll);
			addEventListener(Event.ENTER_FRAME, enterHandler);
			//--> end test part
			
			makeOrderBtn.addEventListener(MouseEvent.CLICK,makeOrderHadler);
			makeOrderBtn.label="оформить заказ"
			addMoneyBtn.addEventListener(MouseEvent.CLICK,addMoneyClickHandler);
			
			backBtn.buttonMode = makeOrderBtn.buttonMode = addMoneyBtn.buttonMode = closeBtn.buttonMode = true;
			backBtn.useHandCursor = makeOrderBtn.useHandCursor = addMoneyBtn.useHandCursor = closeBtn.useHandCursor = true;
			
			var pw:PopUpWindow = new PopUpWindow();
			if (this.needToStudy) {
				this.needToStudy = false;
				pw.showPopUp(this, "Здесь вы можете посмотреть свои заказы. Кнопками \"+\" и \"-\" вы можете менять количество, кнопка \"х\" удаляет товар из корзины.", true, "ok");
			}
		}
		public function addMoneyClickHandler(e:MouseEvent):void {
			sumTxt.text = '0';
			sumDollsTxt.text = '0';
			for (var i:int = 0;i<presents.length;++i) {
				var name:String = rootNames[i].name;
				(cont[name] as PresViewField).numTxt.text = '0';
			}
			//(_root as Shop).updatingAfterMainMenu = false;
			//var addM:AddMoneyWindow = new AddMoneyWindow(_root);
			//this.visible = false;
		}
		/*public function updateMoney(newMoney:String):void {
			//myMoneyTxt.text = newMoney;
			var t:int = parseInt(myMoneyTxt.text)+parseInt(newMoney);
			myMoneyTxt.text = String(t);
			if ((_root as Shop).gp) {
				(_root as Shop).gp.indexMc.kukubaksi = t;
				(_root as Shop).gp.indexMc.indicatorsMc.kukubaksLable.text = (_root as Shop).gp.indexMc.kukubaksi;
			}
			reload("Success");
			
			//Shop.mainClass.gp.indexMc.kukubaksi +=1000;
//			Shop.mainClass.gp.indexMc.indicatorsMc.kukubaksLable.text = Shop.mainClass.gp.indexMc.kukubaksi;
//				
		}*/
		public function makeOrderHadler(e:MouseEvent):void {
			if (presents.length==0) return;
			if (sumTxt.text=='0' && sumDollsTxt.text=='0') return;
			var s:String = '';//(cont[rootNames[0].name] as PresViewField).numTxt.text;
			var totalPres:String = '';//(cont[rootNames[0].name] as PresViewField).nameTxt.text;
			Debug.log("Gotta! Current num:"+s+"; curr pres:"+totalPres);
			trace("BASKET L=",presents.length);
			for (var i:int = 0;i<presents.length;++i) {
				var name:String = rootNames[i].name;
				if ((cont[name] as PresViewField).numTxt.text=='0') continue;
				else {
					Debug.log("Added to totalPresents!");
					s+=(cont[name] as PresViewField).numTxt.text+";";
					totalPres+=(cont[name] as PresViewField).nameTxt.text+';';
				}
			trace("BASKET  =",(cont[name] as PresViewField).nameTxt.text,(cont[name] as PresViewField).descTxt.text);
			}
			s = s.slice(0,s.length-1);
			totalPres = totalPres.slice(0,totalPres.length-1);
			Debug.log("Total num:"+s+"; total pres:"+totalPres);
			//if (globalParams.secureCheck(myMoneyTxt.text)) {
			var sumKB:int = parseInt(sumTxt.text);
			var sum:int = parseInt(sumDollsTxt.text);
			trace("BASKET          totalPres=",totalPres);
			sendPresArray = totalPres;
			sendNumArray = s;
			
			popup = new PopUpWindow();
			popup.showPopUp(this,"Please, wait while checking ability to buy...",false);
			
			secureCheck();
			this.addEventListener("secureCheckSuccess",secureCheckSuccess);
			//}
		}
		public function secureCheckSuccess(e:Event):void {
			var sumKB:int = parseInt(sumTxt.text);
			var sum:int = parseInt(sumDollsTxt.text);
			
			popup.hide();
			
			(_root as Shop).calcUserCode("#");
			trace(" BASKET  MakeOrderWindow",_root,"pres=",sendPresArray, sendNumArray);
			var mo:MakeOrderWindow = new MakeOrderWindow(_root,sendPresArray, sendNumArray);
			visible = false;
			mo.presentsCost = sum;
			mo.presentsCostKB = sumKB;
		}
		public function secureCheck():void {
			//logic to check user's money...
			Debug.log("collecting data...");
			var ldr:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest((_root as Shop).server+"/secureCheck.php");
			var v:URLVariables = new URLVariables();
			v.id = (_root as Shop).userId;
			v.code = (_root as Shop).userCode;
			v.kb = this.sumTxt.text;
			v.dolls = this.sumDollsTxt.text;
			v.check = MD5.hash(this.sumTxt.text+this.sumDollsTxt.text + (_root as Shop).userCode);
			req.data = v;
			//Debug.log("md5code:"+MD5.hash((_root as Shop).userCode));
			ldr.addEventListener(Event.COMPLETE, secureCheckAnswer);
			Debug.log('sending...');
			ldr.load(req);
		}
		public function secureCheckAnswer(e:Event):void {
			Debug.log('got answer!');
			Debug.log("answer:"+String((e.target).data));
			//if (String((e.target).data)=='true') {
				dispatchEvent(new Event("secureCheckSuccess"));
				//}
			//else {
				//popup.showPopUp(this,"Some errors occured; It seems like your balance don't have enough money to proceed checkout.",true, "ok");
			//}
		}
		//reload breakpoint
		public function reload(s:String):void {
			if (s=='Success') {
				var t:int = parseInt(myMoneyTxt.text)-parseInt(sumTxt.text);
				myMoneyTxt.text = String(t);
				t = parseInt(myDollarMoneyTxt.text)-parseInt(sumDollsTxt.text);
				myDollarMoneyTxt.text = String(t);
				for (var i:int = 0;i<presents.length;++i) {
					var name:String = rootNames[i].name;
					(cont[name] as PresViewField).numTxt.text = '0';
				}
				recount();
				refreshMoney();
			}
			if (s=='Cancel') Debug.log("Order canceled!");
			this.visible = true;
		}
		public function refreshMoney():void {
			//server money refreshing
			//don't forget to refresh money in globalParams!
			
		}
		public function recount():void {
			var money:int = 0;
			var dolls:int = 0;
			for (var i:int = 0;i<presents.length;++i) {
				var name:String = rootNames[i].name;
				var x:int = parseInt((cont[name] as PresViewField).numTxt.text)*parseInt((cont[name] as PresViewField).priceTxt.text);
				var y:int = parseInt((cont[name] as PresViewField).numTxt.text)*parseInt((cont[name] as PresViewField).dollarPriceTxt.text);
				money+=x;
				dolls+=y;
			}
			if (presents.length==0) emptyTextTxt.visible = true;
			sumTxt.text = String(money);
			sumDollsTxt.text = String(dolls);
		}
		private function genPresentsList(e:Array):void {
			for (var i:int = 0;i<e.length;++i) {
				//var r:PresCell = e[i] as PresCell;
				Debug.log('----------------------');
				var name:String = rootNames[i].name;
				Debug.log(name);
				//for (var s:String in e[i]) Debug.log(s,e[i][s]);
				cont[name] = new PresViewField(e[i].name,e[i].desc,e[i].price,e[i].url,name,e[i].gamePrice);
				cont[name].deleteBtn.addEventListener(MouseEvent.CLICK,removeCurrentPresent);
				(cont[name] as PresViewField).incBtn.addEventListener(MouseEvent.CLICK,increase);
				(cont[name] as PresViewField).decBtn.addEventListener(MouseEvent.CLICK,decrease);
				pres.addChild(cont[name]);
				cont[name].y = i*108;
			}
			if (e.length!=0) emptyTextTxt.visible = false;
			//refreshMoney();
			recount();
		}
		public function removeCurrentPresent(e:MouseEvent):void {
			Debug.log("clicked:"+e.target.parent.name);
			var deleted:String = e.target.parent.name;
			var x:PresViewField = e.target.parent as PresViewField;
			var tw:Tween = new Tween(x,"alpha",null,1,0,7);
			tw.start();
			var s:Array = String(e.target.parent.name).split(new RegExp(/_/g));
			///**/
			var sI:int = 0;
			for (var i:int = 0;i<presents.length;++i) {
				var name:String = rootNames[i].name;
				if (name==deleted) {
					presents.splice(i,1);
					rootNames.splice(i,1);
					sI = i;
					break;
				}
			}
			//presents.splice(s[1],1);
			//rootNames.splice(s[1],1);
			Debug.log("left (in rootNames):");
			for (i = 0;i<presents.length;++i) {
				Debug.log(rootNames[i].name);
			}
			tw.addEventListener(TweenEvent.MOTION_FINISH,function():void {
				//Debug.log(presents);
				//for (var z:int = 0;z<presents.length;++z) Debug.log("pres_"+z);
				pres.removeChild(cont[deleted]);
				for (var i:int = sI;i<presents.length;++i) {
					var name:String = rootNames[i].name;
					Debug.log("attempting to move: "+name);
					//Debug.log(cont[name].name);
					//var r:Tween = new Tween(cont[name],"y",null,cont[name].y,cont[name].y-108,5);
					//pres.removeChild(cont[name]);
					cont[name].y -= 108;
					//r.start();
				}
				recount();
			});
		}
		public function addHandlers():void {
			backBtn.addEventListener(MouseEvent.CLICK,function():void {destruct();});
			backBtn.label="назад к призам"
			closeBtn.addEventListener(MouseEvent.CLICK,function():void {(_root as Shop).mm.destruct();});
		}
		private function destruct():void {
			(_root as Shop).mm.updateAfterBasket(rootNames);
			//(_root as Shop).mm.vi
			_root.removeChild(this);
		}
		public function increase(e:MouseEvent):void {
			var curMoney:int = parseInt(myMoneyTxt.text);
			var curDolls:int = parseInt(myDollarMoneyTxt.text);
			var obj:PresViewField = e.target.parent as PresViewField;
			//Debug.log(obj.name);
			var curNum:int = parseInt(obj.numTxt.text);
			var newMoney:int = parseInt(sumTxt.text)+parseInt(obj.priceTxt.text);
			var newDolls:int = parseInt(sumDollsTxt.text)+parseInt(obj.dollarPriceTxt.text);
			if (newMoney>curMoney || curNum+1>99 || newDolls>curDolls) return;
			++curNum;
			sumTxt.text = String(newMoney);
			sumDollsTxt.text = String(newDolls);
			obj.numTxt.text = String(curNum);
		}
		public function decrease(e:MouseEvent):void {
			var curMoney:int = parseInt(myMoneyTxt.text);
			var curDolls:int = parseInt(myDollarMoneyTxt.text);
			var obj:PresViewField = e.target.parent as PresViewField;
			//Debug.log(obj.name);
			var curNum:int = parseInt(obj.numTxt.text);
			var newMoney:int = parseInt(sumTxt.text)-parseInt(obj.priceTxt.text);
			var newDolls:int = parseInt(sumDollsTxt.text)-parseInt(obj.dollarPriceTxt.text);
			if (newMoney<0 || curNum==0 || newDolls<0) return;
			--curNum;
			sumTxt.text = String(newMoney);
			sumDollsTxt.text = String(newDolls);
			obj.numTxt.text = String(curNum);
		}
		//<!--test code
		//This function is called when the user is dragging the scrollMC
		public function startScroll(e:Event):void {
			Debug.log("clicked!");
			//Set scrolling to true
			scrolling = true;
			
			//Start dragging the scrollMC 
			scrollMC.startDrag(false,bounds);
		}
		
		//This function is called when the user stops dragging the scrollMC
		public function stopScroll(e:Event):void {
			
			//Set scrolling to false
			scrolling = false;
			
			//Stop the drag
			scrollMC.stopDrag();
		}
		public function enterHandler(e:Event):void {
			if (presents.length<=2) {
				pres.y = 100;
				oldY = 100;
				return;
			}
			//Check if we are scrolling
			if (scrolling == true) {
				//Debug.log("in");
				//Calculate the distance how far the scrollMC is from the top
				var distance:Number = Math.round(scrollMC.y - bounds.y);
				
				//Calculate the percentage of the distance from the line height.
				//So when the scrollMC is on top, percentage is 0 and when its
				//at the bottom the percentage is 1.
				var percentage:Number = distance / MASK_HEIGHT;
				
				//Save the old y coordinate
				oldY = pres.y;
				
				//Calculate a new y target coordinate for the content.
				//We subtract the mask's height from the contentHeight.
				//Otherwise the content would move too far up when we scroll down.
				//Remove the subraction to see for yourself!
				var targetY:Number = -((pres.height - MASK_HEIGHT) * percentage) + 100;
				//Debug.log(pres.height,MASK_HEIGHT,percentage);
				//We only want to animate the scroll if the old y is different from the new y.
				//In our movie we animate the scroll if the difference is bigger than 5 pixels.
				
					
					//Tween the content to the new location.
					//Call the function tweenFinished() when the tween is complete.
					pres.y = targetY;
				
			} 
		}
	}
}