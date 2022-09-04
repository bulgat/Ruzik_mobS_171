package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.*;
	import tools.*;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class lands_Sort extends MovieClip
	{
		
		
		public function botPodSorterHooligan()
		{
			for (var i:int = 0; i < globalParams.indexMc.botArray.length; i ++)
			{
				if (globalParams.indexMc.botArray[i].botName== "Робокот") {
					
					if (botPod_visitor(globalParams.indexMc.botArray[i].currentObj.i,globalParams.indexMc.botArray[i].currentObj.j)) {
						trace(i, "############   Робокот  ###############")
						//globalParams.indexMc.botArray[i].action = "waitForCloseMenue";
						globalParams.indexMc.botArray[i].Pause_Robocat();
					trace(i, "_______________L=",globalParams.indexMc.botArray.length,"__YES      Робокот   ",globalParams.indexMc.botArray[i].action)
					}

				}

			}

		}
		public function botPod_visitor(i_:int, j_:int):Boolean
		{
			for (var i:int = 0; i < globalParams.indexMc.botArray.length; i ++)
			{
				if (globalParams.indexMc.botArray[i].botName== "Хулиган") {
					if (globalParams.indexMc.botArray[i].currentObj.i==i_&&globalParams.indexMc.botArray[i].currentObj.j==j_) {
						globalParams.indexMc._soundProcessor.playSnd ("kick");
						
						
						globalParams.indexMc._lands_bot.removeBot (globalParams.indexMc.botArray[i])
						
						return true;
					}
					
				}
			}
			return false
		}
		public function botPodSorter()
		{
			
			botPodSorterHooligan()
			
			
			var sortArray:Array = new Array ();
			var sortTrigger:Boolean = false;
			var maxL:int = 0;
			for (var i:int = 0; i < globalParams.indexMc.botArray.length; i ++)
			{
				sortTrigger = false;
				
				for (var j:int = 0; j < sortArray.length; j ++)
				{
					//координаты картинки внутри бота 
					if (sortArray[j].i == globalParams.indexMc.botArray[i].currentObj.i && sortArray[j].j == globalParams.indexMc.botArray[i].currentObj.j)
					{
						sortTrigger = true;
						sortArray[j].botArray.push(i);
					}
				}
				if (! sortTrigger)
				{
					sortArray.push(new Object ());
					sortArray[sortArray.length-1].i = globalParams.indexMc.botArray[i].currentObj.i;
					sortArray[sortArray.length-1].j = globalParams.indexMc.botArray[i].currentObj.j;
					
					sortArray[sortArray.length-1].botArray = new Array ();
					sortArray[sortArray.length-1].botArray.push(i);
				}
			}
			for (var ii:int = 0; ii < sortArray.length; ii ++)
			{
				if (maxL < sortArray[ii].botArray.length)
				{
					maxL = sortArray[ii].botArray.length;
				}
				if (sortArray[ii].botArray.length > 0)
				{
					//trace(sortArray.length,"#####",sortArray[ii].i,sortArray[ii].j,"___________stat ",globalParams.indexMc.landWidth,globalParams.indexMc.landHeight)
					//сортировка по размерам карты

// допуск
					if (sortArray[ii].i > 0 && sortArray[ii].i <= globalParams.indexMc.landWidth)
					{
						if (sortArray[ii].j > 0 && sortArray[ii].j <= globalParams.indexMc.landHeight+1)
						{
							//trace("sort",sortArray[ii]);
							podBotDepthSorter(sortArray[ii]);
						}
					}
				}
			}
		}
		//сортировка изображений по глубине
		public function podBotDepthSorter(inObject:Object):void
		{
			var tmpPoint:Point = new Point(0,0);
			//var i:int;
			var inArray:Array = inObject.botArray;
			var objArr:Array = new Array ();
			for (var i:int = 0; i < inArray.length; i++)
			{
				objArr[i] = new Object ();
				objArr[i].idn = inArray[i];
				objArr[i].yp = globalParams.indexMc.botArray[inArray[i]].botImage.y;
			}
			var tmpMc:Object;
			
			for (var ii:int = 0; ii < objArr.length; ii++)
			{
				for (var j = 0; j < objArr.length-1; j++)
				{
					if (objArr[j].yp > objArr[j + 1].yp)
					{
						tmpMc = objArr[j];
						objArr[j] = objArr[j + 1];
						objArr[j + 1] = tmpMc;
					}
				}
			}

			var topPosition:int = globalParams.indexMc.landscape.getChildIndex(globalParams.indexMc.lanscapeArray[inObject.i][inObject.j]);
			//trace(objArr.length,"topPosition=",topPosition,"____",inObject.name)
			for (var i_:int = 0; i_ < objArr.length; i_++)
			{
				// генератор ошибок + (1+i_)
				globalParams.indexMc.landscape.setChildIndex(globalParams.indexMc.botArray[objArr[i_].idn].botImage, topPosition+(1+i_));
				
			}
		}
		public function sortObjectsButtonsFn(objectsButtonArray:Array,botButtonArray:Array):void
		{
			
			//сортировка объектов
			var tmpPoint:Point = new Point(0,0);
			
			var k:int;
			var tmpPoint1:Point;
			//сортировка земли
			if (globalParams.indexMc.prevLandscapePositionX != globalParams.indexMc.landscape.x || globalParams.indexMc.prevLandscapePositionY != globalParams.indexMc.landscape.y || globalParams.indexMc.prevObjectCounterFor_sortObjectButtonFn != globalParams.indexMc.objectsArray.length)
			{
				
				for (var ii2:int = 0; ii2 < objectsButtonArray.length; ii2++)
				{
					
					tmpPoint1 = globalParams.indexMc.objectsArray[objectsButtonArray[ii2].id].objectBottom_mc.localToGlobal(tmpPoint);
					
					objectsButtonArray[ii2].button.visible = globalParams.indexMc.lanscapeArray[globalParams.indexMc.objectsArray[objectsButtonArray[ii2].id].i][globalParams.indexMc.objectsArray[objectsButtonArray[ii2].id].j].visible;
					objectsButtonArray[ii2].button.x = tmpPoint1.x;
					objectsButtonArray[ii2].button.y = tmpPoint1.y;
					
					//обновление  светофор размеры и кординаты
					globalParams.indexMc.Zoom_Svetofor(tmpPoint1,ii2);
					
				}
			}
			//
			//сортировка button ботов
			for (var ii:int = 0; ii < botButtonArray.length; ii++)
			{
				tmpPoint1 = botButtonArray[ii].button.target.botImage.localToGlobal(tmpPoint);
				botButtonArray[ii].button.x = tmpPoint1.x;
				botButtonArray[ii].button.y = tmpPoint1.y;
				botButtonArray[ii].button.visible = true;
				if (! botButtonArray[ii].button.target.botImage.visible)
				{

					//перемещает кнопку ботов за край карты делая их невидимыми
					botButtonArray[ii].button.visible = false;
				}
			}
//
var i:int;
			if (globalParams.indexMc.prevObjectCounterFor_sortObjectButtonFn != globalParams.indexMc.objectsArray.length)
			{
				globalParams.indexMc.prevObjectCounterFor_sortObjectButtonFn = globalParams.indexMc.objectsArray.length;
				var objArr:Array = new Array ();
				for (var i3:int = 0; i3 < objectsButtonArray.length; i3++)
				{
					objArr[i3] = new Object ();
					objArr[i3].id = "objButton";
					objArr[i3].idn = i3;
					objArr[i3].yp = objectsButtonArray[i3].button.y;
				}
				for (var i4:int = 0; i4 < botButtonArray.length; i4++)
				{
					k = objArr.length;
					objArr.push(new Object ());
					objArr[k].id = "botButton";
					objArr[k].idn = i4;
					objArr[k].yp = botButtonArray[i].button.y;
				}

				var tmpMc:Object;
				for (i = 0; i < objArr.length; i++)
				{
					for (var j = 0; j < objArr.length-1; j++)
					{
						if (objArr[j].yp > objArr[j + 1].yp)
						{
							tmpMc = objArr[j];
							objArr[j] = objArr[j + 1];
							objArr[j + 1] = tmpMc;
						}
					}
				}
				var topPosition:uint = globalParams.indexMc.objectsButtonLayer.numChildren - 1;

				for (i = 0; i < objArr.length; i++)
				{
					if (objArr[i].id == "objButton")
					{
						globalParams.indexMc.objectsButtonLayer.setChildIndex(objectsButtonArray[objArr[i].idn].button, topPosition);
					}
				}
				for (i = 0; i < globalParams.indexMc.svetoforArray.length; i++)
				{
					//trace(i," svetoforArray.length",globalParams.indexMc.svetoforArray.length,"  ",globalParams.indexMc.contains(globalParams.indexMc.svetoforArray[i]))
					globalParams.indexMc.top_position (globalParams.indexMc.svetoforArray[i], topPosition);
					
				}
			}
		}
		public function trace_error() {
			for (var i2:int = 0; i2 < globalParams.indexMc.objectsButtonArray.length; i2++)
				{
					trace(i2,"   id = ",globalParams.indexMc.objectsButtonArray[i2].id,"    ",globalParams.indexMc.objectsButtonArray[i2].idk,"__",globalParams.indexMc.objectsButtonArray[i2])
				}
			
		}
		
		public function updatePosition (tmpX:int, tmpY:int) {
			globalParams.indexMc.leftBorder  = (globalParams.indexMc.landWidth)*76 + 76
			globalParams.indexMc.rightBorder = -(globalParams.indexMc.landWidth) * 76 - 76 + 800/globalParams.indexMc.zoomParam
			
			if (tmpX < globalParams.indexMc.leftBorder*globalParams.indexMc.zoomParam && tmpX > globalParams.indexMc.rightBorder*globalParams.indexMc.zoomParam) {
				globalParams.indexMc.landscape.x = tmpX
			} else if (tmpX > globalParams.indexMc.leftBorder*globalParams.indexMc.zoomParam) {
				globalParams.indexMc.landscape.x = globalParams.indexMc.leftBorder*globalParams.indexMc.zoomParam
			} else if (tmpX < globalParams.indexMc.rightBorder*globalParams.indexMc.zoomParam){
				globalParams.indexMc.landscape.x = globalParams.indexMc.rightBorder*globalParams.indexMc.zoomParam
			}
			if (tmpY < 300 - globalParams.indexMc.topBorder*globalParams.indexMc.zoomParam && tmpY > 300 + globalParams.indexMc.topBorder*globalParams.indexMc.zoomParam) {
				globalParams.indexMc.landscape.y = tmpY
			} else if (tmpY > 300 - globalParams.indexMc.topBorder*globalParams.indexMc.zoomParam) {
				globalParams.indexMc.landscape.y = 300 - globalParams.indexMc.topBorder*globalParams.indexMc.zoomParam
			} else if (tmpY < 300 + globalParams.indexMc.topBorder*globalParams.indexMc.zoomParam) {
				globalParams.indexMc.landscape.y = 300 + globalParams.indexMc.topBorder*globalParams.indexMc.zoomParam
			}
			if (globalParams.indexMc.zoomParam <= .3) {
				globalParams.indexMc.landscape.x = 420
				globalParams.indexMc.landscape.y = 220
			}
			globalParams.indexMc._lands_Sort.sortObjectsButtonsFn (globalParams.indexMc.objectsButtonArray,globalParams.indexMc.botButtonArray)
			globalParams.indexMc._screen_border_vis.checkVisibility ()
			//trash
			globalParams.indexMc._trash_refuse.transform_Refuse()
			globalParams.indexMc._trash_refuse.sort_Refuse()
		}


	}

}