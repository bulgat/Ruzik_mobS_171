package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;

	public class lands_Collections extends MovieClip
	{
		public function getElementOfCollection():void
		{
			
			//
			var rand		:int = 1 + Math.random()*100;
			
				var count	:int = 0;
			
			
			for(var i:int = 0; i < globalParams.indexMc.collectionsArray.length; i++)
			{
				if(globalParams.indexMc.collectionsArray[i] > 0)
				{
					count++;
				}
			}
			if (count == 0)
			{
				giveElementOfCollection();
			}
			
			if(rand == 1)
			{
				giveElementOfCollection();
			}
		
			//Add_Purse_Collection();
		}
		public function giveElementOfCollection():void
		{
			var randomElement:int = 1 + Math.random() * globalParams.indexMc.collectionsArray.length;
				globalParams.indexMc.collectionsArray[randomElement]++;
				
			
		}
		
	}

}