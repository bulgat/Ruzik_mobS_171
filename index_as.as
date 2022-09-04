package  
{
	import AS.encryption.MD5;
	
	import classes.json.*;
	
	import com.carlcalderon.arthropod.Debug;
	
	import flash.display.*;
	import flash.display.Stage;
	import flash.events.*;
	import flash.external.*;
	import flash.net.*;
	import flash.system.Security;
	import flash.system.System;
	import flash.utils.*;
	
	import tools.*;
	
	//import vk.*;
	
	public class index_as extends MovieClip
	{
		
		//Задаем переменные
		//arr					:Arrow,
		public var  _getDataInfo		:getDataInfo 	= new getDataInfo (),
					_getUserData		:getUserData 	= new getUserData (),
					muteMusTrigger		:Boolean = false,
					muteSndTrigger		:Boolean = false,
					centerX				:Number = 400,
					centerY				:Number = 300;
					
					public var  flashVars			:Object;
					
					public var  parkLoader			:ParkLoader,
					counter				:int			= 0;
		
		private var _getAdminTable		:getAdminTable 	= new getAdminTable ();
 public static var 	QUALITY_SET			:String = "MEDIUM",
					HIGH_Q				:String = "HIGH",
					MEDIUM_Q			:String = "MEDIUM",
					LOW_Q				:String = "LOW",
					
					texter				:Texter = new Texter(),
					testBlock			:grass_mc = new grass_mc();
 
 
 		private var _api_secret:String = "";
		public var _protectKey:protectKey = new protectKey();
		public var _SaveShared:SaveShared;
		
		public function index_as ()
		{
			_SaveShared = new SaveShared();
			if(this.stage) 
			{ 
				added(); 
			} 
			else 
			{ 
				addEventListener(Event.ADDED_TO_STAGE, added); 
			} 
		}
		
		
		
		public var _Texter:Texter = new Texter ();
		public function Add_Texter(Help:String,Num:int,Max:int=1):void {
			_Texter.x = 288;
			_Texter.y = 234;
			_Texter._txt.text = Help;
			addChild(_Texter);
			if (0==Num) {
				_Texter.pre.visible = false;
			} else {
				_Texter.pre.visible = true;
				_Texter.pre.preMask.scaleX = Num / Max;
			}
		}
		public function Remove_Texter():void {
			if (contains(_Texter)) {
				removeChild(_Texter);
			}
		}
		public function loadSecretKey(get_ProtectedKey:String):void {
			
			var ldr:URLLoader = new URLLoader();
			var req:URLRequest = new URLRequest(globalParams.SERVER+get_ProtectedKey);
			//trace(" loadSecretKey   SERVER: "+globalParams.SERVER+globalParams.getProtectedKey);
						
			var v:URLVariables = new URLVariables();
			v.vkid = globalParams.UID;
			
			req.data = v;
			
			ldr.addEventListener(Event.COMPLETE, loadKeyComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, loadKey_Error);
			ldr.load(req);
		
		}
		private function loadKey_Error(e:Event):void {
			
			//Add_Texter("Не могу установить соединение с сервером.....  :( ",0);
		}
		private function loadKeyComplete(e:Event):void {
			//trace("key = ",(e.target).data);
			
			globalParams.create_clue("",String((e.target).data));
			//Add_Texter("Подождите немного.......... Идет загрузка данных игрока и генерация ландшафта",0);
		}
		
		private function added(e:Event = null):void
		{
			
			Debug.allowLog = true;
			if (!globalParams.alone) {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			}
			stage.quality = StageQuality.MEDIUM
			stage.showDefaultContextMenu = false
			stage.addEventListener (Event.FULLSCREEN, FullScreenEventFn)
			if (!globalParams.alone) {
			Security.allowDomain("*");}
			//trace("@@  globalParams.stageMc = "+this );
			globalParams.stageMc = this
			Add_Texter("Идет соединение с сервером......",0);
			
			init();
			//trace("00_______init_______");
			flashVars = Object(stage.loaderInfo.parameters);
			
			if(flashVars.api_id)
			{
				// Получени IP из контакта.
				globalParams.UID = flashVars.viewer_id;
			}
			
			
			
			// Сборка одна.
			if (!globalParams.alone) {
				_protectKey.launch("USER_CODE",globalParams.getProtectedKey);
				//Security.allowDomain("*");
				
			}
			else {
				
				}
			//_protectKey.launch("USER_Date",globalParams.shelter_Key);
			
			//loadSecretKey(globalParams.getProtectedKey);
			//loadSecretKey(globalParams.shelter_Key);
			
			
			
		}
		
		public function ErrorInternet(e:Event):void
		{
			//trace("NO");
		}
		public var full_Screen:Boolean;
		//ФуллСкрин
		public function FullScreenEventFn (e:Event)
		{
			if (full_Screen) {
				full_Screen=false;
				} else {
					full_Screen=true;
					}
			
			if (globalParams.indexMc.btnSwitchTrigger)
			{
				
			}
			else
			{
				globalParams.indexMc.fsTrigger = false
			}
			
			if (globalParams.indexMc.fsTrigger)
			{
				globalParams.indexMc._rightButtons.fullscreenBtn.gotoAndStop ("fullscreenFr")
			}
			else
			{
				globalParams.indexMc._rightButtons.fullscreenBtn.gotoAndStop ("nofullscreenFr")
			}
			
			globalParams.indexMc.btnSwitchTrigger = false;
			
			
		}
		
		public var prewStageW:Number = 0
		
		public function switchQuality () {
			if (index_as.QUALITY_SET == index_as.HIGH_Q) {
				stage.quality = StageQuality.MEDIUM
				index_as.QUALITY_SET = index_as.MEDIUM_Q
			} else if (index_as.QUALITY_SET == index_as.MEDIUM_Q) {
				stage.quality = StageQuality.LOW
				index_as.QUALITY_SET = index_as.LOW_Q
			} else if (index_as.QUALITY_SET == index_as.LOW_Q) {
				stage.quality = StageQuality.HIGH
				index_as.QUALITY_SET = index_as.HIGH_Q
			}
		}
		public function setQuality () {
			if (index_as.QUALITY_SET == index_as.HIGH_Q) {
				stage.quality = StageQuality.HIGH
			} else if (index_as.QUALITY_SET == index_as.MEDIUM_Q) {
				stage.quality = StageQuality.MEDIUM
			} else if (index_as.QUALITY_SET == index_as.LOW_Q) {
				stage.quality = StageQuality.LOW
			}
		}
		public function updateServerTime () {
			
			
			_getDataInfo.init ()
			
			//запись инфы на сервер через определенные промежутки времени игры ?    наверно....
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false);
		
		}
		public function init () {
			MovieClip(root).stop ();
			MovieClip(root).addChildAt(this, MovieClip(root).numChildren - 1);
			
			if (ExternalInterface.available) {
				ExternalInterface.marshallExceptions = true;
				try {
					ExternalInterface.addCallback	("sendToActionScript", receivedFromJavaScript);
					ExternalInterface.addCallback	("sendFriendsData", recieveFriendsData);
					ExternalInterface.addCallback	("sendAppFriendsData", recieveAppFriendsData);
					
					ExternalInterface.call 			("initConnect");
				} catch(e:Error) {
				}
			} else {
				trace(" No Java");
			}
			_getAdminTable.addEventListener (Event.COMPLETE, get_TableFn)
			//загрузка с сервера 
			//загрузка данных игрока
			//trace("######### _getAdminTable загрузка данных игрока");
			//Получение XML параметров зданий (продажа, прибыль, название и т.д)
			_getAdminTable.init ()
			
		}
		
		public function showWelcomeWindow () {
			
			if(globalParams.questNumber == 1)
			{
				addChild(globalParams.indexMc._lands_Quest);
				globalParams.indexMc._lands_Quest.Quest_launch(1);
						
						
			}
			
			
		}
		
		private function gotCellsHandler(e:Event):void
		{
			
		}
		
		private function cellClick_Friends(e:MouseEvent):void
		{
			globalParams.indexMc._lands_Friend.saveUserParkBuffer();
			globalParams.friendsParkTrigger = true;
			
			//Переход в парк друзей
			globalParams.indexMc._lands_Friend.showFriendParkFn(e.currentTarget.uid);
		}
		
		public function writeln(s:*):void
		{
			texter.txt.appendText(String(s) + '\n');
		}
		
		public function closed(e:Event):void
		{
			switch(int(globalParams.questNumber))
			{
				case 2:
				globalParams.indexMc._lands_Interface._building_menue.glow.play();
				break;
				
				case 3:
				globalParams.indexMc._lands_Interface._building_menue.glow.play();
				break;
				
				case 4:
				globalParams.indexMc._lands_Interface._building_menue.glow.play();
				break;
			}
			
		}
		
		
		private var timeInt:uint
		private var prevGt:Object
		public function updateTime (_inc:String) {
			trace("##   updateTime"+_inc);
			if (globalParams.globalTime != null) {
				//присваевает сегодняшнию дату и время
				prevGt = globalParams._handle_time.returnGlobalDataPhantom ()
			}
			globalParams.globalTime = dataObjectTranslator.returnObject (_inc)
			if (prevGt != null) {
				var tmpTI:Number = globalParams._handle_time.returnTimeDifference (prevGt, globalParams.globalTime)
				if (Math.abs (tmpTI) > 10) {
					globalParams.globalTime = prevGt
					_getDataInfo.init ()
					
				}
			}
			
			if (landScape == null) {
				//globalParams.indexMc._handle_time.updateTime()
				//timeInt = setInterval(globalParams._handle_time.updateTime(), 1000);
				timeInt = setInterval(globalParams._handle_time.updateTime, 1000);
				//timeInt = setInterval(globalParams.updateTime, 1000);
				startGame ()
			} else {
				globalParams.indexMc._lands_Svetofor.inspectAttractions ()
			}
		}
		//сюда
		private function receivedFromJavaScript(viewer_id, sid):void {
			
			globalParams.UID = flashVars.viewer_id;
			
			
			if (globalParams.UID == null) {
				globalParams.UID = "vk50081723"
			}
			//trace("###@@@@@@@@@@@@@@@@@");
			_getAdminTable.addEventListener (Event.COMPLETE, get_TableFn);
			
			_getAdminTable.init ()
        }
		
		public function get_TableFn (e:Event) {
			//trace("@@@@@ get_TableFn ok");
			// Получени денег, опыта и уровня игрока.
			_getUserData.load_User ()
		}
		private function recieveFriendsData (friendsInfo):void {
			
			globalParams.allFriendsInfo = friendsInfo
			
			ExternalInterface.call ("getAppFriendsData");
        }
		private function recieveAppFriendsData (friendsInfo):void {
			
			globalParams.appFriendsInfo = friendsInfo
			
			
        }
		public function recieveFriendsAssidtData () {
			
		}
		var _get_ListQuest:get_ListQuest = new get_ListQuest()
		private var landScape:landscapeGeneratorV01
		public function startGame () {
			//trace(landScape+"    startGame   ");
			//var ape = new landscapeGeneratorV01 ();
			landScape = new landscapeGeneratorV01 ();
			
			addChild (landScape);
			
			landScape.start_init (globalParams.UID,globalParams.GET_RATING);
			_get_ListQuest.load_init(globalParams.SERVER+"_getMiniQuestDataAll.php");
			//trace( "  end  startGame   ");
		}
		
	}

}

