package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;

	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;

	import tools.*;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class lands_Quest extends MovieClip
	{
		public var questWindow:QuestWindow = new QuestWindow();
		public var L_Quest:int = 3;


		public function Quest_launch(Num:int)
		{


			globalParams.questNumber++;
			//Создали окошко квестов
			if (globalParams.questBasa[globalParams.questNumber - 1].Priz)
			{
				userLevelsTable.addExperience(globalParams.questBasa[globalParams.questNumber].Pr_Exp);
				userLevelsTable.addExperience(globalParams.questBasa[globalParams.questNumber].Pr_Money);
			}
			Add_Quest_Windows("Главный квест","" + globalParams.questBasa[globalParams.questNumber].Text);



			if (globalParams.questNumber >= L_Quest)
			{
				//globalParams.indexMc._lands_Interface.Remove_Quest_Log();
			}
		}
		public var myTween:Tween;
		public function Add_Quest_Windows(topic:String,Message:String):void
		{

			globalParams.indexMc.addChild(globalParams.indexMc._lands_Quest);


			//Присвоили координаты;
			questWindow.x = globalParams.stageMc.centerX;
			questWindow.y = globalParams.stageMc.centerY;
			questWindow.closeBtn.addEventListener(MouseEvent.CLICK, close);
			
			questWindow.cls.addEventListener(MouseEvent.CLICK, close);
			questWindow.QuestText.text = Message;
			questWindow.topic.text = topic;
			addChild(questWindow);
			myTween = new Tween(questWindow,"y",Elastic.easeOut,-50,globalParams.stageMc.centerY,3,true);
		}
		var expectation:int;
		
		public function Add_miniQuest():void
		{

//globalParams.questTask_Mini=[];
			if (globalParams.questTask_Mini.length == 0)
			{

				if (globalParams.UnixTime_Global > expectation)
				{
					var OnQuestRandom:int = Math.floor(Math.random() * 3);
					trace(expectation,"___________Quest_ ",globalParams.UnixTime_Global,"   L___",OnQuestRandom);
					expectation = globalParams.UnixTime_Global + globalParams.waitQuest;
					if (OnQuestRandom==0)
					{
						trace("_____GET______Quest_ ");
						globalParams.quest_historyBuild = [];
						var numQ:int = Math.floor(Math.random() * globalParams.quest_MiniBasa.length);
						Add_Quest_Windows("Мини-квест",globalParams.quest_MiniBasa[numQ].Text+"\n Опыт: "+globalParams.quest_MiniBasa[numQ].Pr_Exp+"\n Монеты: "+globalParams.quest_MiniBasa[numQ].Pr_Money+globalParams.quest_historyBuild+"\n Время: "+ globalParams._handle_time.min_sek(globalParams.quest_MiniBasa[numQ].time,true)+" секунд");
						globalParams.questTask_Mini.push({quest:globalParams.quest_MiniBasa[numQ],time:globalParams.quest_MiniBasa[numQ].time+globalParams.UnixTime_Global,num:numQ});
					}
				}

			} else {
				if (!time_miniQuest(0)) {
					//Квест провален TIME

					Add_Quest_Windows(" Мини-квест"," "+globalParams.questTask_Mini[0].quest.task+"\n Квест провален, вы не успели по времени. ");
					delete_miniQuest(0);
				}
			
			}
		}
		public function checup_Quest(building:String):void
		{

			globalParams.quest_historyBuild.push(building);
			
			trace("!!!!!!!!!!!!!!!!_ Quest_quest_historyBuild=",globalParams.quest_historyBuild," =");
			for (var i = 0; i < globalParams.questTask_Mini.length; i++)
			{

				if (time_miniQuest(i))
				{
					if (one_buildingQuest(globalParams.questTask_Mini[i].quest,globalParams.questTask_Mini[i].num))
					{
						delete_miniQuest(i)
						
					}
				}
				else
				{
					//Квест провален TIME

					Add_Quest_Windows(" Мини-квест"," "+globalParams.questTask_Mini[i].quest.task+"\n Квест провален, вы не успели по времени. ");
					delete_miniQuest(i);
				}
			}


		}
		public function time_miniQuest(i:int):Boolean
		{
			//проверка не истек ли квест
			if (globalParams.questTask_Mini[i].time > globalParams.UnixTime_Global)
			{
				return true;
			}
			
			return false;
		}
		public function delete_miniQuest(i:int):void
		{
			expectation = globalParams.UnixTime_Global + globalParams.waitQuest;
			globalParams.questTask_Mini.splice(i,1);
		}
		public function one_buildingQuest(Glob_quest:Object,num:int):Boolean
		{
			if (checup_buildingQuest(Glob_quest,num))
			{
				//Поздравление с выполненым квестом
				var timePerformance:int = globalParams.questTask_Mini[0].time - globalParams.UnixTime_Global;
				trace("   checup_Quest    Квест выполнен   ");
				Add_Quest_Windows(" Мини-квест"," "+globalParams.questTask_Mini[0].quest.task+"\n Квест выполнен, получите: "+"\n Опыт: "+globalParams.questTask_Mini[0].quest.Pr_Exp+"\n Монеты: "+globalParams.questTask_Mini[0].quest.Pr_Money+"\n Время выполнения: "+globalParams._handle_time.min_sek(globalParams.questTask_Mini[0].time)+" секунд.");
				//globalParams.indexMc.currentMoneyFn(Glob_quest.Pr_Money);
				globalParams.indexMc.currentMoneyFn(globalParams.questTask_Mini[0].quest.Pr_Money);
				//опыт за  ;
				//userLevelsTable.addExperience(Glob_quest.Pr_Exp);
				userLevelsTable.addExperience(globalParams.questTask_Mini[0].quest.Pr_Exp);
				return true;
			}
			return false;
		}
		public function checup_buildingQuest(Glob_quest:Object,num:int):Boolean
		{

			var listBuild_Q:Array = globalParams.clone(globalParams.quest_MiniBasa[num].Build);
			
			trace("!!!!!!!!!!!!!!!!_ Quest_quest_historyBuild=",globalParams.quest_historyBuild," list =",listBuild_Q);
			for (var i = 0; i < globalParams.quest_historyBuild.length; i++)
			{
				var ib:int = listBuild_Q.length;
				while (ib--)
				{

					if (globalParams.quest_historyBuild[i] == listBuild_Q[ib])
					{
						trace(i,ib,"___________Quest_ ",globalParams.quest_historyBuild[i]," list=",listBuild_Q[ib]);
						listBuild_Q.splice(ib,1);
						break;
					}
				}
			}
			trace("___________Quest=",listBuild_Q);
			if (listBuild_Q.length == 0)
			{
				return true;
			}
			return false;
		}

		public function close(e:MouseEvent):void
		{
			removeChild(questWindow);

		}

		public function _Quest(Num_Q:int)
		{
			trace(globalParams.questNumber,"     Num_Q = ",Num_Q);
			if (globalParams.questNumber == Num_Q)
			{

				Quest_launch(Num_Q);
			}


		}
		
		
		public function Quest_Log(e:MouseEvent):void
		{
			
			//globalParams.indexMc.addChild(globalParams.indexMc._lands_Quest);
			Add_Quest_Windows("Главный квест","" + globalParams.questBasa[globalParams.questNumber].Text);

			
		}
		public function mini_Quest_Log(e:MouseEvent):void
		{
			//помощь, какой квест сейчас находится в активном режиме
			var timeLess:int = globalParams.questTask_Mini[0].time-globalParams.UnixTime_Global
			globalParams._handle_time.min_sek(globalParams.questTask_Mini[0].time)
			//Add_Quest_Windows("Мини-квест",globalParams.questTask_Mini[0].quest.Text+"\n Опыт: "+globalParams.questTask_Mini[0].quest.Pr_Exp+"\n Монеты: "+globalParams.questTask_Mini[0].quest.Pr_Money+"\n Время: "+timeLess+" секунд"+perfomanceQuest());
		Add_Quest_Windows("Мини-квест",globalParams.questTask_Mini[0].quest.Text+"\n Опыт: "+globalParams.questTask_Mini[0].quest.Pr_Exp+"\n Монеты: "+globalParams.questTask_Mini[0].quest.Pr_Money+"\n Время: "+globalParams._handle_time.min_sek(globalParams.questTask_Mini[0].time)+" "+perfomanceQuest());
		}
		public function unicumObj():Object
		{
			var unicumOb:Object=[]
			for (var i = 0; i < globalParams.questTask_Mini[0].quest.Build.length; i++)
			{
				if (unicumOb[globalParams.questTask_Mini[0].quest.Build[i]]==undefined) {
					unicumOb[globalParams.questTask_Mini[0].quest.Build[i]] = new Object();
					unicumOb[globalParams.questTask_Mini[0].quest.Build[i]].get=0;
					unicumOb[globalParams.questTask_Mini[0].quest.Build[i]].set=1;
					//trace("         LOG   ",globalParams.questTask_Mini[0].quest.Build[i]);
				} else {
					unicumOb[globalParams.questTask_Mini[0].quest.Build[i]].set+=1;
				}
			}
			return unicumOb;
		}
		public function perfomanceQuest():String
		{
			var executeQ:String="\n Сделано:"
			var listObj:Object=unicumObj()
			
			var listBuild_Q:Array = globalParams.clone(globalParams.questTask_Mini[0].quest.Build);
			for (var i = 0; i < globalParams.quest_historyBuild.length; i++)
			{
				var ib:int = listBuild_Q.length;
				while (ib--)
				{

					if (globalParams.quest_historyBuild[i] == listBuild_Q[ib])
					{
						trace(i,ib,"___________Quest_ сделоно",globalParams.quest_historyBuild[i]," надо сделать=",listBuild_Q[ib]);
						
						listObj[listBuild_Q[ib]].get+=1;
						listBuild_Q.splice(ib,1);
						break;
					}
				}
			}
			for (var detailN:* in  listObj) {
				//trace(" хрень = ",detailN);
				
				executeQ+="\n"+globalParams.Building_Basa[detailN].Name+"  "+listObj[detailN].get+"/"+listObj[detailN].set;
			}
			
			return executeQ;
		}
	
	}

}