package tools 
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.*;
	import flash.display.*;
	import fl.containers.UILoader;
	import flash.net.URLRequest;
	
	  import flash.system.ApplicationDomain; 
	 import flash.system.LoaderContext; 
	  import flash.net.LocalConnection;
	  import flash.system.Security;
	  import flash.system.SecurityDomain;
	public class objectMenue extends MovieClip
	{
		
		
		public var id:int
		private var targetObject:Object
		private var levelupInterface:MovieClip
		
		private var adminContainer:MovieClip
		
		public function init (_id:int) {
			
			globalParams.indexMc._soundProcessor.playSnd ("showWindow");
			id = _id
			var possibleTrigger:Boolean = true
			if (globalParams.indexMc.removeObjectTrigger) {
				possibleTrigger = false
				globalParams.indexMc.dragLand (null)
				globalParams.indexMc.stopdragLand (null)
			}
			if (globalParams.indexMc.placeRoadTrigger) {
				possibleTrigger = false
				globalParams.indexMc.dragLand (null)
				globalParams.indexMc.stopdragLand (null)
			}
			
			if (possibleTrigger) {
				
				
				if (this.x > 480) {
					globalParams.indexMc.landscape.x = globalParams.indexMc.landscape.x - (this.x-480)
					this.x = 480
				}
				if (this.x < 105) {
					globalParams.indexMc.landscape.x = globalParams.indexMc.landscape.x + (105 - this.x)
					this.x = 105
				}
				if (this.y < 95) {
					globalParams.indexMc.landscape.y = globalParams.indexMc.landscape.y + (95 - this.y)
					this.y = 95
				}
				if (this.y > 400) {
					globalParams.indexMc.landscape.y = globalParams.indexMc.landscape.y - (this.y-410)
					this.y = 400
				}
				globalParams.indexMc._lands_Sort.updatePosition (globalParams.indexMc.landscape.x, globalParams.indexMc.landscape.y);
				
				//windowMc.open_button.id = id
				
				windowMc.dmgLable.ptText.text = "10000";
				windowMc.open_button.visible = false
				//windowMc.open_button.addEventListener (MouseEvent.CLICK, Game_Btn)
				//windowMc.open_button.buttonMode=true;
				windowMc.headerT.visible=false
				
				windowMc.botButton.visible = false
				windowMc.addBot.visible = false
				windowMc.levelupButton.visible = false
				windowMc.levelCounter.visible = false
				
				windowMc.ccLable.visible = false
				windowMc.ptLable.visible = false
				windowMc.Order_Priz.visible = false;
				windowMc.Order_Priz.label = "сделать заказ";
				windowMc.Order_Priz.addEventListener 		(MouseEvent.CLICK, showShop);
				
				globalParams.indexMc.objectsArray[id].id = id
				targetObject = globalParams.indexMc.objectsArray[id]
				
				var attractionParams:Object = attractionClass.getAttracctionParams (targetObject)
				
				windowMc.sellBtn.targetObject = targetObject
				windowMc.sellBtn.addEventListener (MouseEvent.CLICK, sellFunction)
				
				windowMc.moveBtn.targetObject = targetObject
				windowMc.moveBtn.addEventListener (MouseEvent.CLICK, moveBtnFn)
				
				windowMc.pizzaBtn.visible = false
				windowMc.cockaBtn.visible = false
				windowMc.burgerBtn.visible = false
				
				if (targetObject.openTrigger) {
					windowMc.statusMc.gotoAndStop ("open")
				} else {
					windowMc.statusMc.gotoAndStop ("closed")
				}
				if (targetObject.type == "kafeshkaKresla" || targetObject.type == "kafeshkaRuzik") {
					windowMc.pizzaBtn.visible = true
					windowMc.cockaBtn.visible = true
					windowMc.burgerBtn.visible = true
					
					windowMc.pizzaBtn.gotoAndStop (1)
					windowMc.cockaBtn.gotoAndStop (1)
					windowMc.burgerBtn.gotoAndStop (1)
				
					windowMc.pizzaBtn.id = id
					windowMc.cockaBtn.id = id
					windowMc.burgerBtn.id = id
				
					windowMc.pizzaBtn.productType = "pizza"
					windowMc.cockaBtn.productType = "coca"
					windowMc.burgerBtn.productType = "burger"
					
					windowMc.pizzaBtn.addEventListener (MouseEvent.CLICK, selectProduct)
					windowMc.cockaBtn.addEventListener (MouseEvent.CLICK, selectProduct)
					windowMc.burgerBtn.addEventListener (MouseEvent.CLICK, selectProduct)
					
					if (globalParams.indexMc.objectsArray[id].TypeFood == "pizza") {
						windowMc.pizzaBtn.gotoAndStop (2)
					}
					if (globalParams.indexMc.objectsArray[id].TypeFood == "coca") {
						windowMc.cockaBtn.gotoAndStop (2)
					}
					if (globalParams.indexMc.objectsArray[id].TypeFood == "burger") {
						windowMc.burgerBtn.gotoAndStop (2)
					}
				}
				windowMc.moveCrossBtn.visible = false
				if (targetObject.type == "lavka") {
					windowMc.informationBtn.visible = false
					windowMc.moveBtn.visible = false
					windowMc.moveCrossBtn.visible = true
					
					
				} else if (targetObject.type == "decoration") {
					
					windowMc.informationBtn.visible = false
					windowMc.headerT.visible=true
					
					
				
					} else {
					
					windowMc.informationBtn.visible = false
					windowMc.levelupButton.visible = true
					windowMc.levelupButton.addEventListener (MouseEvent.CLICK, showAttractionLevelupInterface)
					if (targetObject.level < 6) {
						windowMc.levelCounter.visible = true
						windowMc.levelCounter.text = targetObject.level + "ур."
					} else {
						windowMc.levelCounter.visible = true;
						windowMc.levelCounter.text = "Макс ур."
					
					}
					
					
					if (targetObject.botSlot != undefined) {
						targetObject.botSlot = undefined
					}
					if (targetObject.worker == undefined) {
						windowMc.addBot.visible = true
						windowMc.addBot.addEventListener (MouseEvent.CLICK, addWorkerInterfaceFn)
					} else {
						
						
						trace("_____targetBotObject targetObject.worker = ",targetObject.worker,"__",globalParams.workersArray[targetObject.worker]," L=",globalParams.workersArray.length)
						
						var targetBotObject:Object = globalParams.workersArray[targetObject.worker]
						
						
						if (targetBotObject!=null) {
							windowMc.botButton.visible = true;
							var inMenueBotImage:MovieClip = new workerMc ()
							inMenueBotImage.x = 20
							inMenueBotImage.y = 38
							
							if (targetBotObject.gender == 1) {
								inMenueBotImage.gotoAndStop (targetBotObject.color)
							}
							if (targetBotObject.gender == 2) {
								inMenueBotImage.gotoAndStop (3+targetBotObject.color)
							}
							windowMc.botButton.worker = targetObject.worker
						
							windowMc.botButton.addChild (inMenueBotImage)
							windowMc.botButton.levelCounter.text = targetBotObject.lvl + "ур."
							windowMc.botButton.botName.text = stringCollector.getBotFio (targetBotObject.botName, targetBotObject.botLastName, targetBotObject.gender)
							windowMc.botButton.coockText.text = "" + targetBotObject.coock + ""
							windowMc.botButton.techText.text = "" + targetBotObject.tech + ""
							windowMc.botButton.cleanText.text = "" + targetBotObject.clean + ""
							windowMc.botButton.artText.text = "" + targetBotObject.art + ""
						} else {
							windowMc.addBot.visible = true
							windowMc.addBot.addEventListener (MouseEvent.CLICK, addWorkerInterfaceFn)
						}
					}
				}
				
				//windowMc.headerText.text = attractionClass.getName (targetObject.type, targetObject.productType) + " - " + getBuildingStatus (targetObject) + ".   - " + globalParams.getFreePlaces_obj (targetObject) + "h"
				windowMc.headerT.text = attractionClass.getName (targetObject.type, targetObject.productType)
				windowMc.sympleName = attractionClass.getName (targetObject.type, targetObject.productType) + " - "
				
				if (targetObject.statusObject != undefined) {
					
					windowMc.ccLable.visible = true
					windowMc.ccLable.ccText.text = targetObject.cc + "/" + attractionParams.maxProfit
					
					windowMc.ptLable.visible = true
					//текст    время сколько осталось до сбора прибыли
					windowMc.ptLable.ptText.text =  Math.ceil((attractionParams.profitTime-globalParams._handle_time.returnTimeDifference (targetObject.lpt, globalParams.globalTime))/6)/10 + " Мин."
				}
				
				if (targetObject.type!="decoration") {
				
				windowMc.aTypeIco.visible = true;
				windowMc.aTypeIco.gotoAndStop (globalParams.Building_Basa[targetObject.type].botX);
				
				if (globalParams.Building_Basa[targetObject.type].drag) {
					//магазин
					if (targetObject.type == "Magazin") {
						if (!globalParams.alone) {
							windowMc.Order_Priz.visible = true;
						}
				windowMc.aTypeIco.visible = false;
					windowMc.addBot.visible = false;
					
					windowMc.levelupButton.visible = false;
					
					windowMc.levelCounter.visible = false;
					windowMc.botButton.visible = false
				
					windowMc.ccLable.visible = false
					windowMc.ptLable.visible = false
					
					}
					
				
				
				} else {
					//это значит вход
					
					windowMc.aTypeIco.visible = false;
					windowMc.addBot.visible = false;
					
					windowMc.levelupButton.visible = false;
					
					windowMc.levelCounter.visible = false;
				
					windowMc.botButton.visible = false
				
					windowMc.ccLable.visible = false
					windowMc.ptLable.visible = false
				
				
				
					windowMc.statusMc.gotoAndStop ("open")
					//вход
					windowMc.x -=77
					windowMc.y -=  85
					windowMc.moveBtn.visible = false;
					windowMc.sellBtn.visible = false;
				}
				
				} else {
					windowMc.aTypeIco.visible =false;
					}
			
			}
			//windowMc.open_button.visible = false
		
		}
		public function moveBtnFn (e:MouseEvent)
		{
			
			var targetObject:Object = e.currentTarget.targetObject
			var tmpObj:Object = attractionClass.getAttracctionParams (targetObject)
			
			globalParams.indexMc.closeObjectMenue (e)
			
			//globalParams.indexMc.obm_moveObjectFunction (targetObject)
		globalParams.indexMc._lands_MoveBuilding.obm_moveObjectFunction (targetObject)
		}
		public function selectProduct (e:MouseEvent)
		{		
				windowMc.pizzaBtn.gotoAndStop (1)
				windowMc.cockaBtn.gotoAndStop (1)
				windowMc.burgerBtn.gotoAndStop (1)
				
				if (e.currentTarget.productType == "pizza") {
					windowMc.pizzaBtn.gotoAndStop (2)
					globalParams.indexMc.objectsArray[e.currentTarget.id].TypeFood = "pizza";
				}
				if (e.currentTarget.productType == "coca") {
					windowMc.cockaBtn.gotoAndStop (2)
					globalParams.indexMc.objectsArray[e.currentTarget.id].TypeFood = "coca";
				}
				if (e.currentTarget.productType == "burger") {
					windowMc.burgerBtn.gotoAndStop (2)
					globalParams.indexMc.objectsArray[e.currentTarget.id].TypeFood = "burger";
				}
				globalParams.indexMc.objectsArray[e.currentTarget.id].objectBottom_mc.object_mc.open_mc.icoMc.ico.gotoAndStop (globalParams.indexMc.objectsArray[e.currentTarget.id].TypeFood)
		}
		var sell_targetObject:Object;
		public function sellFunction (e:MouseEvent) {
			var targetObject:Object = e.currentTarget.targetObject
			
			var possibleTrigger:Boolean = true
			var tmpObj:Object = attractionClass.getAttracctionParams (targetObject)
			var _yesNoMessage:yesNoMessage = new yesNoMessage();
			if (targetObject.worker != undefined) {
				
				_yesNoMessage.Message("Вы не можете продать здание пока к нему приклеплен работник. Хотите снять сотрудника с должности?")
				_yesNoMessage.button_text("Снять","Отмена","Предупреждение персонала!")
				_yesNoMessage.addEventListener ("confirm", fireWorkerFromAttraction)
				//_yesNoMessage.addEventListener ("repeal", killLevelupInterface)
				sell_targetObject = targetObject
				globalParams.indexMc.addChild(_yesNoMessage);
				//globalParams.indexMc.systemMessage ("Вы не можете продать здание пока к нему приклеплен работник.")
				
				possibleTrigger = false
			}
			
			if (possibleTrigger) {
				//var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message("Продажа этого здания принесет " + tmpObj.price/2 +"кр. Вы действительно хотите это сделать?")
				_yesNoMessage.button_text("Продать","Отмена","Продать здание?")
				_yesNoMessage.addEventListener ("confirm", sellThisAttraction)
				//_yesNoMessage.addEventListener ("repeal", killLevelupInterface)
				sell_targetObject = targetObject
				globalParams.indexMc.addChild(_yesNoMessage);
				
				sell_targetObject = targetObject
				
			}
		}
		//продать аттрактион
		public function sellThisAttraction (e:Event) {
			//var targetObject:Object = e.currentTarget.targetObject
			//var tmpObj:Object = attractionClass.getAttracctionParams (targetObject)
			
			var tmpObj		:Object = attractionClass.getAttracctionParams (sell_targetObject);
			//killLevelupInterface (e)
			//globalParams.indexMc.closeObjectMenue (e)
			globalParams.indexMc.close_ObjectMenueNew ();
			//продажа зданий и запись
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
			
			globalParams.indexMc._lands_RemoveBuilding.removeObjectFromItself (targetObject)
		}
		
		//Уволить сотрудника с аттракциона
		public function fireWorkerFromAttraction (e:Event)
		{
			
			var tmpObj		:Object = attractionClass.getAttracctionParams (sell_targetObject);
				//sell_targetObject
			
			globalParams.workersArray[targetObject.worker].work = undefined
			
			targetObject.statusObject.status = "noWorker"
			targetObject.openTrigger = false
			targetObject.worker = undefined
			
			globalParams.indexMc.close_ObjectMenueNew ();
			//увольнение сотрудника и запись
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
		}
		
		public function showAttractionLevelupInterface (e:MouseEvent) {
			var possibleTrigger:Boolean = true
			var tmpObj:Object = stringCollector.getBuildingUpgradeText (targetObject.type, targetObject.level)
			if (targetObject.worker == undefined) {
				globalParams.indexMc.systemMessage ("Вы не можете усовершенствовать аттракцион пока к нему не прикреплен работник.")
				possibleTrigger = false
			}
			if (targetObject.level >= 6) {
				globalParams.indexMc.systemMessage ("Аттракцион максимально усовершенствован.")
				possibleTrigger = false
			}
			if (globalParams.user_cash < tmpObj.value) {
				globalParams.indexMc.systemMessage ("Вы не можете усовершенствовать аттракцион, вам не хватает денег.")
				possibleTrigger = false
			}
			if (possibleTrigger) {
				var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message(tmpObj.lable + " Это будет стоить " + tmpObj.value +"кр.")
				_yesNoMessage.button_text("Модернизировать","Отмена","Модернизировать аттракцион.")
				_yesNoMessage.addEventListener ("confirm", levelUpThisAttraction)
				//_yesNoMessage.addEventListener ("repeal", killLevelupInterface)
				sell_targetObject = targetObject
				globalParams.indexMc.addChild(_yesNoMessage);
				
			}
		}
		public function levelUpThisAttraction (e:Event) {
			var tmpObj:Object = stringCollector.getBuildingUpgradeText (targetObject.type, targetObject.level)
			globalParams.indexMc.currentMoneyFn ( -tmpObj.value)
			
			++ targetObject.level
			targetObject.price = targetObject.price + .25
			
			//killLevelupInterface (e)
			//globalParams.indexMc.closeObjectMenue (e)
			globalParams.indexMc.close_ObjectMenueNew ();
			//поднять уровень атракциона и записать
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
		}
		
		public function addWorkerInterfaceFn (e:MouseEvent) {
			globalParams.indexMc._land_personalMenu.addWorkerInterfaceFn (id)
			globalParams.indexMc.closeObjectMenue (e)
		}
		public function hireBotFn (e:MouseEvent) {
			
		}
		public function killAddWorkerInterface (e:MouseEvent) {
			
		}
		public function levelUpThisBot (e:MouseEvent) {
			
		}
		
		public function getBuildingStatus (mc_:Object):String {
			var req:String = "ЗАКРЫТО"
			if (mc_.openTrigger) {
				req = "ОТКРЫТО"
			}
			if (mc_.statusObject != undefined) {
				if (mc_.statusObject.status == "charging") {
					req = "ИДЕТ ПОДГОТОВКА"
				}
			}
			return req
		}
		
		public function killLevelupInterface (e:MouseEvent) {
			this.removeChild (levelupInterface)
			levelupInterface = null
		}
		//Показать магазин
		
		public function showShop (e:MouseEvent) {
			
		Add_Shop ();
		}
		
		var Inflexion_Shop_Kuku:int;
		public function Add_Shop () {
			
			
			var tmpMc:Shop = new Shop(globalParams.SERVER_shop, int(globalParams.indexMc.kukubaksi), int(globalParams.user_cash), globalParams.UID, globalParams);
			
			tmpMc.x = -20 - 46
			tmpMc.y = - 19
			
			adminContainer = new adminPanelFon ()
			adminContainer.x = stage.stageWidth / 2 - (stage.stageWidth - 300) / 2 + 10
			adminContainer.y = stage.stageHeight / 2 - (stage.stageHeight-180) / 2
			
			adminContainer.crossButton.addEventListener (MouseEvent.CLICK, killAdminPanel)
			adminContainer.fon.addEventListener (MouseEvent.CLICK, killAdminPanel)
			adminContainer.addChild (tmpMc)
			
			globalParams.indexMc.addChild (adminContainer)
			
			
		}
		
		
		public function killAdminPanel (e:MouseEvent) {
			globalParams.indexMc.removeChild (adminContainer)
		}
		
		
		
		
		
		
		
		
		public function Game_Btn (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click");
			trace("-------------------  Game_Btn   -------------------- ");
		trace("localhost",new LocalConnection().domain);
		//Security.allowDomain()
		//Loader_game()
		Loader_Aircraft()
		}
		var loader:Loader = new Loader  ;
		var context:LoaderContext = new LoaderContext(); 





		public function Loader_Aircraft():void
		{
			
			Security.allowDomain(globalParams.SERVERLocation);
			Security.allowInsecureDomain(globalParams.SERVERLocation);
			
			var loaderContext:LoaderContext = new LoaderContext();
loaderContext.applicationDomain = ApplicationDomain.currentDomain;
loaderContext.securityDomain = SecurityDomain.currentDomain; // Sets the security context to resolve Error # 2121 
			
			context.checkPolicyFile = false;
			
			
			
			//var urlReq:URLRequest = new URLRequest(globalParams.SERVERLocation+"ruzik_card.swf"); 
			//var ldrContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			globalParams.global_Log.push("\n ###### saveShot_API ######### "+new LocalConnection().domain)
			globalParams.indexMc.addChild(loader);
			//loader.load(new URLRequest(globalParams.SERVERLocation+"ruzik_card.swf"),context);
			loader.load(new URLRequest(globalParams.SERVERLocation+globalParams.Building_Basa_Params[targetObject.type].gameName+".swf"),loaderContext);
			
			//loader.load(new URLRequest(globalParams.SERVERLocation+globalParams.Building_Basa_Params[targetObject.type].gameName+".swf"));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,swfIn_Aircraft);
			globalParams.global_Log.push("\n  s11  ")
		}
		public function swfIn_Aircraft(e:Event):void
		{
			globalParams.global_Log.push("\n  saveShot_API_1 ")
			//ApplicationDomain.currentDomain.getDefinition(globalParams.SERVERLocation+"ruzik_card.swf");
			
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,swfIn_Aircraft);
			globalParams.global_Log.push("\n   222 loader.content as MovieClip")
			try {
			mcExternal = loader.content as MovieClip;
			} catch (e:Error) {
	
				trace(",________",e)
				globalParams.global_Log.push("\n   error="+e)
			}
			globalParams.global_Log.push("\n   A "+mcExternal.money)
			mcExternal.addEventListener("close",Unload_Close);
		
		//mcExternal.Gamble.Close.addEventListener(MouseEvent.CLICK,_Close);
		globalParams.global_Log.push("\n  saveShot_API_11111111 ")
		//mcExternal.visible = false;
		}
		
		public function Unload_Close(e:Event):void
		{
			//var _baglog:baglog = new baglog();
				//addChild(_baglog);
			trace("!!!!!! Listener in container_1, user_cash=",globalParams.user_cash);
			globalParams.global_Log.push("\n money "+e.target.money)
			globalParams.user_cash+=e.target.money;
			trace("review",mcExternal.money)
			
			trace("end  e.target.money",e.target.money);
			trace(" i= ",globalParams.user_cash);
			//mcExternal.removeEventListener(MouseEvent.CLICK,Unload_Close);
			
			//trace("****    win    *****",mcExternal.Gamble.Beat);
			//trace("****    win    *****",mcExternal.kol());
			loader.unload();
			globalParams.indexMc.removeChild(loader);
		}
		
		/////////////
		public var loader_:UILoader = new UILoader();
		var mcExternal:MovieClip;
		
		
	}

}