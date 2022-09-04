package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class botEngine extends MovieClip
	{
		public function botEngine()
		{
			
		}
		var BasaMind:Array = ["Какая сегодня прекрасная погода!",
							  "Я хочу мороженое.",
							  "Нашел промокод - хочу Айфон!",
							  "Как приятно просто взять и погулять.",
							  "О боже, здесь Рузик!",
							 "Я только что видел Человека-Паука!",
							"Я остаюсь здесь жить.",
							"Здесь безопасно и спокойно.",
							 "Я хочу кукурузу.",
							 "Я сфоткался с Рузиком!",
							 "Пойду пузыряться.",
							  "Надо рассказать друзьям про этот парк.",
							 "У вас так клево, хочу у вас работать!",
							 "Когда я ем кукурузные палочки, я вспоминаю друзей.",
							  "Хочу в тенек."];
		var BasaMind2:Array = ["Ммм, парк развлечений.",
							   "Интересно, а что там внутри.",
							   "Какая прелесть!",
							   "Классный парк!",
							   "Вы моего друга Валеру не видили?",
							   "Хочу в парк к друзьям.",
							   "А как пройти в библиoтеку?",
							   "Мне кажется, лучше на Железяке строить.",
							   "Парк - это так романтично.",
							   "Хотелось бы  погулять по парку и развлечься."];
		var BasaMindgoAway:Array = ["Этот парк слишком маленький.",
									"А где кукупальма?",
									"Мне не понравился этот парк.",
									"Кажется, я на что-то наступил.",
									"Пойду-ка я лучше домой.",
									"В этом парке абсолютно нечем заняться.",
									"Есть хочется...",
									"Жалко здесь нет шаурмы.",
									"Здесь слишком шумно.",
									
									"Почему здесь так мало туалетов?",
									"Почему здесь такие большие очереди?",
									"Дайте мне жалобную книгу!",
									
									"Персонал очень грубый.",
									"Почему здесь нет французской кухни?",
									"Почему ботаническая коллекция растений неполная?",
									"Кто такой Ermine?"];
		var BasaMindgoAway2:Array = ["Ух ты! Новый парк! Жалко он закрыт, приду позже.",
									 "Этот парк закрыт, придётся прийти попозже.",
									 "Я потратил все свои кукубаксы!",
									"А тут можно покататься бесплатно?",
									"Когда-нибудь этот парк сравнится с Дисней-лэндом!",
									"Хочу в Париж.",
									 "Я уже слышал про этот новый парк. Интересно, когда он откроется?"];
		
		var BasaMind_walkInPark:Array = ["Это хороший парк, здесь есть где погулять.",
									"Красота спасет мир.",
									"Прекрасные мгновения.",
									"Я обошел почти весь парк.",
									"Когда парк будет расширяться?",
									"Ой, меня ткнули!",
									"Я не псих, наш мир - Матрица, и мы живем в игре...",
									"А здесь можно выгуливать собак?"
									];
		var BasaMind_hunger:Array = ["Мне неуютно.",
									"Пойду схожу в ресторан.",
									"Не буду больше ходить в ваш парк!",
									"Пойду домой.",
									"Мне здесь надоело, пойду домой.",
									"Я замерз.",
									"Я устал.",
									"Я больше не могу.",
									
									"Пора домой!",
									"Это просто счастье - возвращатся домой.",
									"Я иду головою свесив по дороге в знакомый кабак.",
									"Я хочу домой! Хочу домой!"
									];
		
		//public var botImage:MovieClip
		public var botImage:botImage_ = new botImage_ ();
		public var way:String = "stay"
		public var action:String = "walkAroundPark"
		public var botName:String = "Посетитель"
		public var mainMoney:int;
		public var spd:Number = .75
		
		public var hunger:int;
		public var fun:int = 50
		public var activity:int = 50
		public var gender:int = 0
		
		private var sortTimer:Number = 0
		private var pereborTimer:Number = 0
		
		public var currentObj:Object = {i:0,j:0}
		
		public var BasaActionStatus:Object = {walkAroundPark:"Прогуливается рядом с парком.",
		waytClassPark:"Оценивает парк со стороны.",
		inAttraction:"На аттракционе.",
		goAway:" Уходит домой.",
		goAway2:"__Уходит домой.",
		walkInPark:"Гуляет по парку."};
		
		public var inAttractionObject:Object
		
		
		public function initiateBot (ii:int, jj:int, _way:String) {
			hunger = 5 + Math.ceil (Math.random ()*50)
			
			fun = 5 + Math.ceil (Math.random ()*50)
			activity = 8 + Math.ceil (Math.random ()*20)
			spd = .2 + Math.ceil (Math.random() * 2) / 10
			if (spd > 1) {
				spd = 1
			}
			botName = "Посетитель #" + Math.ceil (Math.random() * 400)
			gender = Math.ceil (Math.random ()*2)
			var botNameId:int = stringCollector.getBotNameId (gender);
			var botLastNameId:int = stringCollector.getBotLastNameId (gender);
			botName = stringCollector.getBotFio (botNameId, botLastNameId, gender);
			mainMoney = 120 + Math.ceil (Math.random()*100)
			
			way = _way
			
			//botImage:botImage_ = new botImage_ ();
			botImage.scaleX = 1.1 - Math.ceil (Math.random ()*3)/10
			botImage.scaleY = botImage.scaleX
			botImage.x = (ii - 1)*76 + (jj-1)*76 - (globalParams.indexMc.landWidth)*76 + 76
			botImage.y = (ii - 1) * 38 - (jj - 1) * 38
			
			currentObj = new Object ()
			currentObj.i = ii
			currentObj.j = jj
			
			var rnd:Number = Math.ceil (Math.random() * 20) - 10
			
			botImage.x = botImage.x - rnd
			botImage.y = botImage.y + rnd / 2
			//тип бота
			currentCilor = Math.ceil (Math.random ()*11)
			botImage.face.visible = false;
			//Add_Hooligan ();
			Add_Robocat ();
			//запретить клонирование рузика
			if (currentCilor==10) {
				if (Catch_Rusik ("Рузик")==true) {
					
					currentCilor=1;
					Add_Hooligan ();
					
				
				} else {
					
					botName = "Рузик";
					
				}
			
			}
			
			
			
			botImage.gotoAndStop (currentCilor)
			globalParams.indexMc.landscape.addChild (botImage)
			
			//botImage.addEventListener (MouseEvent.CLICK, showBotMenue)
		}
		public function Add_Robocat ():void
		{
			if (globalParams.Allow_Robocat) {
				if (!Catch_Rusik ("Робокот")) {
					if (Math.ceil (Math.random ()*2)==1) {
						botName = "Робокот";
						currentCilor = 12
					}
				}
			}
		}
		public function Add_Hooligan ():void
		{
			if (Math.ceil (Math.random ()*2)==1) {
				botName = "Хулиган";
				currentCilor=1;
				globalParams.indexMc.Bright_Image(botImage,-150);
				botImage.face.visible = true;
				globalParams.indexMc.Bright_Image(botImage.face,100);
				
				//botImage.addEventListener (MouseEvent.MOUSE_OVER, Bot_Club)
				//botImage.addEventListener (MouseEvent.MOUSE_OUT, remove_Bot_Club)
			} else {
				
			}
			
		}
		//запретить клонирование рузика
		public function Catch_Rusik (NameCoincidence:String):Boolean
		{
			//запретить клонирование рузика
			
			for (var i:int=0; i < globalParams.indexMc.botArray.length; i++)
			{
				if (globalParams.indexMc.botArray[i].botName==NameCoincidence) {
					
					return true;
				}
				
				
				
				
			}
			return false;
		}
		
		
		private var currentCilor:int
		public function setBotStartPosition (_obj:Object):void
		{
			
			
			botImage.x = globalParams.indexMc.lanscapeArray [_obj.i][_obj.j].x
			botImage.y = globalParams.indexMc.lanscapeArray [_obj.i][_obj.j].y
			
			targetBoxObject = new Object ()
			currentObj = new Object ()
			currentObj.i = _obj.i
			currentObj.j = _obj.j
			action = "walkInPark"
			getNextRoadBox ()
			solutionTimer = 0
		}
		private var count_Robocat:int
		public function Pause_Robocat ()
		{
			count_Robocat=0;
			addEventListener (Event.ENTER_FRAME, Stop_Pause_Robocat)
			
			action = "waitForCloseMenue";
		}
		public function Stop_Pause_Robocat(e:Event) {
			count_Robocat++
			if (count_Robocat>=160) {
				trace("Stop_Pause_Robocat",count_Robocat)
				removeEventListener (Event.ENTER_FRAME, Stop_Pause_Robocat)
				action = "walkInPark"
			}
		}
		public function getActionStatus ()
		{
			
			if (BasaActionStatus[action]!=undefined) {
					return BasaActionStatus[action];
			}
			return "";
			
		}
		
		public var currentMind:String = ""
		
		public function getMind (Action:String):String
		{
			//мнение бота  строка 
			//var req:String = ""
			//var rnd:Number
			
			
			if (fun <=0||activity<=0||hunger<=0)
			{ 
			
				return BasaMind_hunger[Math.floor (Math.random () * BasaMind_hunger.length)];
			}
			if (Action == "walkAroundPark") {
				
				//rnd = Math.ceil (Math.random () * BasaMind.length)
				return BasaMind[Math.ceil (Math.random () * BasaMind.length)-1];
			}
			if (Action == "waytClassPark")
			{
				
				//rnd = Math.ceil (Math.random () * BasaMind2.length)
				
				return BasaMind2[Math.ceil (Math.random () * BasaMind2.length)-1];
			}
			if (Action == "goAway")
			{
				
				//rnd = Math.ceil (Math.random () * BasaMindgoAway.length)
				return BasaMindgoAway[Math.ceil (Math.random () * BasaMindgoAway.length)-1];
				
			}
			
			if (Action == "goAway2")
			{
				
				//rnd = Math.ceil (Math.random () * BasaMindgoAway2.length)
				return BasaMindgoAway2[Math.ceil (Math.random () * BasaMindgoAway2.length)-1];
				
				
			}
			if (Action == "walkInPark")
			{
				
				return BasaMind_walkInPark[Math.ceil (Math.random () * BasaMind_walkInPark.length)-1];
				
			}
			
			
			return "опа?"
		}
		
		private var hungerTimer:Number = 0
		private var updateFinishTrigger:Boolean = true
		private var animationTurnTrigger:Boolean = false
		public function Reset_Bot_demand ():void {
			++hungerTimer
			
			if (hungerTimer > 240)
			{
				hungerTimer = 0;
				hunger--;
				fun--;
				activity--;
				
				if (hunger < 0||mainMoney<0)
				{
					hunger = 0
					solutionTrigger=true;
				}
				if (activity < 0)
				{
					activity = 0
					solutionTrigger=true;
				}
				if (fun < 0)
				{
					fun = 0
					solutionTrigger=true;
				}
			}
			
		}
		public function update ():void {
			
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			Reset_Bot_demand ();
			
			// solutionTrigger == true, боту принять решение куда идти
			if (solutionTrigger) {
				solutionTimer--;
				if (solutionTimer < 0) {
					getSolution ()
				}
			} 
			update_Stroll_action(lanscapeArray);
						
			update_inAttraction(lanscapeArray);
			
			sortTimer++;
			
			if (sortTimer > 4)
			{
				sortTimer = 0
				sortBotDepths ()
			}
			
			if (action == "walkInPark") {
				walkInPark();
			}
			var tmpPoint	:Point;
			var tmpPoint1	:Point;
			tmpPoint 	= new Point(0, 0);
			tmpPoint1 	= botImage.localToGlobal(tmpPoint);
			
			if (action != "inAttraction")
			{
				
				if (tmpPoint1.x < - 50 || tmpPoint1.x > globalParams.indexMc.stage.stageWidth-100 || tmpPoint1.y < - 50 || tmpPoint1.y > globalParams.indexMc.stage.stageHeight-50)
				{
					if (botImage.visible)
					{
						botImage.visible = false
					}
				}
				else
				{
					botImage.visible = true
					if (globalParams.indexMc.zoomTrigger)
					{
						if (globalParams.indexMc.zoomParam < .5)
						{
							botImage.visible = false
						}
					} else {
						if (!botImage.visible) {
							
						}
					}
				}
			}
			if (action == "walkAroundPark") {
				pereborTimer ++
				if (pereborTimer > 4) {
					pereborTimer = 0
					pereborKletok ()
				}
			}
			
			updateFinishTrigger = true
			
		}
		private function update_Stroll_action(lanscapeArray:Object):void
		{
			//
			var Basa_Animat_Way:Object = {
				goToCenterOfRoad2:{highwayWalker:true},
				goAway:{highwayWalker:true},
				goAway2:{highwayWalker:true},
				goToCenterOfRoad:{highwayWalker:true},
				waytToGoOnAttraction:{highwayWalker:false},
				enterToPark:{highwayWalker:false},
				walkInPark:{highwayWalker:false},
				walkAroundPark:{highwayWalker:true}}
			
			if (Basa_Animat_Way[action]!=undefined) {
				if (animationTurnTrigger)
				{
					botImage.bot_mc.gotoAndStop (way)
				}
				else
				{
					animationTurnTrigger = true
					botImage.bot_mc.bot_mc.play ()	
				}
				if (Basa_Animat_Way[action].highwayWalker) {
					highwayWalker ();
				}
				//войти в парк
				if (action == "enterToPark") {
					enterToPark ()
				}
				if (action == "waytToGoOnAttraction") {
				
				
					if (lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].x < botImage.x-2) {
						botImage.x = botImage.x - 2*spd
					}
					if (lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].x > botImage.x+2) {
						botImage.x = botImage.x + 2*spd
					}
					if (lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].y < botImage.y-2) {
						botImage.y = botImage.y - 1*spd
					}
					if (lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].y > botImage.y+2) {
						botImage.y = botImage.y + 1*spd
					}
					generateWay (botImage.x, botImage.y, lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].x, lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].y)
				}
			
			} else {
				if (animationTurnTrigger) {
					animationTurnTrigger = false
					botImage.bot_mc.bot_mc.stop ()
				}
			}
			
			
			
			
			
		}
		
		private function update_inAttraction(lanscapeArray:Object):void
		{
			if (action == "inAttraction") {
				
				//стоп анимация аттракционов
				
				if (globalParams.Check_Basa_Attraction[inAttractionObject.attraction.type]!=undefined) {
					//trace("  ?????  = ",inAttractionObject.attraction.type)
					//trace(Check_Basa_Attraction[inAttractionObject.attraction.type].animation)
					if (globalParams.Check_Basa_Attraction[inAttractionObject.attraction.type].animation) {
						if (inAttractionObject.time == 15) {
							inAttractionObject.attraction.objectBottom_mc.animation.gotoAndPlay ("endAnimation")
						}
					}
					
				}
				
				
				if (inAttractionObject.attraction.type == "octopus" || inAttractionObject.attraction.type == "orbitalStation" || inAttractionObject.attraction.type == "spaceShipTravel") {
					if (inAttractionObject.time == 15) {
						if (getFreePlaces (lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j]) == inAttractionObject.attraction.places) {
							inAttractionObject.attraction.objectBottom_mc.animation.gotoAndPlay ("endAnimation")
						}
					}
				}
				
				
				if (inAttractionObject.time > 0)
				{
					inAttractionObject.time--;
				}
				else
				{
					//trace(action,"  update   botName = ",botName,"____");
					
					//time меньше нуля из парка вон?
					action = "walkInPark"
					generateWay (botImage.x, botImage.y, lanscapeArray[targetBoxObject.i][targetBoxObject.j].x, lanscapeArray[targetBoxObject.i][targetBoxObject.j].y)
					//trace("_________inAttraction__________|",inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place],"|___");
					if (inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place]!=undefined) {
					if (inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place].visible)
					{
						//trace("_________inAttraction_________1111_");
						if (inAttractionObject.attraction[inAttractionObject.place])
						{
							inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place].visible = false
						}
						inAttractionObject.attraction[inAttractionObject.place] = false
					}
					}
					//trace("_________inAttraction__________0");
				}
				if (botImage.visible)
				{
					botImage.visible = false
				}
			}
			
			
			
		}
		private var solutionTimer:Number
		private var solutionTrigger:Boolean = false
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		private function Prime_DownPark(old:String):String
		{
			if (hunger <= 0||fun<=0||activity<=0||mainMoney<=0) 
			{
				for (var i_ = 0; i_ <  globalParams.indexMc.objectsArray.length; i_++) {
					if ( globalParams.indexMc.objectsArray[i_].type == "enterBoth") {
						if (currentObj.i == globalParams.indexMc.objectsArray[i_].i -1 && currentObj.j==globalParams.indexMc.objectsArray[i_].j) {
							way = "ne" ;
							
							return "goAway2";
						}
					
					//trace(" enterBoth =",botImage.hitTestObject(globalParams.indexMc.objectsArray[i]));
					}
				}
			}
			
			return old
		}
		private function Prime_DownScreen(old:String):String
		{
			if (hunger <= 0||fun<=0||activity<=0||mainMoney<=0) 
			{
				for (var i_ = 0; i_ <  globalParams.indexMc.objectsArray.length; i_++) {
					if ( globalParams.indexMc.objectsArray[i_].type == "enterBoth") {
						if (currentObj.i == globalParams.indexMc.objectsArray[i_].i -1 && currentObj.j==globalParams.indexMc.objectsArray[i_].j+2) {
							hunger = 10;
							fun=10;
							activity=10;
							way = "se" ;
							
							return "goAway2";
						}
					
					//trace(" enterBoth =",botImage.hitTestObject(globalParams.indexMc.objectsArray[i]));
					}
				}
			}
			
			return old
		}
		
				
		//решение бота куда идти
		private function getSolution()
		{
			//решение бота куда идти
			var lanscapeArray	:Array 		= globalParams.indexMc.lanscapeArray;
			//var i				:Number;
			var landWidth		:Number 	= globalParams.indexMc.landWidth;
			var landHeight		:Number 	= globalParams.indexMc.landHeight;
			var offRoadArray	:Array 		= globalParams.indexMc.offRoadArray;
			var roadsArray		:Array 		= globalParams.indexMc.roadsArray;
			var botArray		:Array 		= globalParams.indexMc.botArray;
			var possibleTrigger	:Boolean 	= true;
			//бот проголодался или устал - идет домой
			
			action = Prime_DownPark(action);
			
			action=Prime_DownScreen(action)
			
			switch (action) { 
				case "classPark" : 
				//пойти в парк?
				random_Timer ()
				leave_park_mind ()
				action = "goToCenterOfRoad"; 
				break; 
				case "goToCenterOfRoad" : 
				//покинуть парк?
				random_Timer ()
				solutionTrigger = true;
				currentMind = getMind(action);
				action = "waytClassPark";
				break; 
				case "goToCenterOfRoad2" : 
				//покинуть парк?
				checkEnterBoth2 (lanscapeArray[currentObj.i][landHeight])
				if (way == "sw")
				{
					var rnd:Number = Math.ceil (Math.random() * 50)
					if (rnd < 25)
					{
						targetBoxObject = new Object ()
						targetBoxObject.i = currentObj.i+1
						targetBoxObject.j = currentObj.j
						way = "se"
					}
					else
					{
						way = "nw"
						targetBoxObject = new Object ()
						targetBoxObject.i = currentObj.i-1
						targetBoxObject.j = currentObj.j
					}
				}
				
				animationTurnTrigger = true;
				random_Timer ()
				
				leave_park_mind ()
				break; 
				case "waytClassPark" : 
				// количество посетителей<= если атракционов больще
				if (globalParams.getSpaceInPark () <= globalParams.getBotInPark ())
				{
					random_Timer ()
					
					leave_park_mind ()
					action = "goAway"
				}
				else
				{
					random_Timer ()
					
					leave_park_mind ()
					action = "enterToPark";
				}
				break; 
				case "goAway" : 
				//уход из парка
				
				leave_park_mind ()
				action = "goAway"
				break; 
				case "goAway2" : 
				//уход из парка
				
				leave_park_mind ()
				//action = "goAway2"
				break;
				case "waytToGoOnAttraction" : 
				if (globalParams.Check_Basa_Attraction[inAttractionObject.attraction.type]!=undefined) {
					goIn_Attraction(inAttractionObject.attraction.type)
					
				}
				
				solutionTrigger = false
				
				action = "inAttraction"
				break;
				default : 
				
			}
			
			
		}
		
		public function random_Timer () {
			solutionTimer = 50 + Math.ceil (Math.random() * 100);
		}
		public function leave_park_mind () {
			solutionTrigger = false
				currentMind = getMind (action)
		}
		//забирать бабло у посетителей из их кошелька
		public function checkMyMoney (num_:int, target_:Object) {
			//забирать бабло у посетителей из их кошелька
			
			//Если данные не корректные, что бы данные не обнулялись происходит проверка
			if (num_ is int) {
				
				mainMoney = mainMoney - num_;
			
				target_.profit += num_;
			
			} else {
				mainMoney = mainMoney - 10;
			
				target_.profit += 10;
			}
			
		}
		
		
		public function goIn_Attraction (Attraction:String) {
			
			trace("    TYPE",globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].id].type);
			
			if (botName == "Хулиган") {
				globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].id].statusObject.repairInterval-=100+Math.floor (Math.random () * 100);
				
				globalParams.indexMc.ResetCashCollect(globalParams.indexMc.lanscapeArray[inAttractionObject.attraction.i][inAttractionObject.attraction.j].id);
				globalParams.indexMc._lands_Svetofor.updateSvetofors ()
				globalParams.indexMc._soundProcessor.playSnd ("laugh");
				globalParams.indexMc._trash_refuse.create_trash();
			}
			
			
			if (inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place]!=undefined) {
				
				inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place].visible = inAttractionObject.attraction[inAttractionObject.place]
			}
			
			
			
			checkMyMoney (inAttractionObject.attraction.price, inAttractionObject.attraction)
			
			inAttractionObject.attraction.goods --;
		
			if (globalParams.Check_Basa_Attraction[Attraction]!=undefined) {
				fun +=  globalParams.Check_Basa_Attraction[Attraction].fun;
				hunger +=  globalParams.Check_Basa_Attraction[Attraction].hunger;
				activity += globalParams.Check_Basa_Attraction[Attraction].activity;
				
			}
			
			if (globalParams.Check_Basa_Attraction[Attraction].animation) {
			
				inAttractionObject.attraction.objectBottom_mc.animation.play ()
			}
			
			if (globalParams.Check_Basa_Attraction[Attraction].lavka) {
				if (inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place]!=undefined) {
					inAttractionObject.attraction.objectBottom_mc[inAttractionObject.place].gotoAndStop (currentCilor);
				}
				
				
				if (globalParams.Check_Basa_Attraction[Attraction].kafe) {
					In_Kafeshka ()
				}
			}
			
		}
		
		public function In_Kafeshka () {
			var foodArr:Object={pizza:{hunger:35,activity:20,fun:-20},
			coca:{hunger:15,activity:10,fun:-10},
			burger:{hunger:50,activity:30,fun:-30}
			}
			hunger +=  foodArr[inAttractionObject.attraction.productType].hunger
			activity += foodArr[inAttractionObject.attraction.productType].activity;
			fun  += foodArr[inAttractionObject.attraction.productType].fun;
			
		}
		
		public function pereborKletok():void
		{
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			var landWidth:int = globalParams.indexMc.landWidth
			var landHeight:int = globalParams.indexMc.landHeight
			var possibleTrigger:Boolean = true
			var objectsArray:Array = globalParams.indexMc.objectsArray
			if (action == "walkAroundPark") {
				if (globalParams.indexMc.enterPosition == "up") {
					if (currentObj.i <= 0) {
						possibleTrigger = false
					}
					if (currentObj.i >= landWidth) {
						possibleTrigger = false
					}
					if (possibleTrigger) {
						if (lanscapeArray[currentObj.i][landHeight].cellType == "enterBoth") {
							
							checkEnterBoth (lanscapeArray[currentObj.i][landHeight])
						}
					}
				}
				if (globalParams.indexMc.enterPosition == "right") {
					if (currentObj.i <= 0) {
						possibleTrigger = false
					}
					if (currentObj.i >= landHeight) {
						possibleTrigger = false
					}
					if (possibleTrigger) {
						if (lanscapeArray[landWidth][currentObj.i].cellType == "enterBoth") {
							
							checkEnterBoth (lanscapeArray[landWidth][currentObj.i])
						}
					}
				}
				if (globalParams.indexMc.enterPosition == "down") {
					if (currentObj.i <= 0) {
						possibleTrigger = false
					}
					if (currentObj.i >= landWidth) {
						possibleTrigger = false
					}
					if (possibleTrigger) {
						if (lanscapeArray[currentObj.i][1].cellType == "enterBoth") {
							
							checkEnterBoth (lanscapeArray[currentObj.i][1])
						}
					}
				}
				if (globalParams.indexMc.enterPosition == "left") {
					if (currentObj.i <= 0) {
						possibleTrigger = false
					}
					if (currentObj.i >= landHeight) {
						possibleTrigger = false
					}
					if (possibleTrigger) {
						if (lanscapeArray[1][currentObj.i].cellType == "enterBoth") {
							
							checkEnterBoth (lanscapeArray[1][currentObj.i])
						}
					}
				}
			}
		}
		
		public function checkEnterBoth (_mc:MovieClip)
		{
			
			if (hunger <= 0||fun<=0||activity<=0) 
			{
				action = "goAway";
							
			}
			
			if (action != "goAway")
			{
				action = "classPark"
				getSolution()
			}
		}
		
		public function checkEnterBoth2 (_mc:MovieClip):void
		{
			//выход со стороны улицы
			
			if (hunger <= 0||fun<=0) 
			{
				action = "goAway";
				
			}
			
			
			if (action != "goAway")
			{
				var objectsArray:Array = globalParams.indexMc.objectsArray
				if (_mc.id != undefined)
				{
					if (objectsArray[_mc.id].openTrigger)
					{
						action = "classPark"
						getSolution ()
					}
					else
					{
						action = "walkAroundPark"
						getSolution ()
					}
				} else {
					action = "walkAroundPark"
					getSolution ()
				}
				
			}
		}
		
		public function removeListeners ():void
		{
			globalParams.indexMc.landscape.removeChild (botImage)
		}
		
		public function sortBotDepths ()
		{
			
			var possibleTrigger:Boolean = true
			//var topPosition:uint
			if (action == "walkAroundPark" || action == "goAway" || action == "goAway2" || action == "goToCenterOfRoad") {
				highwaySorter ()
				possibleTrigger = false
			}
			
			if (action == "walkInPark") {
				InParkSorter()
			}
			if (action == "waytToGoOnAttraction") {
				InParkSorter()
			}
		}
		public var distanceNumber:Number
		private var numNum:int = 0
		public function walkInPark ():void {
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			//trace("walkInPark = ",targetBoxObject.i,targetBoxObject.j)
			//trace(lanscapeArray[targetBoxObject.i][targetBoxObject.j].x);
			var xd:int = Math.abs (Math.abs (lanscapeArray[targetBoxObject.i][targetBoxObject.j].x) - Math.abs (botImage.x))
			var yd:int = Math.abs (Math.abs (lanscapeArray[targetBoxObject.i][targetBoxObject.j].y) - Math.abs (botImage.y))
			var distance:Number =  Math.sqrt (xd * xd + yd * yd);
			distanceNumber = distance
			if (lanscapeArray[targetBoxObject.i][targetBoxObject.j].x < botImage.x-2) {
				botImage.x = botImage.x - 2*spd
			}
			if (lanscapeArray[targetBoxObject.i][targetBoxObject.j].x > botImage.x+2) {
				botImage.x = botImage.x + 2*spd
			}
			if (lanscapeArray[targetBoxObject.i][targetBoxObject.j].y < botImage.y-2) {
				botImage.y = botImage.y - 1*spd
			}
			if (lanscapeArray[targetBoxObject.i][targetBoxObject.j].y > botImage.y+2) {
				botImage.y = botImage.y + 1*spd
			}
			
			numNum ++
			if (distance > 10) {
				getNextTrigger = true
			} else {
				InParkSorter ()
				
				if (getNextTrigger) {
					if (targetBoxObject.i == currentObj.i) {
						if (targetBoxObject.j == currentObj.j) {
							getNextRoadBox ()
							checkAttractions ()
						}
					}
				}
			}
		}
		private var attractionArray:Array
		public function checkAttractions () {
			//проверка аттракцион вдоль дороги ботом
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			var landWidth:int = globalParams.indexMc.landWidth
			var landHeight:int = globalParams.indexMc.landHeight
			
			var upTrigger:Boolean = false
			var downTrigger:Boolean = false
			var rightTrigger:Boolean = false
			var leftTrigger:Boolean = false
			//Array в который добавляются все аттрактион который нашел данный бот
			attractionArray = new Array ()
			var n:int
			if (currentObj.i < landWidth) {
				if (getCellAttractionPossibility (lanscapeArray[currentObj.i + 1][currentObj.j])) {
					n = attractionArray.length
					attractionArray.push (new Object ())
					attractionArray[n].i = currentObj.i + 1
					attractionArray[n].j = currentObj.j
					attractionArray[n].targetObject = getObjectFromCoordinates (attractionArray[n].i, attractionArray[n].j)
				}
			}
			if (currentObj.i > 1) {
				if (getCellAttractionPossibility (lanscapeArray[currentObj.i - 1][currentObj.j]))
				{
					n = attractionArray.length
					attractionArray.push (new Object ())
					attractionArray[n].i = currentObj.i - 1
					attractionArray[n].j = currentObj.j
					attractionArray[n].targetObject = getObjectFromCoordinates (attractionArray[n].i, attractionArray[n].j)
				}
			}
			if (currentObj.j < landHeight) {
				if (getCellAttractionPossibility (lanscapeArray[currentObj.i][currentObj.j + 1]))
				{
					n = attractionArray.length
					attractionArray.push (new Object ())
					attractionArray[n].i = currentObj.i
					attractionArray[n].j = currentObj.j + 1
					attractionArray[n].targetObject = getObjectFromCoordinates (attractionArray[n].i, attractionArray[n].j)
				}
			}
			if (currentObj.j > 1) {
				if (getCellAttractionPossibility (lanscapeArray[currentObj.i][currentObj.j - 1]))
				{
					n = attractionArray.length
					attractionArray.push (new Object ())
					attractionArray[n].i = currentObj.i
					attractionArray[n].j = currentObj.j - 1
					attractionArray[n].targetObject = getObjectFromCoordinates (attractionArray[n].i, attractionArray[n].j)
				}
			}
			if (attractionArray.length > 0) {
				checkAttractionArray (attractionArray)
			}
		}
		public function getObjectFromCoordinates (i_:int, j_:int):Object {
			var objectsArray:Array = globalParams.indexMc.objectsArray
			var tmpObject:Object
			for (var i = 0; i < objectsArray.length; i++) {
				if (objectsArray[i].i == i_ && objectsArray[i].j == j_) {
					tmpObject = objectsArray[i]
				}
			}
			
			return tmpObject
		}
		private function getCellAttractionPossibility (mc_:MovieClip) {
			
			var attractionNameArray:Array = globalParams.attractionNameArray
			
			var objectsArray:Array = globalParams.indexMc.objectsArray
			var req:Boolean = false
			var n:int
			for (var i = 0; i < attractionNameArray.length; i++) {
				if (mc_.cellType == attractionNameArray[i]) {
					req = true
				}
			}
			for (i = 0; i < objectsArray.length; i++) {
				//почему _et_2 ведь есть и другие клетки?
				if (mc_.cellType == objectsArray[i].type + "_et_2") {
					
					n = attractionArray.length
					attractionArray.push (new Object ())
					attractionArray[n].i = currentObj.i - 1
					attractionArray[n].j = currentObj.j - 1
					attractionArray[n].targetObject = objectsArray[i]
				}
				
			}
			return req
		}
		
		
		public function checkAttractionArray (array_:Array):void {
			
			var id_Obj:Object = new Object();
			for (var bi = 0; bi < 13; bi++) {
				id_Obj["id_"+bi]=0
			}
			
			
			var maxId:int = array_.length
			if (maxId > 6) {
				maxId = 6
			}
			for (var i = 0; i < maxId; i++) {
				
				
				if (globalParams.Check_Basa_Attraction[array_[i].targetObject.type]!=undefined) {
					
					if (this[globalParams.Check_Basa_Attraction[array_[i].targetObject.type].demand] < 80) {
						
						id_Obj["id_"+i] +=  10
					
					}
					
					if (this[globalParams.Check_Basa_Attraction[array_[i].targetObject.type].demand] < 70) {
						id_Obj["id_"+i] +=  10
					}
					
					if (this[globalParams.Check_Basa_Attraction[array_[i].targetObject.type].demand] < 60) {
						id_Obj["id_"+i] +=  10
					}
					id_Obj["id_"+i] = 80 - this[globalParams.Check_Basa_Attraction[array_[i].targetObject.type].demand];
					
					if (getFreePlaces (array_[i].targetObject) <= 0)
					{
						id_Obj["id_"+i] = 0
					} else {
						id_Obj["id_"+i]+=5*getFreePlaces (array_[i].targetObject);
					}
				
				
				}
				
				
				if (!array_[i].targetObject.openTrigger) {
					id_Obj["id_"+i] = 0;
				}
				//разрешить заходить ему во все здания
				if (botName == "Хулиган") {
					id_Obj["id_"+i] = 100+Math.ceil (Math.random ()*10);
					array_[i].targetObject.openTrigger=true;
				}
				//запретить заходить ему в здание
				if (botName == "Робокот") {
					id_Obj["id_"+i] = -1;
					
				}
				
				
				if (id_Obj["id_" + i] > 0) {
					id_Obj["id_"+i] += (Math.ceil (Math.random ()*10) - 5)
				}
				
			}
			
			var id_id:int = -1
			var max_id:int = 0
			//выбирается приоретет для посетителя
			for (i = 0; i <= 3; i++) {
				if (id_Obj["id_" + i] > max_id) {
					
					id_id = i
					max_id = id_Obj["id_" + i]
				}
			}
			//после выбора приоритета, посетитель определяется а идти-ли ему на атракцион или нет.
			
			if (id_id != -1) {
				
				if (globalParams.Check_Basa_Attraction[array_[id_id].targetObject.type]!=undefined) {
					check_Attraction (array_[id_id].targetObject,array_[id_id].targetObject.type);
					
				}
				
				
			
			}
		}
		
		
		public function check_Attraction (targetObject:Object,Atract_Str:String):void {
			
			if (targetObject.openTrigger) {
				var rnd:int = Math.ceil (Math.random () * 200)
				if (activity < 40) {
					rnd = 50
				}
				
				//решение сходить на атракцион
				if (rnd < 100) {
					
					action = "waytToGoOnAttraction"
					solutionTrigger = true
					solutionTimer = globalParams.Check_Basa_Attraction[Atract_Str].solutionTimer;
					//обнуляем inAttractionObject
					inAttractionObject = new Object ()
					inAttractionObject.attraction = targetObject
					inAttractionObject.place = ""
					inAttractionObject.time = Math.ceil (Math.random ()*globalParams.Check_Basa_Attraction[Atract_Str].basatime) + Math.ceil (Math.random ()*globalParams.Check_Basa_Attraction[Atract_Str].time);
					for (var _j:int = 1; _j < 9; _j ++)
					{
						
						if (globalParams.Check_Basa_Attraction[Atract_Str]["m_"+_j]&&Atract_Str!="lavka")
						{
							if (!inAttractionObject.attraction["m_"+_j]) {
								inAttractionObject.attraction["m_"+_j]=true;
								inAttractionObject.place = "m_"+_j;
								break;
							}
						}
						
						if (globalParams.Check_Basa_Attraction[Atract_Str]["m_"+_j] && Atract_Str=="lavka")
						{
							if (!inAttractionObject.attraction["m_"+_j]) {
								inAttractionObject.attraction["m_"+_j]=true;
								inAttractionObject.place = "m_"+_j;
								break;
							}
						}
					
					
					
					}
						
				} else {
					
				}
			}
			
		}
		
		
		public function getFreePlaces (img:Object):int {
			//есть ли места для входа посетителей? (свободные места)
			var req:int = 0
			for (var i = 1; i <= img.places; i++) {
				if (img["m_" + i]) {
					
				} else {
					req ++
				}
			}
			return req
		}
		public function generateWay (firstX:Number, firstY:Number, secondX:Number, secondY:Number) {
			if (firstX < secondX  && firstY > secondY) {
				way = "ne"
			}
			if (firstX > secondX  && firstY > secondY) {
				way = "nw"
			}
			if (firstX < secondX  && firstY < secondY) {
				way = "se"
			}
			if (firstX > secondX  && firstY < secondY) {
				way = "sw"
			}
		}
		private var getNextTrigger:Boolean = false
		var perekrestokCounter:int;
		public function getNextRoadBox ()
		{
			//bot определяет куда ему идти
			var lanscapeArray	:Array = globalParams.indexMc.lanscapeArray
			var landWidth		:Number = globalParams.indexMc.landWidth
			var landHeight		:Number = globalParams.indexMc.landHeight
			
			var upTrigger	:Boolean = false
			var downTrigger	:Boolean = false
			var rightTrigger:Boolean = false
			var leftTrigger	:Boolean = false
			
			getNextTrigger = false
			
			var nextTrigger:Boolean = false
			
			if (way == "ne") {
				if (currentObj.j < landWidth) {
					nextTrigger=road_lavka (0,1)
					
				}
			}
			
			if (way == "sw") {
				if (currentObj.j > 1) {
					nextTrigger=road_lavka (0,-1)
					
				}
			}
			if (way == "nw") {
				if (currentObj.i > 1) {
					nextTrigger=road_lavka (-1,0)
					
				}
			}
			
			if (way == "se") {
				if (currentObj.i < landWidth) {
					nextTrigger=road_lavka (1,0)
					
				}
			}
			
			perekrestokCounter = 0
			if (way == "ne" || way == "sw") {
				if (currentObj.i < landWidth) {
					rightTrigger=road_lavka (1,0)
					
				}
				if (currentObj.i > 1) {
					leftTrigger=road_lavka (-1,0)
					
				}
			}
			
			if (way == "se" || way == "nw") {
				if (currentObj.j < landHeight) {
					upTrigger=road_lavka (0,1)
					
				}
				if (currentObj.j > 1) {
					downTrigger=road_lavka (0,-1)
					
				}
			}
			
			var rnd:Number
			var perekrestokTrigger:Boolean = false
			if (perekrestokCounter > 0) {
				rnd = Math.ceil (Math.random () * 100)
				if (rnd < 50) {
					perekrestokTrigger = true
				} else {
					
				}
			}
			
			
			if (perekrestokTrigger) {
				if (perekrestokCounter == 1) {
					convert_triger (upTrigger,leftTrigger,rightTrigger,downTrigger)
					
				}
				if (perekrestokCounter == 2) {
					rnd = Math.ceil (Math.random () * 100)
					if (way == "ne" || way == "sw")
					{
						if (rnd < 50)
						{
							way = "nw"
						}
						else
						{
							way = "se"
						}
					} else if (way == "se" || way == "nw") {
						if (rnd < 50) {
							way = "sw"
						} else {
							way = "ne"
						}
					}
				}
			}
			
			if (!perekrestokTrigger)
			{
				if (!nextTrigger)
				{
					if (perekrestokCounter > 0)
					{
						if (perekrestokCounter == 1)
						{
							convert_triger (upTrigger,leftTrigger,rightTrigger,downTrigger)
							
						}
						if (perekrestokCounter == 2) {
							rnd = Math.ceil (Math.random () * 100)
							
							if (way == "ne" || way == "sw") {
								if (rnd < 50) {
									way = "nw"
								} else {
									way = "se"
								}
							} else if (way == "se" || way == "nw") {
								if (rnd < 50) {
									way = "sw"
								} else {
									way = "ne"
								}
							}
							
						}
					} else {
						switch (way) { 
	case "se" : 
		way = "nw"
		break; 
	case "nw" : 
		way = "se"
		break; 
	case "ne" : 
		way = "sw"
		break; 
		case "sw" : 
		way = "ne"
		break; 
}
						
						
					}
				}
			}
			resume_road (way)
			
		}
		public function road_lavka (i:int,j:int):Boolean
		{
			if (globalParams.indexMc.lanscapeArray[currentObj.i +i][currentObj.j+j].cellType == "road") {
						perekrestokCounter++
						return true
			}
			if (globalParams.indexMc.lanscapeArray[currentObj.i +i][currentObj.j+j].cellType == "lavka") {
						perekrestokCounter++
						return true
			}
			return false
		}
		public function convert_triger (upTrigger,leftTrigger,rightTrigger,downTrigger)
		{
			if (upTrigger)
							{
								way = "ne"
							}
							if (leftTrigger)
							{
								way = "nw"
							}
							if (rightTrigger)
							{
								way = "se"
							}
							if (downTrigger)
							{
								way = "sw"
							}
			
		}
		public function getNextRoadBox_new_old ()
		{
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			
			var landWidth:Number = globalParams.indexMc.landWidth
			var landHeight:Number = globalParams.indexMc.landHeight
			
			var upTrigger:Boolean = false
			var downTrigger:Boolean = false
			var rightTrigger:Boolean = false
			var leftTrigger:Boolean = false
			
			getNextTrigger = false
			
			var nextTrigger:Boolean = false
			if (currentObj.i < landWidth) {
				if (lanscapeArray[currentObj.i + 1][currentObj.j].cellType == "road") {
					rightTrigger = true
				}
				if (way == "se") {
					if (lanscapeArray[currentObj.i+1][currentObj.j].cellType == "road") {
						nextTrigger = true
					}
				}
			}
			if (currentObj.i > 1) {
				if (lanscapeArray[currentObj.i - 1][currentObj.j].cellType == "road") {
					leftTrigger = true
				}
				if (way == "nw") {
					if (lanscapeArray[currentObj.i-1][currentObj.j].cellType == "road") {
						nextTrigger = true
					}
				}
			}
			if (currentObj.j < landHeight) {
				if (lanscapeArray[currentObj.i][currentObj.j+1].cellType == "road") {
					upTrigger = true
				}
				if (way == "ne") {
					if (lanscapeArray[currentObj.i][currentObj.j+1].cellType == "road") {
						nextTrigger = true
					}
				}
			}
			if (currentObj.j > 1) {
				if (lanscapeArray[currentObj.i][currentObj.j-1].cellType == "road") {
					downTrigger = true
				}
				if (way == "sw") {
					if (lanscapeArray[currentObj.i][currentObj.j-1].cellType == "road") {
						nextTrigger = true
					}
				}
			}
			
			if (!nextTrigger) {
				
			switch (way) { 
	case "se" : 
		way = "nw"
		break; 
	case "nw" : 
		way = "se"
		break; 
	case "ne" : 
	
		way = "sw"
		break; 
	case "sw" : 
		way = "ne" 
		break; 
	
}
			
			
			}
random_resume_road(leftTrigger,rightTrigger,downTrigger,upTrigger)

resume_road(way)
			
		}
		public function random_resume_road(leftTrigger,rightTrigger,downTrigger,upTrigger)
		{
			var rnd:Number = Math.ceil (Math.random() * 400)
				if (rnd >= 0 && rnd <= 100)
				{
					
					if (leftTrigger)
					{
						way = "nw"
					}
					else if (rightTrigger)
					{
						way = "se"
					}
					else if (downTrigger)
					{
						way = "sw"
					}
					else if (upTrigger)
					{
						way = "ne"
					}
				
				
				
				}
				if (rnd > 100 && rnd <= 200) {
					if (rightTrigger) {
						way = "se"
					} else if (downTrigger) {
						way = "sw"
					} else if (upTrigger) {
						way = "ne"
					} else if (leftTrigger) {
						way = "nw"
					}
				}
				if (rnd > 200 && rnd <= 300) {
					if (downTrigger) {
						way = "sw"
					} else if (upTrigger) {
						way = "ne"
					} else if (leftTrigger) {
						way = "nw"
					} else if (rightTrigger) {
						way = "se"
					}
				}
				if (rnd > 300 && rnd <= 400) {
					if (upTrigger) {
						way = "ne"
					} else if (leftTrigger) {
						way = "nw"
					} else if (rightTrigger) {
						way = "se"
					} else if (downTrigger) {
						way = "sw"
					}
				}
			
		}
		
		public function resume_road(side:String)
		{
			if (side == "sw") {
				targetBoxObject.i = currentObj.i
				targetBoxObject.j = currentObj.j-1
			}
			if (side == "se") {
				targetBoxObject.i = currentObj.i+1
				targetBoxObject.j = currentObj.j
			}
			if (side == "ne") {
				targetBoxObject.i = currentObj.i
				targetBoxObject.j = currentObj.j+1
			}
			if (side == "nw") {
				targetBoxObject.i = currentObj.i-1
				targetBoxObject.j = currentObj.j
			}
		}
		public function next_road (course:String):Boolean {
			
			var nextAr:Object={nw:{i:-1,j:0},
			se:{i:1,j:0},
			sw:{i:0,j:-1},
			ne:{i:0,j:1}}
			var i:int=nextAr[course].i
			var j:int=nextAr[course].j
			
			if (globalParams.indexMc.lanscapeArray[currentObj.i+i][currentObj.j+j].cellType == "road") {
					getNextTrigger = true
					return false
			}
			return true
		}
		public function getNextRoadBox_old () {
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			
			var nextTrigger:Boolean = true
			nextTrigger=next_road (way)
			
			
			var nwTrigger:Boolean = false
			var seTrigger:Boolean = false
			var swTrigger:Boolean = false
			var neTrigger:Boolean = false
			if (nextTrigger) {
				if (way != "nw") {
					if (lanscapeArray[currentObj.i-1][currentObj.j].cellType == "road") {
						nwTrigger = true
					}
				}
				if (way != "se") {
					if (lanscapeArray[currentObj.i + 1][currentObj.j].cellType == "road") {
						seTrigger = true
					}
				}
				if (way != "sw") {
					if (lanscapeArray[currentObj.i][currentObj.j - 1].cellType == "road") {
						swTrigger = true
					}
				}
				if (way != "ne") {
					if (lanscapeArray[currentObj.i][currentObj.j+1].cellType == "road") {
						neTrigger = true
					}
				}
				random_resume_road (seTrigger,swTrigger,neTrigger,nwTrigger)
				
			}
		}
		
		
		public var targetBoxObject:Object
		
		////////////////////////////////////Войти в парк//////////////////////////////////////////
		
		public function enterToPark ()
		{
			trace(botName,"enterToPark"    );
			//создаем новый объект
			targetBoxObject = new Object ();
			
			way = "sw"
			targetBoxObject.i = currentObj.i;
			targetBoxObject.j = currentObj.j-1;
			
			action 					= "walkInPark";
			targetBoxObject.action 	= "pause";
			
			//Забираем массив объектов
			var objectsArray:Array = globalParams.indexMc.objectsArray;
			
			for (var i = 0; i < objectsArray.length; i++)
			{
				if (objectsArray[i].type == "enterBoth")
				{
					checkMyMoney (objectsArray[i].price, objectsArray[i]);
				}
			}
		}
		//Конец функции
		
		
		public function highwayWalker()
		{
			
			var offRoadArray:Array = globalParams.indexMc.offRoadArray;
			var xd			:Number;
			var yd			:Number;
			
			if (targetBoxObject == null)
			{
				targetBoxObject = new Object();
				targetBoxObject.i = currentObj.i;
				targetBoxObject.j = currentObj.j;
			}
			if (way == "nw")
			{
				
				xd = Math.abs(Math.abs(offRoadArray[targetBoxObject.i].x) - Math.abs(botImage.x))
				yd = Math.abs(Math.abs(offRoadArray[targetBoxObject.i].y) - Math.abs(botImage.y))
			}
			if (way == "se") {
				
				xd = Math.abs(Math.abs(offRoadArray[targetBoxObject.i].x) - Math.abs(botImage.x))
				yd = Math.abs(Math.abs(offRoadArray[targetBoxObject.i].y) - Math.abs(botImage.y))
			}
			
			if (offRoadArray[targetBoxObject.i].x < botImage.x-2)
			{
				botImage.x = botImage.x - 2*spd
			}
			if (offRoadArray[targetBoxObject.i].x > botImage.x+2)
			{
				botImage.x = botImage.x + 2*spd
			}
			if (offRoadArray[targetBoxObject.i].y < botImage.y-2) {
				botImage.y = botImage.y - 1*spd
			}
			if (offRoadArray[targetBoxObject.i].y > botImage.y+2) {
				botImage.y = botImage.y + 1*spd
			}
			
			var distance:Number =  Math.sqrt (xd * xd + yd * yd);
			
			if (distance < 10)
			{
				getNexHighWayWalkingTarget ()
			}
			
			if (action == "goToCenterOfRoad")
			{
				//пойти в парк
				offRoad_fn(offRoadArray,5)
				
				xd = Math.abs (Math.abs (offRoadArray[currentObj.i].x) - Math.abs (botImage.x))
				yd = Math.abs (Math.abs (offRoadArray[currentObj.i].y) - Math.abs (botImage.y))
				distance =  Math.sqrt (xd * xd + yd * yd);
				if (distance < 20) {
					getSolution ()
				}
			}
			//покируть парк
			if (action == "goToCenterOfRoad2")
			{
				offRoad_fn(offRoadArray,5)
				
				xd = Math.abs (Math.abs (offRoadArray[currentObj.i].x) - Math.abs (botImage.x))
				yd = Math.abs (Math.abs (offRoadArray[currentObj.i].y) - Math.abs (botImage.y))
				distance =  Math.sqrt (xd * xd + yd * yd);
				if (distance < 20)
				{
					getSolution();
				}
			}
		}
		
		public function offRoad_fn(offRoadArray:Array,num:int):void
		{
			if (botImage.x < offRoadArray[currentObj.i].x -num) {
					botImage.x = botImage.x + 2*spd
				}
				if (botImage.x > offRoadArray[currentObj.i].x +num) {
					botImage.x = botImage.x - 2*spd
				}
				if (botImage.y < offRoadArray[currentObj.i].y -num) {
					botImage.y = botImage.y + 1*spd
				}
				if (botImage.y > offRoadArray[currentObj.i].y +num) {
					botImage.y = botImage.y - 1*spd
				}
		}
		public function getNexHighWayWalkingTarget():void
		{
			var landWidth:Number = globalParams.indexMc.landWidth
			var landHeight:Number = globalParams.indexMc.landHeight
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			if (way == "nw") {
				if (targetBoxObject.i > 0) {
					currentObj.i = targetBoxObject.i
					if (currentObj.i > 0 && currentObj.i < landWidth) {
						if (lanscapeArray[currentObj.i][landHeight].cellType == "enterBoth") {
							
							checkEnterBoth (lanscapeArray[currentObj.i][landHeight])
						}
					}
					targetBoxObject.i = targetBoxObject.i - 1
				} else {
					//globalParams.indexMc.landscape.removeChild (botImage)
					globalParams.indexMc._lands_bot.removeBot (this)
				}
			}
			if (way == "se") {
				if (targetBoxObject.i < globalParams.indexMc.landWidth) {
					
					currentObj.i = targetBoxObject.i
					if (currentObj.i > 0 && currentObj.i < landWidth) {
						if (lanscapeArray[currentObj.i][landHeight].cellType == "enterBoth") {
							
							checkEnterBoth (lanscapeArray[currentObj.i][landHeight])
						
						}
					}
					targetBoxObject.i = targetBoxObject.i + 1
				} else {
					//globalParams.indexMc.landscape.removeChild (botImage)
					globalParams.indexMc._lands_bot.removeBot (this)
				}
			}
		}
		public function InParkSorter ():void {
			var landWidth:Number = globalParams.indexMc.landWidth
			var landHeight:Number = globalParams.indexMc.landHeight
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			//var topPosition:uint
			var possibleTrigger:Boolean = true
			
			for (var i = landWidth ; i >= 1; i--) {
				for (var j = 1 ; j <= landHeight; j++) {
					if (botImage.legsMc.hitTestObject (lanscapeArray[i][j].gr.boxMc)) {
						if (possibleTrigger) {
							possibleTrigger = false;
							currentObj = new Object ();
							currentObj.i = i;
							currentObj.j = j;
							
						} else {
							var xd:Number = Math.abs (Math.abs (lanscapeArray[currentObj.i][currentObj.j].x) - Math.abs (botImage.x));
							var yd:Number = Math.abs (Math.abs (lanscapeArray[currentObj.i][currentObj.j].y) - Math.abs (botImage.y));
							var distance:Number =  Math.sqrt (xd * xd + yd * yd);
							
							xd = Math.abs (Math.abs (lanscapeArray[i][j].x) - Math.abs (botImage.x));
							yd = Math.abs (Math.abs (lanscapeArray[i][j].y) - Math.abs (botImage.y));
							var distance2:Number =  Math.sqrt (xd * xd + yd * yd);
							
							if (distance < distance2) {
								
							}
							else
							{
								if (currentObj.j > j)
								{
									var topPosition:uint = globalParams.indexMc.landscape.getChildIndex (lanscapeArray[i][j]);
									globalParams.indexMc.landscape.setChildIndex(botImage, topPosition+1);
									possibleTrigger = false;
									
									currentObj = new Object ();
									currentObj.i = i;
									currentObj.j = j;
								}
							}
						}
					} 
				}
			}
			
		}
		public function highwayCourse (route:String):void
		{
			// Здесь сортируются боты, ходящие по главной дороге за парком..
			//var offRoadArray:Array = globalParams.indexMc.offRoadArray
			//var courseAr:Object = {up:{i:"Vector",j:globalParams.indexMc.landHeight+1},left:{i:1,j:"Vector"},down:{i:"Vector",j:1},right:{i:globalParams.indexMc.landWidth+1,j:"Vector"}}
			/*
			for (var i:int = offRoadArray.length - 1 ; i >= 0 ; i--) {
				//if (possibleTrigger) {
					if (botImage.legsMc.hitTestObject (offRoadArray[i].boxMc)) {
						var topPosition:uint = globalParams.indexMc.landscape.getChildIndex (offRoadArray[i])
						if (topPosition+1 >= 0) {
							globalParams.indexMc.landscape.setChildIndex(botImage, topPosition + 1);
						}
						//possibleTrigger = false
						currentObj = new Object();
						if (courseAr[route].i=="Vector") {
							currentObj.i = offRoadArray[i].id
						} else {
							currentObj.i =courseAr[route].i
						}
						if (courseAr[route].j=="Vector") {
							currentObj.j = offRoadArray[i].id
						} else {
							currentObj.j =courseAr[route].j
						}
					
					}
				//}
				
			}
			*/
		}
		public function highwaySorter ():Boolean
		{
			//var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			//var offRoadArray:Array = globalParams.indexMc.offRoadArray
			
			if (globalParams.indexMc.enterPosition == "up") {
				highwayCourse ("up")
				
			return false
			}
			if (globalParams.indexMc.enterPosition == "left")
			{
				highwayCourse ("left")
				
			return false
			}
			if (globalParams.indexMc.enterPosition == "down")
			{
				highwayCourse ("down")
				
			return false
			}
			if (globalParams.indexMc.enterPosition == "right") {
				highwayCourse ("right")
				
			return false
			}
		return false
		}
	}

}