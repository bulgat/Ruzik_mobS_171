package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;

	import flash.events.MouseEvent;

	public class load_correct_data extends MovieClip
	{
		public var _yesNoMessage:yesNoMessage = new yesNoMessage();
		public function option_load():void
		{
			globalParams.indexMc.addChild(_yesNoMessage);
			_yesNoMessage.Message(" При загрузке парка обнаружена критическая ошибка - парк частично поврежден. Продолжить играть или загрузить парк из бэкапа? ");
			_yesNoMessage.addEventListener("confirm", confirm_load);
			_yesNoMessage.addEventListener("repeal", repeal_load);
		}
		public function confirm_load(e:Event):void
		{
			trace("_______________Пришли неправильные данные");
			_yesNoMessage.removeEventListener("confirm", repeal_load);
			_yesNoMessage.removeEventListener("repeal", repeal_load);
			globalParams.indexMc._getSavedGames.launch_load_park();

		}
		public function repeal_load(e:Event):void
		{

			_yesNoMessage.removeEventListener("confirm", repeal_load);
			_yesNoMessage.removeEventListener("repeal", repeal_load);
			globalParams.indexMc._getSavedGames.Error_Load_Player +=  1;
			
			globalParams.indexMc._getSavedGames.load_init(globalParams.UID,globalParams.indexMc._getSavedGames.Basa_BackUp_Name[globalParams.indexMc._getSavedGames.Error_Load_Player],globalParams.indexMc._getSavedGames.Error_Load_Player,0);


		}
	}

}