package tools 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*
	//import Shop.*
	//import shopAdmin.*;
	/**
	 * ...
	 * @author ...
	 */
	public class present_menue extends MovieClip 
	{
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		public var Allow_ID:Boolean;
		
		public var _insertPromoLog:insertPromoLog = new insertPromoLog()
		
		//public var shop:Shop;
		
		
		public function present_menue() 
		{
			this.addEventListener (MouseEvent.MOUSE_OVER, 	onMouseOverHandler);
			this.addEventListener (MouseEvent.MOUSE_OUT, 	onMouseOutHandler);
			this.addEventListener (MouseEvent.ROLL_OUT, 	onMouseOutHandler);
			
			workerBtn.Help = "Коллекции";
			workerBtn.addEventListener		(MouseEvent.CLICK, showCollections);
				workerBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
				workerBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			
			if (!globalParams.alone) {
				implentBtn.addEventListener		(MouseEvent.CLICK, implementatorMail_click);
				implentBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
				implentBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
				implentBtn.Help = "Написать разработчику";
				marketBtn.addEventListener 		(MouseEvent.CLICK, showCheatInterface);
			marketBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			marketBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
				
				marketBtn.Help = "Введите пароль";
				attractionsBtn.addEventListener (MouseEvent.CLICK, showShop);
				attractionsBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
				attractionsBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
				attractionsBtn.Help = "Пригласить друга";
			} else {
				implentBtn.visible = false;
				marketBtn.visible = false;
				attractionsBtn.visible = false;
			}
		if (globalParams.Allow_Chiter==false) {
			marketBtn.visible = false;
			attractionsBtn.visible = false;
		}
		
		
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
		
		public function implementatorMail_click(e:MouseEvent):void
		{
			
		var _implementatorMail:implementatorMail = new implementatorMail();
		addChild(_implementatorMail);
		}
		
		//Показать коллекции
		public function showCollections(e:MouseEvent):void
		{
			
		var _tableCollect:tableCollect = new tableCollect()
		_tableCollect.x = stage.stageWidth/2-300;
			_tableCollect.y = stage.stageHeight/2-230;
		globalParams.indexMc.addChild(_tableCollect)
		_tableCollect.Anim()
		
		
		}
		
		private var passEnterTrigger:Boolean = false;
		private var _passwordInterface:MovieClip;
		public function showCheatInterface (e:MouseEvent) {
			
			if (passEnterTrigger) {
				//showCheatsInterface ()
			} else {
				_passwordInterface = new passwordInterface ()
				_passwordInterface.x = (stage.stageWidth-800)/2 + 399-74
				_passwordInterface.y = -(stage.stageHeight-600)/2 + 287-520
				_passwordInterface.windowMc.okBtn.addEventListener (MouseEvent.CLICK, killPassEnter)
				_passwordInterface.windowMc.passBtn.addEventListener (MouseEvent.CLICK, passEnter)
				
				addChild (_passwordInterface)
			}
		
		
		
		}
		
		//Показать магазин
		
		public function showShop (e:MouseEvent) {
			globalParams.indexMc._post_friend.post_launch();
		}
		
		
		
		
		//Магазин кончился
		/*
		public function close_baglog (event:MouseEvent) {
			removeChild(_baglog);
		}
		*/
		public function passEnter (e:MouseEvent) {
			if (globalParams.Allow_Chiter) {
			if (_passwordInterface.windowMc.messageText.text == "post") {
				globalParams.indexMc._post_image.post_launch("сегодня праздник, идет весна","holiday");
				}
			if (_passwordInterface.windowMc.messageText.text == "draw") {
				//var k:String='http://cs320731.vk.com/upload.php?act=do_add&mid=154412759&aid=-14&gid=0&hash=acdab02436847b9a6c96ce1866ba38b2&rhash=c69acff628ae775be16477b1f9ea99ef&swfupload=1&api=1&wallphoto=1';
				
				//globalParams.indexMc._lands_Interface._Friend_API.removeChild(globalParams.indexMc._lands_Interface._Friend_API._panel_friend);
				
				//globalParams.indexMc._lands_Interface._Friend_API._saveShot_API.makeScreenshot(k)
				//globalParams.indexMc._saveShot_API.makeScreenshot(k)
				//globalParams.indexMc._lands_Interface._Friend_API._saveShot_API.makeScreenshot("fsdafrasdfsad");
				trace("__________log__________");
			//globalParams.indexMc.make_shot()
			
			}
			if (_passwordInterface.windowMc.messageText.text == "draw0") {
				//globalParams.indexMc._lands_Interface._Friend_API.Screenshot_response({})
			}
			
			if (_passwordInterface.windowMc.messageText.text == "draw1") {
				//globalParams.indexMc._lands_Interface._Friend_API.makeScreenshot()
			}
			if (_passwordInterface.windowMc.messageText.text == "log") {
				
				
				var _baglog:baglog = new baglog();
				addChild(_baglog);
			}
			
			
			if (_passwordInterface.windowMc.messageText.text == "friend1") {
				//globalParams.indexMc._lands_Friend.saveUserParkBuffer()
				globalParams.indexMc._lands_Friend.showFriendParkFn(2874707);
			}
			if (_passwordInterface.windowMc.messageText.text == "friend0") {
				globalParams.indexMc._lands_Friend.saveUserParkBuffer()
				globalParams.indexMc._lands_Friend.showFriendParkFn(6513731);
			}
			if (_passwordInterface.windowMc.messageText.text == "ermineruzik") {
				passEnterTrigger = true
			}
			if(_passwordInterface.windowMc.messageText.text == 'reset')
			{
				resetParkFn();
			}
			if(_passwordInterface.windowMc.messageText.text == 'money_')
			{
				globalParams.user_cash += 100000;
			//globalParams.user_cash += 80000;
			}
			if(_passwordInterface.windowMc.messageText.text == 'add__')
			{
				globalParams.indexMc._insertBillingInfo.init(1, "_Ruz");
			}
			
			if(_passwordInterface.windowMc.messageText.text == 'money__')
			{
				trace(" land      kukubaksi = ",globalParams.indexMc.kukubaksi);
				
				globalParams.indexMc.kukubaksi+=1000;
				
				//globalParams.indexMc._lands_Interface.indicatorsMc.kukubaksLable.text = "" + globalParams.indexMc.kukubaksi
				//indexMc.indicatorsMc.kukubaksLable.text =""+globalParams.indexMc.kukubaksi;
				//globalParams.indexMc._insertBillingInfo.init(1000, "Admin_Ruz");
				//globalParams.kukubaksi += 1000;
			}
			if(_passwordInterface.windowMc.messageText.text == 'energy_')
			{
				globalParams.user_energy=100;
			}
			if(_passwordInterface.windowMc.messageText.text == 'exp_')
			{
				globalParams.user_exp += 10000000;
			}
			if(_passwordInterface.windowMc.messageText.text == 'save')
			{
				trace("   SAVE  ",globalParams.BACKUP_SAVE);
				globalParams.indexMc._updateSavedGames.init_Save (globalParams.BACKUP_SAVE,false);
			}
			if(_passwordInterface.windowMc.messageText.text == 'load')
			{
				trace("   LOAD  ",globalParams.BACKUP_GET);
				globalParams.indexMc.reloadParkFn (globalParams.UID,globalParams.BACKUP_GET);
			}
			
			if(_passwordInterface.windowMc.messageText.text == 'save_')
			{
				
				globalParams.indexMc._updateSavedGames.init_Save (globalParams.C_BACKUP_SAVE,false);
			}
			if(_passwordInterface.windowMc.messageText.text == 'load_')
			{
				
				globalParams.indexMc.reloadParkFn (globalParams.UID,globalParams.C_BACKUP_GET);
			}
			if(_passwordInterface.windowMc.messageText.text == 'save__')
			{
				
				globalParams.indexMc._updateSavedGames.init_Save (globalParams.D_BACKUP_SAVE,false);
			}
			if(_passwordInterface.windowMc.messageText.text == 'load__')
			{
				
				globalParams.indexMc.reloadParkFn (globalParams.UID,globalParams.D_BACKUP_GET);
			}
			
			if(_passwordInterface.windowMc.messageText.text == 'work')
			{
				globalParams.indexMc.Push_Workers ()
				
			}
			if(_passwordInterface.windowMc.messageText.text == 'promo')
			{
				_insertPromoLog.insert_Promo_Log ();
			}
			if(_passwordInterface.windowMc.messageText.text == 'worker_')
			{
				personalMenue.Push_Workers_M()
			}
			if (Allow_ID == true) {
				var _UID:String = ""+int(_passwordInterface.windowMc.messageText.text);
				Allow_ID = false;
				globalParams.indexMc.reloadParkFn (_UID,globalParams.GET_RATING);
			}
			
			if(_passwordInterface.windowMc.messageText.text == 'ruzik')
			{
				Allow_ID = true;
			}
			
			killPassEnter (e)
			
			}
		}
		private var _cheats:MovieClip
		
		private var adminContainer:MovieClip
		
		public function killAdminPanel (e:MouseEvent) {
			globalParams.indexMc.removeChild (adminContainer)
		}
		
		public function resetMarketFn (e:MouseEvent) {
			//reset??
			load_personalMenue.analyseWorkersMarket (null)
		}
		
		
		public function resetParkFn (e:MouseEvent = null) {
			globalParams.user_cash = globalParams.user_start_cash
			globalParams.user_energy = 10;
			globalParams.indexMc.resetPark ()
			
			//Обнуляю номер квеста
			globalParams.questNumber = 0;
			
			//Отправляю данные об этом на сервер
			//globalParams.stageMc.qNum.setQuest();
			
			globalParams.user_lvl = 1
			globalParams.user_exp = 0
		}
		
		function addExpFn (e:MouseEvent) {
			userLevelsTable.addExperience (100)
		}
		
		function addCoinsFn (e:MouseEvent) {
			globalParams.indexMc.currentMoneyFn (1000)
			
		}
		
		public function killPassEnter (e:MouseEvent) {
			try
			{
			this.removeChild (_passwordInterface);
			_passwordInterface = null;
			} catch (e:Error)
			{
				
			}
		}
		
		// АНИМАЦИЯ
		private var wayTrigger:Boolean = false
		function onMouseOverHandler (e:MouseEvent) {
			wayTrigger = true
			var topPosition:uint = globalParams.indexMc.numChildren - 1;
			//globalParams.indexMc.setChildIndex(globalParams.indexMc._present_menue, topPosition);
		globalParams.indexMc.setChildIndex(globalParams.indexMc._lands_Interface, topPosition);
		}
		function onMouseOutHandler (e:MouseEvent) {
			wayTrigger = false
		}
		public function update () {
			if (wayTrigger) {
				this.nextFrame ()
			} else {
				this.prevFrame ()
			}
		}
	}

}