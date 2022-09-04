package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;
	//import flash.filters.GradientGlowFilter;
	import flash.filters.GlowFilter;

	public class lands_Interface extends MovieClip
	{
		//globalParams.Allow_Robocat = true
		public var _shield:shield = new shield ();
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		public var _RuzikSmall_:RuzikSmall_ = new RuzikSmall_();
		public var _mini_Quest:mini_Quest = new mini_Quest();


		public var indicatorsMc:_indicatorMc = new _indicatorMc ();

		public var _Friend_API:Friend_API = new Friend_API();
		public var _toPlanet:toPlanet=new toPlanet();
		public var toGroup:ToGroup;
		public var _park_menue:park_menue;
		public var _building_menue:building_menue;
		public var _present_menue:present_menue;
		
		
		
		public function lands_Interface():void
		{}
		public function refresh_indicator():void
		{
			indicatorsMc.exp.preMask.scaleX = globalParams.user_exp / Math.floor(globalParams.Exp_MaxLv);
			indicatorsMc.kukubaksLable.text = String(globalParams.indexMc.kukubaksi);
		}
		public function refresh_menu():void
		{
			remove_menu();
			add_menu();
		}
		public function resize_menu():void
		{
			_shield.x = 1-(globalParams.indexMc.stage.stageWidth-800)/2;
			_shield.y = 170-(globalParams.indexMc.stage.stageHeight-600)/2;

			indicatorsMc.x = 20-(globalParams.indexMc.stage.stageWidth-800)/2;
			indicatorsMc.y = -(globalParams.indexMc.stage.stageHeight-600)/2;

			globalParams.indexMc._rightButtons.x = (globalParams.indexMc.stage.stageWidth-800)/2;
			globalParams.indexMc._rightButtons.y = -(globalParams.indexMc.stage.stageHeight-600)/2;;


			_building_menue.x = 74-(globalParams.indexMc.stage.stageWidth-800)/2;

			_building_menue.y  = 520+(globalParams.indexMc.stage.stageHeight-600)/2;
			_park_menue.x = 14-(globalParams.indexMc.stage.stageWidth-800)/2;

			_park_menue.y  = 520+(globalParams.indexMc.stage.stageHeight-600)/2;
			_present_menue.x = 134-(globalParams.indexMc.stage.stageWidth-800)/2;;

			_present_menue.y  = 520+(globalParams.indexMc.stage.stageHeight-600)/2;

			toGroup.x = 194-(globalParams.indexMc.stage.stageWidth-800)/2;
			toGroup.y = 520+(globalParams.indexMc.stage.stageHeight-600)/2;

			_toPlanet.x= ((globalParams.indexMc.stage.stageWidth-800)+728)-(globalParams.indexMc.stage.stageWidth-800)/2;
			_toPlanet.y=450+(globalParams.indexMc.stage.stageHeight-600)/2;

			globalParams.indexMc.expPopup.x = 30-(globalParams.indexMc.stage.stageWidth-800)/2;;
			globalParams.indexMc.expPopup.y = 27-(globalParams.indexMc.stage.stageHeight-600)/2;;

			globalParams.indexMc._popupBalonMc.x = 136-(globalParams.indexMc.stage.stageWidth-800)/2;;
			globalParams.indexMc._popupBalonMc.y = 27-(globalParams.indexMc.stage.stageHeight-600)/2;;

			_RuzikSmall_.x = 10-(globalParams.indexMc.stage.stageWidth-800)/2;;
			_RuzikSmall_.y = 120-(globalParams.indexMc.stage.stageHeight-600)/2;;

			_mini_Quest.x = 10-(globalParams.indexMc.stage.stageWidth-800)/2;;
			_mini_Quest.y = 120-(globalParams.indexMc.stage.stageHeight-600)/2+50;

			globalParams.indexMc._land_building_cancel.x = _building_menue.x - 15;//-(globalParams.indexMc.stage.stageWidth-800)/2;
			globalParams.indexMc._land_building_cancel.y = _building_menue.y - 44;//-(globalParams.indexMc.stage.stageHeight-600)/2;
			try
			{
				globalParams.indexMc._backToMAinModeBtn.x = 74;
				globalParams.indexMc._backToMAinModeBtn.y = globalParams.indexMc.stage.stageHeight - 80;
			}
			catch (e:Error)
			{

			}

			if (globalParams.stageMc.prewStageW != globalParams.indexMc.stage.stageWidth)
			{
				globalParams.stageMc.prewStageW = globalParams.indexMc.stage.stageWidth;
				globalParams.indexMc._screen_border_vis.checkVisibility();
			}

			_Friend_API.x = (globalParams.indexMc.stage.stageWidth -800)/2;
			_Friend_API.y = 3+(globalParams.indexMc.stage.stageHeight -600)/2;


		}
		public function add_menu():void
		{
			//добавить нижние левые кнопки призов;
			_present_menue = new present_menue ();
			_present_menue.x = 134;
			_present_menue.y = 520;
			addChild(_present_menue);
			toGroup = new ToGroup(globalParams.indexMc.stage.stageHeight);
			addChild(_toPlanet);
			_toPlanet.Launch(globalParams.indexMc.groundSkin);
			addChild(toGroup);
			//добавить нижние левые кнопки найма сотрудников
			_park_menue = new park_menue ();
			_park_menue.x = 14;
			_park_menue.y = 520;
			addChild(_park_menue);
			//добавить нижние левые кнопки строительства;
			_building_menue = new building_menue ();
			_building_menue.x = 74;
			_building_menue.y = 520;
			addChild(_building_menue);
			_RuzikSmall_.addEventListener(MouseEvent.CLICK, globalParams.indexMc._lands_Quest.Quest_Log);
			_mini_Quest.addEventListener(MouseEvent.CLICK, globalParams.indexMc._lands_Quest.mini_Quest_Log);


			add_collections();

			addChild(_Friend_API);

			_Friend_API.Main();
			_Friend_API.addEventListener("click_id_friend", Click_Friends);
			indicatorsMc.Energy.addEventListener(MouseEvent.MOUSE_OVER, energy_over);
			indicatorsMc.Energy.addEventListener(MouseEvent.MOUSE_OUT, energy_out);
			indicatorsMc.Energy.addEventListener(MouseEvent.CLICK, energy_click);
			indicatorsMc.LabelEnergy.mouseEnabled = false;
			indicatorsMc.Energy.preMask.mouseEnabled = false;
			indicatorsMc.buttonMode = true;
			//indicatorsMc.Energy.LabelEnergy.mouseEnabled=false
		}
		public function energy_over(event:MouseEvent)
		{

			event.target.filters=[
			  new GlowFilter( 0xFFFFFF, 1, 3, 3, 10, 3  )
			];
		}
		public function energy_out(event:MouseEvent)
		{

			event.target.filters=[
			];
		}
		public function energy_click(event:MouseEvent)
		{

			var _yesNoMessage:yesNoMessage = new yesNoMessage();
			_yesNoMessage.Message("Купить 50 ед. энергии за 3 кукубакса. +ускорнение выработки энергии в 2 раза в течение часа.");
			_yesNoMessage.button_text("Купить","Отмена","Купить энергию?");
			_yesNoMessage.addEventListener("confirm", addEnergy);
			addChild(_yesNoMessage);

		}


		public function Click_Friends(e:Event):void
		{

			globalParams.indexMc._lands_Friend.saveUserParkBuffer();
			globalParams.friendsParkTrigger = true;
			//Переход в парк друзей
			globalParams.indexMc._lands_Friend.showFriendParkFn(e.currentTarget.uid);
		}

		public function add_collections():void
		{


			if (globalParams.Allow_Robocat == true || globalParams.Interdict_Litter == true)
			{
				_shield.x = 1;
				_shield.y = 170;
				_shield.scaleX = .5;
				_shield.scaleY = .5;
				if (globalParams.Allow_Robocat == true)
				{
					_shield.symbol.gotoAndStop(1);
					_shield.Help = "Коллекция стража \n нет хулиганов";
				}
				else
				{
					_shield.symbol.gotoAndStop(2);
					_shield.Help = "Коллекция эколога \n нет мусора";
				}

				_shield.addEventListener(MouseEvent.MOUSE_OVER, Add_Help_Menu);
				_shield.addEventListener(MouseEvent.MOUSE_OUT, Remove_Help_Menu);
				addChild(_shield);
			}

		}
		public function Add_Help_Menu(event:MouseEvent)
		{
			Bubble_Help_mc.x = mouseX + 15;
			Bubble_Help_mc.y = mouseY - 15;
			Bubble_Help_mc.helpText.text = " " + event.currentTarget.Help;
			addChild(Bubble_Help_mc);

		}
		public function Remove_Help_Menu(e:MouseEvent)
		{
			if (contains(Bubble_Help_mc))
			{
				removeChild(Bubble_Help_mc);
			}

		}


		public function add_indicator():void
		{

			//globalParams.indexMc.indicatorsMc = new _indicatorMc ();
			indicatorsMc.x = 20;
			indicatorsMc.y = 5;
			//Добавляем верхнюю панель, которая баблосами, опытом и прочей хуйней
			globalParams.indexMc.addChild(indicatorsMc);
			indicatorsMc.levelLable.addEventListener(MouseEvent.CLICK, exp_table_add);
			indicatorsMc.exp.addEventListener(MouseEvent.CLICK, exp_table_add);
			indicatorsMc.exp.addEventListener(MouseEvent.MOUSE_OVER, energy_over);
			indicatorsMc.exp.addEventListener(MouseEvent.MOUSE_OUT, energy_out);
		}
		public function exp_table_add(e:MouseEvent):void
		{
			var _exp_table:exp_table = new exp_table();
			indicatorsMc.addChild(_exp_table);
			_exp_table.Launch();
		}
		public function add_coin_menu():void
		{
			
			if (!globalParams.alone) {
				//добавит деньги
				indicatorsMc.addCoins.addEventListener(MouseEvent.CLICK, globalParams.indexMc.addMoney);
				indicatorsMc.moneyLable.addEventListener(MouseEvent.CLICK, globalParams.indexMc.addMoney);
				
				//добавить кукубаксы;
				indicatorsMc.addKukubakses.addEventListener(MouseEvent.CLICK, globalParams.indexMc.addMoney);
				indicatorsMc.kukubaksLable.addEventListener(MouseEvent.CLICK, globalParams.indexMc.addMoney);
				indicatorsMc.kukubaks_add.addEventListener(MouseEvent.CLICK, globalParams.indexMc.addMoney);
				indicatorsMc.kukubaks_add.addEventListener(MouseEvent.MOUSE_OVER, energy_over);
				indicatorsMc.kukubaks_add.addEventListener(MouseEvent.MOUSE_OUT, energy_out);
			}
		}
		public function add_return_park_button():void
		{
			if (globalParams.friendsParkTrigger)
			{


				//добавить кнопку возвращения домой из города друга 
				_park_menue.visible = false;
				_building_menue.visible = false;
				globalParams.indexMc._backToMAinModeBtn = new backToMAinModeBtn ();
				globalParams.indexMc._backToMAinModeBtn.addEventListener(MouseEvent.CLICK, globalParams.indexMc._lands_Friend.backToMainModeFn);
				globalParams.indexMc._backToMAinModeBtn.addEventListener(MouseEvent.MOUSE_OVER, globalParams.indexMc.Add_Help_Menu);
				globalParams.indexMc._backToMAinModeBtn.addEventListener(MouseEvent.MOUSE_OUT, globalParams.indexMc.Remove_Help_Menu);
				globalParams.indexMc._backToMAinModeBtn.Help = "Вернутся в свой парк";
				//Здесь координаты кнопки «домой»
				globalParams.indexMc._backToMAinModeBtn.x = 74;
				globalParams.indexMc._backToMAinModeBtn.y = globalParams.indexMc.stage.stageHeight - 80;
				globalParams.indexMc.addChild(globalParams.indexMc._backToMAinModeBtn);
			}



		}

		public function add_popup():void
		{
			globalParams.indexMc._popupBalonMc = new popupBalonMc ()
			;
			globalParams.indexMc._popupBalonMc.x = 136;
			globalParams.indexMc._popupBalonMc.y = 27;
			globalParams.indexMc._popupBalonMc.textBaloon.textBaloon.textLable.text = "+11";
			globalParams.indexMc._popupBalonMc.textBaloon.gotoAndStop(1);
			globalParams.indexMc._popupBalonMc.gotoAndStop("endFr");
			globalParams.indexMc.addChild(globalParams.indexMc._popupBalonMc);
			globalParams.indexMc.expPopup = new popupBalonMc ();
			globalParams.indexMc.expPopup.x = 30;
			globalParams.indexMc.expPopup.y = 27;
			globalParams.indexMc.expPopup.textBaloon.textBaloon.textLable.text = "+11";
			globalParams.indexMc.expPopup.textBaloon.gotoAndStop(2);
			globalParams.indexMc.expPopup.gotoAndStop("endFr");
			globalParams.indexMc.addChild(globalParams.indexMc.expPopup);
		}

		public function update():void
		{
			_building_menue.update();
			_park_menue.update();
			_present_menue.update();
		}
		public function remove_menu():void
		{
			removeChild(_park_menue);
			removeChild(_building_menue);
			removeChild(_present_menue);
			removeChild(toGroup);
			removeChild(_toPlanet);

			globalParams.indexMc.removeChild(indicatorsMc);
			if (contains(_shield))
			{
				_shield.removeEventListener(MouseEvent.MOUSE_OVER, Add_Help_Menu);
				_shield.removeEventListener(MouseEvent.MOUSE_OUT, Remove_Help_Menu);
				removeChild(_shield);
			}
			indicatorsMc.levelLable.removeEventListener(MouseEvent.CLICK, exp_table_add);
			indicatorsMc.exp.removeEventListener(MouseEvent.CLICK, exp_table_add);

			_RuzikSmall_.removeEventListener(MouseEvent.CLICK, globalParams.indexMc._lands_Quest.Quest_Log);
			_RuzikSmall_.removeEventListener(MouseEvent.CLICK, globalParams.indexMc._lands_Quest.mini_Quest_Log);
		}

		public function Launch_Interface():void
		{


			//правое верхнее кнопки меню
			globalParams.indexMc._rightButtons = new rightButtons ();
			globalParams.indexMc._rightButtons.gotoAndStop(1);
			globalParams.indexMc._rightButtons.settings.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.settings2.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.zoomButton.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.zoomOutButton.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.musickSwitch.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.soundSwitch.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.qualitiButton.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.screen.addEventListener(MouseEvent.MOUSE_OVER, openRightMenue);
			globalParams.indexMc._rightButtons.settings.addEventListener(MouseEvent.MOUSE_OUT, closeRightMenue);
			globalParams.indexMc._rightButtons.settings2.addEventListener(MouseEvent.MOUSE_OUT, closeRightMenue);
			globalParams.indexMc.objectsButtonLayer.addEventListener(MouseEvent.MOUSE_OUT, closeRightMenue);
			globalParams.indexMc._rightButtons.openTrigger = false
			;
			globalParams.indexMc._rightButtons.zoomButton.addEventListener(MouseEvent.CLICK, zoomInFn);
			globalParams.indexMc._rightButtons.zoomOutButton.addEventListener(MouseEvent.CLICK, zoomOutFn);
			globalParams.indexMc._rightButtons.musickSwitch.addEventListener(MouseEvent.CLICK, musickSwitchFn);
			globalParams.indexMc._rightButtons.soundSwitch.addEventListener(MouseEvent.CLICK, soundSwitchFn);
			globalParams.indexMc._rightButtons.fullscreenBtn.addEventListener(MouseEvent.CLICK, globalParams.indexMc.switchFullscreen);
			globalParams.indexMc._rightButtons.qualitiButton.addEventListener(MouseEvent.CLICK, switchQuality);
			globalParams.indexMc._rightButtons.screen.addEventListener(MouseEvent.MOUSE_OVER, overScreenshot);
			globalParams.indexMc._rightButtons.screen.addEventListener(MouseEvent.CLICK, makeScreenshot);
			globalParams.indexMc.addChild(globalParams.indexMc._rightButtons);
		}
		public function user_energy(DispenseYes:Boolean):Boolean
		{

			var MaxDispense:int = 10 + globalParams.user_lvl + globalParams.buy_energy;
			if (DispenseYes == true)
			{

				if (1 <= globalParams.user_energy)
				{

					globalParams.user_energy -=  1;
					user_energy_Goto(MaxDispense);
					return true;
				}
				else
				{
					globalParams.indexMc.systemMessage("У вас не хватает энергии.");
				}
			}
			else
			{
				if (isNaN(globalParams.user_energy)) globalParams.user_energy=0;
				
				//trace(globalParams.user_energy," energy = "+.001 + globalParams.buy_speed_energy,"===")
				globalParams.user_energy +=  .001 + globalParams.buy_speed_energy;
				if (globalParams.buy_time_energy + 3600 < globalParams.UnixTime_Global)
				{

					globalParams.buy_energy = 0;
					globalParams.buy_speed_energy = 0;
				}
				if (globalParams.buy_time_booster + 3600 < globalParams.UnixTime_Global)
				{
					globalParams.buy_booster = 1;
				}


				user_energy_Goto(MaxDispense);
				return false;

			}



			return false;
		}
		public function user_energy_Goto(MaxDispense:int):void
		{
			
			if (globalParams.user_energy >= MaxDispense)
			{
				globalParams.user_energy = MaxDispense;
			}
			
			indicatorsMc.Energy.preMask.scaleX = globalParams.user_energy / MaxDispense;
			indicatorsMc.LabelEnergy.text = "" + int(globalParams.user_energy / 1);


		}
		public function addEnergy(e:Event)
		{
//trace("00 globalParams.user_energy = ",globalParams.user_energy);

			globalParams.user_energy +=  50;
			globalParams.buy_energy = 50;
			globalParams.buy_speed_energy = .001;
			globalParams.buy_time_energy = globalParams.UnixTime_Global;
			userLevelsTable.kukuSpending(-3,"b_energy");
			//trace("11 globalParams.user_energy = ",globalParams.user_energy);
		}

		public function openRightMenue(e:MouseEvent)
		{
			globalParams.indexMc._rightButtons.openTrigger = true;
		}
		public function closeRightMenue(e:MouseEvent)
		{
			globalParams.indexMc._rightButtons.openTrigger = false;
		}
		public function zoomInFn(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			globalParams.indexMc.zoomTrigger = true;
			if (globalParams.indexMc.zoomParam < 1)
			{
				globalParams.indexMc.zoomParam = globalParams.indexMc.zoomParam + 0.2;
			}
			if (globalParams.indexMc.zoomParam == 1)
			{
				globalParams.indexMc.zoomTrigger = false;
			}

			globalParams.indexMc.landscape.x ++
			;
			globalParams.indexMc.zoom_Button();
			globalParams.indexMc._screen_border_vis.checkVisibility();
		}
		public function zoomOutFn(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			globalParams.indexMc.zoomTrigger = true;
			if (globalParams.indexMc.zoomParam > 0.4)
			{
				globalParams.indexMc.zoomParam = globalParams.indexMc.zoomParam - 0.2;
			}
			if (globalParams.indexMc.zoomParam == 1)
			{
				globalParams.indexMc.zoomTrigger = false;
			}

			globalParams.indexMc.landscape.x++;
			globalParams.indexMc.zoom_Button();

			globalParams.indexMc._screen_border_vis.checkVisibility();
		}
		public function musickSwitchFn(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			globalParams.stageMc.muteMusTrigger = ! globalParams.stageMc.muteMusTrigger;
			globalParams.indexMc._updateUserData.save_init();
		}
		public function soundSwitchFn(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			globalParams.stageMc.muteSndTrigger = ! globalParams.stageMc.muteSndTrigger;
			globalParams.indexMc._updateUserData.save_init();


		}
		
		public function switchQuality(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			globalParams.stageMc.switchQuality();
		}
		//var kol:Bitmap;;

		private function overScreenshot(e:MouseEvent):void
		{
			globalParams.indexMc._lands_Interface._Friend_API.makeScreenshot();
		}
		private function makeScreenshot(e:MouseEvent):void
		{
			globalParams.indexMc._soundProcessor.playSnd("click");

			//VK.api("photos.getWallUploadServer", {}, Screenshot_response, Screenshot_Error);
			globalParams.indexMc._lands_Interface._Friend_API.Screenshot_click();
		}

		public function Add_Quest_Log():void
		{
			//globalParams.questNumber=1
			if (globalParams.questNumber <= globalParams.indexMc._lands_Quest.L_Quest - 1)
			{

				globalParams.indexMc.addChild(globalParams.indexMc._lands_Quest);

				_RuzikSmall_.scaleX = .8;
				_RuzikSmall_.scaleY = .8;
				addChild(_RuzikSmall_);
				_RuzikSmall_.visible = true;
			}
			else
			{

				_RuzikSmall_.visible = false
				;
			}
			if (globalParams.questTask_Mini.length > 0)
			{

				_mini_Quest.scaleX = .8;
				_mini_Quest.scaleY = .8;
				addChild(_mini_Quest);
				_mini_Quest.visible = true
				;
			}
			else
			{
				_mini_Quest.visible = false;
			}

		}

	}

}