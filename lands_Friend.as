package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;
	/**
	 * ...
	// --------------------------------- отслеживалки возможности установки объектов ---------------------------------
	
	 */
	public class lands_Friend extends MovieClip
	{
		
		public function saveUserParkBuffer():void
		{
			if (globalParams.friendsParkTrigger == false)
			{
				trace("##########################  UserParkBuffer   ##################################");
				globalParams.indexMc.Save_Buffer(globalParams.indexMc.type_planet());
				globalParams.indexMc.Player_Park = globalParams.indexMc._getBuildingData.buildingData(false);
				
			}
			
		}
		//Функция показать парк друзей
		public function showFriendParkFn(inUid):void
		{
			trace("##########################  SHOW FRIEND   ##################################");
			
			globalParams.friendsParkTrigger = true;
			globalParams.indexMc.RemovePark();

			globalParams.FRIEND_UID = inUid;
			
			globalParams.indexMc._soundProcessor.playSnd("goToFriendPark");

globalParams.indexMc._getSavedGames.load_init(globalParams.FRIEND_UID,globalParams.GET_RATING,0,0);
			
		}
		//возращение к себе в парк
		public function backToMainModeFn(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click")
			globalParams.indexMc._soundProcessor.playSnd ("goToFriendPark")
			globalParams.global_Log.push(" **********  backToMain   ********** ");
			globalParams.global_Log.push(" |=",globalParams.indexMc.Player_Park,"=| ");
			globalParams.indexMc.RemovePark();
			//возвращаемя на землю
			globalParams.indexMc.Load_Buffer(0);
			globalParams.friendsParkTrigger = false
			
			globalParams.global_Log.push(" =",globalParams.indexMc.Player_Park,"= ");
			//пока доступен только зеленый парк
			globalParams.indexMc.startLoadedGame (0,globalParams.indexMc.Player_Park)
			//load
			//globalParams.indexMc.init (globalParams.UID,globalParams.GET_RATING)
		}

	}

}