package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;

	import flash.events.MouseEvent;

	public class load_welcom_first extends MovieClip
	{
		public function Welcom_Full():void
		{
			globalParams.stageMc.Remove_Texter();
			if (! globalParams.friendsParkTrigger)
			{
				//плюс лицензия
				globalParams.indexMc.showChooseWindow();
				globalParams.indexMc._Choosewin.addEventListener('winClosed', closed);
			} else {
				globalParams.indexMc.startNewGame(0);
				if (globalParams.indexMc.type_planet()==0) {
					globalParams.indexMc.systemMessage ("У вашего друга нет парка! Срочно попросите его сделать.")
				} else {
					globalParams.indexMc.systemMessage ("У вашего друга нет планеты! Срочно попросите его ее сделать.")
				}
				
			
			}
		}
		public function closed(e:Event):void
		{
			//закрыть окно после выбора планеты
			globalParams.indexMc.startNewGame(0);
			//insert;
			globalParams.indexMc._insertSavedGames.init(globalParams.INSERT_RATING);

			globalParams.stageMc.showWelcomeWindow();
			globalParams.indexMc.Start_Quest();
			globalParams.user_energy = 10;
		}
	}

}