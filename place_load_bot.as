package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class place_load_bot extends MovieClip
	{
		public function Place_bot():void
		{
			var botsIntPark:int = globalParams.getSpaceInPark () - (Math.ceil (Math.random() * 10) - 5);
			for (var i_s:int = 0; i_s < botsIntPark; i_s++)
			{
				var n:int = globalParams.indexMc.botArray.length;
				globalParams.indexMc.botAddingTimer = globalParams.indexMc.botAddingRnd + 1;
				globalParams.indexMc._lands_bot.botAdding();
				var rnd:int = Math.ceil(Math.random() * globalParams.indexMc.roadsArray.length);
				for (var j = 0; j < globalParams.indexMc.roadsArray.length; j++)
				{
					if (j == rnd)
					{

						if (globalParams.indexMc.roadsArray[j].i != undefined || globalParams.indexMc.roadsArray[j].j != undefined)
						{
							globalParams.indexMc.botArray[n].setBotStartPosition(globalParams.indexMc.roadsArray[j]);
						}
					}
				}
			}

		}




	}

}