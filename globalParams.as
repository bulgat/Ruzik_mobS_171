package
{
	import AS.encryption.MD5;
	
	import flash.display.MovieClip;
import flash.utils.ByteArray;
	public class globalParams
	{
		public static var alone:Boolean=true;
		
		//public static var UID:String = "117111781";
		//public static var UID:String = "6513731";
		//RUZIK VK
		//public static var UID:String = "154412759";
		//николай
		//public static var UID:String = "6575381";
		//ID    для тестирования пользователей )
		//public static var UID:String = "190375950";
		//public static var UID:String = "50290666";
		
		//public static var UID:String = "133600254";
		public static var UID:String = "11";
		
		
		public static var ironPlanet:Boolean=false;
		public static var G_PLANET:int=0;
		public static var Exp_MaxLv:Number=0;
		
		public static var UnixTime_Global:Number =0;
		public static var AllowRisizePark:Boolean =true;
		public static var AllowFriendPark:Boolean = true;
		
		public static var Allow_Chiter:Boolean =true;
		
		public static var Allow_Robocat:Boolean =false;
		public static var Period_Robocat:Object = [];
		public static var Interdict_Litter:Boolean =false;
		public static var Period_Interdict_Litter:Object =[];
		
		public static var global_Log:Array =[""];
		
		public static var flag_load:Boolean;
		
		public static var waitQuest:int=1200;
		//public static var waitQuest:int=120;
		public static var questNumber:int = 0;
		
		public static var quest_historyBuild:Array = [];
		public static var questTask_Mini:Array = [];
		
		public static var quest_MiniBasa:Array =[]
		/*
		public static var quest_MiniBasa:Array = [{Build:["three_1","three_1","three_1"],Pr_Money:500,Pr_Exp:10,time:180,Text:"Срочно нужна помощь, в течение 3 минут, нужно построить 3 дуба.",task:"Построить 3 дуба."},
												 {Build:["three_2","three_2","three_2"],Pr_Money:1000,Pr_Exp:30,time:240,Text:"Срочно нужна помощь, в течение 4 минут, нужно построить 3 ясеня.",task:"Построить 3 ясеня."},
												  {Build:["wcRooms","clumb_1"],Pr_Money:600,Pr_Exp:40,time:240,Text:"Срочно нужна помощь, приближается хомячковая эпидемия, надо улучшить санитарное состояние парка. В течение 4 минут, нужно построить туалет и клумбу подсолнухов.",task:"Построить 1 туалет и 1 клумбу подсолнухов."},
												 {Build:["refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse","refuse"],Pr_Money:100,Pr_Exp:40,time:240,Text:"Нужна срочная уборка, надо обязательно улучшить санитарное состояние парка. В течение 4 минут, нужно убрать 15 единиц мусора.",task:"Убрать 15 единиц мусора."}
												  ];
		*/
		public static var questBasa:Array = [
											
											 {Road:true,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Привет , я хомячок Рузик!  \n  \n  Давай поиграем и построим лучший на свете парк развлечений! Для начала нужно проложить дорожку. А я пока съем пару кукурузных палочек."},
																						 
											 {Road:false,Build:true,ObjStr:"kafeshkaRuzik",Priz:true,Pr_Money:100,Pr_Exp:10,Text:"Поэтому давайте поставим Рузи-ларёк, \n где посетители смогут подкрепиться, гуляя по парку!"},
											{Road:false,Build:true,ObjStr:"batutTower",Priz:true,Pr_Money:100,Pr_Exp:15,Text: "Кто откажется похрустеть вкусными кукурузными палочками в компании друзей?  Я, как хомяк, точно не отказался бы! Выберите Надувной батут в меню строительства и разместите рядом с дорогой."},
											 											 
											{Road:false,Build:false,ObjStr:"_",Priz:true,Pr_Money:120,Pr_Exp:20,Text: "Отлично, все задания сделаны. У нас все есть для будущих посетителей!"},
											
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Выберите курсором любого прохожего, чтобы узнать, о чём он думает и чего желает на данный момент."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Старайтесь отслеживать желания посетителей, чтобы правильно развивать парк. Если случатся какие-то проблемы, посетители будут разочарованы, и очень скоро их число сократится."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Теперь нам следует нанять сотрудников, которые будут отвечать за аттракционы и прочие заведения нашего луна-парка."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Нашему парку пока ещё многого не хватает для прогулок и отдыха.  \n  \n Посади своё первое дерево и поставь скамейку рядом с ним."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Наш парк постепенно преображается. Но чтобы развиваться дальше, нам нужна прибыль."},
											 {Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Соберите выручку в каждом из объектов, когда придёт время, чтобы мы могли продолжить строительство луна-парка."},
											 {Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Хорошо! Дело постепенно продвигается! Но прибылью надо распорядиться с умом."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Каким бы прекрасным не был наш парк, он будет вызывать критику со стороны посетителей, если в нём не будет ни одной уборной."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Поставьте Био-туалет в Вашем парке."},
											{Road:false, Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Раз Вы так хорошо справляетесь, я поделюсь одним полезным секретом. Это Вам очень пригодится. Иногда, при выполнении определённых действий вроде постройки, ремонта объектов или сбора прибыли, Вам могут выпадать определённые предметы."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Это части так называемых коллекций. Собрав все предметы коллекций, вы можете получить ценный приз."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text: "Попробуйте получить один из таких предметов, выполняя ремонт объектов в Вашем парке."},
											{Road:false,Build:false,ObjStr:"_",Priz:false,Pr_Money:0,Pr_Exp:0,Text:"Браво! Вы теперь многое умеете, и я определённо Вам могу доверить будущее луна-парка. Поэтому я временно оставлю Вас – супер-хомячка ждут великие дела. Но я обязательно вернусь – вот увидите!"}];
		
		public static var stageMc:index_as
		public static var indexMc:landscapeGeneratorV01
		public static var _handle_time:handle_time = new handle_time()
		
		public static var minuteTimer:Number = 0
		
		public static var user_exp:int = 0
		public static var user_lvl:int = 1
		public static var buy_energy:int = 0;
		public static var buy_speed_energy:int = 0;
		public static var buy_time_energy:int = 0;
		
		public static var buy_time_booster:int = 0;
		public static var buy_booster:int = 1;
		
		public static var user_start_cash:int = 4000
		private static var _user_cash:int = 0;
		//private static var k=0;
		public static function set user_cash (cash:int) {
			_user_cash = cash;
			//trace("===="+k);
			//if (k>1) throw new ("######");
			
			//k++;
			
		}
		public static function get user_cash ():int {
			return _user_cash;
		}
		
		public static var user_energy:Number = 0;
		/*
		public static function set user_energy(num:Number):void {
			//var k = num == NaN;
			trace(_user_energy+"  energ========="+num+"__________"+globalParams.buy_speed_energy)
			_user_energy+=num;
			 if (num==63.001)throw new("gggg");
			var MaxDispense:Number = 10 + user_lvl + buy_energy;
			if (_user_energy >= MaxDispense)
			{
				_user_energy = MaxDispense;
			}
			
		}
		
		public static function get user_energy():Number {
			return _user_energy;
		}
		*/
		public static var user_cash_Garantia:int = 50000;
		
		public static var friendsAssistArray:Array = new Array ()
		
		public static var lastUpdate
		public static var lastPresent
		
		public static var globalTime:Object
		public static var lastUpdateObject:Object
		public static var workersMarket:Array = []
		public static var workersArray:Array = [];
		
		public static var prevAttractionProfit:Array = new Array ()
		public static var attractionProfit:Array = new Array ()
		public static var attractionNameArray:Array = ["batut","kafeshkaKresla","lavka","aquaShake","puzirator","octopus","kafeshkaRuzik",
								"wcRooms","orbitalStation","spaceShipTravel","cinemaAttraction","rocketAttraction",
								"jumpIt","saturn","marsianCave","batutTower","submarine","teleport","ufo","ufo"];
		//SERVER eSucF4ZtBi
		
		public static var SERVER:String = "http://5.9.149.107/ruzikland_pre_release/scr/"
		
		public static var SERVERLocation:String = 'http://5.9.149.107/ruzikland_pre_release/';
		
		public static var SERVER_shop:String = "http://5.9.149.107/ruzikland_pre_release/shopAdmin"
		//ADRESS
		public static var GET_RATING:String = SERVER + "_getSavedGamesData.php";
		public static var GET_USERDATA:String = SERVER + "getUserData.php";
		public static var INSERT_RATING:String = SERVER + "insertSavedGamesData.php";
		//public static var INSERT_USERDATA:String = SERVER + "insertUserData.php";
		public static var UPDATE_RATING:String = SERVER + "updateSavedGamesData.php";
						
		public static var new_insert_Data:String = SERVER + "new_insertUserData_backup.php";
		
		public static var new_GET_Data:String = SERVER + "_new_getUserData_backup.php";
		
		
		//public static var BACKUP_INSERT:String = SERVER + "b_insertSavedGamesData.php";
		public static var BACKUP_SAVE:String = SERVER + "b_updateSavedGamesData.php";
		public static var BACKUP_GET:String = SERVER + "_b_getSavedGamesData.php";
		
		public static var C_BACKUP_SAVE:String = SERVER + "c_updateSavedGamesData.php";
		public static var C_BACKUP_GET:String = SERVER + "_c_getSavedGamesData.php";
		
		public static var D_BACKUP_SAVE:String = SERVER + "d_updateSavedGamesData.php";
		public static var D_BACKUP_GET:String = SERVER + "_d_getSavedGamesData.php";
		
				
		public static var INSERT_DATA_LOG:String = SERVER + "insertDataLog.php";
		public static var INSERT_PROMO_LOG:String = SERVER + "insertPromoLog.php";
		
		public static var UPDATE_USERDATA:String = SERVER + "updatUserData.php";
		public static var GET_DATA_INFO:String = SERVER + "getDataInfo.php";
		public static var LOAD_TIME:String = SERVER + "load_time.php";
		
		public static var GET_PAYMENT_DATA:String = SERVER + "_getPaymentData.php";
		public static var INSERT_BILLING_INFO:String = SERVER + "insertBillingInfo.php";
		public static var CHECK_CASH:String = SERVER + "checkCash.php";
		
		public static var INSERT_FRIENDS_ASSIST_DATA:String = SERVER + "insertFriendAssistData.php";
		public static var GET_FRIENDS_ASSIST_DATA:String = SERVER + "_getFriendAssistData.php";
		
		public static var GET_ADMIN_TABLE:String = SERVER + "getAdminTable.php"
		public static var getProtectedKey:String = "getProtectedKey.php";
		public static var shelter_Key:String = "shelter_Key.php";
		
		//public static var prompcod_SEND_CODE:String = "sendPromocode.php";
		//-------------------------------
		//dark wizard's variables
		public static var loaderInfoObject:Object = null;
		
		//-------------------------------
		
		
		public static var Random_backUp_N_1:int = 12;
		public static var Random_backUp_N_2:int = 20;
		public static var Random_backUp_N_3:int = 80;
		
		
		
		
		public  static var USER_CODE:String = "";
		public  static var USER_Date:String = "";
		
		public static var pendingNetworkOperation:Boolean = false;
		
		//private
		public static var USER_CODE_api_secret:String = "";
		public static var USER_Date_api_secret:String = "";
		public static var needToUpdateLevel:Boolean = false;
		
		public static var FRIEND_UID:String
		public static var friendsParkTrigger:Boolean = false
		
		public static var SID:String = "4d8da98dbad41822fb512e0104b2229035d335ae1c21fb137370a325349cab";
		public static var enterPrize:Number = 0;
		//что это? и зачем?
		public static var allFriendsInfo:String = "%7B%22response%22%3A%5B%7B%22uid%22%3A71557%2C%22first_name%22%3A%22%u0420%u0443%u0441%u043B%u0430%u043D%22%2C%22last_name%22%3A%22%u0421%u0438%u0440%u0430%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5162.vk.com/u71557/e_1eb8df46.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5162.vk.com/u71557/b_3b24e629.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5162.vk.com/u71557/a_ed580ee2.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A189444%2C%22first_name%22%3A%22Roman%22%2C%22last_name%22%3A%22Zimonin%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5555.vk.com/u189444/e_c1fa2f50.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5555.vk.com/u189444/b_e4cd4183.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5555.vk.com/u189444/a_38720c99.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A348874%2C%22first_name%22%3A%22%u041A%u0441%u0435%u043D%u0438%u044F%22%2C%22last_name%22%3A%22%u041B%u0430%u043C%u043A%u0438%u043D%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10433.vk.com/u348874/e_0fd8452d.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10433.vk.com/u348874/b_a61d47f9.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10433.vk.com/u348874/a_9b29add2.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A1107235%2C%22first_name%22%3A%22%u0422%u0430%u043D%u044F%22%2C%22last_name%22%3A%22%u041A%u043E%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9228.vk.com/u1107235/e_a5819749.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9228.vk.com/u1107235/b_12349ac3.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9228.vk.com/u1107235/a_7dd47673.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A1241646%2C%22first_name%22%3A%22%u0422%u0430%u0442%u044C%u044F%u043D%u0430%22%2C%22last_name%22%3A%22%u0411%u0435%u043B%u0430%u044F%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs36.vk.com/u1241646/e_403441d1.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs36.vk.com/u1241646/b_d3e309b.jpg%22%2C%22photo_big%22%3A%22http%3A//cs36.vk.com/u1241646/a_d3e309b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A1643873%2C%22first_name%22%3A%22%u0410%u0440%u0442%u0451%u043C%22%2C%22last_name%22%3A%22%u0417%u043D%u0430%u043C%u0435%u043D%u0449%u0438%u043A%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10900.vk.com/u1643873/e_87e19eb0.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10900.vk.com/u1643873/b_3ef1c0ba.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10900.vk.com/u1643873/a_15b83f17.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A1888041%2C%22first_name%22%3A%22%u041E%u043B%u044C%u0433%u0430%22%2C%22last_name%22%3A%22%u0418%u0432%u0430%u043D%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10648.vk.com/u1888041/e_1f2880ce.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10648.vk.com/u1888041/b_2ee2fbe7.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10648.vk.com/u1888041/a_1d3bef79.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A1977397%2C%22first_name%22%3A%22%u041B%u0435%u043D%u0430%22%2C%22last_name%22%3A%22%u0422%u0435%u0440%u0451%u0445%u0438%u043D%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4309.vk.com/u1977397/e_e8a4b269.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4309.vk.com/u1977397/b_03411b57.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4309.vk.com/u1977397/a_ae5ae78d.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A2060747%2C%22first_name%22%3A%22%u0410%u043D%u0434%u0440%u0435%u0439%22%2C%22last_name%22%3A%22%u0412%u043E%u043B%u0433%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5483.vk.com/u2060747/e_5a2932d8.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5483.vk.com/u2060747/b_97d81b93.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5483.vk.com/u2060747/a_d7688f34.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A2170830%2C%22first_name%22%3A%22%u041A%u0440%u0438%u0441%u0442%u0438%u043D%u0430%22%2C%22last_name%22%3A%22%u0414%u043E%u043D%u0435%u0446%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs5585.vk.com/u2170830/e_4f18f189.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5585.vk.com/u2170830/b_3a62e3c7.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5585.vk.com/u2170830/a_f1508d58.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A2460021%2C%22first_name%22%3A%22%u0421%u0432%u0435%u0442%u043A%u0430%22%2C%22last_name%22%3A%22%u0420%u0435%u0432%u0435%u043D%u043A%u043E%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9870.vk.com/u2460021/e_9751310c.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9870.vk.com/u2460021/b_0b78076b.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9870.vk.com/u2460021/a_2a463a7e.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A2847531%2C%22first_name%22%3A%22Milana%22%2C%22last_name%22%3A%22%u041B%u043E%u0437%u0438%u043D%u0441%u043A%u0430%u044F%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4154.vk.com/u2847531/e_027b9851.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4154.vk.com/u2847531/b_23627666.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4154.vk.com/u2847531/a_4023dc17.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A2874707%2C%22first_name%22%3A%22%u041A%u0441%u0435%u043D%u0438%u044F%22%2C%22last_name%22%3A%22%u041C%u0451%u0434%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs5979.vk.com/u2874707/e_e4bef79d.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5979.vk.com/u2874707/b_0e166127.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5979.vk.com/u2874707/a_2c7484b1.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A2893899%2C%22first_name%22%3A%22%u0418%u043B%u044C%u044F%22%2C%22last_name%22%3A%22%u041B%u0435%u0432%u0448%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4167.vk.com/u2893899/e_82dcf5ac.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4167.vk.com/u2893899/b_108ccb2e.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4167.vk.com/u2893899/a_853fa385.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A3023745%2C%22first_name%22%3A%22%u0410%u043D%u0434%u0440%u0435%u0439%22%2C%22last_name%22%3A%22%u0418%u0432%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10678.vk.com/u3023745/e_d18b79bd.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10678.vk.com/u3023745/b_89819617.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10678.vk.com/u3023745/a_04ee0132.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A3043891%2C%22first_name%22%3A%22%u0421%u0435%u0440%u0433%u0435%u0439%22%2C%22last_name%22%3A%22%u041B%u0443%u0447%u0448%u0438%u0439%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9678.vk.com/u3043891/e_8fa70e13.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9678.vk.com/u3043891/b_a5563f21.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9678.vk.com/u3043891/a_ffa2f5b2.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A3669777%2C%22first_name%22%3A%22Mutagen%22%2C%22last_name%22%3A%22n/a%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs634.vk.com/u3669777/e_a94b2eb7.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs634.vk.com/u3669777/b_ad31e5c1.jpg%22%2C%22photo_big%22%3A%22http%3A//cs634.vk.com/u3669777/a_f72b7710.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A3962393%2C%22first_name%22%3A%22%u0422%u0430%u0442%u044C%u044F%u043D%u0430%22%2C%22last_name%22%3A%22%u0411%u0435%u0448%u0430%u043D%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs407.vk.com/u3962393/e_a8305c8f.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs407.vk.com/u3962393/b_04a049ad.jpg%22%2C%22photo_big%22%3A%22http%3A//cs407.vk.com/u3962393/a_76286a67.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A4521755%2C%22first_name%22%3A%22%u0414%u0430%u0432%u0438%u0434%22%2C%22last_name%22%3A%22%u0411%u0430%u0441%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5037.vk.com/u4521755/e_ccf5d759.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5037.vk.com/u4521755/b_ca252d8d.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5037.vk.com/u4521755/a_ca92f5ec.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A4579245%2C%22first_name%22%3A%22Daniel%22%2C%22last_name%22%3A%22Krivenkoff%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9304.vk.com/u4579245/e_54cb358e.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9304.vk.com/u4579245/b_4ad198ae.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9304.vk.com/u4579245/a_cd192fe5.jpg%22%2C%22online%22%3A1%7D%2C%7B%22uid%22%3A4855431%2C%22first_name%22%3A%22%u041C%u0430%u0440%u0438%u044F%22%2C%22last_name%22%3A%22Fox%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10578.vk.com/u4855431/e_ba935274.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10578.vk.com/u4855431/b_1640f6ff.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10578.vk.com/u4855431/a_24bc37f8.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A4870002%2C%22first_name%22%3A%22%u041C%u0430%u0440%u0438%u044F%22%2C%22last_name%22%3A%22%u0412%u0435%u0440%u0445%u043E%u0432%u0446%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs5690.vk.com/u4870002/e_406616f9.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5690.vk.com/u4870002/b_f52f58bc.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5690.vk.com/u4870002/a_32804ef0.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5016679%2C%22first_name%22%3A%22Marina%22%2C%22last_name%22%3A%22Chernova%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9613.vk.com/u5016679/e_7952c4d8.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9613.vk.com/u5016679/b_8b199977.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9613.vk.com/u5016679/a_93f8024c.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5077748%2C%22first_name%22%3A%22%u0410%u043D%u0442%u043E%u043D%22%2C%22last_name%22%3A%22%u041E%u0441%u0430%u0434%u0447%u0438%u0439%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10925.vk.com/u5077748/e_d8bf7fbe.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10925.vk.com/u5077748/b_8583743b.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10925.vk.com/u5077748/a_99473832.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5135275%2C%22first_name%22%3A%22%u0411%u043E%u0440%u0438%u0441%22%2C%22last_name%22%3A%22%u0420%u043E%u0433%u043E%u0437%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9742.vk.com/u5135275/e_0fec9648.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9742.vk.com/u5135275/b_c263f829.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9742.vk.com/u5135275/a_0857cb98.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5262642%2C%22first_name%22%3A%22%u0418%u043B%u044C%u044F%22%2C%22last_name%22%3A%22Smith%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4154.vk.com/u5262642/e_92fc26dd.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4154.vk.com/u5262642/b_a5ada00a.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4154.vk.com/u5262642/a_d32f437b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5308864%2C%22first_name%22%3A%22%u041A%u0440%u0438%u0441%u0442%u0438%u043D%u0430%22%2C%22last_name%22%3A%22%u0421%u0443%u0440%u043A%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4190.vk.com/u5308864/e_fb68a71a.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4190.vk.com/u5308864/b_bd9656a7.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4190.vk.com/u5308864/a_69fca8f1.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5503931%2C%22first_name%22%3A%22%u041C%u0430%u043A%u0441%u0438%u043C%22%2C%22last_name%22%3A%22%u0422%u0435%u0440%u0435%u0445%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs221.vk.com/u5503931/e_164f6c97.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs221.vk.com/u5503931/b_8bb58398.jpg%22%2C%22photo_big%22%3A%22http%3A//cs221.vk.com/u5503931/a_4a84ba6f.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5663213%2C%22first_name%22%3A%22%u041D%u0430%u0434%u0435%u0436%u0434%u0430%22%2C%22last_name%22%3A%22%u0424%u043E%u043C%u0438%u0447%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs700.vk.com/u5663213/e_fb0d2335.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs700.vk.com/u5663213/b_5d37e4c1.jpg%22%2C%22photo_big%22%3A%22http%3A//cs700.vk.com/u5663213/a_a6c5a6e9.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5693380%2C%22first_name%22%3A%22%u0420%u043E%u043C%u0430%u043D%u043E%u0432%22%2C%22last_name%22%3A%22%u0414%u043C%u0438%u0442%u0440%u0438%u0439%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4347.vk.com/u5693380/e_0c6a6b96.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4347.vk.com/u5693380/b_eaefdf2a.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4347.vk.com/u5693380/a_29beff55.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A5918140%2C%22first_name%22%3A%22Olga%22%2C%22last_name%22%3A%22Novichkova%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs5364.vk.com/u5918140/e_7798ce9f.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5364.vk.com/u5918140/b_01a32aa0.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5364.vk.com/u5918140/a_bc55433f.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A6271096%2C%22first_name%22%3A%22%u0410%u0439%u0440%u0430%u0442%22%2C%22last_name%22%3A%22%u0425%u0443%u0437%u0438%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10182.vk.com/u6271096/e_baf2e1cd.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10182.vk.com/u6271096/b_423634ed.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10182.vk.com/u6271096/a_79b38af8.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A6540782%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0430%u043D%u0434%u0440%22%2C%22last_name%22%3A%22%u0411%u0435%u043B%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10211.vk.com/u6540782/e_3454a36a.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10211.vk.com/u6540782/b_8f5a61ab.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10211.vk.com/u6540782/a_3b6d293b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A6736757%2C%22first_name%22%3A%22Fu%22%2C%22last_name%22%3A%22Ck%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9851.vk.com/u6736757/e_37d77d7e.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9851.vk.com/u6736757/b_0f32b2ae.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9851.vk.com/u6736757/a_a67dda5b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A6846014%2C%22first_name%22%3A%22%u0422%u0430%u0442%u044C%u044F%u043D%u0430%22%2C%22last_name%22%3A%22%u0412%u0435%u0434%u0435%u043D%u0435%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4313.vk.com/u6846014/e_08100a55.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4313.vk.com/u6846014/b_c19e004c.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4313.vk.com/u6846014/a_c935672f.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A7048506%2C%22first_name%22%3A%22%u0415%u0432%u0433%u0435%u043D%u0438%u0439%22%2C%22last_name%22%3A%22%u0414%u044B%u0431%u043E%u0448%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs114.vk.com/u7048506/e_d076100b.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs114.vk.com/u7048506/b_d3a85b82.jpg%22%2C%22photo_big%22%3A%22http%3A//cs114.vk.com/u7048506/a_6b704b98.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A7154877%2C%22first_name%22%3A%22%u0410%u043D%u0442%u043E%u043D%22%2C%22last_name%22%3A%22Bumblebee%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9224.vk.com/u7154877/e_af3fb12c.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9224.vk.com/u7154877/b_9029fa57.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9224.vk.com/u7154877/a_74dcca41.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A7969232%2C%22first_name%22%3A%22%u0418%u043B%u044C%u044F%22%2C%22last_name%22%3A%22%u041A%u043B%u0435%u0432%u0435%u0440%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10099.vk.com/u7969232/e_cd49ed52.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10099.vk.com/u7969232/b_6a1a52df.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10099.vk.com/u7969232/a_10ff6d9d.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A8841735%2C%22first_name%22%3A%22%u0418%u043B%u044C%u044F%22%2C%22last_name%22%3A%22%u041A%u043E%u043D%u043E%u0448%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//vk.com/images/question_c.gif%22%2C%22photo_medium%22%3A%22http%3A//vk.com/images/question_b.gif%22%2C%22photo_big%22%3A%22http%3A//vk.com/images/question_a.gif%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A8850107%2C%22first_name%22%3A%22%u0410%u043D%u0430%u0441%u0442%u0430%u0441%u0438%u044F%22%2C%22last_name%22%3A%22%u041F%u043E%u0433%u043E%u0434%u0438%u043D%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs1620.vk.com/u8850107/e_a2480a8b.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs1620.vk.com/u8850107/b_70009bb6.jpg%22%2C%22photo_big%22%3A%22http%3A//cs1620.vk.com/u8850107/a_6d95ad9d.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A8941699%2C%22first_name%22%3A%22%u0415%u0432%u0433%u0435%u043D%u0438%u0439%22%2C%22last_name%22%3A%22%u041F%u0440%u043E%u043D%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9321.vk.com/u8941699/e_27d03939.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9321.vk.com/u8941699/b_2f8dcdf5.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9321.vk.com/u8941699/a_3f781c34.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A9014520%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0430%u043D%u0434%u0440%22%2C%22last_name%22%3A%22%u041A%u043E%u0447%u0435%u043C%u0430%u0441%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9460.vk.com/u9014520/e_d3869e6e.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9460.vk.com/u9014520/b_d19d3c1d.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9460.vk.com/u9014520/a_43999844.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A10544511%2C%22first_name%22%3A%22%u0414%u043C%u0438%u0442%u0440%u0438%u0439%22%2C%22last_name%22%3A%22%u0411%u0435%u043B%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10222.vk.com/u10544511/e_38fe1b25.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10222.vk.com/u10544511/b_e822ec41.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10222.vk.com/u10544511/a_7b4f16df.jpg%22%2C%22online%22%3A1%7D%2C%7B%22uid%22%3A10588862%2C%22first_name%22%3A%22%u0415%u043A%u0430%u0442%u0435%u0440%u0438%u043D%u0430%22%2C%22last_name%22%3A%22%u0421%u043E%u0431%u043E%u043B%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10105.vk.com/u10588862/e_0ab439ab.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10105.vk.com/u10588862/b_44f195d0.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10105.vk.com/u10588862/a_ecf902a6.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A10644597%2C%22first_name%22%3A%22%u0410%u043B%u0430%u043D%22%2C%22last_name%22%3A%22%u0425%u0435%u0441%u0442%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs1774.vk.com/u10644597/e_b0a2951a.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs1774.vk.com/u10644597/b_a46d4487.jpg%22%2C%22photo_big%22%3A%22http%3A//cs1774.vk.com/u10644597/a_967a7ea3.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A12061890%2C%22first_name%22%3A%22%u0414%u043C%u0438%u0442%u0440%u0438%u0439%22%2C%22last_name%22%3A%22%u041C%u0438%u0448%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10656.vk.com/u12061890/e_2742fd70.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10656.vk.com/u12061890/b_0cf16602.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10656.vk.com/u12061890/a_a08823a6.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A13879752%2C%22first_name%22%3A%22Elena%22%2C%22last_name%22%3A%22Ivanova%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10650.vk.com/u13879752/e_0b87d0c2.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10650.vk.com/u13879752/b_963fb1a2.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10650.vk.com/u13879752/a_1d4a4f11.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A14386712%2C%22first_name%22%3A%22%u0424%u0435%u0434%u043E%u0440%22%2C%22last_name%22%3A%22%u0412%u0430%u0441%u0438%u043B%u044C%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10354.vk.com/u14386712/e_6ba967fc.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10354.vk.com/u14386712/b_db977d53.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10354.vk.com/u14386712/a_d39e65b4.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A14524510%2C%22first_name%22%3A%22%u0410%u043D%u0434%u0440%u0435%u0439%22%2C%22last_name%22%3A%22%u0422%u044E%u0442%u044E%u043D%u043D%u0438%u043A%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10935.vk.com/u14524510/e_2c3109bb.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10935.vk.com/u14524510/b_85e531c0.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10935.vk.com/u14524510/a_ad36ad8a.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A14752602%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0430%u043D%u0434%u0440%22%2C%22last_name%22%3A%22%u0422%u044E%u0433%u0430%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10535.vk.com/u14752602/e_632b3f9b.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10535.vk.com/u14752602/b_795abdc8.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10535.vk.com/u14752602/a_67b13bde.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A15875804%2C%22first_name%22%3A%22%u0410%u043D%u044E%u0442%u0430%22%2C%22last_name%22%3A%22%u0412%u044C%u044E%u0433%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10549.vk.com/u15875804/e_e1379a60.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10549.vk.com/u15875804/b_4d50d80a.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10549.vk.com/u15875804/a_f9706b67.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A17705440%2C%22first_name%22%3A%22%u0410%u043D%u043D%u0430%22%2C%22last_name%22%3A%22%u0428%u0430%u0433%u0438%u043D%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs11503.vk.com/u17705440/e_f9fa0a51.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs11503.vk.com/u17705440/b_aaec7002.jpg%22%2C%22photo_big%22%3A%22http%3A//cs11503.vk.com/u17705440/a_61c0fc8c.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A18103919%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0435%u0439%22%2C%22last_name%22%3A%22%u0412%u043B%u0430%u0434%u0438%u043C%u0438%u0440%u043E%u0432%u0438%u0447%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4119.vk.com/u18103919/e_e3163b06.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4119.vk.com/u18103919/b_e2d1c5a3.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4119.vk.com/u18103919/a_aca3f866.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A19280145%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0435%u0439%22%2C%22last_name%22%3A%22%u042D%u043A%u043A%u0435%u043C%u0435%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9930.vk.com/u19280145/e_5e061898.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9930.vk.com/u19280145/b_5d48ee13.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9930.vk.com/u19280145/a_ab2370be.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A20095874%2C%22first_name%22%3A%22Helen%22%2C%22last_name%22%3A%22Romanova%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4157.vk.com/u20095874/e_5017a3e9.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4157.vk.com/u20095874/b_dd26393d.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4157.vk.com/u20095874/a_21785fac.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A21271218%2C%22first_name%22%3A%22%u041C%u0410%u0420%u0418%u041D%u0410%22%2C%22last_name%22%3A%22%u041A%u043E%u0432%u0448%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs199.vk.com/u21271218/e_e1db855d.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs199.vk.com/u21271218/b_606aeab0.jpg%22%2C%22photo_big%22%3A%22http%3A//cs199.vk.com/u21271218/a_26a814fb.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A21785934%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0430%u043D%u0434%u0440%22%2C%22last_name%22%3A%22%u0410%u0442%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10769.vk.com/u21785934/e_fa0946da.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10769.vk.com/u21785934/b_c71cf5ca.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10769.vk.com/u21785934/a_8a467c3b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A21934881%2C%22first_name%22%3A%22Marsel%22%2C%22last_name%22%3A%22Profaid%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5765.vk.com/u21934881/e_965feaf1.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5765.vk.com/u21934881/b_d3e730f7.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5765.vk.com/u21934881/a_41da8ddf.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A22243916%2C%22first_name%22%3A%22%u0415%u0432%u0433%u0435%u043D%u043D%u0438%u0439%22%2C%22last_name%22%3A%22%u0416%u0435%u0440%u0435%u0431%u0446%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4559.vk.com/u22243916/e_27eaafcc.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4559.vk.com/u22243916/b_85952f67.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4559.vk.com/u22243916/a_1498aff7.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A22512355%2C%22first_name%22%3A%22%u0410%u043D%u0434%u0440%u0435%u0439%22%2C%22last_name%22%3A%22%u0427%u0435%u0440%u043D%u044B%u0439%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10251.vk.com/u22512355/e_65824a9e.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10251.vk.com/u22512355/b_17e76452.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10251.vk.com/u22512355/a_cda8d872.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A23673182%2C%22first_name%22%3A%22%u0421%u0435%u0440%u0451%u0433%u0430%22%2C%22last_name%22%3A%22%u041C%u0435%u0434%u0432%u0435%u0436%u0443%u0442%u044C%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//vk.com/images/deactivated_c.gif%22%2C%22photo_medium%22%3A%22http%3A//vk.com/images/deactivated_b.gif%22%2C%22photo_big%22%3A%22http%3A//vk.com/images/deactivated_b.gif%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A25328065%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0435%u0439%22%2C%22last_name%22%3A%22%u0410%u0440%u0442%u0430%u043C%u043E%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs1680.vk.com/u25328065/e_5960a4eb.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs1680.vk.com/u25328065/b_36aeb438.jpg%22%2C%22photo_big%22%3A%22http%3A//cs1680.vk.com/u25328065/a_8287949b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A26188558%2C%22first_name%22%3A%22%u041F%u0430%u0432%u0435%u043B%22%2C%22last_name%22%3A%22%u0410%u0440%u0442%u0430%u043C%u043E%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs11508.vk.com/u26188558/e_fb2d1fda.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs11508.vk.com/u26188558/b_37ebeda0.jpg%22%2C%22photo_big%22%3A%22http%3A//cs11508.vk.com/u26188558/a_eccf25bb.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A26236299%2C%22first_name%22%3A%22%u0420%u0430%u043C%u0438%u043B%u044C%22%2C%22last_name%22%3A%22%u041D%u0430%u0441%u044B%u0440%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10724.vk.com/u26236299/e_23ad130c.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10724.vk.com/u26236299/b_e522c35b.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10724.vk.com/u26236299/a_7e990929.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A27276385%2C%22first_name%22%3A%22%u0418%u0433%u043E%u0440%u044C%22%2C%22last_name%22%3A%22%u041A%u043E%u0447%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5454.vk.com/u27276385/e_68fd009a.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5454.vk.com/u27276385/b_b43e7b0b.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5454.vk.com/u27276385/a_1d910fce.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A29028403%2C%22first_name%22%3A%22%u0410%u043D%u043D%u0430%22%2C%22last_name%22%3A%22%u041D%u0438%u043A%u0438%u0448%u0438%u043D%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs11015.vk.com/u29028403/e_170bb7ab.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs11015.vk.com/u29028403/b_b0644260.jpg%22%2C%22photo_big%22%3A%22http%3A//cs11015.vk.com/u29028403/a_3aa2cb41.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A30102764%2C%22first_name%22%3A%22%u0421%u0442%u0430%u043D%u0438%u0441%u043B%u0430%u0432%22%2C%22last_name%22%3A%22%u0410%u043B%u044C%u0448%u0435%u0432%u0441%u043A%u0438%u0439%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5509.vk.com/u30102764/e_53c037e3.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5509.vk.com/u30102764/b_51ce54e2.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5509.vk.com/u30102764/a_5c95e06c.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A31775097%2C%22first_name%22%3A%22%u041E%u043B%u044C%u0433%u0430%22%2C%22last_name%22%3A%22%u0410%u0444%u0430%u043D%u0430%u0441%u044C%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10187.vk.com/u31775097/e_b649125d.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10187.vk.com/u31775097/b_8de0a02f.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10187.vk.com/u31775097/a_4b2c2287.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A32407829%2C%22first_name%22%3A%22%u042E%u043B%u0438%u044F%22%2C%22last_name%22%3A%22%u0411%u0435%u043B%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10952.vk.com/u32407829/e_05fc39e9.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10952.vk.com/u32407829/b_e6c07e1b.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10952.vk.com/u32407829/a_0f84523c.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A33182811%2C%22first_name%22%3A%22%u0414%u0430%u0440%u044C%u044F%22%2C%22last_name%22%3A%22%u041E%u0440%u043B%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9782.vk.com/u33182811/e_28262bc4.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9782.vk.com/u33182811/b_ed53bd41.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9782.vk.com/u33182811/a_d743d555.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A34067554%2C%22first_name%22%3A%22%u0410%u043D%u043D%u0430%22%2C%22last_name%22%3A%22%u041A%u0430%u0437%u0430%u043A%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs5848.vk.com/u34067554/e_8ca17770.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5848.vk.com/u34067554/b_99d51f18.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5848.vk.com/u34067554/a_883b6fc1.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A38250786%2C%22first_name%22%3A%22%u041D%u0430%u0442%u0430%u043B%u044C%u044F%22%2C%22last_name%22%3A%22%u0428%u0430%u043F%u043E%u0432%u0430%u043B%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4277.vk.com/u38250786/e_446399e5.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4277.vk.com/u38250786/b_0d24f675.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4277.vk.com/u38250786/a_bf4de456.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A39096674%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0430%u043D%u0434%u0440%22%2C%22last_name%22%3A%22%u0421%u0442%u0435%u043F%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4410.vk.com/u39096674/e_74095003.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4410.vk.com/u39096674/b_d29f9ad3.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4410.vk.com/u39096674/a_818c2482.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A43867654%2C%22first_name%22%3A%22%u0421%u0435%u0440%u0433%u0435%u0439%22%2C%22last_name%22%3A%22%u041C%u043E%u043B%u0447%u0430%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//vk.com/images/question_c.gif%22%2C%22photo_medium%22%3A%22http%3A//vk.com/images/question_b.gif%22%2C%22photo_big%22%3A%22http%3A//vk.com/images/question_a.gif%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A44980935%2C%22first_name%22%3A%22%u041C%u0438%u0445%u0430%u0438%u043B%22%2C%22last_name%22%3A%22%u0426%u0430%u0440%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5963.vk.com/u44980935/e_8bddcc42.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5963.vk.com/u44980935/b_db34329d.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5963.vk.com/u44980935/a_aae1c334.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A45278432%2C%22first_name%22%3A%22%u0415%u043A%u0430%u0442%u0435%u0440%u0438%u043D%u0430%22%2C%22last_name%22%3A%22%u0427%u0435%u043A%u0430%u043B%u0438%u043D%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs987.vk.com/u45278432/e_158a19d9.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs987.vk.com/u45278432/b_96c06f81.jpg%22%2C%22photo_big%22%3A%22http%3A//cs987.vk.com/u45278432/a_d17ebca7.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A45416508%2C%22first_name%22%3A%22%u0410%u043D%u0430%u0441%u0442%u0430%u0441%u0438%u044F%22%2C%22last_name%22%3A%22%u0410%u0442%u0430%u043D%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4397.vk.com/u45416508/e_43324ee1.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4397.vk.com/u45416508/b_fdbc1f36.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4397.vk.com/u45416508/a_ae780e18.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A46753201%2C%22first_name%22%3A%22%u041E%u043A%u0441%u0430%u043D%u0430%22%2C%22last_name%22%3A%22%u0410%u043B%u044C%u0448%u0435%u0432%u0441%u043A%u0430%u044F%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9953.vk.com/u46753201/e_57058fef.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9953.vk.com/u46753201/b_ebda70c6.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9953.vk.com/u46753201/a_10cf46e7.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A50003902%2C%22first_name%22%3A%22%u0413%u0440%u0438%u0448%u0430%22%2C%22last_name%22%3A%22Mad%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10185.vk.com/u50003902/e_25a8eca1.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10185.vk.com/u50003902/b_7f212782.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10185.vk.com/u50003902/a_8671cf9b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A50199879%2C%22first_name%22%3A%22%u0410%u043B%u0435%u043A%u0441%u0430%u043D%u0434%u0440%22%2C%22last_name%22%3A%22%u041B%u0443%u0437%u0435%u043D%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs933.vk.com/u50199879/e_3a1c140c.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs933.vk.com/u50199879/b_499d1641.jpg%22%2C%22photo_big%22%3A%22http%3A//cs933.vk.com/u50199879/a_9bd2ac3c.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A50636890%2C%22first_name%22%3A%22%u0410%u043D%u0442%u043E%u043D%22%2C%22last_name%22%3A%22%u041A%u043E%u0440%u043E%u043B%u0435%u043D%u043A%u043E%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs4460.vk.com/u50636890/e_c394b79d.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4460.vk.com/u50636890/b_49844daa.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4460.vk.com/u50636890/a_a619a6f7.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A53769631%2C%22first_name%22%3A%22%u0422%u0438%u043C%u0443%u0440%22%2C%22last_name%22%3A%22%u0411%u0430%u0442%u0440%u0443%u0442%u0434%u0438%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs296.vk.com/u53769631/e_188c631a.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs296.vk.com/u53769631/b_d889ffe7.jpg%22%2C%22photo_big%22%3A%22http%3A//cs296.vk.com/u53769631/a_1d40c8e5.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A55001386%2C%22first_name%22%3A%22%u041A%u043E%u043D%u0441%u0442%u0430%u043D%u0442%u0438%u043D%22%2C%22last_name%22%3A%22%u0410%u043D%u0442%u043E%u043D%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9949.vk.com/u55001386/e_a1e75e53.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9949.vk.com/u55001386/b_990534f6.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9949.vk.com/u55001386/a_b6f53e8a.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A60676678%2C%22first_name%22%3A%22%u0420%u0430%u0444%u0430%u044D%u043B%u044C%22%2C%22last_name%22%3A%22%u0428%u0430%u0439%u0434%u0443%u043B%u0438%u043D%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10884.vk.com/u60676678/e_27433fbc.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10884.vk.com/u60676678/b_c1121fe2.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10884.vk.com/u60676678/a_4e1f3d75.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A72363560%2C%22first_name%22%3A%22%u041E%u043B%u0435%u0433%22%2C%22last_name%22%3A%22%u041B%u0443%u043A%u0430%u0448%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs11177.vk.com/u72363560/e_6f0ea704.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs11177.vk.com/u72363560/b_9782fca1.jpg%22%2C%22photo_big%22%3A%22http%3A//cs11177.vk.com/u72363560/a_58696e2a.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A78531467%2C%22first_name%22%3A%22%u0418%u0440%u0438%u043D%u0430%22%2C%22last_name%22%3A%22%u0411%u0435%u043B%u044F%u043D%u0438%u043D%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs5727.vk.com/u78531467/e_2a54c374.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5727.vk.com/u78531467/b_424d5e82.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5727.vk.com/u78531467/a_9cdb8336.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A83678045%2C%22first_name%22%3A%22%u0420%u0430%u0438%u0441%22%2C%22last_name%22%3A%22%u0425%u0430%u0439%u0440%u0443%u043B%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9797.vk.com/u83678045/e_567509a5.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9797.vk.com/u83678045/b_ef35c16d.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9797.vk.com/u83678045/a_7483f964.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A118997484%2C%22first_name%22%3A%22%u0422%u0430%u0442%u044C%u044F%u043D%u0430%22%2C%22last_name%22%3A%22%u0414%u0438%u043A%u043C%u0430%u0440%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10522.vk.com/u118997484/e_b063e2c0.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10522.vk.com/u118997484/b_5ed285ec.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10522.vk.com/u118997484/a_3269be08.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A122331393%2C%22first_name%22%3A%22%u0414%u0435%u043D%u0438%u0441%22%2C%22last_name%22%3A%22%u041C%u0443%u043B%u0435%u043D%u0434%u0435%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs10510.vk.com/u122331393/e_c1120a95.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10510.vk.com/u122331393/b_f6ad9a6e.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10510.vk.com/u122331393/a_0c3fa910.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A134077800%2C%22first_name%22%3A%22%u0418%u0433%u043E%u0440%u044C%22%2C%22last_name%22%3A%22%u041A%u0430%u0437%u0430%u043A%u043E%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs9720.vk.com/u134077800/e_77098f35.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9720.vk.com/u134077800/b_06cf8f32.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9720.vk.com/u134077800/a_f6c57596.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A136759596%2C%22first_name%22%3A%22Ganjik%22%2C%22last_name%22%3A%22Shaidullin%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5720.vk.com/u136759596/e_a74a1cbd.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5720.vk.com/u136759596/b_87ec457a.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5720.vk.com/u136759596/a_b98c60c3.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A138439010%2C%22first_name%22%3A%22%u041E%u043B%u044C%u0433%u0430%22%2C%22last_name%22%3A%22%u0414%u0436%u0443%u043B%u044C%u0434%u0438%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs4147.vk.com/u138439010/e_9ce5c361.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs4147.vk.com/u138439010/b_bd982b94.jpg%22%2C%22photo_big%22%3A%22http%3A//cs4147.vk.com/u138439010/a_6068672b.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A140679718%2C%22first_name%22%3A%22%u041E%u043B%u044C%u0433%u0430%22%2C%22last_name%22%3A%22%u0414%u0436%u0443%u043B%u044C%u0434%u0438%u0435%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs9522.vk.com/u140679718/e_8d6699e7.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs9522.vk.com/u140679718/b_5e94ea07.jpg%22%2C%22photo_big%22%3A%22http%3A//cs9522.vk.com/u140679718/a_0866847e.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A142106405%2C%22first_name%22%3A%22%u042E%u0440%u0430%22%2C%22last_name%22%3A%22%u0410%u0444%u0430%u043D%u0430%u0441%u044C%u0435%u0432%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%222%22%2C%22photo%22%3A%22http%3A//cs5472.vk.com/u142106405/e_bb849243.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs5472.vk.com/u142106405/b_9d0be35c.jpg%22%2C%22photo_big%22%3A%22http%3A//cs5472.vk.com/u142106405/a_650f2f46.jpg%22%2C%22online%22%3A0%7D%2C%7B%22uid%22%3A143324877%2C%22first_name%22%3A%22%u0420%u0435%u0433%u0438%u043D%u0430%22%2C%22last_name%22%3A%22%u0413%u0430%u0444%u0430%u0440%u043E%u0432%u0430%22%2C%22nickname%22%3A%22%22%2C%22sex%22%3A%221%22%2C%22photo%22%3A%22http%3A//cs10428.vk.com/u143324877/e_0471e1c3.jpg%22%2C%22photo_medium%22%3A%22http%3A//cs10428.vk.com/u143324877/b_8d0de676.jpg%22%2C%22photo_big%22%3A%22http%3A//cs10428.vk.com/u143324877/a_864636eb.jpg%22%2C%22online%22%3A0%7D%5D%7D"
		
		public static var appFriendsInfo:String = "%7B%22response%22%3A%5B189444%2C5135275%2C6736757%2C6846014%2C7969232%2C8841735%2C8850107%2C10644597%2C33182811%5D%7D"
		
		public static var onGetAdminTableInformation:String = "[]"
		// полученные из базы данных.
		public static var onGetAdminTableArray:Object = {
			enterBoth:{price:100,buildExp:0,level:0,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
			wcRooms:{price:200,buildExp:1,level:0,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
			kafeshkaRuzik:{price:350,buildExp:10,level:0,profitTime:200,maxProfit:30,repairtime:1000,productType:"none"},
			
			batutTower:{price:435,buildExp:15,level:0,profitTime:300,maxProfit:40,repairtime:1500,productType:"none"},
			
			aquaShake:{price:500,buildExp:20,level:3,profitTime:400,maxProfit:45,repairtime:2500,productType:"none"},
			Magazin:  {price:600,buildExp:25,level:4,profitTime:500,maxProfit:50,repairtime:3000,productType:"none"},
			kafeshkaKresla:{price:700,buildExp:30,level:5,profitTime:600,maxProfit:55,repairtime:3500,productType:"none"},
			bigKafeshka:{price:800,buildExp:35,level:6,profitTime:700,maxProfit:60,repairtime:4000,productType:"none"},
			puzirator:{price:900,buildExp:40,level:7,profitTime:800,maxProfit:65,repairtime:4500,productType:"none"},
			octopus:{price:1000,buildExp:45,level:8,profitTime:900,maxProfit:70,repairtime:5000,productType:"none"},
			orbitalStation:{price:1100,buildExp:50,level:9,profitTime:1000,maxProfit:75,repairtime:5500,productType:"none"},
			spaceShipTravel:{price:1200,buildExp:55,level:10,profitTime:1100,maxProfit:80,repairtime:6000,productType:"none"},
			cinemaAttraction:{price:1300,buildExp:60,level:11,profitTime:1200,maxProfit:85,repairtime:6500,productType:"none"},
			rocketAttraction:{price:1400,buildExp:65,level:12,profitTime:1300,maxProfit:90,repairtime:7000,productType:"none"},
			jumpIt:  {price:1500,buildExp:70,level:13,profitTime:1400,maxProfit:95,repairtime:7500,productType:"none"},
			marsianCave:{price:1600,buildExp:75,level:14,profitTime:1500,maxProfit:100,repairtime:8000,productType:"none"},
			saturn:  {price:1700,buildExp:80,level:15,profitTime:1600,maxProfit:105,repairtime:8500,productType:"none"},
			submarine:{price:1800,buildExp:85,level:16,profitTime:1700,maxProfit:110,repairtime:9000,productType:"none"},
			teleport:{price:1900,buildExp:90,level:17,profitTime:1800,maxProfit:115,repairtime:9500,productType:"none"},
			ufo:     {price:2000,buildExp:95,level:18,profitTime:1900,maxProfit:120,repairtime:1000,productType:"none"},
			
			lavka:{price:35,buildExp:1,level:0,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
			size13x13:{price:1000,buildExp:2,level:0,profitTime:100,maxProfit:20,repairtime:500,productType:"sizeTools"},
			size15x15:{price:2000,buildExp:3,level:1,profitTime:100,maxProfit:20,repairtime:500,productType:"sizeTools"},
			size17x17:{price:3000,buildExp:4,level:2,profitTime:100,maxProfit:20,repairtime:500,productType:"sizeTools"},
			size19x19:{price:4000,buildExp:5,level:3,profitTime:100,maxProfit:20,repairtime:500,productType:"sizeTools"},
			size21x21:{price:5000,buildExp:6,level:4,profitTime:100,maxProfit:20,repairtime:500,productType:"sizeTools"},
			size25x25:{price:6000,buildExp:7,level:5,profitTime:100,maxProfit:20,repairtime:500,productType:"sizeTools"},
			ironPlanet:{price:7000,buildExp:8,level:6,profitTime:100,maxProfit:20,repairtime:500,productType:"ironPlanet"},
			
			spaceInvanders: {price:2100,buildExp:100,level:19,profitTime:2000,maxProfit:125,repairtime:1500,productType:"none"},
			
			decoration:{
				three_1:{price:35,buildExp:1,level:1,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_2:{price:50,buildExp:2,level:2,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				clumb_1:{price:100,buildExp:3,level:3,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				clumb_2:{price:150,buildExp:4,level:4,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				clumb_3:{price:200,buildExp:5,level:5,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				smThree_1:{price:250,buildExp:6,level:6,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				smThree_2:{price:300,buildExp:7,level:7,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				smThree_3:{price:350,buildExp:8,level:8,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				elka_1:{price:400,buildExp:9,level:9,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				elka_2:{price:450,buildExp:10,level:10,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				elka_3:{price:500,buildExp:11,level:11,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_3:{price:550,buildExp:12,level:12,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_4:{price:560,buildExp:13,level:13,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_5:{price:570,buildExp:14,level:14,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_6:{price:580,buildExp:15,level:15,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_7:{price:590,buildExp:16,level:16,profitTime:100,maxProfit:20,repairtime:500,productType:"none"},
				three_8:{price:595,buildExp:17,level:17,profitTime:100,maxProfit:20,repairtime:500,productType:"none"}
				}
			
		};
		/////
		
		//////						
		
		
		public static var Check_Basa_Attraction:Object = {
		batut:{basatime:1000,time:600,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:false,m_6:false,m_7:false,m_8:false,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		octopus:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		
		bigKafeshka:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"hunger",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		orbitalStation:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		spaceShipTravel:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		
		cinemaAttraction:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		rocketAttraction:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		jumpIt:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		
		marsianCave:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		submarine:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		teleport:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		
		ufo:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		saturn:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		
		batutTower:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:true,fun:25,hunger:-25,activity:-20,animation:true,lavka:false,kafe:false},
		wcRooms:{basatime:600,time:200,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-25,activity:-20,animation:false,lavka:false,kafe:false},
		lavka:{basatime:200,time:200,solutionTimer:35,m_1:true,m_2:true,m_3:true,m_4:true,m_5:true,m_6:true,m_7:true,m_8:true,prioretet:0,demand:"activity",animation:false,fun:0,hunger:0,activity:30,animation:false,lavka:true,kafe:false},
		
		kafeshkaRuzik:{basatime:200,time:100,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:false,m_6:false,m_7:false,m_8:false,prioretet:0,demand:"hunger",animation:false,fun:0,hunger:0,activity:0,animation:false,lavka:true,kafe:true},
		kafeshkaKresla:{basatime:1000,time:600,solutionTimer:25,m_1:true,m_2:true,m_3:true,m_4:true,m_5:false,m_6:false,m_7:false,m_8:false,prioretet:0,demand:"hunger",animation:false,fun:0,hunger:0,activity:0,animation:false,lavka:true,kafe:true},
		puzirator:{basatime:200,time:200,solutionTimer:25,m_1:true,m_2:false,m_3:false,m_4:false,m_5:false,m_6:false,m_7:false,m_8:false,prioretet:0,demand:"fun",animation:false,fun:25,hunger:-35,activity:-30,animation:false,lavka:false,kafe:false},
		
		aquaShake:{basatime:200,time:200,solutionTimer:25,m_1:true,m_2:false,m_3:false,m_4:false,m_5:false,m_6:false,m_7:false,m_8:false,prioretet:0,demand:"fun",animation:true,fun:25,hunger:-35,activity:-30,animation:true,lavka:false,kafe:false},
		spaceInvanders:{basatime:200,time:200,solutionTimer:25,m_1:true,m_2:false,m_3:false,m_4:false,m_5:false,m_6:false,m_7:false,m_8:false,prioretet:0,demand:"fun",animation:true,fun:25,hunger:-35,activity:-30,animation:true,lavka:false,kafe:false}
		};

		public static var Building_Basa_Params:Object = {
			enterBoth:{rus:"вход",cPl:1,Size:"2x3",aType:"",reloadTime:0,maxTickets:0,price:0,buildExp:30,attractionTrigger:false,Delete:false,profitTime:0,maxProfit:0,repairtime:0,repairCost:0,skyscraper:false,superSkyscraper:false},
			wcRooms:{rus:"туалет",cPl:1,Size:"1x1",aType:"clean",reloadTime:360,maxTickets:100,price:150,buildExp:10,attractionTrigger:true,Delete:true,profitTime:300,maxProfit:30,repairtime:4000,repairCost:35,skyscraper:false,superSkyscraper:false},
			batut:{rus:"",cPl:1,Size:"2x2",aType:"clean",reloadTime:360,maxTickets:100,price:150,buildExp:10,attractionTrigger:true,Delete:true,profitTime:600,maxProfit:75,repairtime:6000,repairCost:35,skyscraper:false,superSkyscraper:false},
			
			kafeshkaRuzik:{rus:"к рузик",cPl:1,Size:"1x1",aType:"coock",reloadTime:120,maxTickets:150,price:250,buildExp:15,attractionTrigger:true,Delete:true,profitTime:600,maxProfit:50,repairtime:6000,repairCost:50,skyscraper:false,superSkyscraper:false},
			kafeshkaKresla:{rus:"и кафе",cPl:1,Size:"1x1",aType:"coock",reloadTime:120,maxTickets:150,price:250,buildExp:15,attractionTrigger:true,Delete:true,profitTime:900,maxProfit:100,repairtime:9000,repairCost:50,skyscraper:false,superSkyscraper:false},
			submarine:{rus:"подлодка",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:900,buildExp:35,attractionTrigger:true,Delete:true,profitTime:3240,maxProfit:360,repairtime:32400,repairCost:180,skyscraper:false,superSkyscraper:false},
			saturn:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:900,buildExp:35,attractionTrigger:true,Delete:true,profitTime:3240,maxProfit:360,repairtime:32400,repairCost:180,skyscraper:true,superSkyscraper:false},
			
			batutTower:{rus:"надувн батут",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:900,buildExp:35,attractionTrigger:true,Delete:true,profitTime:3240,maxProfit:360,repairtime:32400,repairCost:180,skyscraper:false,superSkyscraper:false},
			spaceInvanders:{rus:"spaceInvanders",cPl:9,Size:"3x3",aType:"tech",reloadTime:800,maxTickets:600,price:3200,buildExp:85,attractionTrigger:true,Delete:true,profitTime:6480,maxProfit:1150,repairtime:324000,repairCost:1800,skyscraper:true,superSkyscraper:false},
			
			
			marsianCave:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:900,buildExp:35,attractionTrigger:true,Delete:true,profitTime:3240,maxProfit:360,repairtime:32400,repairCost:180,skyscraper:false,superSkyscraper:false},
			
			orbitalStation:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:900,buildExp:35,attractionTrigger:true,Delete:true,profitTime:3240,maxProfit:360,repairtime:32400,repairCost:180,skyscraper:true,superSkyscraper:true},
			jumpIt:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:1800,buildExp:95,attractionTrigger:true,Delete:true,profitTime:1620,maxProfit:600,repairtime:16200,repairCost:180,skyscraper:false,superSkyscraper:false},
			ufo:{rus:"",cPl:9,Size:"3x3",aType:"tech",reloadTime:800,maxTickets:600,price:3200,buildExp:85,attractionTrigger:true,Delete:true,profitTime:6480,maxProfit:1150,repairtime:324000,repairCost:1800,skyscraper:false,superSkyscraper:false},
			teleport:{rus:"гиперкуб",cPl:9,Size:"3x3",aType:"tech",reloadTime:800,maxTickets:600,price:3200,buildExp:85,attractionTrigger:true,Delete:true,profitTime:6480,maxProfit:1150,repairtime:324000,repairCost:1800,skyscraper:true,superSkyscraper:false},
			
			
			cinemaAttraction:{rus:"кинотеатр",cPl:9,Size:"3x3",aType:"tech",reloadTime:800,maxTickets:600,price:3200,buildExp:85,attractionTrigger:true,Delete:true,profitTime:6480,maxProfit:1150,repairtime:324000,repairCost:1800,skyscraper:false,superSkyscraper:false},
			lavka:{rus:"лавка",cPl:1,Size:"1x1",aType:"clean",reloadTime:0,maxTickets:0,price:100,buildExp:5,attractionTrigger:false,Delete:true,profitTime:0,maxProfit:0,repairtime:0,repairCost:0,skyscraper:false,superSkyscraper:false},
			deleted:{rus:"",cPl:1,Size:"1x1",aType:"clean",reloadTime:0,maxTickets:0,price:100,buildExp:5,attractionTrigger:false,Delete:true,profitTime:0,maxProfit:0,repairtime:0,repairCost:0,skyscraper:false,superSkyscraper:false},
			aquaShake:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:400,maxTickets:150,price:600,buildExp:25,attractionTrigger:true,Delete:true,profitTime:2160,maxProfit:240,repairtime:2160,repairCost:120,skyscraper:true,superSkyscraper:false},
			puzirator:{rus:"",cPl:4,Size:"2x2",aType:"tech_clean",reloadTime:1000,maxTickets:90,price:700,buildExp:30,attractionTrigger:true,Delete:true,profitTime:2520,maxProfit:280,repairtime:25200,repairCost:140,skyscraper:true,superSkyscraper:false},
			spaceShipTravel:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:2500,buildExp:60,attractionTrigger:true,Delete:true,profitTime:6480,maxProfit:720,repairtime:6480,repairCost:360,skyscraper:false,superSkyscraper:false},
			rocketAttraction:{rus:"",cPl:4,Size:"2x2",aType:"tech",reloadTime:800,maxTickets:300,price:1700,buildExp:60,attractionTrigger:true,Delete:true,profitTime:12960,maxProfit:780,repairtime:12960,repairCost:360,skyscraper:false,superSkyscraper:false},
			bigKafeshka:{rus:"",cPl:4,Size:"2x2",aType:"coock",reloadTime:1200,maxTickets:400,price:1200,buildExp:50,attractionTrigger:true,Delete:true,profitTime:4320,maxProfit:480,repairtime:43200,repairCost:240,skyscraper:false,superSkyscraper:false},
			octopus:{rus:"карусель",cPl:4,Size:"2x2",aType:"tech",reloadTime:1200,maxTickets:400,price:1200,buildExp:50,attractionTrigger:true,Delete:true,profitTime:4320,maxProfit:480,repairtime:43200,repairCost:240,skyscraper:true,superSkyscraper:false},
			Magazin:{rus:"магазин",cPl:4,Size:"2x2",aType:"",reloadTime:1200,maxTickets:400,price:1200,buildExp:50,attractionTrigger:false,Delete:true,profitTime:4320,maxProfit:480,repairtime:43200,repairCost:240,skyscraper:true,superSkyscraper:false},
			elki:{rus:"",cPl:4,Size:"2x2",aType:"",reloadTime:1200,maxTickets:400,price:1200,buildExp:50,attractionTrigger:false,Delete:true,profitTime:4320,maxProfit:480,repairtime:43200,repairCost:240,skyscraper:false,superSkyscraper:false},
			decoration:{rus:"дерево",Size:"1x1"}
		
		
		};
		
		public static var Building_Basa:Object = {
				enterBoth:{Name:"enterBoth",productType:"tickets",places:4,price:0,openTrigger:false,M_Vis:8,tmpMc2:orbitalStation_mc,Goto:true,animation:false,Button:building_button,fr:0,Cost:150,BigBuilding:false,BigPlace:0,et_1:false,et_2:false,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"clean",Kafeshka:false,special:false,drag:false},
				
				lavka:{Name:"lavka",productType:"none",places:8,price:0,openTrigger:true,M_Vis:8,tmpMc2:lavki_mc,Goto:false,animation:false,Button:lavki_mc_button,fr:0,Cost:100,BigBuilding:false,BigPlace:0,et_1:false,et_2:false,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"clean",Kafeshka:false,special:false,drag:true},
				aquaShake:{Name:"aquaShake",productType:"tickets",places:1,price:0,openTrigger:false,M_Vis:8,tmpMc2:aqua_attraction,Goto:true,animation:true,Button:building_button,fr:4,Cost:600,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				kafeshkaRuzik:{Name:"kafeshkaRuzik",productType:"pizza",places:4,price:0,openTrigger:false,M_Vis:4,tmpMc2:kafeshka_ruzik,Goto:true,animation:false,Button:building_button,fr:1,Cost:250,BigBuilding:false,BigPlace:0,et_1:false,et_2:false,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"coock",Kafeshka:true,special:false,drag:true},
				//kafeshkaRuzik:{Name:"kafeshkaRuzik",productType:"pizza",places:4,price:0,openTrigger:false,M_Vis:4,tmpMc2:kafeshka_ruzik,Goto:true,animation:false,Button:kafeshka_ruzik_button,Cost:250,BigBuilding:false,BigPlace:0,et_1:false,et_2:false,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"coock",Kafeshka:true,special:false,drag:true},
				kafeshkaKresla:{Name:"kafeshkaKresla",productType:"pizza",places:4,price:0,openTrigger:false,M_Vis:4,tmpMc2:kafeshka_kresla,Goto:true,animation:false,Button:building_button,fr:7,Cost:250,BigBuilding:false,BigPlace:0,et_1:false,et_2:false,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"coock",Kafeshka:true,special:false,drag:true},
				orbitalStation:{Name:"orbitalStation",productType:"tickets",places:6,price:0,openTrigger:false,M_Vis:6,tmpMc2:orbitalStation_mc,Goto:true,animation:false,Button:building_button,fr:11,Cost:900,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				spaceShipTravel:{Name:"spaceShipTravel",productType:"tickets",places:6,price:0,openTrigger:false,M_Vis:6,tmpMc2:spaceShipTravel_mc,Goto:true,animation:false,Button:building_button,fr:12,Cost:2500,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				
				ufo:{Name:"ufo",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:ufo_mc,Goto:true,animation:false,Button:building_button,fr:20,Cost:1200,BigBuilding:true,BigPlace:8,et_1:true,et_2:false,et_3:true,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				
				teleport:{Name:"teleport",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:teleport_mc,Goto:true,animation:false,Button:building_button,fr:19,Cost:1200,BigBuilding:true,BigPlace:8,et_1:true,et_2:false,et_3:true,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				
				submarine:{Name:"submarine",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:submarine_mc,Goto:true,animation:false,Button:building_button,fr:18,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				saturn:{Name:"saturn",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:saturn_mc,Goto:true,animation:true,Button:building_button,fr:17,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				batutTower:{Name:"batutTower",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:batutTower_mc,Goto:true,animation:true,Button:building_button,fr:3,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				spaceInvanders:{Name:"spaceInvanders",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:spaceInvanders_mc,Goto:true,animation:true,Button:building_button,fr:21,Cost:1200,BigBuilding:true,BigPlace:8,et_1:true,et_2:false,et_3:true,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				marsianCave:{Name:"marsianCave",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:marsianCave_mc,Goto:true,animation:true,Button:building_button,fr:16,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				
				jumpIt:{Name:"jumpIt",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:jumpIt_mc,Goto:true,animation:true,Button:building_button,fr:15,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				
				rocketAttraction:{Name:"rocketAttraction",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:8,tmpMc2:rocketAttraction_mc,Goto:true,animation:true,Button:building_button,fr:14,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				bigKafeshka:{Name:"bigKafeshka",productType:"tickets",places:8,price:0,openTrigger:false,M_Vis:8,tmpMc2:bigKafeshka,Goto:true,animation:true,Button:building_button,fr:8,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"coock",Kafeshka:false,special:false,drag:true},
				octopus:{Name:"octopus",productType:"tickets",places:8,price:0,openTrigger:false,M_Vis:8,tmpMc2:octopusAttraction,Goto:true,animation:true,Button:building_button,fr:10,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				cinemaAttraction:{Name:"cinemaAttraction",productType:"tickets",places:8,price:0,openTrigger:false,M_Vis:8,tmpMc2:cinemaAttraction,Goto:true,animation:true,Button:building_button,fr:13,Cost:1200,BigBuilding:true,BigPlace:8,et_1:true,et_2:false,et_3:true,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				puzirator:{Name:"puzirator",productType:"tickets",places:8,price:0,openTrigger:false,M_Vis:8,tmpMc2:puzirator_mc,Goto:true,animation:false,Button:building_button,fr:9,Cost:700,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				wcRooms:{Name:"wcRooms",productType:"tickets",places:2,price:0,openTrigger:false,M_Vis:2,tmpMc2:wcRooms_mc,Goto:true,animation:false,Button:building_button,fr:2,Cost:150,BigBuilding:false,BigPlace:0,et_1:false,et_2:false,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"clean",Kafeshka:false,special:false,drag:true},
				
				deleted:{Name:"deleted",productType:"tickets",places:8,price:0,openTrigger:false,M_Vis:8,tmpMc2:building_button,Goto:true,animation:true,Button:building_button,fr:0,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"clean",Kafeshka:false,special:false,drag:true},
				Magazin:{Name:"Magazin",productType:"tickets",places:4,price:0,openTrigger:false,M_Vis:8,tmpMc2:Magazin_mc,Goto:true,animation:false,Button:building_button,fr:5,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:false,drag:true},
				elki:{Name:"elki",productType:"tickets",places:4,price:0,openTrigger:false,M_Vis:8,tmpMc2:firtree_mc,Goto:true,animation:false,Button:building_button,fr:6,Cost:1200,BigBuilding:true,BigPlace:3,et_1:true,et_2:true,et_3:false,et_4:false,et_5:false,et_6:false,et_7:false,et_8:false,et_9:false,botX:"tech",Kafeshka:false,special:true,drag:true},
				three_1:{Name:"Дуб"},
		three_2:{Name:"Ясень"},
		clumb_1:{Name:"Подсолнухи"},
		clumb_2:{Name:"Незабудки"},
		clumb_3:{Name:"Фиалки"},
		smThree_1:{Name:"Бонсай-липа"},
		smThree_2:{Name:"Бонсай-слива"},
		smThree_3:{Name:"Бонсай-апельсин"},
		elka_1:{Name:"Елка"},
		elka_2:{Name:"Пихта"},
		elka_3:{Name:"Сосна"},
		three_3:{Name:"Груша"},
		three_4:{Name:"Лимон"},
		three_5:{Name:"Яблоня"},
		three_6:{Name:"Бук"},
		three_7:{Name:"Куку-пальма"},
		three_8:{Name:"Бана-пальма"},
		refuse:{Name:"Мусор"}
		}
		
		//   checkAquaShakePossibility
		public static var Three_Basa_Params:Object = {
				enterBoth:{name:"MetalTree",cPl:1,productType:1,price:100,buildExp:5,button:enterBoot_mc,planet:true},
				three_1:{name:"MetalTree",cPl:1,productType:1,price:100,buildExp:5,button:three_1_mc,planet:true},
				three_2:{name:"MetalTree2",cPl:1,productType:0,price:120,buildExp:7,button:three_2_mc,planet:true},
				three_3:{name:"MetalTree3",cPl:1,productType:0,price:600,buildExp:20,button:three_3_mc,planet:true},
				three_4:{name:"MetalTree4",cPl:1,productType:0,price:700,buildExp:25,button:three_4_mc,planet:true},
				three_5:{name:"MetalTree5",cPl:1,productType:0,price:500,buildExp:15,button:three_5_mc,planet:true},
				three_6:{name:"MetalTree6",cPl:1,productType:0,price:600,buildExp:17,button:three_6_mc,planet:true},
				three_7:{name:"MetalTree7",cPl:1,productType:0,price:900,buildExp:23,button:three_7_mc,planet:true},
				three_8:{name:"MetalTree8",cPl:1,productType:0,price:1000,buildExp:27,button:three_8_mc,planet:true},
				clumb_1:{name:"MetalClumb_1",cPl:1,productType:0,price:150,buildExp:7,button:clumb_1_mc,planet:true},
				clumb_2:{name:"MetalClumb_2",cPl:1,productType:0,price:150,buildExp:7,button:clumb_2_mc,planet:true},
				clumb_3:{name:"MetalClumb_3",cPl:1,productType:0,price:150,buildExp:7,button:clumb_3_mc,planet:true},
				smThree_1:{name:"MetalsmTree_1",cPl:1,productType:0,price:450,buildExp:15,button:smThree_1,planet:true},
				smThree_2:{name:"MetalsmTree_2",cPl:1,productType:0,price:450,buildExp:15,button:smThree_2,planet:true},
				smThree_3:{name:"MetalsmTree_3",cPl:1,productType:0,price:450,buildExp:15,button:smThree_3,planet:true},
				elka_1:{name:"MetalElka_1",cPl:1,productType:0,price:300,buildExp:10,button:elka_1,planet:true},
				elka_2:{name:"MetalElka_2",cPl:1,productType:0,price:300,buildExp:10,button:elka_2,planet:true},
				elka_3:{name:"MetalElka_3",cPl:1,productType:0,price:400,buildExp:15,button:elka_3,planet:true}
		}
		
		
		public static var Decoration_Basa:Array= [
								"three_1",
							   "three_2",
							   "clumb_1",
							   "clumb_2",
							   "clumb_3",
							   "smThree_1",
							   "smThree_2",
							   "smThree_3",
							   "elka_1",
							   "elka_2",
							   "elka_3",
							   "three_3",
							   "three_4",
							   "three_5",
							   "three_6",
							   "three_7",
							   "three_8"];
		public static var Building_Basa_Name:Array = [[
													   "kafeshkaRuzik",
													  "wcRooms",
													  "batutTower",
													  "aquaShake",
													  "Magazin",
													  //"elki",
													  "kafeshkaKresla",
														"bigKafeshka",
														"puzirator",
														"octopus",
														"orbitalStation",
														"spaceShipTravel",
														"cinemaAttraction",
														"rocketAttraction",
														"jumpIt",
														"marsianCave",
														"saturn",
														"submarine",
														"teleport",
														"ufo"],
							["kafeshkaRuzik",
													  "wcRooms",
													  "batutTower",
													  "aquaShake",
													  "Magazin",
													 // "elki",
													  "kafeshkaKresla",
							"bigKafeshka",
							"puzirator",
							"octopus",
							"orbitalStation",
							"spaceShipTravel",
							"cinemaAttraction",
							"rocketAttraction",
							"jumpIt",
							"marsianCave",
							"saturn",
							"submarine",
							"teleport",
							"ufo","spaceInvanders"]
							 ]
		public static var Facility_Basa:Array = ["lavka",
												 "size13x13",
												 "size15x15",
												 "size17x17",
												 "size19x19",
												 "size21x21",
												 "size25x25",
												 "ironPlanet"
												 ];
		public static var resizePar_Basa:Array =[{land:11,Upper:0},{land:13,Upper:2},{land:15,Upper:2},{land:17,Upper:2},{land:19,Upper:2},
												 {land:21,Upper:2},{land:25,Upper:4}]
		
		
		public static var HistoryPlayer:String;
		public static var HistoryPlayment:String;
		
		
		public static function set secretApi(s:String):void {
			USER_CODE_api_secret = s;
		}
		
		public static function modifyApi(newString:String):void {
			trace("MODIFICE API---------api work +",newString);
			//throw ("fdsfsdf");
			USER_CODE_api_secret += newString;
			USER_CODE = MD5.hash(USER_CODE_api_secret);
			trace("New key:"+USER_CODE_api_secret);
			trace("New hash:"+USER_CODE);
			trace("-------------------------");
		}
		public static function create_clue(intent:String,clue:String):void
		{
			var _secretChars:String = "";
			trace(globalParams.UID,"    USER_CODE  ___________   loadKeyComplete = ",clue);
			var uid:String = globalParams.UID;
			for (var i:int = 0;i<uid.length;++i) {
				_secretChars+=String.fromCharCode(uid.charCodeAt(uid.length-i-1)+117);
				trace("+=",String.fromCharCode(uid.charCodeAt(uid.length-i-1)+117),"_",String.fromCharCode(uid.charCodeAt(uid.length-i-1)));
			}
			globalParams[intent+"_api_secret"] = _secretChars+clue;
			globalParams[intent] = MD5.hash(globalParams[intent+"_api_secret"]);
			//userCode = MD5.hash(_api_secret);
			//globalParams.USER_CODE = userCode;
			globalParams.secretApi = globalParams[intent+"_api_secret"];
		trace("     globalParams[intent+'_api_secret'] =     globalParams[ ",intent," ]=",globalParams[intent]);
		trace("     globalParams.USER_CODE = ",globalParams.USER_CODE);
		}  
		public static function getNumberOfWorkers():int
		{
			return workersArray.length;
		}
		
		public static var updateTimer:Number = 0
		
		public static function getUsedSpace () {
			var lanscapeArray:Array = globalParams.indexMc.lanscapeArray
			//var landWidth:int = globalParams.indexMc.newlandWidth
			//var landHeight:int = globalParams.indexMc.newlandWidth
			
			var req:Number = 0
			for (var i = 1; i <= globalParams.indexMc.newlandWidth; i++) {
				for (var j = 1; j <= globalParams.indexMc.newlandWidth; j++) {
					if (lanscapeArray[i][j].cellType != "grass") {
						req ++
					}
				}
			}
			return req
		}
		public static function getMinuteProfit () {
			var req:Number = 0
			globalParams.minuteTimer++
			
			var objectsArray:Array = globalParams.indexMc.objectsArray
			
			for (var i = 0; i < objectsArray.length; i++) {
				for (var j = 0; j < globalParams.attractionNameArray.length; j++) {
					if (objectsArray[i].type == globalParams.attractionNameArray[j]) {
						if (objectsArray[i].prevProfit == 0) {
							req = req + objectsArray[i].profit
						} else {
							req = req + objectsArray[i].prevProfit
						}
						
					}
				}
				if (objectsArray[i].type == "enterBoth") {
					if (objectsArray[i].prevProfit == 0) {
						req = req + objectsArray[i].profit
					} else {
						req = req + objectsArray[i].prevProfit
					}
				}
			}
			return req
		}
		
		public static function getBotInPark ():int {
			//если атракционов больще
			var botArray:Array = globalParams.indexMc.botArray
			var req:int = 0;
			for (var i = 0; i < botArray.length; i ++) {
				if (botArray[i].action == "inAttraction") {
					req ++
				}
				if (botArray[i].action == "enterToPark") {
					req ++
				}
				if (botArray[i].action == "waytToGoOnAttraction") {
					req ++
				}
				if (botArray[i].action == "walkInPark") {
					req ++
				}
				
			}
			return req
		}
		
		public static function getAttractionInPark () {
			var objectsArray:Array = globalParams.indexMc.objectsArray
			var req:Number = 0
			for (var i = 0; i < objectsArray.length; i ++) {
				if (objectsArray[i].type != "lavka"
				 && objectsArray[i].type != "road"
				 && objectsArray[i].type != "decoration"
				 && objectsArray[i].type != "enterBoth")
				{
					req++;
				}
				
			}
			return req
		}
		public static var Attraction_Capacity_Basa:Object = {kafeshkaKresla:4,aquaShake:5,batut:7,puzirator:3,
		orbitalStation:6,octopus:8,enterBoth:0}
		
		public static function getAttractionMinuteCapacity (_type:String) {
			var req:int;
			
			if (Attraction_Capacity_Basa[_type]!=undefined) {
				req = Attraction_Capacity_Basa[_type];
			}
			
			return req
		}
		
		public static function getSpaceInPark ():int {
			var roadsArray:Array = globalParams.indexMc.roadsArray
			var objectsArray:Array = globalParams.indexMc.objectsArray
			
			var req:int = roadsArray.length/10
			for (var i = 0; i < objectsArray.length; i++) {
				if (objectsArray[i].type == "kafeshkaKresla") {
					req = req + 2
				}
				if (objectsArray[i].type == "lavka") {
					req = req + 1
				}
				if (objectsArray[i].type == "aquaShake") {
					req = req + 3
				}
				if (objectsArray[i].type == "batut") {
					req = req + 2
				}
				if (objectsArray[i].type == "puzirator") {
					req = req + 3
				}
			}
			
			return req
		}
		
		public static function getFreePlaces_obj (img:Object) {
			var req:int = 0
			for (var i = 1; i <= img.places; i++) {
				if (img["m_" + i]) {
					
				} else {
					req ++
				}
			}
			return req
		}
		public static function clone(source:Object):* {
				
			var myBA:ByteArray=new ByteArray  ;
			myBA.writeObject(source);
			myBA.position=0;
			return (myBA.readObject());
		}
		public static function get_x (i:int,j:int,_landWidth:int) {
			return (i - 1) * 76 + (j - 1) * 76 - (_landWidth) * 76 + 76;
		}
		public static function get_y (i:int,j:int) {
			return (i - 1) * 38 - (j - 1) * 38;
		}
	}

}