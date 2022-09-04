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
	public class place_load_road extends MovieClip
	{



		public function Place_Road(dataObject:Object)
		{
			
			//Цикл расставляющий загруженные дорожки
			for (var i:int = 0; i < dataObject.roadsArray.length; i ++)
			{
				if (dataObject.roadsArray[i].i != null,dataObject.roadsArray[i].j != null)
				{
					//если не корректные данные загрузились
					if (dataObject.roadsArray[i].i <= globalParams.indexMc.landWidth && dataObject.roadsArray[i].j <= globalParams.indexMc.landHeight)
					{
						
						if (dataObject.roadsArray[dataObject.roadsArray.length - 1]!=null) {
						globalParams.indexMc.roadsArray.push(new Object ());
						globalParams.indexMc.roadsArray[globalParams.indexMc.roadsArray.length - 1].i = dataObject.roadsArray[i].i;
						globalParams.indexMc.roadsArray[globalParams.indexMc.roadsArray.length - 1].j = dataObject.roadsArray[i].j;
						
						globalParams.indexMc.lanscapeArray[dataObject.roadsArray[i].i][dataObject.roadsArray[i].j].gr.gotoAndStop("road_fr");
						globalParams.indexMc.lanscapeArray[dataObject.roadsArray[i].i][dataObject.roadsArray[i].j].decoMc.visible = false;
						globalParams.indexMc.lanscapeArray[dataObject.roadsArray[i].i][dataObject.roadsArray[i].j].cellType = "road";
						//globalParams.indexMc.updateRoadsCounter = 0;
						globalParams.indexMc._lands_UpdateRoads.updateRoads(dataObject.roadsArray[i].i, dataObject.roadsArray[i].j);
						}
					}
					else
					{
						dataObject.roadsArray.splice(i,1);
					}
				}

			}


		}

	}

}