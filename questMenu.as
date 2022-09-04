package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import tools.*;
	public class questMenu extends MovieClip
	{
		private var leftIndent:int = -165;
		public function Launch()
		{
			
			//_building_menue.x = 74-(globalParams.indexMc.stage.stageWidth-800)/2;
			//_shield.y = 170-(globalParams.indexMc.stage.stageHeight-600)/2;
			
			//this.x = (globalParams.indexMc.stage.stageWidth-700)/2 + 355;
			//this.y = 300-(globalParams.indexMc.stage.stageHeight-600)/2;
			
			this.x = (globalParams.indexMc.stage.stageWidth)/2-(globalParams.indexMc.stage.stageWidth-800)/2;
			this.y = (globalParams.indexMc.stage.stageHeight)/2-(globalParams.indexMc.stage.stageHeight-600)/2;
			close.addEventListener(MouseEvent.CLICK, close_click);
			closeBtn.addEventListener(MouseEvent.CLICK, close_click);
			if (globalParams.questNumber>=3) {
				listPlayer.text = "Главный квест выполнен ";
			} else {
				listPlayer.text = "Главный квест не выполнен ";
				add_quest("Главный квест",globalParams.questBasa[globalParams.questNumber].Text,0);
			}
			//мини квесты
			add_MiniQuest()
			
			trace("     globalParams.questNumber = ",globalParams.questNumber)
		}
		public function add_MiniQuest():void
		{
			
			
			for (var i = 0 ; i < globalParams.questTask_Mini.length; i++)
			{
				trace(globalParams.questTask_Mini[i],globalParams.questTask_Mini[i].quest)
				trace("________Quest_________  ",globalParams.questTask_Mini[i].quest.task);
				add_quest("Мини-квест",globalParams.questTask_Mini[i].quest.task+time_MiniQuest(i),0+1)
			}
			
		}
		public function time_MiniQuest(num:int):String
		{
			var timeLess:int = globalParams.questTask_Mini[num].time-globalParams.UnixTime_Global
			if (timeLess<0) {
				return "\n время ожидания истекло, квест провален.";
			}
			return "\n осталось "+globalParams._handle_time.min_sek(globalParams.questTask_Mini[num].time);
		}
		public function add_quest(title:String,description:String,num:int)
		{
			var _table_quest:table_quest = new table_quest()
			_table_quest.Launch(title,description)
			_table_quest.x = -290+6;
			_table_quest.y = leftIndent+116*num;
			addChild(_table_quest)
			
		}
		public function close_click(event:MouseEvent)
		{
			parent.removeChild(this);
		}
		


	}

}