package tools 
{
	import flash.display.MovieClip;
	import flash.events.*;
	//import classes.json.*;
	import flash.geom.Point;
	//import classes.json.JSON;
	
	public class attractionClass extends MovieClip
	{
		public static var jdec:Object;
		public function attractionClass ():void
		{
			if (!globalParams.alone) {
				jdec = JSON.parse (globalParams.onGetAdminTableInformation);
				//jdec = JSON.decode (globalParams.onGetAdminTableInformation);
			} else {
				jdec = [
						{type:"wcRooms",russianName:"туалет"},
						{type:"kafeshkaRuzik",russianName:"кафе Рузик"},
						{type:"batutTower",russianName:"Батут"},
						{type:"aquaShake",russianName:"Шайкер"},
						{type:"kafeshkaKresla",russianName:"Интернет кафе"},
						{type:"bigKafeshka",russianName:"большое кафе"},
						{type:"puzirator",russianName:"Пузиратор"},
						{type:"octopus",russianName:"Карусель"},
						{type:"orbitalStation",russianName:"колесо Энштейна"},
						{type:"spaceShipTravel",russianName:"гипертелепорт"},
						{type:"cinemaAttraction",russianName:"кинотеатр"},
						{type:"rocketAttraction",russianName:"полет на Луну"},
						{type:"jumpIt",russianName:"антигравитон"},
						{type:"marsianCave",russianName:"пещера ужасов"},
						{type:"saturn",russianName:"космические гонки"},
						{type:"submarine",russianName:"Подводная лодка"},
						{type:"teleport",russianName:"Гиперкуб"},
						{type:"ufo",russianName:"НЛО"},
						{type:"Magazin",russianName:"Магазин"},
						{type:"spaceInvanders",russianName:"Вторжение пришельцев"},
						
						{type:"lavka",russianName:"скамейка"},
						{type:"size13x13",russianName:"расширить 13x13"},
						{type:"size15x15",russianName:"расширить 15x15"},
						{type:"size17x17",russianName:"расширить 17x17"},
						{type:"size19x19",russianName:"расширить 19x19"},
						{type:"size21x21",russianName:"расширить 21x21"},
						{type:"size25x25",russianName:"расширить 25x25"},
						{type:"ironPlanet",russianName:"планета Железяка"},
						
						{type:"three_1",sub_type:"three_1",russianName:"Дуб"},
						{type:"three_1",sub_type:"three_2",russianName:"Ясень"},
						{type:"three_1",sub_type:"clumb_1",russianName:"Подсолнухи"},
						{type:"three_1",sub_type:"clumb_2",russianName:"Незабудки"},
						{type:"three_1",sub_type:"clumb_3",russianName:"Фиалки"},
						{type:"three_1",sub_type:"smThree_1",russianName:"Бонсай-липа"},
						{type:"three_1",sub_type:"smThree_2",russianName:"Бонсай-слива"},
						{type:"three_1",sub_type:"smThree_3",russianName:"Бонсай-апельсин"},
						{type:"three_1",sub_type:"elka_1",russianName:"Елка"},
						{type:"three_1",sub_type:"elka_2",russianName:"Пихта"},
						{type:"three_1",sub_type:"elka_3",russianName:"Сосна"},
						{type:"three_1",sub_type:"three_3",russianName:"Груша"},
						{type:"three_1",sub_type:"three_4",russianName:"Лимон"},
						{type:"three_1",sub_type:"three_5",russianName:"Яблоня"},
						{type:"three_1",sub_type:"three_6",russianName:"Бук"},
						{type:"three_1",sub_type:"three_7",russianName:"Куку-пальма"},
						{type:"three_1",sub_type:"three_8",russianName:"Бана-пальма"}
						
						];
			}
		}
		///

												
		///
		//Вход в парк
		public function getEnterBoothObject ():void
		{
			//Вход в парк
			var tmpMc_:MovieClip = new enterBoot_mc (); 
			var tmpMc2_:MovieClip = new enterBootBottom_mc ();
			var enterPosition:String = globalParams.indexMc.enterPosition
			
			trace("  getEnterBoothObject    globalParams.indexMc.landHeight = ",globalParams.indexMc.landHeight);
			
			globalParams.indexMc.objectsArray[0].profit = 0;
			globalParams.indexMc.objectsArray[0].prevProfit = 0;
			globalParams.indexMc.objectsArray[0].type = "enterBoth";
			
			globalParams.indexMc.objectsArray[0].i = EnterBooth_x_y().x;
			globalParams.indexMc.objectsArray[0].j = EnterBooth_x_y().y;
			
			globalParams.indexMc.objectsArray[0].price = 0
			globalParams.indexMc.objectsArray[0].openTrigger = true
			
			//таблица открытия парка 
			
			tmpMc_.id = 0
			tmpMc2_.id = 0
						
add_button_arr("enterBoth",0)
			
			trace("                      both ",globalParams.indexMc.objectsArray[0].i," x ",globalParams.indexMc.objectsArray[0].j);
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j].object_mc = tmpMc_
			
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j].objectBottom_mc = tmpMc2_
						
			globalParams.indexMc.objectsArray[0].object_mc = tmpMc_
			globalParams.indexMc.objectsArray[0].objectBottom_mc = tmpMc2_
						
			tmpMc_.x = globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j]._x
			tmpMc_.y = globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j]._y
						
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j].gr.addChild (tmpMc2_)
			
			globalParams.indexMc.landscape.addChild (tmpMc_);
							
			var topPosition:uint = globalParams.indexMc.landscape.getChildIndex (globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j])
			globalParams.indexMc.landscape.setChildIndex(tmpMc_, topPosition+1);
						
			globalParams.indexMc.objectsArray[0].object_mc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[0].i][globalParams.indexMc.objectsArray[0].j].object_mc
						
			Field_Building (globalParams.indexMc.objectsArray[0].i,globalParams.indexMc.objectsArray[0].j, 0);
			
						
			globalParams.indexMc._parkBorderProcessor.update_enterBoth ()
			//___________________end getEnterBoothObject_________________________________
		}
		public static function EnterBooth_x_y():Point {
			//var Booth_x_y:Point = new Point(int(globalParams.indexMc.landWidth - (globalParams.indexMc.landWidth-(globalParams.indexMc.landWidth/2)-2))-int(globalParams.indexMc.shiftLeft/2), globalParams.indexMc.landHeight-1)
			var Booth_x_y:Point = new Point(int(25 - (25-(25/2)-2)), 25-1)
			return Booth_x_y;
		}
		public static function Field_Building (i_x:int,j_y:int,i:int):void {
			
			var Field_X:Array =[0,0,-1,-1,-2,-2];
			var Field_Y:Array =[0,1, 0, 1, 0, 1];
			//хрень какая-та, что за _ebr  ?
			var ebp_Field:Array =["ebp_11","ebp_12", "ebp_21", "ebp_22", "ebp_31", "ebp_32"];
			//делает под входом невидимую дорогу, чтобы посетители попали в парк
			for (var i_:int = 0; i_ < Field_X.length; i_ ++)
			{
				
				globalParams.indexMc.lanscapeArray[i_x+Field_X[i_]][j_y+Field_Y[i_]].cellType = "enterBoth_box"
				//globalParams.indexMc.lanscapeArray[dataObject.objectsArray[i].i+Field_X[i_]][dataObject.objectsArray[i].j+Field_Y[i_]].cellType = "enterBoth"
				globalParams.indexMc.lanscapeArray[i_x+Field_X[i_]][j_y+Field_Y[i_]].id = i
				globalParams.indexMc.lanscapeArray[i_x+Field_X[i_]][j_y+Field_Y[i_]].decoMc.visible = false
				globalParams.indexMc.lanscapeArray[i_x+Field_X[i_]][j_y+Field_Y[i_]].gr.gotoAndStop (ebp_Field[i_])
			}
			globalParams.indexMc.lanscapeArray[i_x-1][j_y].cellType = "road"
		}
		public function add_button_arr(button_str:String,Num:int):void {
			//new enterBoot_mc_button ()
			
			globalParams.indexMc.objectsButtonArray.push (new Object);
			trace(button_str," L=",globalParams.indexMc.objectsArray.length,"globalParams.indexMc.objectsButtonArray",globalParams.indexMc.objectsButtonArray.length," Num= ",Num)
			globalParams.indexMc.objectsButtonArray[Num].button = new globalParams.Three_Basa_Params[button_str].button();
			
			if (globalParams.Three_Basa_Params[button_str].planet) {
				trace("planet         Num",Num)
				globalParams.indexMc.Bright_Image(globalParams.indexMc.objectsButtonArray[Num].button,0);
				globalParams.indexMc.objectsButtonArray[Num].button.alpha = 0;
				globalParams.indexMc.objectsButtonArray[Num].button.addEventListener (MouseEvent.MOUSE_OVER, globalParams.indexMc.on_over_button);
				globalParams.indexMc.objectsButtonArray[Num].button.addEventListener (MouseEvent.MOUSE_OUT, globalParams.indexMc.off_over_button);
				if (globalParams.indexMc.groundSkin == 'green') {
				
					globalParams.indexMc.objectsButtonArray[Num].button.gotoAndStop(1);
				} else {
				
					globalParams.indexMc.objectsButtonArray[Num].button.gotoAndStop(2);
				}
				
			}
			
			
			globalParams.indexMc.objectsButtonArray[Num].button.id = Num;
			globalParams.indexMc.objectsButtonArray[Num].button.idk = button_str;
			globalParams.indexMc.objectsButtonArray[Num].id = Num;
						
			globalParams.indexMc.objectsButtonArray[Num].button.addEventListener (MouseEvent.CLICK, globalParams.indexMc.showObjectMenue)
			globalParams.indexMc.objectsButtonArray[Num].button.addEventListener (MouseEvent.MOUSE_DOWN, globalParams.indexMc.dragLand)
			globalParams.indexMc.objectsButtonArray[Num].button.addEventListener (MouseEvent.MOUSE_UP, globalParams.indexMc.stopdragLand)
			globalParams.indexMc.objectsButtonLayer.addChild (globalParams.indexMc.objectsButtonArray[Num].button)
		}
		
		public function get_loadParams (_inc:Object):Object {
			var tmpObject:Object = new Object ()
			tmpObject.j=_inc.j
			tmpObject.i=_inc.i
			tmpObject.productType=_inc.productType
			tmpObject.level=_inc.level
			 tmpObject.worker=_inc.worker
			tmpObject.openTrigger=_inc.openTrigger
			tmpObject.TypeFood=_inc.TypeFood
			tmpObject.cc=_inc.cc
			
			return tmpObject;
		}
		public function get_decoration (_inc:Object,n:int):Object {
			var tmpObject:Object = new Object ()
			tmpObject.type = _inc.type;
			tmpObject.i = _inc.i;
			tmpObject.j = _inc.j;
			tmpObject.productType = _inc.productType;
			tmpObject.TypeFood = _inc.productType;
			
			trace(_inc.productType,"   get_decoration = ",n,"___planet  ",globalParams.Three_Basa_Params[_inc.productType].planet)
			add_button_arr(_inc.productType,n)
			var tmpMc:MovieClip= new MovieClip ();;
			var tmpMc2:MovieClip;
			if (globalParams.Three_Basa_Params[_inc.productType] != undefined)
			{
				tmpMc2 = new globalParams.Three_Basa_Params[_inc.productType].button();
				
				if (globalParams.indexMc.groundSkin == 'green')
				{
					tmpMc2.gotoAndStop(1);

				}
				else
				{
					tmpMc2.gotoAndStop(2);

				}
				
				
			}
			
			tmpMc.id = n;
			tmpMc2.id = n;
							
			globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].object_mc = tmpMc;
			globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].objectBottom_mc = tmpMc2
							
			tmpObject.object_mc = tmpMc;
			tmpObject.objectBottom_mc = tmpMc2
							
							//присваивание координат 
			tmpMc.x = globalParams.indexMc.lanscapeArray[_inc.i][_inc.j]._x;
			tmpMc.y = globalParams.indexMc.lanscapeArray[_inc.i][_inc.j]._y
							
			globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].gr.addChild(tmpMc2);
			globalParams.indexMc.landscape.addChild(tmpMc);
			
			tmpObject.object_mc = globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].object_mc
							
			globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].cellType = "decoration";
			globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].id = n;
			globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].decoMc.visible = false
			
			return tmpObject;
		}
		
		//присваивание переменным флэша загруженных с php данных
		public function getAttractionFromLoadData (_inc:Object,Num:int):Object {
			trace(_inc.type," ''''getAttractionFromLoadData''''  n =",Num," _    i=",_inc.i,"j=",_inc.j,"  statusObject= ",globalParams.indexMc.lanscapeArray[_inc.i][_inc.j].type,"   =");
			
			//var n:int = globalParams.indexMc.objectsArray.length
			var tmpObject:Object = new Object ()
			tmpObject.type = _inc.type
			tmpObject.i = _inc.i
			tmpObject.j = _inc.j
			tmpObject.openTrigger = _inc.openTrigger
			
			tmpObject.worker = _inc.worker
			tmpObject.statusObject = _inc.statusObject
			tmpObject.cc = _inc.cc // показатель cash collected (собрано прибыли)
			tmpObject.lpt = _inc.lpt // показатель last profit taked (дата последнего получения прибыли)
			tmpObject.TypeFood = _inc.TypeFood
			
			if (tmpObject.lpt == undefined) {
				tmpObject.lpt = globalParams._handle_time.returnGlobalDataPhantom ()
			}
			
			if (tmpObject.cc == undefined) {
				tmpObject.cc = 0
			}
			if (_inc.level != undefined) {
				tmpObject.level = _inc.level
			} else { 
				tmpObject.level = 1
			}
			
			if (_inc.botSlot != undefined) {
				tmpObject.botSlot = _inc.botSlot
			}
			
			//слушатель перетаскивать здания
			
			
			//загрузка идет из JSON  некоторые параметры не нужны TypeFood
			
			
			var attractionParams:Object = getAttracctionParams (tmpObject);
			
			tmpObject.statusObject.repairInterval = int(attractionParams.repairtime);
			//------------------------------------------------------------------------------------------------------
				
			svetofor_add (attractionParams.attractionTrigger,Num)
			
			coordinates (tmpObject,_inc.type,Num,"singleBoxObject","Load",tmpObject.i,tmpObject.j)
			
			
			open_rep_building (tmpObject,attractionParams)
			//объект открыт
						
			calculateProfit (tmpObject,attractionParams)
			Kafeshka_open (tmpObject);
			
			return tmpObject;
		}
		public function coordinates (tmpObject:Object,type:String,num:int,frameG:String,action:String,i:int,j:int):void {
			var k_:int = globalParams.indexMc.objectsButtonArray.length
			globalParams.indexMc.objectsButtonArray.push (new Object ())
			var button_= globalParams.indexMc.objectsButtonArray[k_].button = new MovieClip ()
			var _tempMc_but:MovieClip=Fn_building_add (type,action,tmpObject,num);
			var tmpMc2:MovieClip=tmpMc2_build_mc;
			var tmpMc:MovieClip=new MovieClip ();
			tmpMc.id = num;
			tmpObject.object_mc = tmpMc
			tmpObject.objectBottom_mc = tmpMc2
			
			globalParams.indexMc.objectsButtonArray[k_].button.addChild (_tempMc_but)
			globalParams.indexMc.objectsButtonArray[k_].id = num
			
			_tempMc_but.i= i
			_tempMc_but.j = j
			
			globalParams.indexMc.objectsButtonLayer.addChild (button_)
			
			globalParams.indexMc.lanscapeArray[i][j].object_mc = tmpMc
			globalParams.indexMc.lanscapeArray[i][j].objectBottom_mc = tmpMc2
			globalParams.indexMc.lanscapeArray[i][j].gr.gotoAndStop (frameG)
			
			tmpMc.x = globalParams.indexMc.lanscapeArray[i][j]._x
			tmpMc.y = globalParams.indexMc.lanscapeArray[i][j]._y
			globalParams.indexMc.lanscapeArray[i][j].gr.addChild (tmpMc2)
			globalParams.indexMc.landscape.addChild (tmpMc)
			tmpObject.object_mc = globalParams.indexMc.lanscapeArray[i][j].object_mc
			globalParams.indexMc.lanscapeArray[i][j].cellType = type
			globalParams.indexMc.lanscapeArray[i][j].id = num
			globalParams.indexMc.lanscapeArray[i][j].decoMc.visible = false
		}
		public function open_rep_building (tmpObject:Object,attractionParams:Object):void {
			// определятор ранности события
				//var difference:Number = globalParams._handle_time.returnTimeDifference (tmpObject.statusObject.sst, globalParams.globalTime)
				var difference:Number = earningBuild(tmpObject.statusObject);
				if (difference !=  -10000) {
					
					difference =strengthBuild(tmpObject.statusObject.lrd)
					//открыть если ремонт не наступил?
					if (tmpObject.statusObject.repairInterval < difference) {
						tmpObject.statusObject.status = "open"
					}
				}
		}
		public function getObject (_incom:String):Object {
			//приходит название здание, начинается присваивание ему свойств
			var num_L:int = globalParams.indexMc.objectsArray.length
			var tmpObject:Object = new Object ()
			tmpObject.i = globalParams.indexMc.roadPlaceObject.i
			tmpObject.j = globalParams.indexMc.roadPlaceObject.j
			tmpObject.openTrigger = false
			tmpObject.level = 1;
			tmpObject.cc = 0 // показатель cash collected (собрано прибыли)
			tmpObject.lpt = globalParams._handle_time.returnGlobalDataPhantom () // показатель last profit taked (дата последнего получения прибыли
			tmpObject.type=_incom
			//var k:int = globalParams.indexMc.objectsButtonArray.length
			//globalParams.indexMc.objectsButtonArray.push (new Object ())
			//globalParams.indexMc.objectsButtonArray[k].button = new MovieClip ()
									
			//var _tempMc_but:MovieClip = Fn_building_add (_incom,"Stand",tmpObject,globalParams.indexMc.objectsArray.length);
			
			var attractionParams:Object = getAttracctionParams (tmpObject)
			trace("  getObject",_incom,attractionParams.attractionTrigger,"____",tmpObject.type)
			
			tmpObject.statusObject = new Object ()
			tmpObject.statusObject.status = "noWorker"
			//tmpObject.statusObject.lrd = globalParams._handle_time.returnGlobalDataPhantom ()
			tmpObject.statusObject.lrd =globalParams.UnixTime_Global
			tmpObject.statusObject.repairInterval = int(attractionParams.repairtime);
							
			
			svetofor_add (attractionParams.attractionTrigger,num_L)
								
			coordinates (tmpObject,_incom,num_L,"singleBoxObject","Stand",tmpObject.i,tmpObject.j)
						
			globalParams.indexMc.currentMoneyFn ( -attractionParams.price)
			
			globalParams.indexMc.cancelObject = new Object ()
			globalParams.indexMc.cancelObject.id = globalParams.indexMc.lanscapeArray[tmpObject.i][tmpObject.j].id
			globalParams.indexMc.cancelObject.type = _incom
			
			globalParams.indexMc.cancelObject.i = tmpObject.i
			globalParams.indexMc.cancelObject.j = tmpObject.j
			globalParams.indexMc.cancelObject.cost = attractionParams.price
			
			return tmpObject
		}
		
		public static function svetofor_add (attract_svetofor:Boolean,Num:int):void {
			trace("  attract_svetofor = ",attract_svetofor)
			if (attract_svetofor) {
				var svetoFor:MovieClip = new svetoFor_mc ()
				svetoFor.x = 10
				svetoFor.y = - 50
				svetoFor.id =Num;
				
				svetoFor.addEventListener (MouseEvent.CLICK, globalParams.indexMc.switchAttraction)
				var s:int = globalParams.indexMc.svetoforArray.length
				globalParams.indexMc.svetoforArray.push (svetoFor)
				
				globalParams.indexMc.objectsButtonLayer.addChild (globalParams.indexMc.svetoforArray[s])
			}
		}
		public static function Kafeshka_open (tmpObject:Object):void {
			
			if (globalParams.Building_Basa[tmpObject.type]!=undefined) {
				if (globalParams.Building_Basa[tmpObject.type].Kafeshka) {
					
					tmpObject.objectBottom_mc.object_mc.open_mc.icoMc.ico.gotoAndStop (1);
					//tmpObject.object_mc.visible = false;
					if (tmpObject.statusObject.status == "open") {
				
						tmpObject.object_mc.visible = true;
					
						
						kafeshka_Food(tmpObject);
						
			
					} else {
						
					}
				}
			}
			
			
		}
		
		public static function kafeshka_Food(tmpObject:Object):void {
			if (globalParams.Building_Basa[tmpObject.type].Kafeshka==true) {
					
				if (tmpObject.TypeFood==null) {
					tmpObject.objectBottom_mc.object_mc.open_mc.icoMc.ico.gotoAndStop (1);
				} else {
					tmpObject.objectBottom_mc.object_mc.open_mc.icoMc.ico.gotoAndStop (tmpObject.TypeFood);
				}
						
			}
			
		}
		
		public function object_mc_goto (tmpObject:Object) {
			//объект отрытие или закрытие
			//проблема с долбаными бутебродами!!!!!!!!!  ааааааааааааааааа.......
			if (tmpObject.object_mc.object_mc != undefined) {
						trace(tmpObject.object_mc.object_mc,"__");
						
			} else {
						
						try {
							
							  tmpObject.object_mc.object_mc.open_mc.visible = true;
						} catch(e:Error) {
							trace(" KAFESHKA ERROR проблема с долбаными бутебродами!!!!!!!!!  ааааааааааааааааа......");
						}
						
			}
			
		}
		//ответственный за время включения статуса - деньги
		public static function open_calculateProfit (_tmpObject:Object, attractionParams:Object):void {
			//resetCash
			if (globalParams.workersArray[_tmpObject.worker]==undefined) {
					_tmpObject.statusObject.sst = globalParams.UnixTime_Global;
			}
			if (_tmpObject.statusObject.status == "open") {
				//trace("   bot",globalParams.workersArray[_tmpObject.worker])
				
				
				var difference:Number = earningBuild(_tmpObject.statusObject)
				if (difference > attractionParams.profitTime) {
					_tmpObject.statusObject.status = "cashCollected"
					_tmpObject.cc = attractionParams.maxProfit
				} else {
					_tmpObject.cc = Math.ceil (difference*(attractionParams.maxProfit/attractionParams.profitTime))
				}
			}
			
		}
		//ответственный за время включения статуса - ремонт
		public static function open_broken_calculateProfit (_tmpObject:Object, attractionParams:Object):void {
			if (_tmpObject.statusObject.status == "open") {
				//var difference:Number = globalParams._handle_time.returnTimeDifference (_tmpObject.statusObject.lrd, globalParams.globalTime)
				var difference:Number =strengthBuild(_tmpObject.statusObject.lrd)
				/*
				if (difference > _tmpObject.statusObject.repairInterval) {
					_tmpObject.statusObject.status = "broken"//getBrokenStatusVariation ()
					_tmpObject.openTrigger = false
					//это не кафешка
					kafeshka_Food(_tmpObject)
					
				}
				*/
				if (difference > _tmpObject.statusObject.repairInterval) {
					_tmpObject.statusObject.status = "broken"//getBrokenStatusVariation ()
					_tmpObject.openTrigger = false
					//это не кафешка
					kafeshka_Food(_tmpObject)
					
				}
			
			}
			
		}
		
		public static function strengthBuild(lrd):Number {
			if (lrd is Number==false) {
				lrd = globalParams.UnixTime_Global;
			}
			var ret_lrd:Number=globalParams.UnixTime_Global-lrd
			return ret_lrd;
		}
		public static function open_game_(_tmpObject:Object, attractionParams:Object):void {
			if (_tmpObject.statusObject.status == "open"||_tmpObject.statusObject.status == "game") {
			//var difference:Number = globalParams._handle_time.returnTimeDifference (_tmpObject.statusObject.sst, globalParams.globalTime)
		var difference:Number =earningBuild(_tmpObject.statusObject)
		if (difference > 10) {
			_tmpObject.statusObject.status = "open"
		} else {
			if (_tmpObject.blockG==false||_tmpObject.blockG==undefined) {
				if (Math.floor(Math.random() * 2)==0) {
					_tmpObject.statusObject.status = "game"
				
				}
				_tmpObject.blockG=true
			}
		}
		
			}
		}
		public static function repair_calculateProfit (_tmpObject:Object, attractionParams:Object):void {
			if (_tmpObject.statusObject.status == "repair") {
				//var difference:Number = globalParams._handle_time.returnTimeDifference (_tmpObject.statusObject.rrd, globalParams.globalTime)
				var difference:Number = mendingBuild(_tmpObject.statusObject)
				//trace("////",_tmpObject.type, " rrd difference=",difference,"____",attractionParams.repairtime,"/20=",attractionParams.repairtime / 20)
				if (difference > attractionParams.repairtime / 20) {
					{
						globalParams._handle_time.pred_dataMinusTime(_tmpObject)
						
						
						
					}
					//_tmpObject.statusObject.lrd = globalParams._handle_time.returnGlobalDataPhantom ()
					_tmpObject.statusObject.lrd = globalParams.UnixTime_Global
					_tmpObject.statusObject.repairInterval = int(attractionParams.repairtime);
					_tmpObject.statusObject.status = "open"
					_tmpObject.openTrigger = true
					//это не кафешка
					kafeshka_Food(_tmpObject)
					
				}
			}
			
		}
		public static function earningBuild(statusObject:Object):Number {
			if (statusObject.sst is Number==false) {
				statusObject.sst = globalParams.UnixTime_Global;
			}
			var ret_sst:Number=globalParams.UnixTime_Global-statusObject.sst
			return ret_sst;
		}
		public static function mendingBuild(statusObject:Object):Number {
			if (statusObject.rrd is Number==false) {
				statusObject.rrd = globalParams.UnixTime_Global;
			}
			var ret_rrd:Number=globalParams.UnixTime_Global-statusObject.rrd
			return ret_rrd;
		}
		public static function calculateProfit (_tmpObject:Object, attractionParams:Object) {
			//прибыль
			
			open_calculateProfit (_tmpObject,attractionParams)
			
			open_broken_calculateProfit (_tmpObject,attractionParams)
			
			
			repair_calculateProfit (_tmpObject, attractionParams)
			open_game_(_tmpObject,attractionParams)
		}
		
		private var tmpMc2_build_mc:MovieClip;
		public function Fn_building_add (Name:String,Type:String,tmpObject:Object,Num:int):MovieClip
		{
			if (globalParams.Building_Basa[Name]!=undefined) {
				tmpObject.type = Name;
				
				tmpObject.productType = globalParams.Building_Basa[Name].productType
				if (Type=="Stand") {
					tmpObject.TypeFood = globalParams.Building_Basa[Name].productType;
				}
				
				
				tmpObject.places = globalParams.Building_Basa[Name].places;
				tmpObject.price = globalParams.Building_Basa[Name].price
				tmpObject.openTrigger = globalParams.Building_Basa[Name].openTrigger;
				
				for (var vi_:int = 1; vi_ < 9; vi_++) {
					tmpObject["m_"+vi_] = false;
				
				}
				
				tmpMc2_build_mc = new globalParams.Building_Basa[Name].tmpMc2 ();
				//фигурки посетителей, видить их или нет
				for (var vi = 1; vi < globalParams.Building_Basa[Name].M_Vis+1; vi++) {
					
					if (tmpMc2_build_mc["m_"+vi]!=undefined) {
						tmpMc2_build_mc["m_"+vi].visible = globalParams.Building_Basa[Name]["m_"+vi];
					}
				}
				
				tmpMc2_build_mc.id =Num;
				//tmpMc2_build_mc.animation
				//если у здания есть анимация, то она останавливается
				if (globalParams.Building_Basa[Name].animation == true) {
					tmpMc2_build_mc.animation.gotoAndStop (1);
					
				}
				//анимация экранов и дверей атракционов
				if (globalParams.Building_Basa[Name].Goto == true) {
					tmpMc2_build_mc.object_mc.open_mc.gotoAndStop (1)
				}
				
				//скин здания, меняется в зависимости от планеты
				if (globalParams.Building_Basa[Name].special == true) {
					if (globalParams.indexMc.groundSkin=='green') {
						tmpMc2_build_mc.special.gotoAndStop (1);
					} else {
						tmpMc2_build_mc.special.gotoAndStop (2);
					}
					
				}
				var _tempMc:MovieClip = new globalParams.Building_Basa[Name].Button ();
				if (globalParams.Building_Basa[Name].fr!=0) {
					_tempMc.fr(globalParams.Building_Basa[Name].fr)
				}
				
				_tempMc.id = Num
				//_tempMc.idk = Name
				_tempMc.addEventListener (MouseEvent.CLICK, globalParams.indexMc.showObjectMenue)
				_tempMc.addEventListener (MouseEvent.MOUSE_DOWN, globalParams.indexMc.dragLand)
				_tempMc.addEventListener (MouseEvent.MOUSE_UP, globalParams.indexMc.stopdragLand)
				
				if (Name == "lavka") {
					globalParams.indexMc.objectsButtonArray[globalParams.indexMc.objectsButtonArray.length-1].button.button = _tempMc
				}
								
				var PlaceArrayX:Array = [0,-1,-1,0,-1,-2,-2,-2];
				var PlaceArrayZ:Array = [1,1,0,2,2,0,1,2];
				
				if (globalParams.Building_Basa[Name].BigBuilding == true) {
					for (var i = 0; i < globalParams.Building_Basa[Name].BigPlace; i++) {
						var Koef:int=2+i;
						
						if (no_out_sizeMap (tmpObject.i+PlaceArrayX[i], tmpObject.j+PlaceArrayZ[i])) {
						
						globalParams.indexMc.lanscapeArray[tmpObject.i+PlaceArrayX[i]][tmpObject.j+PlaceArrayZ[i]].cellType = Name+"_et_"+Koef;
						globalParams.indexMc.lanscapeArray[tmpObject.i+PlaceArrayX[i]][tmpObject.j+PlaceArrayZ[i]].decoMc.visible = false;
						globalParams.indexMc.lanscapeArray[tmpObject.i+PlaceArrayX[i]][tmpObject.j+PlaceArrayZ[i]].gr.gotoAndStop ("singleBoxFoundament");
			
						}
			
					
					}
				}
				
				
			}
			return _tempMc;
		}
		public static function no_out_sizeMap (Width:int, Height:int):Boolean {
			
			if (Width>globalParams.indexMc.landWidth || Height>globalParams.indexMc.landHeight) {
				
				return false;
			}
			return true
		}
		
		public static function getName (str_:String, substr:String) {
			var req:String = ""
			// здания
			if (str_ != "decoration") {
				req = pereborAdminDataForNameFromAttraction (str_)
			}
			if (str_ == "decoration") {
				req = pereborAdminDataForNameFromDecoration (substr)
			}
			
			return req
		}
		public static function pereborAdminDataForNameFromAttraction (str_:String) {
			var req:String = ""
			for (var i = 0; i < jdec.length; i++) {
				if (jdec[i].type == str_) {
					req = jdec[i].russianName
				}
			}
			return req
		}
		public static function pereborAdminDataForNameFromDecoration (str_:String) {
			var req:String = ""
			//trace(" atr_"+str_);
			for (var i = 0; i < jdec.length; i++) {
				if (jdec[i].sub_type == str_) {
					req = jdec[i].russianName
				}
			}
			return req
		}
		
		
		public static function building_et (b_inc:Object,botX_:Number,req_:Object,Name:String):Number
		{
			
			if (globalParams.Building_Basa[Name]!=undefined) {
				
				for (var i_e = 1; i_e < 10; i_e++) {
					req_["et_"+i_e] = globalParams.Building_Basa[Name]["et_"+i_e];
				}
				
				if (globalParams.workersArray.length>0) {
					if (b_inc.worker != undefined)
					{
					
						//если ошибка приема данных с сервера 
						if (globalParams.workersArray.length > b_inc.worker) {
							if (globalParams.workersArray[b_inc.worker]!=null) {
							botX_ = globalParams.workersArray[b_inc.worker][globalParams.Building_Basa[Name].botX];
							}
						}
					}
				}
			
			}
			
			
			return botX_
		}
		public static function getAttracctionParams (_inc:Object):Object
		{
			
			var req:Object = new Object ()
			if (_inc.type!=undefined) {
				var botX:Number = 0
				req.attractionTrigger = false
				req.aType = "none";
			
				req.maxProfit = 0
			
				if (globalParams.Building_Basa_Params[_inc.type]!=undefined) {
				req.cPl = globalParams.Building_Basa_Params[_inc.type].cPl
				req.aType = globalParams.Building_Basa_Params[_inc.type].aType
				req.reloadTime = globalParams.Building_Basa_Params[_inc.type].reloadTime
				req.maxTickets = globalParams.Building_Basa_Params[_inc.type].maxTickets
				req.attractionTrigger = globalParams.Building_Basa_Params[_inc.type].attractionTrigger
				req.Delete = globalParams.Building_Basa_Params[_inc.type].Delete;
				req.repairCost = globalParams.Building_Basa_Params[_inc.type].repairCost
				}
			//что-то с рабочими
				botX = building_et (_inc,botX,req,_inc.type);
				//зачем пузиратору, такая честь
				/*
				if (_inc.type == "puzirator") {
					botX = building_et (_inc,botX,req,"puzirator");
					if (_inc.worker != undefined) {
					//trace(globalParams.workersArray.length,"  globalParams.workersArray             _inc.worker ",_inc.worker)
					//костыль
						if (globalParams.workersArray.length>_inc.worker)
						{
							botX = (globalParams.workersArray[_inc.worker].tech + globalParams.workersArray[_inc.worker].clean)
						}
					}
								
				}
				*/
				if (_inc.type == "decoration") {
					req.attractionTrigger = false
					if (globalParams.Three_Basa_Params[_inc.productType]!=undefined) {
						req.cPl = globalParams.Three_Basa_Params[_inc.productType].cPl
													
					}
				
				}
				//получение данных из параметров, загруженных с сервера.
				if (_inc.type != "deleted") {
					if (_inc.type != "decoration") {
						//trace("Attraction     _inc.type = ",_inc.type,"___",globalParams.onGetAdminTableArray.length);
						//trace(globalParams.onGetAdminTableArray[_inc.type]);
						//параметры для зданий
						req.price = globalParams.onGetAdminTableArray[_inc.type].price
						req.buildExp = globalParams.onGetAdminTableArray[_inc.type].buildExp
						req.profitTime = globalParams.onGetAdminTableArray[_inc.type].profitTime
						req.maxProfit = globalParams.onGetAdminTableArray[_inc.type].maxProfit
						req.repairtime = globalParams.onGetAdminTableArray[_inc.type].repairtime
						req.productType = globalParams.onGetAdminTableArray[_inc.type].productType
						req.level = globalParams.onGetAdminTableArray[_inc.type].level
					} else {
						//параметры для деревьев
						req.price = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].price
						req.buildExp = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].buildExp
						req.profitTime = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].profitTime
						req.maxProfit = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].maxProfit
						req.repairtime = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].repairtime
						req.productType = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].productType
						req.level = globalParams.onGetAdminTableArray[_inc.type][_inc.productType].level
					
					}
				}
				//рандом прибыли
				if (req.attractionTrigger) {
				req.maxProfit = req.maxProfit + (req.maxProfit / 100) * (5 * (_inc.level - 1))
				req.maxProfit = req.maxProfit + (req.maxProfit / 100 * botX)
				req.maxProfit = Math.ceil (req.maxProfit)
				}
			
				req.reloadTime = Math.ceil (req.reloadTime - (req.reloadTime / 30) * botX)
				req.maxTickets = Math.ceil (req.maxTickets + (req.maxTickets / 20) * botX)
			//trace(_inc.type,globalParams.Building_Basa_Params[_inc.type],"_attractionTrigger_",req.attractionTrigger);
			}
			
			return req
		}
		//public static var jdec:Array = [];
		
		
		public static function getRepairtimeFromAdminData (str_:String, substr:String) {
			var req:Number = 1000000
			
			if (str_ != "decoration") {
				for (var i:int = 0; i < jdec.length; i++) {
					if (jdec[i].type == str_) {
						req = jdec[i].repairtime
					}
				}
				return req
			} else {
				for (var i_:int = 0; i_ < jdec.length; i_++) {
					if (jdec[i_].sub_type == substr) {
						req = jdec[i_].repairtime
					}
				}
			}
		}
		public static function getMaxProfitFromAdminData (str_:String, substr:String) {
			var req:Number = 1000000
			
			//var i:Number
			if (str_ != "decoration") {
				for (var i:int = 0; i < jdec.length; i++) {
					if (jdec[i].type == str_) {
						req = jdec[i].maxProfit
					}
				}
				return req
			} else {
				for (var i_:int = 0; i_ < jdec.length; i_++) {
					if (jdec[i_].sub_type == substr) {
						req = jdec[i_].maxProfit
					}
				}
			}
		}
		public static function getProfitTimeFromAdminData (str_:String, substr:String) {
			var req:Number = 1000000
			//var i:Number
			if (str_ != "decoration") {
				for (var i:int = 0; i < jdec.length; i++) {
					if (jdec[i].type == str_) {
						req = jdec[i].profitTime
					}
				}
				return req
			} else {
				for (var i_:int = 0; i_ < jdec.length; i_++) {
					if (jdec[i_].sub_type == substr) {
						req = jdec[i_].profitTime
					}
				}
			}
		}
		public static function getExpFromAdminData (str_:String, substr:String) {
			var req:Number = 1000000
			//var i:Number
			if (str_ != "decoration") {
				for (var i:int = 0; i < jdec.length; i++) {
					if (jdec[i].type == str_) {
						req = jdec[i].experience
					}
				}
				return req
			} else {
				for (var i_:int = 0; i_ < jdec.length; i_++) {
					if (jdec[i_].sub_type == substr) {
						req = jdec[i_].experience
					}
				}
			}
		}
		public static function getPriceFromAdminData (str_:String, substr:String) {
			var req:Number = 1000000
			//var i:Number
			if (str_ != "decoration") {
				for (var i:int = 0; i < jdec.length; i++) {
					if (jdec[i].type == str_) {
						req = jdec[i].price
					}
				}
				return req
			} else {
				for (var i_:int = 0; i_ < jdec.length; i_++) {
					if (jdec[i_].sub_type == substr) {
						req = jdec[i_].price
					}
				}
			}
		}
		
	}

}