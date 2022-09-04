package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.utils.*;
	import flash.display.*;
	import flash.net.FileReference;
	import flash.geom.ColorTransform;
	
	import com.adobe.images.*;
	import classes.json.JSON;
	import tools.controllers.*;
	import com.carlcalderon.arthropod.Debug;
	import tools.*
	
	import windows.AddMoneyWindow;
	import classes.AddMoneyEvent;
	
import flash.display.BitmapData;
import flash.display.Bitmap;

	public class landscapeGeneratorV01 extends MovieClip
	{
		//Начну с того, что нормально распишу переменные
		//Публичные переменные
		//Переменные ландшафта
		public var 	groundSkin		:String = 'green';
					
									
					//По всей видимости матрица ландшафта
		public var lanscapeArray	:Array,
					
					enterPosition	:String = "up",
					//Начальная сумма денег		
					currentMoney	:Number = 400000,
					
					//Объект занимающийся обработкой звука
					_soundProcessor:soundProcessor 	= new soundProcessor (),
					
					//Создаются объекты для обработки данных на сервере
					_getSavedGames	:getSavedGames 		= new getSavedGames (),
					
				   _insertSavedGames:insertSavedGames 	= new insertSavedGames (),
				   _updateSavedGames:updateSavedGames	= new updateSavedGames (), 
					_getPaymentData	:getPaymentData 	= new getPaymentData (),
					
					//Чертит рамку вокруг парка очевидно
				_parkBorderProcessor:parkBorderProcessor= new parkBorderProcessor (),
					_getAdminTable	:getAdminTable 		= new getAdminTable (),
					
					//Создаются поп-апы
					_popupBalonMc		:MovieClip,
					expPopup		:MovieClip,
					
					//Объект для обработки биллинговой информации
					_insertBillingInfo:insertBillingInfo = new insertBillingInfo(),
										
					//collectionsArray:Array = new Array(),
					
					collectionsHandler:CollectionsHandler;
					public var collectionsArray:Object = new Object();
		public var landscape:MovieClip;
		//public var shop:Shop;
		//public var toGroup:ToGroup;
		public var _Choosewin:ChooseWindow;
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		//Приватные переменные
		public var topBorder		:Number,
					leftBorder		:Number,
					rightBorder		:Number,
					//Какие-то координаты мыши
					mouseBackX		:Number,
					mouseBackY		:Number,
					//Координаты ландшафта
					landBackX		:Number,
					landBackY		:Number,
					//Курсор и рамка
					cursor			:MovieClip;
					//забор
					//public var borderMc		:MovieClip;
					//Окно загрузки
					public var preload_window	:MovieClip;
					//Генератор аттракционов
		
		public var attractionGenerator:attractionClass	 = new attractionClass ();
					
		public var _lands_Roads:lands_Roads = new lands_Roads();
		public var _lands_Grass:lands_Grass = new lands_Grass();
		public var _lands_Possibility:lands_Possibility = new lands_Possibility();
		public var _lands_Quest:lands_Quest = new lands_Quest();
		public var _lands_Interface:lands_Interface = new lands_Interface();
		public var _lands_Sort:lands_Sort = new lands_Sort();
		public var _lands_GenerateLand:lands_GenerateLand = new lands_GenerateLand();
		public var _getDataLog:getDataLog = new getDataLog();
		public var _lands_Collections:lands_Collections = new lands_Collections();
		public var _lands_UpdateRoads:lands_UpdateRoads = new lands_UpdateRoads();
		public var _lands_MoveBuilding:lands_MoveBuilding = new lands_MoveBuilding()
		public var _lands_RemoveBuilding:lands_RemoveBuilding = new lands_RemoveBuilding();
		public var _lands_Friend:lands_Friend = new lands_Friend();
		public var _getBuildingData:getBuildingData = new getBuildingData();
		public var _place_load_road:place_load_road = new place_load_road();
		public var _place_load_building:place_load_building = new place_load_building();
		public var _place_load_bot:place_load_bot = new place_load_bot();
		public var _screen_border_vis:screen_border_vis = new screen_border_vis()
		public var _land_personalMenu:land_personalMenu = new land_personalMenu();
		public var _trash_refuse:trash_refuse = new trash_refuse();
		public var _land_building_cancel:land_building_cancel = new land_building_cancel()
		public var _post_image:post_image = new post_image();
		public var _post_friend:post_friend = new post_friend();
		public var _lands_globalLoad:lands_globalLoad = new lands_globalLoad();
		public var _lands_Svetofor:lands_Svetofor = new lands_Svetofor()
		public var _table_game:table_game = new table_game()
		public var _lands_message:lands_message = new lands_message()
		public var _lands_bot:lands_bot = new lands_bot();
		//public var _saveShot_API:saveShot_API = new saveShot_API();
		//Статические переменные
 		public static var mashtab:int = 11
		public var kukubaksi:int = 0;
		
		public var _rightButtons:MovieClip
		public var fsTrigger:Boolean = false
		public var btnSwitchTrigger:Boolean = false
		
		private var timerFunctionTimer:int = 5
		public var svetoforArray:Array = new Array ()
		
		public var refuse_Array:Array = new Array ()
		//включакт паузу игры, все останавливается
		public var pauseTrigger:Boolean = false;
		public var prevLandscapePositionX:int = 0;
		public var prevLandscapePositionY:int = 0;
		public var prevObjectCounterFor_sortObjectButtonFn:int = 0
		
		public var objectsArray:Array = new Array ()
		public var povorotnikTrigger:Boolean = false
		public var objectsButtonArray:Array = new Array ()
		
		public var botArray:Array = new Array ()
		public var botAddingTimer:Number = 0
		public var botAddingRnd:Number = 200
		public var botButtonArray:Array = new Array ()
		
		public var lk:Number = 0
		
		
		public var cursorMc:MovieClip
		public var cursorShowedTrigger:Boolean = false
		
		public var menue_mc:MovieClip
		public var miniMap_Mc:miniMap
		public var targetMc:MovieClip
		
		public var arrowPlace:MovieClip
		public var placeRoadTrigger:Boolean = false
		//клип строительных инструментов
		private var keys_mc:MovieClip
		
		public var Player_Park:Object = [];
		private var Player_WorkerArray:Array=[0,0];
		private var Player_WorkerMarket:Array=[0,0]
		//public var _handle_time:handle_time = new handle_time()
		import classes.AddMoneyEvent;
		
		public var holiday:int=0;
		public var celebrate:Boolean;
		var currDate:Date = new Date();
		public var _welcomeWindowMc:welcomeWindowMc = new welcomeWindowMc()
		public var roadsArray:Array = new Array ()
		public var roadPlaceObject:Object=[]
		public var _autobusClass:autobusClass;
		
		// Инициализация и Загрузка сохраненной игры
		public function type_planet():int {
			if (groundSkin=='green') {
				return 0;
			} else {
				return 1;
			}
			
			return 0
			}
		public function Save_Buffer(num:int) {
			
			Player_WorkerArray[num]=updateSavedGames.getWorkerArray ();
			Player_WorkerMarket[num]=updateSavedGames.getWorkerMarket ();
		}
		
		public function Load_Buffer(num:int) {
			
			load_personalMenue.analyseWorkersArray(Player_WorkerMarket[num]);
			load_personalMenue.analyseWorkersMarket(Player_WorkerArray[num]);
		}
		
		public function start_init (_UID:String,load_Adress:String) {
			
			collectionsHandler = new CollectionsHandler(globalParams.UID);
			
			collectionsHandler.getCollections();
			collectionsHandler.addEventListener('gotCollection', function()
											   {
												   collectionsArray = collectionsHandler.collectionsArray;
											   })
			
			
			//Сообщаем глобальным параметрам что indexMc — это этот класс
			globalParams.indexMc = this
			
			//Выполнить функцию заполнения стартовыми параметрами
			
			//Проинициализировать загруженные данные об игре
			//if (!globalParams.alone) {
				_getSavedGames.load_init (_UID,load_Adress,0,0);
			//}
			gotoAndStop (2)
			
			
			
		}
		public function Push_Workers ():void
		{
			personalMenue.Push_Workers_M();
		}
		
		public var landWidth		:int;
		public var landHeight		:int;
		
		public var startPoint:int=2;
		public var shiftLeft:int=2;
		public var ParkSize:int;
		public var newlandWidth:int = 25;
		public function startLoadedGame (planet:int,dataObject:Object):void
		{
			//Присваивания переменным флэша данных полученных с сервера
			trace(" **********  startLoadedGame ( ) ********** ");
					
					
					
					if (planet==0) {
						groundSkin = 'green';
					} else {
						groundSkin = "metal";
					}
					globalParams.G_PLANET=planet
					//groundSkin = "metal";
					_lands_globalLoad.paramsLoad(dataObject);
					
					
					
					//если придет 0 игра зависнет
					if (dataObject.landWidth<11) {
						
						dataObject.landWidth=11;
						
					}
					
					
			ParkSize=dataObject.landWidth;
			
			landWidth = 25;
			landHeight = 25;
			
			startPoint=25-ParkSize;
			
			shiftLeft=(25-ParkSize)/2;
			_lands_GenerateLand.generateLandscape(25,25,startPoint,shiftLeft);
			
					var tmpObject:Object;
					var tmpTrigger:Boolean = false;
					var n:int;
					var possibleTrigger:Boolean = false;
					currentMoney = globalParams.user_cash;
					if (!globalParams.friendsParkTrigger) {
						if (dataObject.transpositionPark==undefined) {
							_lands_GenerateLand.transpositionPark (dataObject, 25-ParkSize);
						}
					}
					if (false) {
						
					}
			
				
				_place_load_road.Place_Road (dataObject);
			
				
			//Все остальное
				_place_load_building.Place_Building (dataObject,newlandWidth,newlandWidth);
			
				//bot добавит посетителей
			_place_load_bot.Place_bot()
			
			_lands_Roads.pereborRoads (roadPlaceObject,roadsArray,objectsArray);
			
			/*
					//добавлен 22 октября 2012 года
			if (dataObject.Trash != undefined) {
				var refuse:int = int(dataObject.Trash);
				_trash_refuse.Add_Refuse(refuse);
			}
			*/
			//globalParams.global_Log.push(" updatePosition ");
			
			_lands_Sort.updatePosition (landscape.x,landscape.y);
			//запись инфы на сервер
			
			_getDataLog.init ();
			
			
			this.addEventListener (Event.ENTER_FRAME, updateAll, false, 0, true);
			globalParams.flag_load = false;
			//добавлен 22 октября 2012 года
			if (dataObject.Trash != undefined) {
				var refuse:int = int(dataObject.Trash);
				
				_trash_refuse.Add_Refuse(refuse);
			}
			trace(" on both!!!!!!!!!!!!!!!!!!!!!!!!!!!     L= ",objectsArray.length,"  button    L=",objectsButtonArray.length);
			//_trash_refuse.Add_Refuse(3);
			if (! globalParams.friendsParkTrigger)
			{
				trace("__________________showWelcomeWindow_________________");
				//addChild(_welcomeWindowMc);
				//слушатель перехода в парк друга
				globalParams.stageMc.showWelcomeWindow();
			}
		/*
		if (objectsArray.length!=_place_load_building.verityCount+1) {
		
			systemMessage("Обнаружена критическая ошибка! Для устранения ее обновите игру, если она не пропала, обратитесь за поддержкой в группу Рузика!");
		}
		*/
		
		}
		
		public function on_over_button (event:MouseEvent) {
			Bright_Image(event.currentTarget,50);
		}
		public function off_over_button (event:MouseEvent) {
			
			Bright_Image(event.currentTarget,0);
			event.currentTarget.alpha = 0;
		}
		var colorTransform:ColorTransform = new ColorTransform();
		public function Bright_Image(_Image:Object,e):void {
	
			colorTransform.redOffset = e;
			colorTransform.greenOffset=e;
			colorTransform.blueOffset=e;
	
			_Image.transform.colorTransform = colorTransform;
		}
		
		public function Start_Quest():void
		{
			_lands_Quest._Quest (0);
		}
		public function showChooseWindow():void
		{
			
			//окно пользователю возможность выбрать тип планеты
			_Choosewin = new ChooseWindow();
			_Choosewin.x = stage.stageWidth / 2;
			_Choosewin.y = stage.stageHeight / 2;
			// планету железяку
			
			addChild(_Choosewin)
			var _License:License = new License();
			_License.x = stage.stageWidth / 2;
			_License.y = stage.stageHeight / 2;

			addChild(_License);
			_License.License_Ok()
		}
		
		
		public function checkOpenFn(_obj:Object):void
		{
			if (_obj!=null) {
			if (_obj.openTrigger)
			{
				
				if (globalParams.Building_Basa[_obj.type]!=undefined) {
						attractionClass.kafeshka_Food(_obj)
						
				}
							
			
			}
			
			}
		}
		
		
		
		public function startNewGame(planet:int):void
		{
			
			//Начать абсолютно новую игру после выбора игроком новой планеты,
			//так как у него нет сохраненых данных и повидимому он начинает играть в первый раз
						
			globalParams.ironPlanet=false
			startLoadedGame (planet,{objectsArray:[{type:"enterBoth"}],groundSkin:groundSkin,transpositionPark:true,roadsArray:[],landWidth:11})
			
			
		}
		public function updateAll_bot()
		{
			//trace("  updateAll_bot",botArray.length)
			var i_zavis_bot:int;
			for (var i:int = 0; i < botArray.length; i++)
				{
					i_zavis_bot =i;
					
					botArray[i].update();
				}
			
		}
		public function updateAll(e:Event)
		{
			//событие срабатывающее при входе в каждый кадр
			//globalParams.user_exp=100
			if (!placeObjectTrigger && !placeRoadTrigger)
			{
				if (cursorShowedTrigger)
				{
					cursorMc.x = mouseX
					cursorMc.y = mouseY
				cursorMc.visible = true;
				}
			}
			if (pauseTrigger)
			{
				pauseTrigger = false
			}
			
			if (!pauseTrigger)
			{
				Update_rightButtons();
				
				//globalParams.stageMc.resizeFn()
				
				_lands_Interface.resize_menu()
				
				_soundProcessor.update(globalParams.stageMc.muteMusTrigger, globalParams.stageMc.muteSndTrigger)
				_autobusClass.update();
				
				if (botArray.length < 10)
				{
					_lands_bot.botAdding();
				}
			//var i_zavis_bot:int;
			
			updateAll_bot()
			
				//прибавить секунду
				globalParams._handle_time.updateMinutes(objectsArray);
				
				if (prevLandscapePositionX != landscape.x || prevLandscapePositionY != landscape.y)
				{
					_screen_border_vis.checkVisibility ()
					prevLandscapePositionX = landscape.x
					prevLandscapePositionY = landscape.y
				}
				//просмотор всех объектов карты и включение триггера прибыли
				_lands_Svetofor.inspectAttractions();
				_lands_Svetofor.if_MenueShowedUpdater(objectsArray);
				timerFunctionTimer--;
				
				if (timerFunctionTimer < 0)
				{
					_lands_Sort.botPodSorter();
					//переключение светофора - значка о ремонтн, сборе прибыли и персонале 
					//(перебор всех объектов которые имеют сфетофор)
					_lands_Svetofor.updateSvetofors();
					timerFunctionTimer = 5;
				}
				_lands_Sort.sortObjectsButtonsFn(objectsButtonArray,botButtonArray)
				
			}
			_lands_Interface.indicatorsMc.moneyLable.text = "" + globalParams.user_cash
			userLevelsTable.getExperiencePercent();
			
			_lands_Interface.indicatorsMc.levelLable.text = globalParams.user_lvl + ""
			
			addChild(_land_building_cancel);
			_land_building_cancel.cancelCheck ()
			_lands_Interface.update ()
			
			_lands_Interface.user_energy(false);
			_trash_refuse.litter_Refuse();
			addChild(_land_personalMenu)
			_lands_Quest.Add_miniQuest()
			_lands_Interface.Add_Quest_Log();
		}
		public function Update_rightButtons():void
		{
			_rightButtons.qualitiButton.gotoAndStop (index_as.QUALITY_SET)
				if (globalParams.stageMc.muteSndTrigger)
				{
					_rightButtons.soundSwitch.gotoAndStop ("offFr")
				}
				else
				{
					_rightButtons.soundSwitch.gotoAndStop ("onFr")
				}
				if (globalParams.stageMc.muteMusTrigger)
				{
					_rightButtons.musickSwitch.gotoAndStop ("offFr");
				}
				else
				{
					_rightButtons.musickSwitch.gotoAndStop ("onFr");
				}
				if (_rightButtons.openTrigger)
				{
					_rightButtons.nextFrame();
				}
				else
				{
					_rightButtons.prevFrame();
				}
			
		}
		
		public function Zoom_Svetofor (tmpPoint1:Point,Num_Butt:int):void
		{
			for (var k:int = 0; k < svetoforArray.length; k++)
			{
						if (svetoforArray[k].id == objectsButtonArray[Num_Butt].id)
						{
							svetoforArray[k].x = tmpPoint1.x
							svetoforArray[k].y = tmpPoint1.y - 100 +(100-(100*zoomParam));
							svetoforArray[k].scaleX = zoomParam;
							svetoforArray[k].scaleY = zoomParam;
						
						}
			}
		}
		public var _updateUserData:updateUserData = new updateUserData ()
		public function currentMoneyFn (inc:int):void
		{
			
			_popupBalonMc.gotoAndPlay (1);
			
			if (inc >= 0) {
				inc*=globalParams.buy_booster
				_popupBalonMc.textBaloon.textBaloon.textLable.text = "+" + inc;
			} else {
				_popupBalonMc.textBaloon.textBaloon.textLable.text = "" + inc;
			}
			
			globalParams.user_cash += inc;
			_updateUserData.save_init ();
			_soundProcessor.playSnd ("cashCollect");
		
		}
		private var otladkaBotArray:Array = new Array ();
		public function updateOtladka () {
			
			for (var i = otladkaBotArray.length-1; i >= 0; i--) {
				otladkaMc.removeChild (otladkaBotArray[i])
				otladkaBotArray.splice (i, 1)
			}
			otladkaBotArray = new Array ()
			
			for (i = 0; i < botArray.length; i++)
			{
				//otladkaBotArray.push (new otladkaPlace_mc ());
				otladkaBotArray[i].lable.text = (i+1) + ". " + botArray[i].botName + " / " + botArray[i].action + " / " + botArray[i].hunger + " / " + botArray[i].activity;
				otladkaBotArray[i].x = 19;
				otladkaBotArray[i].y = 479 - 15*i;
				otladkaMc.addChild (otladkaBotArray[i]);
			}
		
		}
		
		public var offRoadArray			:Array;
		public var objectsButtonLayer	:MovieClip;
		/////////////////////Конец функции//////////////////////////////////////////////
		public var cursorPlaceBox_mc	:MovieClip;
	    public var _backToMAinModeBtn	:MovieClip;
		public var _arroundPark			:arroundPark = new arroundPark();
		
		public function setupInterface()
		{
			addChild(_lands_Interface)
			//добавить забор вокруг парка
			
			//добавить нижние левые кнопки строительства
			_lands_Interface.add_menu();
			_lands_Interface.add_return_park_button()
								
			landscape.addChild (new MovieClip ())
			//скрыть числа у плашек ландшщафта
			hideNumbers (false)
			//Добавляем верхнюю панель, которая баблосами, опытом и прочей хуйней
			_lands_Interface.add_indicator()
			//добавит деньги
			_lands_Interface.add_coin_menu()
			//добавить кукубаксы
			_lands_Interface.Launch_Interface();
			_lands_Interface.add_popup()
			if(groundSkin == 'green')
			{
				_arroundPark.init (newlandWidth,newlandWidth);
			
			}
					addChild(_land_personalMenu)
		}
		public function reset_array () {
			roadsArray = new Array ()
			objectsArray = new Array ()
			/*
			for (var i:int = 0; i < objectsButtonArray.length; i++) {
				_lands_RemoveBuilding.remove_splice (i)
			}
			*/
			trace(" reset_array      objectsButtonArray = ",objectsButtonArray.length)
			var i:int = objectsButtonArray.length;
			while (i--)
			{
				_lands_RemoveBuilding.remove_splice (i)
				
			}
			svetoforArray = new Array ()
			var i_:int = svetoforArray.length;
			while (i_--)
			{
				svetofor_splice (i_)
				
			}
			
			
			
			
			//objectsButtonArray = new Array ()
		}
		public function Add_Help_Menu (event:MouseEvent) {
			Bubble_Help_mc.x = mouseX+15;
			Bubble_Help_mc.y = mouseY-15;
			Bubble_Help_mc.helpText.text = " "+event.currentTarget.Help;
			addChild(Bubble_Help_mc);
			
		}
		public function Remove_Help_Menu (e:MouseEvent) {
			if (contains(Bubble_Help_mc)) {
				removeChild(Bubble_Help_mc);
			}
			
		}
		
		public function addMoney(e:MouseEvent):void
		{
			
			
			var addM:AddMoneyWindow = new AddMoneyWindow(this, globalParams.UID, false);
			
			addM.x = 115;
			//addM.y = 115;
			addM.y = 60;
			addM.serverLink = globalParams.SERVER_shop;
			
			if (!this.hasEventListener(AddMoneyEvent.MONEY_ADDED)) 
				this.addEventListener(AddMoneyEvent.MONEY_ADDED, moneyUpdateHandler);
		
		
		
		}
		public function moneyUpdateHandler(e:AddMoneyEvent):void {
			
			globalParams.indexMc._insertBillingInfo.init(e.moneyAdded, "addMoney");
		}
		var _count_Destruct:int;
		public function Count_Destruct(event:Event):void {
			_count_Destruct++;
			if (_count_Destruct>1000) {
				removeEventListener(Event.ENTER_FRAME,Count_Destruct);
				systemMessage ("Истекло время соединения с сервером");
				//removeChild(shop);
			}
		}
		public function switchFullscreen (e:MouseEvent) {
			
			fsTrigger = !fsTrigger
			btnSwitchTrigger = true
			if (fsTrigger) {
				stage.displayState = StageDisplayState.FULL_SCREEN;
				
			} else {
				stage.displayState = StageDisplayState.NORMAL;
				
			}
			
		}
		//выгрузка ботов на станцию и вход в парк
		public function addBotToBusStation():void
		{
			botAddingTimer = botAddingRnd + 1
			var n:int = botArray.length
			//var ii:int = Math.ceil (landHeight/2-int(shiftLeft/2))
			var ii:int = Math.ceil (25/2)
			var jj:int = 25
			_lands_bot.botAdding ()
			
			
			botArray[n].way = "sw"
			botArray[n].action = "goToCenterOfRoad2"
			botArray[n].botImage.x = (ii)*76 + (jj-1)*76 - (25)*76 + 76+80
			botArray[n].botImage.y = (ii) * 38 - (jj-1) * 38 - 130
			
			botArray[n].currentObj.i = ii
			botArray[n].currentObj.j = jj
		}
		
		
		
		
		public function reloadParkFn (_UID:String,load_Adress:String):void
		{
						//загрузка парка друга?
			trace("reloadParkFn")
			RemovePark();
			//блокировать сохранеие парка друга в парк пользователя
			globalParams.friendsParkTrigger = true;
			//load
			start_init (_UID,load_Adress);
			pauseTrigger = false
		}
		
		public function onUpdateRating (e:Event) {
			//запись на сервер прошла успешно
			trace("запись на сервер прошла успешно");
			//загрузка на сервер. Устарело?
			start_init (globalParams.UID,globalParams.GET_RATING);
			pauseTrigger = false
			
			_updateSavedGames.removeEventListener("CorrectSave", onUpdateRating);
			
			
		}
		public function planet_shift(Goto_planet:int):void
		{
			trace("    planet_shift !!!!!!!!!!!!!");
			RemovePark();
			_getSavedGames.load_init(globalParams.UID,globalParams.GET_RATING,0,Goto_planet);
		}
		public function RemovePark():void
		{
			globalParams.FRIEND_UID = null
			
			zoomTrigger = false
			zoomParam = 1
			
			if (_objectMenue != null) {
				this.removeChild (_objectMenue)
				_objectMenue = null
			}
			if (_backToMAinModeBtn != null) {
				this.removeChild (_backToMAinModeBtn)
				_backToMAinModeBtn = null
			}
				
			this.removeEventListener (Event.ENTER_FRAME, OEFRoadPlace)
			this.removeEventListener (Event.ENTER_FRAME, OEFRemover)
			this.removeEventListener (Event.ENTER_FRAME, updateAll)
			this.removeEventListener (Event.ENTER_FRAME, OEF)
			
			this.removeChild (landscape)
			this.removeChild (objectsButtonLayer)
			
			this.removeChild (_rightButtons)
			this.removeChild (arrowPlace)
			
			placeRoadTrigger = false
			placeObjectTrigger = false
			clearObjectPlacement ()
			
			reset_BotArray();
			
				globalParams.workersMarket = new Array ()
				globalParams.workersArray = new Array ()
				//svetoforArray = new Array ()
				_lands_Interface.remove_menu()
			
			_trash_refuse.reset_Refuse();
			trace("                   objectsArray = ",objectsArray.length,"    ",objectsArray);
			trace("RemovePark   objectsButtonArray*************************** ",objectsButtonArray.length,"   ",svetoforArray.length)
			reset_array ()
			trace("RemovePark    objectsButtonArray*************************** ",objectsButtonArray.length,"   ",svetoforArray.length)
			//clearStage ();
		}
		public function reset_BotArray():void
		{
			for (var i = botArray.length - 1; i >= 0; i--) {
				botArray[i].removeListeners ()
				botArray.splice (i, 1)
			}
			botArray=[];
			
		}
		public function resetPark():void
		{
			_soundProcessor.playSnd ("click")
			//_soundProcessor.playSnd ("goToFriendPark")
			trace("resetPark")
			RemovePark();
							
			_lands_GenerateLand.generateLandscape (mashtab, mashtab,25,25)
			
			this.addEventListener (Event.ENTER_FRAME, updateAll)
			placeEnter(6,11);
		}
				
		public function showHandCursor (e:MouseEvent) {
			cursorShowedTrigger = true
			
			Mouse.hide()
		}
		public function hideHandCursor (e:MouseEvent) {
			cursorShowedTrigger = false
			cursorMc.visible = false;
			
			Mouse.show ()
		}
		public var zoomTrigger:Boolean = false
		public var zoomParam:Number = 1
		
		public function zoom_Button ():void 
		{
			for (var i = 0; i < objectsButtonArray.length; i++) {
				objectsButtonArray[i].button.scaleX = zoomParam
				objectsButtonArray[i].button.scaleY = zoomParam
				//zoom_Svetofor (i) objectsButtonLayer
			}
			_trash_refuse.transform_Refuse();
			landscape.scaleX = zoomParam
			landscape.scaleY = zoomParam
			_lands_Sort.updatePosition (landscape.x,landscape.y)
		}
		
		public function zoomNoFn () {
			landscape.x ++
			zoom_Button();
			
			_screen_border_vis.checkVisibility ()
		}
		
		
		private var kukubaksiUpdateTrigger:Boolean = false
		public function getPaymentsDataFn (_inc:Object) {
			//проверка платежей по кукубаксам
			
			globalParams.HistoryPlayment="";
			kukubaksi = 0
			for (var i = 0; i < _inc.length; i ++) {
				kukubaksi = kukubaksi + int(_inc[i].paymentValue);
				
				globalParams.HistoryPlayment += "  \n kukubaksi = "+_inc[i].paymentValue+" ("+kukubaksi+") Вид платежа = "+_inc[i].paymentGoal+"   ________   Время = "+_inc[i].paymentDate;
			}
			_lands_Interface.indicatorsMc.kukubaksLable.text = "" + kukubaksi;
		}
		
		public var cancelObject:Object
		
		
		public var removeObjectTrigger:Boolean = false
		
		public function bombButtonFunction () {
			//бомба
			trace("~~~~~~~~~~~~~~//бомба");
			clearObjectPlacement ()
			placeRoadTrigger = false
			if (!removeObjectTrigger)
			{
				removeObjectTrigger = true
				keys_mc = new bomb_mc ()
				landscape.addChild (keys_mc)
				this.addEventListener (Event.ENTER_FRAME, OEFRemover)
			}
			else
			{
				removeObjectTrigger = false
			}
		}
		
		public function arrowButtonFunction (e:MouseEvent) {
			clearObjectPlacement ()
			placeRoadTrigger = false
		}
		private var tFunctonTrigger:Boolean = false
		public function tFunction (e:MouseEvent) {
			tFunctonTrigger = !tFunctonTrigger
			hideNumbers (tFunctonTrigger)
			
		}
		
		public function hideNumbers (vis:Boolean) {
			for (var i = 1+startPoint ; i <= newlandWidth; i++) {
				for (var j = newlandWidth ; j >= 1+startPoint; j--) {
					lanscapeArray[i][j].gr.nameFld.visible = vis
				}
			}
		}
		public function pauseSwitch (e:MouseEvent) {
			pauseTrigger = !pauseTrigger
		}
		public function openCloseOtladka (e:MouseEvent) {
			otladkaTrigger = !otladkaTrigger
			if (otladkaTrigger) {
				otladkaMc.x = -5
			} else {
				otladkaMc.x = -408
			}
		}
		private var otladkaTrigger:Boolean = false
		private var otladkaMc:MovieClip
		//private var botMenueMc:MovieClip
		public var globalPoint:Point = new Point(0, 0)
		/*
		public function showPosetitelMenue (_mc:botEngine) {
			if (_mc.botName != "Хулиган") {
				
				if (botMenueMc != null) {
					botMenueMc.mc.action = botMenueMc.prevAction
					this.removeChild (botMenueMc)
					botMenueMc = null
				}
				botMenueMc = new botMenue ()
				botMenueMc.init (_mc)
				botMenueMc.fon.addEventListener (MouseEvent.CLICK, closePosetitelMenue)
				botMenueMc.windowMc.okBtn.addEventListener (MouseEvent.CLICK, closePosetitelMenue)
			
				addChild (botMenueMc)
				_lands_Sort.sortObjectsButtonsFn (objectsButtonArray,botButtonArray)
				//Пятый квест
				//5
				_lands_Quest._Quest (4);
			} else {
				
				if (_lands_Interface.user_energy(true)) {
					userLevelsTable.addExperience(1);
				
					
					_lands_bot.removeBot(_mc);
					_soundProcessor.playSnd ("kick");
				}
			}
		}
		
		public function closeOnAttractionWorkerMenue (e:MouseEvent) {
			if (botMenueMc != null) {
				this.removeChild (botMenueMc)
				botMenueMc = null
				
			}
		}
		
		public function closePosetitelMenue (e:MouseEvent) {
			
			if (botMenueMc != null) {
				botMenueMc.mc.action = botMenueMc.prevAction
				this.removeChild (botMenueMc)
				botMenueMc = null
			}
		}
		*/
		/*
		var _Club:Club = new Club();
		var timerBot_Club:int;
		public function Bot_Club (e:MouseEvent) {
			_Club.x = mouseX+5;
			_Club.y = mouseY-30;
			_Club.scaleX = .7;
			_Club.scaleY = .7;
			e.currentTarget.scaleX = 3;
			e.currentTarget.scaleY = 3;
			Mouse.hide()
			addChild(_Club);
			timerBot_Club=0;
		}
		
		public function remove_Bot_Club (e:MouseEvent) {
			
			removeChild(_Club);
			Mouse.show()
			
		}
		
		public function botAdding ():void {
			++botAddingTimer
			if (botAddingTimer > botAddingRnd) {
				botAddingTimer = 0
				botAddingRnd = 100 + Math.ceil (Math.random () * 300)
				var n:int = botArray.length
				botArray.push (new botEngine ())
				var rnd:Number = Math.random() * 50
				
				var k:int = botButtonArray.length
				botButtonArray.push (new Object ())
				botButtonArray[k].button = new botButton_mc ()
				botButtonArray[k].button.id = n
				botButtonArray[k].button.idk = k
				botButtonArray[k].id = n
				botButtonArray[k].button.target = botArray[n]
				botButtonArray[k].button.addEventListener (MouseEvent.CLICK, showBotMenue)
				
				
				
				objectsButtonLayer.addChild (botButtonArray[k].button)
				
				if (enterPosition == "up") {
					if (rnd < 25) {
						botArray[n].initiateBot (newlandWidth+1, newlandWidth+1, "nw")
					
					}
					if (rnd >= 25) {
						botArray[n].initiateBot (0, newlandWidth+1, "se")
					}
					
					if (botArray[n].botName == "Хулиган") {
						botButtonArray[k].button.addEventListener (MouseEvent.MOUSE_OVER, Bot_Club)
						botButtonArray[k].button.addEventListener (MouseEvent.MOUSE_OUT, remove_Bot_Club)
					}
				
				}
			}
		}
		
		public function showBotMenue (e:MouseEvent) {
			showPosetitelMenue (e.currentTarget.target);
		}
		
		public function removeBot (mc:MovieClip):void {
			mc.removeListeners ();
			for (var i = 0; i < botArray.length; i++) {
				if (botArray[i] == mc) {
					trace("remove bot ",botArray[i],mc);
					botArray.splice (i, 1);
				}
			}
		}
		*/
		//запуск подготовки установки дороги
		public function placeRoadFn ():void {
			
			//запуск подготовки установки дороги
			clearObjectPlacement ()
			//var possibleTrigger:Boolean = checkEnterBoth ()
			//trace("!!!!!!!!!!!!!   placeRoadFn    possibleTrigger = ");
				if (!placeRoadTrigger) {
					placeRoadTrigger = true
					keys_mc = new keysMc ()
					landscape.addChild (keys_mc)
					this.addEventListener (Event.ENTER_FRAME, OEFRoadPlace)
				} else {
					placeRoadTrigger = false
				}
				
			
		}
		public var placeObjectTrigger:Boolean = false
		private var placeObjectObject:Object
		
		public function placeThree (id_:String) {
			clearObjectPlacement ()
			placeRoadTrigger = false
			if (!placeObjectTrigger) {
				var possibleTrigger:Boolean = true
				if (possibleTrigger) {
					placeObjectObject = new Object ()
					placeObjectObject.type = "decoration"
					placeObjectObject.productType = id_
					placeObjectObject.id = id_
					
					placeObjectTrigger = true
					keys_mc = new keysMc ()
					landscape.addChild (keys_mc)
					
					//_lands_Quest.checup_Quest(id_)
					this.addEventListener (Event.ENTER_FRAME, OEFRoadPlace)
				} else {
					systemMessage ("Нехватает денег!")
				}
			}
		}
		public function placeObject (_inc:Object)
		{
			
			clearObjectPlacement ()
			placeRoadTrigger = false
			if (!placeObjectTrigger) {
				var possibleTrigger:Boolean = true
				var attrObject:Object = attractionClass.getAttracctionParams (_inc);
				//trace("#########################    placeObject  ##############################################");
				
				if (possibleTrigger) {
					placeObjectObject = new Object ()
					placeObjectObject.type = _inc.type
					
					placeObjectTrigger = true
					if (attrObject.cPl == 1) {
						keys_mc = new keysMc ()
					}
					if (attrObject.cPl == 2) {
						keys_mc = new keysMc2 ()
					}
					if (attrObject.cPl == 4) {
						keys_mc = new keysMc3 ()
					}
					if (attrObject.cPl == 9) {
						keys_mc = new keysMc4 ()
					}
					landscape.addChild (keys_mc)
					this.addEventListener (Event.ENTER_FRAME, OEFRoadPlace)
				}
			}
		}
		
		public function place_Building (Building:String) {
			//trace("^^^^^^^^^^^  place_Building");
			clearObjectPlacement ()
			placeRoadTrigger = false
			if (!placeObjectTrigger) {
				var possibleTrigger:Boolean = true
				if (possibleTrigger) {
					placeObjectObject = new Object ()
					placeObjectObject.type = Building;
					
					placeObjectTrigger = true
					keys_mc = new keysMc3 ()
					landscape.addChild (keys_mc)
					//_lands_Quest.checup_Quest(Building)
					
					this.addEventListener (Event.ENTER_FRAME, OEFRoadPlace)
				} else {
					systemMessage ("Нехватает денег!")
				}
			}
		}
				
		//////////////////////////////////Приклеиваем иконку бомбы к нужной клетке////////////////////////////////
		public function OEFRemover (e:Event):void
		{
			//Начинаем перебор поля
			for (var i = 1 ; i <= newlandWidth; i++)
			{
				for (var j = newlandWidth; j >= 1; j--)
				{
					//Создаем две точки
					var tmpPoint	:Point = new Point(0, 0), 	//Одна в (0, 0)
						tmpPoint1	:Point;						//Вторая просто Поинт
						
					//Второй точке присваиваем значение глобального положения ячейки ландшафта
					tmpPoint1 = lanscapeArray[i][j].localToGlobal (tmpPoint);
					
					//Так вот, если расстояние между мышкой и этой точкой по горизонтали меньше 50
					if (Math.abs (mouseX - tmpPoint1.x) < 50)
					{
						//А по вертикали меньше 25
						if (Math.abs (mouseY - tmpPoint1.y) < 25)
						{
							//Очевидно приклеить иконку с бомбой к этой клетке
							keys_mc.x = lanscapeArray[i][j]._x;
							keys_mc.y = lanscapeArray[i][j]._y;
							
							//Создается новый объект, которому присваиваются относительные координаты
							roadPlaceObject_set(i,j)
							
						}
					}
				}
			}
		}
		///////////////////////////////////////////Конец ремувера///////////////////////////////////
		public function OEFRoadPlace (e:Event) {
			
			if (povorotnikTrigger) {
				if (placeObjectObject.type == "lavka_povorot")
				{
					if (landscape.mouseX > lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].x)
					{
						if (landscape.mouseY > lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].y)
						{
							objectsArray[lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id].povorotTrigger = "se"
							lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].objectBottom_mc.gotoAndStop ("se_fr")
						}
					}
					if (landscape.mouseX < lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].x)
					{
						if (landscape.mouseY > lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].y)
						{
							objectsArray[lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id].povorotTrigger = "sw"
							lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].objectBottom_mc.gotoAndStop ("sw_fr")
						}
					}
					if (landscape.mouseX < lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].x) {
						if (landscape.mouseY < lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].y) {
							objectsArray[lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id].povorotTrigger = "nw"
							lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].objectBottom_mc.gotoAndStop ("nw_fr")
						}
					}
					if (landscape.mouseX > lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].x)
					{
						if (landscape.mouseY < lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].y)
						{
							objectsArray[lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id].povorotTrigger = "ne"
							lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].objectBottom_mc.gotoAndStop ("ne_fr")
						}
					}
				}
			}
			else
			{
				restrictionCursor ();
				
			}
		}
		public function restrictionCursor ()
		{
			for (var i = 1+startPoint-shiftLeft; i <= newlandWidth-shiftLeft; i++)
				{
					for (var j = newlandWidth; j >= 1+startPoint; j--)
					{
						var tmpPoint:Point = new Point(0, 0)
						var tmpPoint1:Point
						tmpPoint1 = lanscapeArray[i][j].localToGlobal (tmpPoint)
						if (Math.abs (mouseX - tmpPoint1.x) < 50)
						{
							if (Math.abs (mouseY - tmpPoint1.y) < 25)
							{
								keys_mc.x = lanscapeArray[i][j]._x
								keys_mc.y = lanscapeArray[i][j]._y
								roadPlaceObject_set(i,j)
								//roadPlaceObject = new Object ()
								//roadPlaceObject.i = i
								//roadPlaceObject.j = j
							}
						}
					}
				}
			
		}
		//жать на значки деньги, ремонт
		public function switchAttraction (e:MouseEvent)
		{
			if (_lands_Interface.user_energy(true)) {
			//жать на значки деньги, ремонт = реакция
			
			var difference:int;
			
			var attractionParams:Object = attractionClass.getAttracctionParams (objectsArray[e.currentTarget.id])
			if (objectsArray[e.currentTarget.id].statusObject.status == "repair") {
				globalParams.user_energy +=  1;
			}
			//ремонт?
			if (objectsArray[e.currentTarget.id].statusObject.status == "broken") {
				objectsArray[e.currentTarget.id].statusObject.status = "repair"
				//objectsArray[e.currentTarget.id].statusObject.rrd = globalParams._handle_time.Just_newTime ();
				objectsArray[e.currentTarget.id].statusObject.rrd = globalParams.UnixTime_Global;
				//objectsArray[e.currentTarget.id].statusObject.lrd = globalParams._handle_time.Just_newTime ();
				objectsArray[e.currentTarget.id].statusObject.lrd = globalParams.UnixTime_Global;
				
				_soundProcessor.playSnd ("repair")
				//добавить опыт игроку за ремонт
				userLevelsTable.addExperience(5);
			}
			//собирать деньги (значки денег)
			if (objectsArray[e.currentTarget.id].statusObject.status == "cashCollected")
			{
				
				_lands_Collections.getElementOfCollection();
				
				ResetCashCollect(e.currentTarget.id);
				
				
				globalParams.stageMc._getDataInfo.init ()
				//начисление денег за жмаканье на значки
				currentMoneyFn (attractionParams.maxProfit)
				
				//опыт за сбор денег 
				userLevelsTable.addExperience(1);
				objectsArray[e.currentTarget.id].blockG=false;
			}
			if (objectsArray[e.currentTarget.id].statusObject.status == "noWorker")
			{
				_land_personalMenu.addWorkerInterfaceFn (e.currentTarget.id)
			}
			if (objectsArray[e.currentTarget.id].statusObject.status == "game")
			{
				if (!globalParams.alone) {
					_soundProcessor.playSnd ("buildingPlace")
					objectsArray[e.currentTarget.id].statusObject.status = "open"
					//objectsArray[e.currentTarget.id].blockG=false;
					addChild(_table_game)
					_table_game.Launch();
				}
			}
			
			//запись сделанных действий сбор денег, ремонт, 
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
			
			
			}
		
		
		}
		public function ResetCashCollect(ID:int):void
		{
			
			
			objectsArray[ID].statusObject.status = "open"
			
			objectsArray[ID].statusObject.sst = globalParams.UnixTime_Global;
			objectsArray[ID].openTrigger = true
			objectsArray[ID].cc = 0;
		}
		
		
		
		public function clearStage ()
		{
			//enterPosition = _enterPosition
			this.removeChild (landscape)
			this.removeChild (objectsButtonLayer)
			
			this.removeChild (arrowPlace)
			placeRoadTrigger = false
			placeObjectTrigger = false
			
			clearObjectPlacement ()
			
			//очистка botArray от ботов
			for (var i = botArray.length - 1; i >= 0; i--)
			{
				botArray[i].removeListeners();
				botArray.splice (i, 1);
			}
			
			_lands_GenerateLand.generateLandscape (newlandWidth, newlandWidth,25,25)
			
		}
		
		public function clearObjectPlacement () {
			
			if (keys_mc != null)
			{
				landscape.removeChild (keys_mc);
				keys_mc = null;
			}
			
			this.removeEventListener (Event.ENTER_FRAME, OEFRoadPlace)
			this.removeEventListener (Event.ENTER_FRAME, OEFRemover)
			
			removeObjectTrigger = false
			placeObjectTrigger = false
			povorotnikTrigger = false
		}
		
		public function dragLand (e:MouseEvent) {
			//trace("|||||||||||||||||||      dragLand____",placeObjectTrigger);
			var tmpObject:Boolean;
			var tmpTrigger:Boolean = false
			
			var possibleTrigger:Boolean = false
			
			///////////////////////////////////////Если что-то ставим//////////////////////////////////
			if (placeObjectTrigger) {
				var params:Object = attractionClass.getAttracctionParams (placeObjectObject)
				
				trace(placeObjectObject,placeObjectObject.type,"            params.cPl = ",params.cPl);
				if (placeObjectObject.type!="decoration") {
					//поставить здание 
					if (_lands_Interface.user_energy(true)) {
						setupBig_Place (roadPlaceObject,globalParams.Building_Basa_Params[placeObjectObject.type].Size);
						tmpTrigger = false;
						//trace("+++++++++++++++++++++++++++  ",placeObjectObject.type,"+++++++++++++++++++++++++++  ");
						_lands_Quest.checup_Quest(placeObjectObject.type)
					}
					
					//attractionClass.Kafeshka_open (placeObjectObject);
				}
				
				
				//проверка главного квеста
				if (placeObjectObject.type==globalParams.questBasa[globalParams.questNumber].ObjStr) {
						
							_lands_Quest.Quest_launch(globalParams.questNumber);
						
				}
				
				//для деревьев
				if (placeObjectObject.type == "decoration") {
					tmpObject = _lands_Possibility.checkDecoPossibility (roadPlaceObject.i, roadPlaceObject.j,lanscapeArray)
					if (tmpObject) {
						tmpTrigger = place_Three(params);
						
					}
				//trace("DECORATION = ",placeObjectObject.id)
				
				}
				
				//tmpTrigger - проверка местности для лавок?
				if (tmpTrigger) {
					lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].decoMc.visible = false				
					//miniMap_Mc.updateMinimap (landWidth, landHeight, lanscapeArray);
					clearObjectPlacement ()
				}
				
				//запись только что построенногго здания
				_updateSavedGames.init_Save (globalParams.UPDATE_RATING,true)
				_soundProcessor.playSnd ("buildingPlace")
				
				
				_lands_Roads.pereborRoads (roadPlaceObject,roadsArray,objectsArray);
				zoomNoFn ()
			} else if (placeRoadTrigger) {
				possibleTrigger = _lands_Possibility.checkRoadPlacePossibility (enterPosition,roadPlaceObject,lanscapeArray)
				if (possibleTrigger) {
					//trace(")=dragLand____",possibleTrigger)
					//установить дорогу
					build_place_Road();
					
					//Второй квест
					//2
					_lands_Quest._Quest(0);
					
				}
				
			} else {
				mouseBackX = mouseX
				mouseBackY = mouseY
				//trace("  landscape.x = ",landscape.x);
				landBackX = landscape.x
				landBackY = landscape.y
				
				this.addEventListener (Event.ENTER_FRAME, OEF)
				cursorMc.gotoAndStop ("closeFr")
			}
			if (removeObjectTrigger) {
				//снос зданий
				_lands_RemoveBuilding.removeObjectFromCursor ()
			}
		}
		public function addExperience(params:int):void
		{
			userLevelsTable.addExperience (params);
		}
		public function place_Three(params:Object):Boolean
		{
			if (_lands_Interface.user_energy(true)) {
				userLevelsTable.addExperience (params.buildExp)
				var tmpMc:MovieClip = new MovieClip ()
																		
				//var n:int = objectsArray.length
				var n:int = objectsButtonArray.length
				
				objectsArray.push (new Object)
				objectsArray[n].type = "decoration"
				objectsArray[n].i = roadPlaceObject.i
				objectsArray[n].j = roadPlaceObject.j
				objectsArray[n].productType = placeObjectObject.id
						
				attractionGenerator.add_button_arr(placeObjectObject.id,n)
						
						
						if (globalParams.Three_Basa_Params[placeObjectObject.id]!=undefined) {
								var tmpMc2:MovieClip = new globalParams.Three_Basa_Params[placeObjectObject.id].button();
								
								
								if (groundSkin == 'green') 
								{
									tmpMc2.gotoAndStop(1);
									
								} else {
									//планета железяка отключена
									tmpMc2.gotoAndStop(2);
									
								}
								
								
							
							
							}
												
						
						tmpMc.id = n
						tmpMc2.id = n
						
						
						lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].object_mc = tmpMc
						lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].objectBottom_mc = tmpMc2
						
						objectsArray[n].object_mc = tmpMc
						objectsArray[n].objectBottom_mc = tmpMc2
						
						tmpMc.x = lanscapeArray[roadPlaceObject.i][roadPlaceObject.j]._x
						tmpMc.y = lanscapeArray[roadPlaceObject.i][roadPlaceObject.j]._y
						
						lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].gr.addChild (tmpMc2)
						landscape.addChild (tmpMc)
						
						objectsArray[n].object_mc = lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].object_mc
						
						lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].cellType = "decoration"
						lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id = n
						
						
						var attractionParams:Object = attractionClass.getAttracctionParams (objectsArray[n])
						currentMoneyFn (-attractionParams.price)
						
						cancelObject = new Object ()
						cancelObject.id = lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id
						cancelObject.type = "decoration"
						cancelObject.i = roadPlaceObject.i
						cancelObject.j = roadPlaceObject.j
						cancelObject.cost = attractionParams.price
						_lands_Quest.checup_Quest(placeObjectObject.id)
				return  true
			}
			return false
		}
		public function roadPlaceObject_set(i:int,j:int):void
		{
			roadPlaceObject = new Object ();
							roadPlaceObject.i = i;
							roadPlaceObject.j = j;
		}
		public function build_place_Road():void
		{
			
			var n:int = roadsArray.length
					roadsArray.push (new Object ())
					roadsArray[n].i = roadPlaceObject.i
					roadsArray[n].j = roadPlaceObject.j
					
					lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].gr.gotoAndStop ("road_fr")
					lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].decoMc.visible = false
					lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].cellType = "road"
					
					_lands_UpdateRoads.updateRoads(roadPlaceObject.i, roadPlaceObject.j)
					
					cancelObject = new Object ()
					cancelObject.id = lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id
					cancelObject.type = "road"
					cancelObject.i = roadPlaceObject.i
					cancelObject.j = roadPlaceObject.j
					cancelObject.cost = 50
						
					_lands_Roads.pereborRoads (roadPlaceObject,roadsArray,objectsArray);
					_soundProcessor.playSnd ("buildingPlace")
			
			
		}
		public function placeEnter(PlaceX:int,PlaceZ:int):void
		{
			landWidth=25
			landHeight=25
			_place_load_building.Place_Building ({objectsArray:[{type:"enterBoth"}]},25,25);
			
			
		}
		
		public var moveTrigger		:Boolean 	= false;
		public var targetObject	:Object;
		//public var _obBtnMc		:MovieClip;
		public var prevSI			:Number 	= -500003;
		public var prevSJ			:Number 	= -500003;
		
		public var prevI:Number = -500003
		public var prevJ:Number = -500003
		public function OEFMoveBuildiing (e:Event)
		{
			
			_lands_MoveBuilding.MoveBuildiing (attractionClass.getAttracctionParams (targetObject))
		}
		
		
		public function delete_Place (_prevI:int,_prevJ:int,Num:int):void
		{
			var X_Place:Array =[0,0,-1,-1,0,-1,-2,-2,-2];
			var Y_Place:Array =[0,1, 1, 0,2, 2, 0, 1, 2];
			for (var i_ = 0; i_ < Num; i_++) {
						
				lanscapeArray[_prevI+X_Place[i_]][_prevJ+Y_Place[i_]].cellType = "grass"
				lanscapeArray[_prevI+X_Place[i_]][_prevJ+Y_Place[i_]].decoMc.visible = true
				lanscapeArray[_prevI+X_Place[i_]][_prevJ+Y_Place[i_]].gr.gotoAndStop (1)
			}
					
			
		}
		
		public function remove_lavka (roadPlaceObject_:Object):Boolean {
			
			SaleOldBuilding ("lavka","");
			for (var i_:int = 0; i_ < objectsButtonArray.length; i_++)
			{
				if (objectsButtonArray[i_].id == lanscapeArray[roadPlaceObject_.i][roadPlaceObject_.j].id)
				{
							_lands_RemoveBuilding.remove_splice (i_)
							
				}
			}
					
			lanscapeArray[roadPlaceObject_.i][roadPlaceObject_.j].cellType = "road"
			
			objectsArray[lanscapeArray[roadPlaceObject_.i][roadPlaceObject_.j].id].type = "deleted"
			try {
				landscape.removeChild (lanscapeArray[roadPlaceObject_.i][roadPlaceObject_.j].object_mc);
				lanscapeArray[roadPlaceObject_.i][roadPlaceObject_.j].gr.removeChild (lanscapeArray[roadPlaceObject_.i][roadPlaceObject_.j].objectBottom_mc);
				} catch (e:Error) {
					trace("ERROR REMOVE LAVKA");
				}
			
			
			
			
			return false;
		}
		public function Remove_Svetofor (objectsButtonLayer:Object,ID:int):void {
			for (var i_:int = 0; i_ < svetoforArray.length; i_++) {
				if (svetoforArray[i_].id == ID) {
					svetofor_splice(i_)
					
								
				}
			}
			
		}
		public function svetofor_splice(i_:int):void {
			objectsButtonLayer.removeChild (svetoforArray[i_]);
			svetoforArray.splice (i_, 1);
			
		}
		//продажа старых зданий
		public function SaleOldBuilding (_nameObject:String,TreeWood:String) {
			
			var Cost_Old:int;
			//если декорация (дерево)   продажа старых зданий за пол цены
			
			if (_nameObject != "decoration") {
				
				if (globalParams.onGetAdminTableArray[_nameObject]==undefined) {
					_nameObject = _nameObject.slice(0,_nameObject.length-5)
				}
				
				Cost_Old = globalParams.onGetAdminTableArray[_nameObject].price/2;
			} else {
				
				
				Cost_Old = globalParams.onGetAdminTableArray["decoration"][TreeWood].price/2;
			}
			
			currentMoney+=Cost_Old;
			currentMoneyFn(Cost_Old);
			
		}

		public function add_log (EventLog:String) {
			
			userLevelsTable._insertDataLog.insert_Data_Log (EventLog)
		}
		// --------------------------------- Установка больших объектов -------------------------------
		
		public function setupBig_Place (_inc:Object,Place:String) {
			var params:Object = attractionClass.getAttracctionParams (placeObjectObject)
			var tmpObject:Object = new Object ()
			tmpObject.trigger = false
			if (Place == "3x3") {
				
				tmpObject.trigger = _lands_Possibility.check3x3Possibility (_inc.i, _inc.j,lanscapeArray)
			} 
			if (Place == "2x2") {
				tmpObject.trigger = _lands_Possibility.check2x2Possibility (_inc.i, _inc.j,enterPosition,lanscapeArray)
			
			}
			if (Place == "1x1") {
				if (placeObjectObject.type!="lavka") {
					tmpObject.trigger = _lands_Possibility.check1x1Possibility (_inc.i, _inc.j,enterPosition,lanscapeArray)
				} else {
					//checkLavkaPossibility(ii, jj,enterPosition:String,lanscapeArray)
					tmpObject.trigger = _lands_Possibility.checkLavkaPossibility (_inc.i, _inc.j,enterPosition,lanscapeArray)
				}
				
			}
			if (tmpObject.trigger) {
				userLevelsTable.addExperience (params.buildExp)
				//trace("__ = ",placeObjectObject.type);
				if (placeObjectObject.type!="decoration") {
					//trace("No decoration");
					objectsArray.push (attractionGenerator.getObject (placeObjectObject.type))
					
				}
				lanscapeArray[_inc.i][_inc.j].decoMc.visible = false
				clearObjectPlacement ()
				
			}
		}
		
		// --------------------------------- покажем менюшки объектов ---------------------------------
		
		public function selectProduct (e:MouseEvent):void {
			_soundProcessor.playSnd ("click")
			if (!objectsArray[e.currentTarget.id].openTrigger) {			
				objectsMenueMc.windowMc.pizzaBtn.gotoAndStop (1)
				objectsMenueMc.windowMc.cockaBtn.gotoAndStop (1)
				objectsMenueMc.windowMc.burgerBtn.gotoAndStop (1)
				
				if (e.currentTarget.productType == "pizza") {
					objectsMenueMc.windowMc.pizzaBtn.gotoAndStop (2)
					objectsArray[e.currentTarget.id].TypeFood = "pizza"
				}
				if (e.currentTarget.productType == "coca") {
					objectsMenueMc.windowMc.cockaBtn.gotoAndStop (2)
					objectsArray[e.currentTarget.id].TypeFood = "coca"
				}
				if (e.currentTarget.productType == "burger") {
					objectsMenueMc.windowMc.burgerBtn.gotoAndStop (2)
					objectsArray[e.currentTarget.id].TypeFood = "burger"
				}
				
			
			} else {
				closeObjectMenue (e)
				systemMessage ("Остановите работу кафе прежде чем менять меню.")
			}
		}
		public var objectsMenueMc:MovieClip
		
		public var _objectMenue:objectMenue
		
		public function psevdo_Button (e:MouseEvent) {
			trace("++++++++++++++++  psevdo_Button  ++++++++++++++++++++");
		}
		
		public function showObjectMenue (e:MouseEvent) {
			
			_soundProcessor.playSnd ("click")
			var possibleTrigger:Boolean = true
			//тригер, отвечающий за снос здания
			if (removeObjectTrigger) {
				
				_lands_RemoveBuilding.removeObjectFromItself (objectsArray[lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].id])
				possibleTrigger = false
			}
			if (placeRoadTrigger) {
				possibleTrigger = false
			}
			if (placeObjectTrigger) {
				possibleTrigger = false
			}
			if (globalParams.friendsParkTrigger) {
				possibleTrigger = false
			}
			if (possibleTrigger) {
				_objectMenue = new objectMenue ()
				
				var tmpPoint:Point = new Point(0, 0)
				var tmpPoint1:Point
				
				tmpPoint1 = objectsArray[e.currentTarget.id].objectBottom_mc.localToGlobal (tmpPoint)
				
				_objectMenue.x = tmpPoint1.x
				_objectMenue.y = tmpPoint1.y - 30
				trace(objectsArray[e.currentTarget.id].type,"____food = ",objectsArray[e.currentTarget.id].TypeFood);
				
				attractionClass.Kafeshka_open (objectsArray[e.currentTarget.id])
				
				_objectMenue.init (e.currentTarget.id)
				
				_objectMenue.fon.addEventListener (MouseEvent.CLICK, closeObjectMenue)
				_objectMenue.windowMc.okBtn.addEventListener (MouseEvent.CLICK, closeObjectMenue)
				
				addChild (_objectMenue)
			}
		
		
		}
		
		public function close_ObjectMenueNew () {
			_soundProcessor.playSnd ("click")
			pauseTrigger = false
			this.removeChild (_objectMenue)
			_objectMenue = null
		}
		public function closeObjectMenue (e:MouseEvent) {
			_soundProcessor.playSnd ("click")
			pauseTrigger = false
			this.removeChild (_objectMenue)
			_objectMenue = null
		}
		// --------------------------------- стандартное системное сообщение
		public function systemMessage (msg:String) {
			addChild(_lands_message)
			_lands_message.systemMessage (msg)
		}
		
		public function stopdragLand (e:MouseEvent) {
			this.removeEventListener (Event.ENTER_FRAME, OEF)
			cursorMc.gotoAndStop ("openFr")
		}
		public function OEF (e:Event) {
			leftBorder = 76
			rightBorder = landscape.x + (newlandWidth)*76*2+76
			
			var tmpX:int = landBackX -  (mouseBackX - mouseX)
			var tmpY:int = landBackY -  (mouseBackY - mouseY)
			_lands_Sort.updatePosition (tmpX, tmpY)
		}
		
		public function Coordinate_landscape (i_Land:int,j_Land:int):Point {
			var Land_Point:Point = new Point(0,0);
			Land_Point.x=globalParams.get_x(i_Land,j_Land,newlandWidth);
			Land_Point.y=globalParams.get_y(i_Land,j_Land);
			/*
			Land_Point.x= (i_Land - 1) * 76 + (j_Land - 1) * 76 - (newlandWidth) * 76 + 76;
			Land_Point.y = (i_Land - 1) * 38 - (j_Land - 1) * 38;
			*/
			return Land_Point;
		}
		
		public function top_position (ObjDisplay:DisplayObject,top:int):void {
			if (objectsButtonLayer.contains(ObjDisplay)) {
				objectsButtonLayer.setChildIndex(ObjDisplay, top);
			} else {
				trace("  ERROR нарушение расположения слоев!!!!!!!  Лишний объект?      ",ObjDisplay)
				}
		}
		public function trash_and_building(mc1:Object):Boolean
		{
			
			for (var k:int = 0; k < objectsArray.length; k++) {
				
				
				if (mc1.hitTestObject(objectsArray[k].objectBottom_mc)) {
					
					return true;
				
				}
			
			}
			return false
		}
	}
}