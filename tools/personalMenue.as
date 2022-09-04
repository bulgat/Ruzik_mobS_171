package tools 
{
	import fl.motion.Motion;
	import flash.display.*;
	import flash.events.*;
	import classes.json.*;

	public class personalMenue extends MovieClip
	{
		//Задаем переменные
		public var targetAttractionId	:Number = - 1000;
		
		private var currentSite			:Number = 0
		//private var leftIndent:int = -195;
	private var leftIndent:int = -165;
		//private var leftIndent_x:int = -220;
		private var leftIndent_x:int = -260;
		private var five:int = 4;
		////////////////////////////////////////Присоединить сотрудника///////////////////////////////////////////
			public function visButton (page:int,end:int):void{
			trace("page >= end",page,end);
			if (page == 0)
			{
				//_buildingMenueMc.lArrow.visible = false
				windowMc.lArrow.visBut(false)
			}
			if (page > 0) {
				windowMc.lArrow.visBut(true)
			}
			if (page == end-1) {
				windowMc.rArrow.visBut(false)
			}
		}
		public function attachWorkerInit (attractionId:Number)
		{
			
			//Идентификатор выделенного аттракциона
			targetAttractionId 					= attractionId;
			
			//Делаем в окошке видимыми кнопочки
			
			//Если количество свободных работников больше нуля
			if (getFreeWorkerCount () > 0)
			{
				
				//Показываем окошко со свободными рабочими
				showFreeWorkers(0);
			}
			else
			{
				
				//Показываем окшко магазина работников
				showWorkerMarket(0);
			}
		}
		
		//////////////////////////////////////Посчитать свободных сотрудников//////////////////////////////////////////////
		
		public function getFreeWorkerCount ():Number
		{
			
			//Переменная счетчик
			var count:Number = 0;
			
			//Перебираем массив с работниками
			for (var i = 0; i < globalParams.workersArray.length; i++)
			{
				
				//Если работа у кого-то из работников не найдена
				trace(i,"   personalMenue = ",globalParams.workersArray.length,globalParams.workersArray[i]);
				if (globalParams.workersArray[i] != null)
				{
				if (globalParams.workersArray[i].work == undefined)
				{
					//Посчитать этого работника
					count ++;
				}
				}
			}
			
			//Вернуть количество свободных работников
			return count;
		}
		
		////////////////////////////////////////Показать своих рабочих/////////////////////////////////////////
		public function remove_container ():void
		{
			if (positionContainer != null)
			{
				//Удалить его и присвоить ему значение null
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			
			
		}
		
		/////////////////////////////////////////////Показать магазин///////////////////////////////////////////
		public function worker_PersonalMenueBtnFn (e:MouseEvent)
		{
			//Играем звук
			globalParams.indexMc._soundProcessor.playSnd ("click");
			remove_container ()
			
			
			//Показать магазин работников
			showWorkers (0);
		}
		public function workerMarketBtnFn (e:MouseEvent)
		{
			//Играем звук
			globalParams.indexMc._soundProcessor.playSnd ("click");
			remove_container ()
			//Если контейнер существует
			
			
			//Показать магазин работников
			showWorkerMarket (0);
		}
		//////////////////////////////////////Билдинг баттон///////////////////////////////////////////////
		
		public function buildingtBtnFn (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			remove_container ();
			
			showAttractionList (0)
		}
		///////////////////////////////////////Показать свободных сотрудников//////////////////////////////////////
		
		public function showFreeWorkers (_site:int):void
		{
			
			//Поменять иконку c рабочими
			windowMc.mainIco.gotoAndStop ("workers");
			
			//Переменные счетчики чтоль
			var i		:int,
				n		:int,
				
				//Индекс нарисованного на одной страничке работника
				wlength	:Number = 0;
			
			//Проверяем на наличие контейнера бла-бла-бла
			if (positionContainer != null)
			{
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			
			//Создаем новый экзмепляр
			positionContainer = new MovieClip ();
			
			//И основное окошко добавляет себе его
			windowMc.addChild (positionContainer);
			
			//Изменяем заголовок окна
			windowMc.headerText.text = "Свободные сотрудники."
			
			//Создаем массив позиций (видимо для того, что бы расставлять внутри контейнера содержимое)
			positionArray = new Array();
			
			//Перебираем массив работников начиная с нужной страницы
			for (i = (_site)*five; i < globalParams.workersArray.length; i++)
			{
				//Если под этим индексом сущесвует работник и работы у него нет
				if (globalParams.workersArray[i] != undefined && globalParams.workersArray[i].work == undefined)
				{
					//Если индекс нарисованного на одной странице работника меньше 5
					if (wlength < five)
					{
						//Целевым объектом становится текущий работник
						var targetObject:Object 	= globalParams.workersArray[i];
														//создаем новую картинку с работником
							var workerImage	:MovieClip 	= new workerMc ();
						targetObject.workerName = stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender)
						//n — это теперь длина массива
						n = positionArray.length;
						
						//Запихнуть в массив новую подложку
						positionArray.push (new table_worker());
						positionArray[n].Launch(i,false,targetObject)
						
						//Задать ей координаты (боже как криво)
						positionArray[n].x = -256;
						//positionArray[n].y = -138 + n * 75;
						positionArray[n].y = leftIndent + n * 75;
						leftIndent
						//Заполняем текстовые поля
						
						
						
						//И добавляем слушателя на клик по этой кнопке, которые будет прикреплять рабтника
						//к аттракциону
						//positionArray[n].attachButton.addEventListener (MouseEvent.CLICK, attachToAttraction);
						positionArray[n].addEventListener ("confirm", attachToAttraction);
						//В зависимости от пола выбираем нужную картинку
						if (targetObject.gender == 1)
						{
							workerImage.gotoAndStop (targetObject.color);
						}
						if (targetObject.gender == 2)
						{
							workerImage.gotoAndStop (3+targetObject.color);
						}
						
						//По уродски задаем координаты для картинки
						workerImage.x = 29-5
						workerImage.y = 50-6
						
						//Каждый объект в нужное место добавляет себе картинку
						positionArray[n].imagePlace.addChild (workerImage);
						
						//А контейнер добавляет в себя этот объект
						positionContainer.addChild (positionArray[n]);
					}
				
				//Рассмотриваем следующий элемент
				wlength++;
				}
			}
			//Здесь закончился цикл
			attach_in_Attraction_build (_site,wlength);
			
			
		}
		public function attach_in_Attraction_build (_site:int,wlength:int):void
		{
			//Сделать стрелки прокрутки невидимыми
			//windowMc.lArrow.visible = false
			//windowMc.rArrow.visible = false
			windowMc.lArrow.visBut(false)
			windowMc.rArrow.visBut(false)
			//НАЗНАЧАТЬ РАБОТНИКОВ НА АТТРАКЦИОН ? почему здесь?
			//Если номер текущего работника превысил 5 (Серегу даже н посетила мысль перенести это
			//в отдельную переменную)
			if (wlength > five)
			{
				//Счетчи страниц (честно гвооря КРАЙНЕ странно считающийся)
				var siteCounter:int = Math.ceil (wlength / five);
				
				//Показать стрелки прокрутки
				//windowMc.lArrow.visible = true;
				//windowMc.rArrow.visible = true;
				//windowMc.lArrow.visBut(true)
				//windowMc.lArrow.visBut(true)
				visButton(_site,siteCounter);
				//Если страница нулевая
				/*
				if (_site == 0) {
					
					//Сделать левую стрелку невидимой
					//windowMc.lArrow.visible = false
					windowMc.lArrow.visBut(false)
				}
				
				//Если равно максимальному значению
				if (_site == siteCounter-1) {
					
					//Перестать показывать правую кнопочку
					windowMc.rArrow.visible = false
					windowMc.rArrow.visBut(false)
				}
				*/
				//Перебор страниц и разрешение на перелистывание
				for (var i_:int = 0; i_ < siteCounter; i_++)
				{
					trace("Arrow ",i_,"__",siteCounter,"   site = ",_site,"   OTHER selectAttractionListPage");
					if (i_ == _site) {
						windowMc.lArrow.addEventListener (MouseEvent.CLICK, selectAttractionListPage)
						windowMc.lArrow.id = (i_)
					}
					if (i_  < _site) {
						windowMc.rArrow.addEventListener (MouseEvent.CLICK, selectAttractionListPage)
						windowMc.rArrow.id = (i_)
					//right_Arrow = (i_)
					}
				}
			}
			
			
			
			
		}
		/////////////////////////////////////////Прикрепить к аттракциону///////////////////////////////////////////

		public function attachToAttraction (e:Event)
		{
			//присоединить работника к атракционну
			//Играем звук
			globalParams.indexMc._soundProcessor.playSnd ("click");
			
			//Присоединить работника к аттракциону (посмотрть функцию!!!)
			placeWorkerToAttraction (e.currentTarget.id);
			
			//Отправить данные об игре в базу данных
			//запись присоединить работника к атракционну
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false);
		}
		
		///////////////////////////////////Присоединить сотрудника к аттракциону////////////////////////////////////////
		
		public function placeWorkerToAttraction (id:int) {
			
			//Временный объект — это текущий аттракцион
			var tmpObject:Object = globalParams.indexMc.objectsArray[targetAttractionId];
			
			//Присваиваем работнику место работы
			//globalParams.workersArray[e.currentTarget.id].work = targetAttractionId;
			globalParams.workersArray[id].work = targetAttractionId;
			//Работником в аттракционе теперь является выбраный работник
			//tmpObject.worker = e.currentTarget.id;
			tmpObject.worker = id;
			//Аттракцион после этого считается открытым
			tmpObject.statusObject.status	= "open";
			
			//Поднимаем флажок того, что он открыт
			tmpObject.openTrigger 			= true;
			
			//Видимо сихронизация  со временем сервера
			tmpObject.statusObject.sst 		= globalParams.globalTime;
			
			//
			if (tmpObject.object_mc.object_mc != undefined)
			{
				tmpObject.object_mc.object_mc.open_mc.gotoAndStop (1)
			}
			else
			{
				tmpObject.objectBottom_mc.object_mc.open_mc.gotoAndStop (2)
			}
			
			//появляется пицца над зданием кафешки
			trace("     EDA_________________  - ",tmpObject.object_mc.object_mc);
			Kafeshka_Pizza (tmpObject);
						
			//Убрать менюшку
			 globalParams.indexMc._land_personalMenu.killPersonalInterface_New()
			//globalParams.indexMc._land_personalMenu.killPersonalInterface (e)
		}
		
		public function Kafeshka_Pizza (tmpObject:Object):void
		{
			if (globalParams.Building_Basa[tmpObject.type]!=undefined) {
					if (globalParams.Building_Basa[tmpObject.type].Kafeshka==true) {
							trace("-------",tmpObject.TypeFood);
							tmpObject.objectBottom_mc.object_mc.open_mc.icoMc.ico.gotoAndStop (tmpObject.TypeFood)
							//tmpObject.objectBottom_mc.object_mc.open_mc.icoMc.ico.gotoAndStop ("coca")
							trace("     EDA_________________get - ",tmpObject.TypeFood);
					}
						
			}
		}
		
		////////////////////////////////////Показать работников/////////////////////////////////////////
		//var left_Arrow:int;
		//var right_Arrow:int;
		public function showWorkers (_site:int)
		{
			
			//Сменить иконку
			windowMc.mainIco.gotoAndStop ("workers");
			
			//Обозначаем текущую страницу
			currentSite = _site
			
			//Опять какие-то счетчики
			var i:int,
				n:int;
			
			//И еще раз обнуляем контейнер
			if (positionContainer != null)
			{
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			
			//Создаем новый контейнер
			positionContainer = new MovieClip();
			
			//Окно добавляет контейнер
			windowMc.addChild (positionContainer);
			
			//Задаем заголовок
			windowMc.headerText.text = "Ваши сотрудники.";
			
			//Новый массив позиций
			positionArray = new Array();
			
			
			for (i = (_site)*five; i < (_site)*five + five; i++) {
				
				//Если найден сотрудник под этим индексом
				if (globalParams.workersArray[i] != undefined) {
					
					//Текущий объект — это текущий работник
					var targetObject:Object = globalParams.workersArray[i];
					targetObject.workerName = stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender) + "";
					n = positionArray.length
					
					positionArray.push (new table_worker())
					positionArray[n].Launch(i,true,targetObject);
					
					positionArray[n].x = leftIndent_x
					//positionArray[n].y = - 178 + n * 75
					positionArray[n].y = leftIndent + n * 75
					
					
					
					if (targetObject.work != undefined) {
						
						if (globalParams.indexMc.objectsArray[targetObject.work] != undefined)
						{
							//_string = "" 
						}
						
						//positionArray[n].actionButton.id = i
						
						//positionArray[n].actionButton.buttonText.text = "Снять"
						
						//positionArray[n].actionButton.addEventListener (MouseEvent.CLICK, unBusyWorker)
						positionArray[n].addEventListener ("repeal", unBusyWorker)
						//positionArray[n].attachButton.visible = false
					positionArray[n].attach_Button(false,"ttttt","Снять");
					} else {
						//positionArray[n].actionButton.id = i
						//positionArray[n].actionButton.addEventListener (MouseEvent.CLICK, fireWorker)
						positionArray[n].addEventListener ("repeal", fireWorker)
						//positionArray[n].attachButton.visible = true
						positionArray[n].attach_Button(true,"Назначить","Уволить");
						//positionArray[n].attachButton.id = i
						//positionArray[n].attachButton.buttonText.text = "Назначить"
						//positionArray[n].attachButton.addEventListener (MouseEvent.CLICK, attachButtonFn)
					positionArray[n].addEventListener ("confirm", attachButtonFn)
					}
					
					//positionArray[n].workerName.text = stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender) + "";
					var workerImage:MovieClip = new workerMc ()
					if (targetObject.gender == 1) {
						workerImage.gotoAndStop (targetObject.color)
					}
					if (targetObject.gender == 2) {
						workerImage.gotoAndStop (3+targetObject.color)
					}
					workerImage.x = 29-5
					workerImage.y = 50 - 6
					
					positionArray[n].imagePlace.worker = i 
					positionArray[n].imagePlace.addChild (workerImage)
					positionContainer.addChild (positionArray[n])
				}
			}
			
			//windowMc.lArrow.visible = false
			//windowMc.rArrow.visible = false
			var siteCounter:Number = Math.ceil (globalParams.workersArray.length / five)
			visButton(_site,siteCounter);
			for (i = 1; i <= siteCounter; i++) {
					if (i - 1 == _site-1) {
						windowMc.lArrow.addEventListener (MouseEvent.CLICK, selectWorkersPage)
						windowMc.lArrow.id = (i - 1)
					}
					if (i - 1 == _site+1) {
						windowMc.rArrow.addEventListener (MouseEvent.CLICK, selectWorkersPage)
						windowMc.rArrow.id = (i - 1)
					//right_Arrow = (i - 1)
					}
				}
			
		}
		private var botToAttractionSeletctTrigger:Boolean = false
		private var currentWorker:Number
		
		///////////////////////////////////////Аттач баттон////////////////////////////////////////////////
		
		public function attachButtonFn (e:Event) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			currentWorker = e.currentTarget.id
			botToAttractionSeletctTrigger = true
			showAttractionList (0)
		}
		
		
		
		////////////////////////////////////Показать аттракционы//////////////////////////////////////////////////
		
		public function showAttractionList (_site:int) {
			windowMc.mainIco.gotoAndStop ("buildings")
			
			var i:int
			var n:int
			if (positionContainer != null) {
				windowMc.removeChild (positionContainer)
				positionContainer = null
			}
			positionContainer = new MovieClip ()
			windowMc.addChild (positionContainer)
			windowMc.headerText.text = "Ваши заведения."
			positionArray = new Array ()
			
			var wiewedPositionCounter:int = 0
			var selectiveArray:Array = new Array ()
			var targetObject:Object;
			if (botToAttractionSeletctTrigger) {
				for (i = 0; i < globalParams.indexMc.objectsArray.length; i++) {
					targetObject = globalParams.indexMc.objectsArray[i];
					if (targetObject.worker == undefined) {
						n = selectiveArray.length
						selectiveArray.push (targetObject)
						selectiveArray[n].id = i
					}
				}
			} else {
				selectiveArray = globalParams.indexMc.objectsArray
			}
			for (i = 0; i < selectiveArray.length; i++) {
				
				if (selectiveArray[i] != undefined) {
					targetObject = selectiveArray[i]
					var targetBotObject:Object
					if (targetObject.worker != undefined) {
						targetBotObject = globalParams.workersArray[targetObject.worker]
					}
					var attractionParams:Object = attractionClass.getAttracctionParams (targetObject)
					if (attractionParams.attractionTrigger) {
						n = positionArray.length
						
						positionArray.push (new personal_mc (attractionClass.getName (targetObject.type, targetObject.productType),targetObject.worker,globalParams.getFreePlaces_obj (targetObject),targetObject.cc,attractionParams.maxProfit))
						
						if (targetObject.worker != undefined) {
							
							if (targetBotObject!=null) {
							
							positionArray[n].levelExp.text = stringCollector.getBotFio (targetBotObject.botName, targetBotObject.botLastName, targetBotObject.gender);
							
							positionArray[n].coockId.text = targetBotObject.coock
							positionArray[n].techId.text = targetBotObject.tech
							positionArray[n].cleanId.text = targetBotObject.clean
							positionArray[n].artId.text = targetBotObject.art
							positionArray[n].botIcos.visible = true
							positionArray[n].coockId.visible = true
							positionArray[n].techId.visible = true
							positionArray[n].cleanId.visible = true
							positionArray[n].artId.visible = true
							}
						} else {
							//positionArray[n].levelExp.text = "Наймите сотрудника."
							
							
							
							positionArray[n].botIcos.visible = false
							positionArray[n].coockId.visible = false
							positionArray[n].techId.visible = false
							positionArray[n].cleanId.visible = false
							positionArray[n].artId.visible = false
						}
						var _attractionIco:MovieClip = new attractionIco ()
						
						_attractionIco.gotoAndStop (targetObject.type)
						_attractionIco.x = 17
						_attractionIco.y = -43
						_attractionIco.scaleX = .5
						_attractionIco.scaleY = .5
						_attractionIco.buttonMode = true;
						_attractionIco.useHandCursor = true;
						if (botToAttractionSeletctTrigger) {
							positionArray[n].imagePlace.id = currentWorker
							positionArray[n].imagePlace.currentAttractionId = targetObject.id
							positionArray[n].imagePlace.addEventListener (MouseEvent.CLICK, showAttachWorkerToAttrationInterface)
						} else {
							positionArray[n].imagePlace.id = i
							positionArray[n].imagePlace.addEventListener (MouseEvent.CLICK, showThatAttraction)
						}
						
						positionArray[n].imagePlace.addChild (_attractionIco)
						
						wiewedPositionCounter ++
					}
				}
			}
			var wlength:int = 0
			for (i = (_site) * five; i < (_site) * five + five; i++) {
				if (positionArray[i] != undefined) {
					positionArray[i].x = leftIndent_x
					//positionArray[i].y = - 178 + wlength * 75
					positionArray[i].y = leftIndent + wlength * 75
					wlength ++ 
					positionContainer.addChild (positionArray[i])
				}
			}
			//windowMc.lArrow.visible = false
			//windowMc.rArrow.visible = false
			var siteCounter:int = int(wiewedPositionCounter / five)+1;
			visButton(_site,siteCounter);
			for (var i2:int = 0; i2 < siteCounter; i2++) {
					trace(" Arrow_present_attraction",i,"  _site = ",_site,"  siteCounter = ",siteCounter);
					if (i <= _site) {
						
						if (_site ==0) {
							windowMc.lArrow.id_new = 0;
						} else {
							if (i2<_site) {
							windowMc.lArrow.id_new = (i2);
							}
						}
						
						windowMc.lArrow.addEventListener (MouseEvent.CLICK, selectAttractionListPage)
						
						
					}
					if (i2 > _site) {
						
						windowMc.rArrow.id_new = (i2);
						windowMc.rArrow.addEventListener (MouseEvent.CLICK, selectAttractionListPage)
						
						
					break;
					}
				}
			//windowMc.lArrow.visBut(false)
			//windowMc.rArrow.visBut(false)
			/*
			if (wiewedPositionCounter > five) {
				//windowMc.lArrow.visible = true
				//windowMc.rArrow.visible = true
				windowMc.lArrow.visBut(true)
				windowMc.rArrow.visBut(true)
				var tmpMc:MovieClip
				
				Arrow_present_attraction (_site,wiewedPositionCounter);
				
			}
		*/
		}
		/*
		public function Arrow_present_attraction (_site:int,wiewedPositionCounter:int):void {
				var siteCounter:int = int(wiewedPositionCounter / five)+1;
				
				if (_site == 0) {
					//windowMc.lArrow.visible = false
					windowMc.lArrow.visBut(false)
				}
				if (_site == siteCounter) {
					//windowMc.rArrow.visible = false
				windowMc.rArrow.visBut(false)
				}
				
				for (var i:int = 0; i < siteCounter; i++) {
					trace(" Arrow_present_attraction",i,"  _site = ",_site,"  siteCounter = ",siteCounter);
					if (i <= _site) {
						
						if (_site ==0) {
							windowMc.lArrow.id_new = 0;
						} else {
							if (i<_site) {
							windowMc.lArrow.id_new = (i);
							}
						}
						
						windowMc.lArrow.addEventListener (MouseEvent.CLICK, selectAttractionListPage)
						
						
					}
					if (i > _site) {
						
						windowMc.rArrow.id_new = (i);
						windowMc.rArrow.addEventListener (MouseEvent.CLICK, selectAttractionListPage)
						
						
					break;
					}
				}
		
		}
		*/
		///////////////////////Показать интефейс добавления сотрудника к атракциону//////////////////////////////////////////////////
		var attachPersonal:Object=[];
		public function showAttachWorkerToAttrationInterface (e:MouseEvent) {
			
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var possibleTrigger:Boolean = true
			var targetObject:Object = globalParams.workersArray[e.currentTarget.id]
			
			if (possibleTrigger) {
				//Новое окошко
				var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message(stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender) + " будет назначен на " + attractionClass.getName (globalParams.indexMc.objectsArray[e.currentTarget.currentAttractionId].type, globalParams.indexMc.objectsArray[e.currentTarget.currentAttractionId].productType)+ ", вы действительно хотите сделать это?")
				_yesNoMessage.button_text("Назначить","Отмена","Назначить сотрудника на объект?")
				_yesNoMessage.addEventListener ("confirm", acceptAttachWorkerToAttractionFn)
				
				_yesNoMessage.correct_coordinat()
				//globalParams.indexMc.addChild(_yesNoMessage);
				addChild(_yesNoMessage);
				attachPersonal.id = e.currentTarget.id
				attachPersonal.currentAttractionId = e.currentTarget.currentAttractionId
				trace(" 0  attachPersonal  ",attachPersonal.id,attachPersonal.currentAttractionId)
				
			}
		}
		
		//////////////////////////////////Подтверждение прикрепления сотрудника/////////////////////////////////////////
		
		//сюда
		public function acceptAttachWorkerToAttractionFn (e:Event)
		{
			trace("   attachPersonal  ",attachPersonal.id,attachPersonal.currentAttractionId)
			globalParams.indexMc._soundProcessor.playSnd ("click")
			//globalParams.workersArray[e.currentTarget.id].work = e.currentTarget.currentAttractionId
			globalParams.workersArray[attachPersonal.id].work = attachPersonal.currentAttractionId
			
			//globalParams.indexMc._land_personalMenu.killPersonalInterface (e)
			globalParams.indexMc._land_personalMenu.killPersonalInterface_New()
			//запись назначили нового работника
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
			
			//var currentAttraction = globalParams.indexMc.objectsArray[e.currentTarget.currentAttractionId];
			var currentAttraction = globalParams.indexMc.objectsArray[attachPersonal.currentAttractionId];
			//Присваиваем статусы
			currentAttraction.statusObject.status = 'open';
			//currentAttraction.worker = e.currentTarget.id;
			currentAttraction.worker =attachPersonal.id
			currentAttraction.openTrigger = true;
			
			//Шестой квест
			if(globalParams.questNumber == 6)
			{
				//globalParams.indexMc._lands_Quest.Quest_launch(2);
				
				
			}
			
		}
		
		////////////////////////////////////Показать аттракцион/////////////////////////////////////////
		
		public function showThatAttraction (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			globalParams.indexMc._land_personalMenu.killPersonalInterface (e)
			globalParams.indexMc.showObjectMenue (e)
			
		}
		
		/////////////////////////////////////Статус постройки////////////////////////////////////////
		
		public function getBuildingStatus (mc_:Object)
		{
			var req:String = "ЗАКРЫТО"
			
			if (mc_.openTrigger)
			{
				req = "ОТКРЫТО"
			}
			if (mc_.statusObject != undefined)
			{
				if (mc_.statusObject.status == "charging")
				{
					req = "ИДЕТ ПОДГОТОВКА"
				}
			}
			return req
		}
		
		////////////////////////////////////////Снять работника//////////////////////////////////////
		var unBusy:Object=[];
		public function unBusyWorker (e:Event) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var possibleTrigger:Boolean = true
			trace("  e.currentTarget.id ",e.currentTarget.id)
			var targetObject:Object = globalParams.workersArray[e.currentTarget.id]
			if (globalParams.indexMc.objectsArray[targetObject.work] != undefined) {
				
			}
			
			if (possibleTrigger)
			{
				var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message(stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender) + " будет переведен в запас, вы действительно хотите сделать это?.")
				_yesNoMessage.button_text("Снять","Отмена","Снять сотрудника с объекта?")
				_yesNoMessage.addEventListener ("confirm",acceptUnBusyWorker)
				
				//globalParams.indexMc.addChild(_yesNoMessage);
				_yesNoMessage.correct_coordinat()
				addChild(_yesNoMessage);
				
				unBusy.id = e.currentTarget.id
				
			}
		}
		
		//////////////////////////////////////Подтверждение снятия сотрудника//////////////////////////////////////////////
		
		public function acceptUnBusyWorker (e:Event)
		{
			
			globalParams.indexMc._soundProcessor.playSnd ("click")
			//var targetObject:Object = globalParams.workersArray[e.currentTarget.id]
			var targetObject:Object = globalParams.workersArray[unBusy.id]
			
			if (globalParams.indexMc.objectsArray[targetObject.work] != undefined)
			{
				globalParams.indexMc.objectsArray[targetObject.work].worker = undefined
				globalParams.indexMc.objectsArray[targetObject.work].statusObject.status = "noWorker"
				globalParams.indexMc.objectsArray[targetObject.work].openTrigger = false
				
				if (globalParams.indexMc.objectsArray[targetObject.work].object_mc.object_mc != undefined)
				{
					globalParams.indexMc.objectsArray[targetObject.work].object_mc.object_mc.open_mc.gotoAndStop (2)
				}
				else
				{
					trace("obj = ",globalParams.indexMc.objectsArray[targetObject.work].objectBottom_mc.object_mc)
					if (globalParams.indexMc.objectsArray[targetObject.work].objectBottom_mc.object_mc!=undefined) {
						globalParams.indexMc.objectsArray[targetObject.work].objectBottom_mc.object_mc.open_mc.gotoAndStop (1)
					}
				}
			}
			
			targetObject.work = undefined
			
			//killSelectInterface (e)
			
			showWorkers (currentSite)
			//занять работника записать
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
		}
		
		/////////////////////////////////////////Увольение сотрундника///////////////////////////////////////////
		var fire_Worker:Object=[];
		public function fireWorker (e:Event)
		{
			var targetObject:Object = globalParams.workersArray[e.currentTarget.id]
			var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message(stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender) + " будет уволен из парка, вы действительно хотите уволить его?.")
				_yesNoMessage.button_text("Уволить","Отмена","Уволить сотрудника?")
				_yesNoMessage.addEventListener ("confirm", acceptFiring)
				//_yesNoMessage.addEventListener ("repeal", killLevelupInterface)
				_yesNoMessage.correct_coordinat()
				//globalParams.indexMc.addChild(_yesNoMessage);
			addChild(_yesNoMessage);
			globalParams.indexMc._soundProcessor.playSnd ("click")
			
			
			fire_Worker.id  = e.currentTarget.id
			
		}
		
		//////////////////////////////////Подтверждение увольнения////////////////////////////////////
		
		public function acceptFiring (e:Event) {
			//globalParams.indexMc._soundProcessor.playSnd ("click")
			//var targetObject:Object = globalParams.workersArray[e.currentTarget.id]
			var targetObject:Object = globalParams.workersArray[fire_Worker.id]
			if (targetObject.work != undefined) {
				globalParams.indexMc.systemMessage ("Вы не можете уволить этого сотрудника, пока он прикреплен к одному из аттракционов, для начала снимите его с должности")
			} else {
				globalParams.workersArray.splice (fire_Worker.id, 1)
			}
			//killSelectInterface (e)
			
			if (positionContainer != null) {
				windowMc.removeChild (positionContainer)
				positionContainer = null
			}
			
			showWorkers (0)
			//увольнение работника и запись
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false)
		}
		
		private var positionArray:Array = new Array ()
		private var positionContainer:MovieClip
		
		
		///////////////////////////////////Показать магазин сотрудников/////////////////////////////////////////
		
		public function showWorkerMarket (_site:Number) {
			windowMc.mainIco.gotoAndStop ("market")
			var i:Number
			var n:Number
			positionContainer = new MovieClip ()
			windowMc.addChild (positionContainer)
			windowMc.headerText.text = "Нанять сотрудников"
			positionArray = new Array ()
			
			if (globalParams.workersMarket!=null) {
			for (i = (_site)*five; i < (_site)*five + five; i++)
			{
				if (globalParams.workersMarket[i] != undefined)
				{
					var targetObject:Object = globalParams.workersMarket[i]
					n = positionArray.length
					positionArray.push (new personaPosition_mc ())
					positionArray[n].x = leftIndent_x
					//positionArray[n].y = - 178 + n * 75
					positionArray[n].y = leftIndent + n * 75
					positionArray[n].workerName.text = stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender)
					positionArray[n].levelExp.text = "" + targetObject.lvl;
					positionArray[n].exp_.text = "   Exp: " + targetObject.exp
					positionArray[n].coockId.text = targetObject.coock
					positionArray[n].techId.text = targetObject.tech
					positionArray[n].cleanId.text = targetObject.clean
					positionArray[n].artId.text = targetObject.art
					positionArray[n].botIcos.visible = true
							positionArray[n].coockId.visible = true
							positionArray[n].techId.visible = true
							positionArray[n].cleanId.visible = true
							positionArray[n].artId.visible = true
					
					
					positionArray[n].priceValue.text = 100 //globalParams.workersArray.length*200 + 100
					positionArray[n].actionButton.id = i
					positionArray[n].actionButton.addEventListener (MouseEvent.CLICK, hireWorker)
					var workerImage:MovieClip = new workerMc ()
					if (targetObject.gender == 1) {
						workerImage.gotoAndStop (targetObject.color)
					}
					if (targetObject.gender == 2) {
						workerImage.gotoAndStop (3+targetObject.color)
					}
					workerImage.x = 29-5
					workerImage.y = 50-6
					
					positionArray[n].imagePlace.addChild (workerImage)
					positionContainer.addChild (positionArray[n])
					
				}
			}
			}
			//windowMc.lArrow.visible = false
			//windowMc.rArrow.visible = false
			windowMc.lArrow.visBut(false)
			windowMc.rArrow.visBut(false)
			if (globalParams.workersMarket.length > five) {
				//windowMc.lArrow.visible = true
				//windowMc.rArrow.visible = true
					windowMc.lArrow.visBut(true)
					windowMc.rArrow.visBut(true)
				var siteCounter:Number = Math.ceil (globalParams.workersMarket.length /five)
				if (_site == 0) {
					//windowMc.lArrow.visible = false
					windowMc.lArrow.visBut(false)
				}
				if (_site == siteCounter-1) {
					//windowMc.rArrow.visible = false
				windowMc.rArrow.visBut(false)
				}
				for (i = 1; i <= siteCounter; i++) {
					if (i - 1 == _site-1) {
						windowMc.lArrow.addEventListener (MouseEvent.CLICK, selectMarketPage)
						windowMc.lArrow.id = (i - 1)
					}
					if (i - 1 == _site+1) {
						windowMc.rArrow.addEventListener (MouseEvent.CLICK, selectMarketPage)
						windowMc.rArrow.id = (i - 1)
					//right_Arrow = (i - 1)
					}
				}
			}
		
		
		}
		
		///////////////////////////Показать информацию по выбранному боту///////////////////////
		/*
		public function showThatBotInfo (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var targetObject:Object = globalParams.workersArray[e.currentTarget.worker]
			if (targetObject.work != undefined) {
				globalParams.indexMc._land_personalMenu.killPersonalInterface (e)
			}
			globalParams.indexMc.showOnAttractionBotMenue (e)
		}
		*/
		private var selectInterface:MovieClip
		
		/////////////////////////////////////Нанять сотрудника/////////////////////////////////////////////
		var hire_Worker:Object =[];
		public function hireWorker (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			var possibleTrigger:Boolean = true
			if ((100) > globalParams.user_cash) {
				possibleTrigger = false
				globalParams.indexMc.systemMessage ("Вы не можете нанять еще одного сотрудника, потому что у вас слишком мало денег для расширения штата служащих.")
			}
			if (possibleTrigger) {
				var targetObject:Object = globalParams.workersMarket[e.currentTarget.id]
				var _yesNoMessage:yesNoMessage = new yesNoMessage();
				_yesNoMessage.Message(stringCollector.getBotFio (targetObject.botName, targetObject.botLastName, targetObject.gender) + " будет прикреплен к вашему парку, найм этого сотрудника будет стоить " + (100) + ", вы действительно хотите его нанять?")
				_yesNoMessage.button_text("Нанять","Отмена","Нанять сотрудника?")
				_yesNoMessage.addEventListener ("confirm", acceptHiring)
				//_yesNoMessage.addEventListener ("repeal", killLevelupInterface)
				
				//globalParams.indexMc.addChild(_yesNoMessage);
				_yesNoMessage.correct_coordinat()
				this.addChild(_yesNoMessage);
				hire_Worker.id= e.currentTarget.id
				
			}
		}
		
		///////////////////////////////////////Подтверждение найма сотрудника////////////////////////////////////
		
		public function acceptHiring (e:Event)
		{
			var n:int = globalParams.workersArray.length;
			
			globalParams.indexMc._soundProcessor.playSnd ("click");
			globalParams.indexMc.currentMoneyFn (-(100));
			//globalParams.workersArray.push (globalParams.workersMarket[e.currentTarget.id]);
			globalParams.workersArray.push (globalParams.workersMarket[hire_Worker.id]);
			//globalParams.workersMarket.splice (e.currentTarget.id, 1);
			globalParams.workersMarket.splice (hire_Worker.id, 1);
			
			//killSelectInterface (e);
			
			if (positionContainer != null)
			{
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			if (targetAttractionId == -1000)
			{
				showWorkerMarket (0);
				
			} 
			else
			{
				//e.currentTarget.id = n;
				placeWorkerToAttraction(hire_Worker.id);
				hire_Worker.id =n
				//placeWorkerToAttraction(e);
			
			
			}
			//нанять работника и запись
			globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,false);
		}
		
		/////////////////////////////////////////Убрать интерфейс//////////////////////////////////////
		
		public function killSelectInterface (e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click")
			this.removeChild (selectInterface)
			selectInterface = null
		}
		
		///////////////////////////////////Выбор страницы аттракционов/////////////////////////////////////
		
		public function selectAttractionListPage (e:MouseEvent)
		{
			
			globalParams.indexMc._soundProcessor.playSnd ("click")
			if (positionContainer != null)
			{
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			
			showAttractionList (e.currentTarget.id_new);
			
		}
		
		//////////////////////////////////Выбрать странцу сотрудников//////////////////////////////////
		
		public function selectWorkersPage (e:MouseEvent) {
			
			globalParams.indexMc._soundProcessor.playSnd ("click");
			
			if (positionContainer != null) {
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			
			showWorkers (e.currentTarget.id);
			
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////
		
		public function selectFreeWorkersPage (e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click");
			
			//Заебал уже честно
			//Отдельно функцию надо писать!
			if (positionContainer != null)
			{
				windowMc.removeChild (positionContainer);
				positionContainer = null;
			}
			
			showFreeWorkers (e.currentTarget.id);
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////
		
		public function selectMarketPage (e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click");
			
			//Да еп твою мать!
			if (positionContainer != null)
			{
				windowMc.removeChild (positionContainer)
				positionContainer = null
			}
			showWorkerMarket (e.currentTarget.id)
		}
		
		/////////////////////////////////////////////////////////////////////////////////////////
		public static function Push_Workers_M():void {
			Push_WorkersMarket ()
		}
		public static function Push_WorkersMarket ():void {
			//пол задается на рандом
					var gender:int = Math.ceil (Math.random ()*2);
					
					var n:int = globalParams.workersMarket.length;
					
					globalParams.workersMarket.push (new Object ());
					
					var targetObject:Object 	= globalParams.workersMarket[n];
					targetObject.gender 		= gender;
					targetObject.botName 		= stringCollector.getBotNameId (gender);
					targetObject.botLastName 	= stringCollector.getBotLastNameId (gender);
					
					targetObject.exp = 0;
					targetObject.lvl = 0;
					
					targetObject.color 	= Math.ceil (Math.random () * 12);
					targetObject.clean 	= Math.ceil (Math.random () * 10);
					targetObject.tech 	= Math.ceil (Math.random () * 10);
					targetObject.coock 	= Math.ceil (Math.random () * 10);
					targetObject.art 	= Math.ceil (Math.random () * 10);
			
		}
		
	}
}