package tools 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*
	import classes.ServerProvider
	
	import flash.filters.ColorMatrixFilter;
import fl.motion.ColorMatrix;
	public class building_menue extends MovieClip 
	{
		
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		//public var cm:ColorMatrix = new ColorMatrix();

 
//public var cmf:ColorMatrixFilter = new ColorMatrixFilter (cm.GetFlatArray())
		var offset:Number = 0.33;
var cmf:ColorMatrixFilter = new ColorMatrixFilter ([offset, offset, offset, 0, 0,
                                                    offset,offset,offset,0,0,
                                                    offset,offset,offset,0,0,
                                                    0, 0, 0, 1, 0]);
		public function building_menue() 
		{
			
			
			this.addEventListener (MouseEvent.MOUSE_OVER, onMouseOverHandler)
			this.addEventListener (MouseEvent.MOUSE_OUT, onMouseOutHandler)
			this.addEventListener (MouseEvent.ROLL_OUT, onMouseOutHandler)
			//кнопки левого нижнего меню (середина) cтроительство зданий, дорог, снос
			roadBtn.addEventListener (MouseEvent.CLICK, placeRoad)
			roadBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			roadBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			roadBtn.Help = "Построить дорогу";
			buildingBtn.addEventListener (MouseEvent.CLICK, showBuildingSelectInterface)
			buildingBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			buildingBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			buildingBtn.Help = "Построить здание";
			deleteBtn.addEventListener (MouseEvent.CLICK, deleteBtnFn)
			deleteBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			deleteBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			deleteBtn.Help = "Снести постройку";
		
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
		private var _buildingMenueMc:MovieClip
		
		public function showBuildingSelectInterface (e:MouseEvent) {
			buildingBtn.glow.gotoAndStop(1);
			
			globalParams.indexMc._soundProcessor.playSnd ("click")
			_buildingMenueMc = new buildingMenueMc ()
			
			_buildingMenueMc.x = (stage.stageWidth-800)/2 + 345
			_buildingMenueMc.y = -(stage.stageHeight-600)/2 -200
			_buildingMenueMc.closeBtn.addEventListener (MouseEvent.CLICK, closeBuildingMenue)
			
			_buildingMenueMc.showAttractionButton.label="аттракционы";
			_buildingMenueMc.showAttractionButton.addEventListener (MouseEvent.CLICK, showAttractionFn)
			
			_buildingMenueMc.showDevicesButton.label="оборудование";
			_buildingMenueMc.showDevicesButton.addEventListener (MouseEvent.CLICK, showDevicesFn)
		
			_buildingMenueMc.showDecorationsButton.label="декорации";
			_buildingMenueMc.showDecorationsButton.addEventListener (MouseEvent.CLICK, showDecorationsFn)
			
			_buildingMenueMc.helper.x = -1000
			addChild (_buildingMenueMc)
			wayTrigger = false
			gotoAndStop (1)
			showBuildingList (lastBType, lastPage)
		
		}
		public function deleteBtnFn (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			wayTrigger = false
			gotoAndStop (1)
			globalParams.indexMc.bombButtonFunction ()
		}
		private var positionElementsLayer:MovieClip
		private var currentType:String = ""
		public function showAttractionFn (e:MouseEvent) {
			trace("     showAttractionFn")
			globalParams.indexMc._soundProcessor.playSnd ("click")
			showBuildingList ("attraction", 0)
		}
		public function showDevicesFn (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			showBuildingList ("devices", 0)
		}
		public function showDecorationsFn (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			showBuildingList ("decorations", 0)
		}
		private var lastBType:String = "attraction"
		private var lastPage:Number = 0
		
		public function showBuildingList (buildingType:String, page:int) {
			
			lastBType = buildingType
			lastPage = page
			if (positionElementsLayer != null) {
				_buildingMenueMc.removeChild (positionElementsLayer)
				positionElementsLayer = null
			}
			positionElementsLayer = new MovieClip ()
			positionElementsLayer.x = -248
			//positionElementsLayer.y = -137
			positionElementsLayer.y = -177
			_buildingMenueMc.addChild (positionElementsLayer)
			
			var topPosition:uint = _buildingMenueMc.numChildren - 1;
			_buildingMenueMc.setChildIndex(_buildingMenueMc.helper, topPosition);
			
			var positionArray:Array = new Array ()
			currentType = buildingType
			if (buildingType == "attraction") {
				positionArray = globalParams.Building_Basa_Name[globalParams.G_PLANET];
			}
			if (buildingType == "devices") {
				positionArray = globalParams.Facility_Basa;
			}
			if (buildingType == "decorations") {
				positionArray = getDecorations ()
			}
			var sortNum:Number = 0;
			var rowNum:Number = 0;
			var i:Number;
			
			var wlength:Number = 0 
			for (i = (page)*12; i < positionArray.length; i++) {
				if (wlength < 12) {
					sortNum ++
					if (sortNum > 4) {
						rowNum ++
						sortNum = 1
					}
					var positionElement:MovieClip = new buildingMenuePosition ()
					
					positionElement.x = 128*i - rowNum*128*4 - page*128*12
					positionElement.y = rowNum * 117 
					positionElement.type = positionArray[i]
					if (buildingType=="decorations") {
						positionElement.gotoAndStop (2)
					}  else {
						positionElement.gotoAndStop (1)
					}
					//positionElement.gotoAndStop (buildingType)
					var tmpOject:Object = new Object ()
					tmpOject.type = positionArray[i]
					
					var attractionParams:Object;
					//  обычное здание
					if (positionArray[i] != "decoration") {
						
						trace("   showBuildingList  ",tmpOject,tmpOject.type)
						//placeObject
						
						attractionParams = attractionClass.getAttracctionParams (tmpOject)
						
						positionElement.attraction_ico.gotoAndStop (positionArray[i])
						
						trace("positionArray[i]",positionArray[i],"  __");
						if (userLevelsTable.getAttractionStatus (positionArray[i],globalParams.user_lvl)) {
							if (userLevelsTable.getNew (positionArray[i])) {
								positionElement.newStar.visible = true
							} else {
								positionElement.newStar.visible = false
							}
							trace(i,"   Building ^ ",attractionParams.productType,globalParams.AllowRisizePark);
							if (attractionParams.productType == "sizeTools") {
								//временно заблокировать расширение
								if (globalParams.AllowRisizePark) {
									positionElement.addEventListener (MouseEvent.CLICK, resizePark)
								}
								
								
							} 
							if (attractionParams.productType == "ironPlanet") {
								positionElement.addEventListener (MouseEvent.CLICK, buildPlanet)
								
							}
							if (tmpOject.type == "lavka") {
								positionElement.addEventListener (MouseEvent.CLICK, placeObject)
								trace(tmpOject.type,"___________________addEventListener")
							}
							trace(" building ",tmpOject.type,"__________",buildingType,"_________",attractionParams.productType,attractionParams.productType === null,"   lavka==",attractionParams.productType == "lavka",tmpOject.type=="lavka","positionArray[i]=",positionArray[i],positionArray[i]=="lavka")
							/*
							if (attractionParams.productType == null) {
								
								positionElement.addEventListener (MouseEvent.CLICK, placeObject)
								
							}
							*/
							if (buildingType == "attraction") {
								positionElement.addEventListener (MouseEvent.CLICK, placeObject)
								
							}
						
						} else {
							
							positionElement.attraction_ico.filters=[cmf]
							positionElement.newStar.visible = false
						
						}
					} else {
						//деревья
						trace(tmpOject,"___________________addEvent ")
						tmpOject.productType = decoParamsArray[i];
						attractionParams = attractionClass.getAttracctionParams (tmpOject);
						
						//positionElement.gotoAndStop ("decorations")
						positionElement.gotoAndStop (2)
						positionElement.attraction_ico.gotoAndStop (Transfer_Three_Metal(decoParamsArray[i]))
						
						
						positionElement.id = decoParamsArray[i]
						positionElement.type = positionArray[i]
						positionElement.productType = decoParamsArray[i]
						
						if (userLevelsTable.getFromAdminPanelStatus (positionArray[i], decoParamsArray[i], globalParams.user_lvl)) {
							if (userLevelsTable.getNew (positionArray[i])) {
								positionElement.newStar.visible = true
							} else {
								positionElement.newStar.visible = false
							}
							positionElement.addEventListener (MouseEvent.CLICK, placeThree)
						} else {
							//positionElement.lock.visible = true
							positionElement.attraction_ico.filters=[cmf]
							//positionElement.filters=[cmf]
							positionElement.newStar.visible = false
						}
					}
					positionElement.productType = positionElement.id
					positionElement.addEventListener (MouseEvent.MOUSE_OVER, onRollOverFn)
					positionElement.addEventListener (MouseEvent.MOUSE_OUT, onRollOutFn)
					positionElement.priceText.text = attractionParams.price.toString();
					positionElement.expText.text = attractionParams.buildExp.toString();
					
					if (_Quest_Building (positionElement.attraction_ico.currentLabel)) {
						
						positionElement.glow.play();
					}
					
					
					
					positionElementsLayer.addChild (positionElement);
				}
				++ wlength
			}
			
			
			visButton (page,Math.ceil (positionArray.length / 12));
			if (positionArray.length > 12) {
				
				_buildingMenueMc.lArrow.visBut(true)
				_buildingMenueMc.rArrow.visBut(true)
				var siteCounter:int = Math.ceil (positionArray.length / 12)
				visButton (page,Math.ceil (positionArray.length / 12));
				
				for (i = 1; i <= siteCounter; i++) {
					if (i - 1 == page-1) {
						_buildingMenueMc.lArrow.addEventListener (MouseEvent.CLICK, selectPage)
						_buildingMenueMc.lArrow.id = (i - 1)
					}
					if (i - 1 == page+1) {
						_buildingMenueMc.rArrow.addEventListener (MouseEvent.CLICK, selectPage)
						_buildingMenueMc.rArrow.id = (i - 1)
					}
				}
			}

		}
		public function visButton (page:int,end:int):void{
			trace("page >= end",page,end);
			if (page == 0)
			{
				//_buildingMenueMc.lArrow.visible = false
				_buildingMenueMc.lArrow.visBut(false)
			}
			if (page > 0) {
				_buildingMenueMc.lArrow.visBut(true)
			}
			if (page == end-1) {
				_buildingMenueMc.rArrow.visBut(false)
			}
		}
		public function Transfer_Three_Metal (ThreeStr:String):String {
			if (globalParams.indexMc.groundSkin=='green') {
							
			} else {
				if (globalParams.Three_Basa_Params[ThreeStr]!=undefined) {
					return globalParams.Three_Basa_Params[ThreeStr].name;
			}
					
					
				
			}
			return ThreeStr;
		}
		public function onRollOverFn (e:MouseEvent) {
			
			//пузырь с помощью
			_buildingMenueMc.helper.x = mouseX - _buildingMenueMc.x
			_buildingMenueMc.helper.y = mouseY - _buildingMenueMc.y
			
			//trace("menu = ",e.currentTarget.type, e.currentTarget.productType);
			_buildingMenueMc.helper.helpText.text = attractionClass.getName (e.currentTarget.type, e.currentTarget.productType)
		}
		public function onRollOutFn (e:MouseEvent) {
			//скрыть пузырь с помощью
			try
			{
				_buildingMenueMc.helper.x = -1000
			}
			catch (e:Error)
			{
				
			}
		}
		public function selectPage (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			showBuildingList (currentType, e.currentTarget.id)
		}
		
		public function buildPlanet (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var tmpObject:Object = new Object ()
			tmpObject.type = e.currentTarget.type
			var attObject:Object = attractionClass.getAttracctionParams (tmpObject)
			if (attObject.price > globalParams.user_cash) {
				globalParams.indexMc.systemMessage ("У вас не хватает денег на приобретение "+ attractionClass.getName (e.currentTarget.type, e.currentTarget.productType)+".")
				
			} else {
				var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message("Вы действительно хотите основать новый парк на планете Железяка?")
				_yesNoMessage.button_text("Купить","Отмена","Подтверждение покупки.")
				_yesNoMessage.addEventListener ("confirm", buildPlanet_Accept)
				globalParams.indexMc.addChild(_yesNoMessage);
				_yesNoMessage.money =attObject.price
				closeBuildingMenue (e)
			}
			//trace("     _____buildPlanet____",globalParams.ironPlanet);
		}
		public function buildPlanet_Accept (e:Event) {
			trace("_____Planet____");
			globalParams.indexMc._soundProcessor.playSnd ("click")
			globalParams.ironPlanet=true
			
			//минус бабло
			UpdateRating_currentMoney = e.target.money;
			//запись на сервер
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,true);
				
			
			onUpdateRating ()
			globalParams.indexMc._lands_Interface._toPlanet.Launch(globalParams.indexMc.groundSkin)
			if (globalParams.alone) {
				SaveShared.createPlanet();
			}
		}
		private var selectInterface:MovieClip
		private var resizePark_str:String;
		public function resizePark (e:MouseEvent) {
			trace( "   ||||||  resizePark  _____buildPlanet____" );
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var possibleTrigger:Boolean = true
			var tmpObject:Object = new Object ()
			tmpObject.type = e.currentTarget.type
			var attObject:Object = attractionClass.getAttracctionParams (tmpObject)
			
			if (attObject.price > globalParams.user_cash) {
				globalParams.indexMc.systemMessage ("У вас не хватает денег на приобретение "+ attractionClass.getName (e.currentTarget.type, e.currentTarget.productType)+".")
				possibleTrigger = false
			}
			if (possibleTrigger) {
				//покупка расширение парка
				var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message("Вы действительно хотите приобрести расширение парка?")
				_yesNoMessage.button_text("Купить","Отмена","Подтверждение покупки.")
				_yesNoMessage.addEventListener ("confirm", resizeParkAccept)
				//_yesNoMessage.addEventListener ("repeal", killLevelupInterface)
				
				globalParams.indexMc.addChild(_yesNoMessage);
				
				resizePark_str = e.currentTarget.type
				
			}
		}
		public function killBuyingInterface (e:MouseEvent) {
			this.removeChild (selectInterface)
			selectInterface = null
		}
		public function resizeParkAccept (e:Event) {
			//изменение размера парка
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var tmpObject:Object = new Object ()
			
			tmpObject.type =resizePark_str
			var attObject:Object = attractionClass.getAttracctionParams (tmpObject)
			
			if (attObject.price > globalParams.user_cash) {
				globalParams.indexMc.systemMessage ("У вас не хватает денег на приобретение "+ attractionClass.getName (e.currentTarget.type, e.currentTarget.productType)+".")
			} else {
				//пользователи щелкают много раз по клавиши и здания уплывают за пределы парка, может быть поможет
				//selectInterface.windowMc.selectFromFriendsBtn.removeEventListener (MouseEvent.CLICK, resizeParkAccept)
				globalParams.indexMc._updateUserData.save_init ()
				var inUpper:int = 0
				
				//просто меняем глобально длину и высоту landWidth и landHeight
				for (var i = 1; i < globalParams.Facility_Basa.length; i ++) {
					if (tmpObject.type == globalParams.Facility_Basa[i]) {
						
						globalParams.indexMc.ParkSize = globalParams.resizePar_Basa[i].land
						
						
						inUpper = globalParams.resizePar_Basa[i].Upper;
						
					}
				}
				
				
				
				//UpPark_size (inUpper)
				
				globalParams.indexMc.pauseTrigger = true
				
				//запись на сервер
				globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,true);
				
				//минус бабло
				UpdateRating_currentMoney = attObject.price;
				
				
				onUpdateRating ()
				//closeBuildingMenue (e)
			
			}
		}
		var UpdateRating_currentMoney:int;
		//запись на сервер прошла успешно
		public function onUpdateRating ():void {
			//запись на сервер прошла успешно
			trace("запись на сервер прошла успешно");
			//добавит опыт
			userLevelsTable.addExperience (1);
			//globalParams.indexMc.reloadParkFn (globalParams.UID,globalParams.GET_RATING)
			
			var NewParkObj:Object = globalParams.indexMc._getBuildingData.buildingData (false);
			var type_planet:int = globalParams.indexMc.type_planet()
			globalParams.indexMc.Save_Buffer(type_planet);
			
			globalParams.indexMc.RemovePark();
			globalParams.indexMc.Load_Buffer(type_planet)
			
			if (type_planet==0) {
				globalParams.indexMc.startLoadedGame (0,NewParkObj)
			} else {
				globalParams.indexMc.startLoadedGame (1,NewParkObj)
			}
			
			
			///
			globalParams.indexMc.currentMoneyFn ( -UpdateRating_currentMoney);
			//что это, надо разобраться?
		//selectInterface.windowMc.selectFromFriendsBtn.addEventListener (MouseEvent.CLICK, resizeParkAccept)
		}
		
		public function placeObject (e:MouseEvent) {
			trace("************************__________placeObject___________******************************")
			e.currentTarget.glow.gotoAndStop(1);
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var tmpObject:Object = new Object ()
			tmpObject.type = e.currentTarget.type
			var attObject:Object = attractionClass.getAttracctionParams (tmpObject)
			if (attObject.price > globalParams.user_cash) {
				globalParams.indexMc.systemMessage ("У вас не хватает денег на приобретение "+ attractionClass.getName (e.currentTarget.type, e.currentTarget.productType)+".")
			} else {
				globalParams.indexMc.placeObject (tmpObject)
				closeBuildingMenue (e)
			}
		}
		public function placeThree (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var tmpObject:Object = new Object ()
			tmpObject.type = e.currentTarget.type
			tmpObject.productType = e.currentTarget.productType
			var attObject:Object = attractionClass.getAttracctionParams (tmpObject)
			if (attObject.price > globalParams.user_cash) {
				globalParams.indexMc.systemMessage ("У вас не хватает денег на приобретение " + attractionClass.getName (e.currentTarget.type, e.currentTarget.productType)+".")
			} else {
				globalParams.indexMc.placeThree (e.currentTarget.id)
				closeBuildingMenue (e)
			}
			
		}
		/*
		public function getDevices () {
			
			return globalParams.Facility_Basa;
		}
		*/
		public var decoParamsArray:Array=[];
		public function getDecorations () {
			//деревья
			
			var req:Array =[];
			/*
			decoParamsArray =[];
			for (var detailN:* in  globalParams.Three_Basa_Params) {
				
				req.push("decoration");
				trace("_",detailN.toString());
				
				decoParamsArray.push(detailN.toString());
			}
			//decoParamsArray.sort(Array.DESCENDING);
			//decoParamsArray.sort(Array.CASEINSENSITIVE);
			
			trace(decoParamsArray);
			*/
			decoParamsArray=globalParams.Decoration_Basa;
			
			for (var i = 0; i <decoParamsArray.length; i ++) {
				 req.push("decoration");
			}
			
			
			return req
		}
		
		public function closeBuildingMenue (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			if (positionElementsLayer != null) {
				_buildingMenueMc.removeChild (positionElementsLayer)
				positionElementsLayer = null
			}
			if (_buildingMenueMc != null) {
				this.removeChild (_buildingMenueMc)
				_buildingMenueMc = null
			}
		}
		//Кнопка запуска подготовки установки дороги
		public function placeRoad (e:MouseEvent) {
			
			roadBtn.glow.gotoAndStop(1);
			globalParams.indexMc._soundProcessor.playSnd ("click")
			wayTrigger = false
			gotoAndStop (1)
			//Кнопка запуска подготовки установки дороги
			globalParams.indexMc.placeRoadFn ()
		}
		
		// АНИМАЦИЯ
		private var wayTrigger:Boolean = false
		public function onMouseOverHandler (e:MouseEvent) {
			_Quest_Bt ()
			
			
		}
		public function _Quest_Bt ():void {
			glow.gotoAndStop(1);
			if (globalParams.questBasa[globalParams.questNumber].Road) {
				roadBtn.glow.play();
			}
			if (globalParams.questBasa[globalParams.questNumber].Build) {
				buildingBtn.glow.play();
			}
			
			wayTrigger = true
			var topPosition:uint = globalParams.indexMc.numChildren - 1;
			//globalParams.indexMc.setChildIndex(globalParams.indexMc._building_menue, topPosition);
		globalParams.indexMc.setChildIndex(globalParams.indexMc._lands_Interface, topPosition);
		}
		public function _Quest_Building (NameBuild:String):Boolean {
			if (NameBuild==globalParams.questBasa[globalParams.questNumber].ObjStr&&globalParams.questBasa[globalParams.questNumber].Build==true) {
				
				return true;
			}
			
			return false;
		}
		public function onMouseOutHandler (e:MouseEvent) {
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