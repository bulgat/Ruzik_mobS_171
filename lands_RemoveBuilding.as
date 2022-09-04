package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	import tools.*
	
	public class lands_RemoveBuilding extends MovieClip
	{
		
		/////////////////////////////////Удалить объект находящийся под курсором///////////////////////////////////////////
		public function removeObjectFromCursor():void
		{
			trace(" ________ %%5 removeObjectFromCursor %%%___________");
			
			
			var possibleTrigger	:Boolean = true,
				i				:int;
			
			// ----------------- Условия про тропинку ------------
			possibleTrigger = remove_from_Cursor_road();
			
			if (globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id] == undefined) {
				possibleTrigger = false
			}
			
			// ----------------- Условия про лавку ------------
			
			if (possibleTrigger) {
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType == "lavka")
				{
					possibleTrigger = globalParams.indexMc.remove_lavka (globalParams.indexMc.roadPlaceObject);
									
				}
			}
			// ----------------- Условия про декорации ------------
			
			if (possibleTrigger) {
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType == "decoration") {
					
					globalParams.indexMc.SaleOldBuilding (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType,globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].productType);
					/*
					for (i = 0; i < globalParams.indexMc.objectsButtonArray.length; i++) {
						if (globalParams.indexMc.objectsButtonArray[i].id == globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id) {
							//globalParams.indexMc.objectsButtonLayer.removeChild (globalParams.indexMc.objectsButtonArray[i].button)
							//globalParams.indexMc.objectsButtonArray.splice (i, 1)
						remove_splice (i)
						}
					}
					*/
					button_search_remove (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j);
					//globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].type = "deleted"
					//globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
					//globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
										
					remove_bottom_building (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j)
					
					
					globalParams.indexMc.delete_Place (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,1);
					
					
					
					possibleTrigger = false
					
				}
			}
			//снос здания
			if (possibleTrigger) {
				
				var targetType:String = ""
				var tmpParams:Object = attractionClass.getAttracctionParams (globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id])
				
				
				
				if (tmpParams.attractionTrigger) {
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].worker != undefined) {
						globalParams.indexMc.systemMessage ("Вы не можете снести здание пока на нем кто-то работает, сначала снимите сотрудника.")
					} else {
						globalParams.indexMc.SaleOldBuilding (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType,"");
						globalParams.indexMc._soundProcessor.playSnd ("sellObject")
						/*
						for (i = 0; i < globalParams.indexMc.objectsButtonArray.length; i++) {
							
							if (globalParams.indexMc.objectsButtonArray[i].id == globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i ][globalParams.indexMc.roadPlaceObject.j].id) {
								
								//globalParams.indexMc.objectsButtonLayer.removeChild (globalParams.indexMc.objectsButtonArray[i].button)
								//globalParams.indexMc.objectsButtonArray.splice (i, 1)
							remove_splice (i)
							}
						
						}
						*/
						button_search_remove (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j);
						
						//удаление светофора здания
						globalParams.indexMc.Remove_Svetofor(globalParams.indexMc.objectsButtonLayer,globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id);
						
						if (tmpParams.cPl == 1||tmpParams.cPl == 4||tmpParams.cPl == 9)
						{
							remove_bottom_building (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j)
							//globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].type = "deleted"
							
							//globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
							//globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
							
							
							globalParams.indexMc.delete_Place (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,tmpParams.cPl);
						}
						
						
					}
				}
			}
			globalParams.indexMc._lands_Roads.pereborRoads (globalParams.indexMc.roadPlaceObject,globalParams.indexMc.roadsArray,globalParams.indexMc.objectsArray);
		
		
		}
		public function remove_from_Cursor_road():Boolean
		{
			
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType == "road")
				{
					for (var ir:int = 0; ir < globalParams.indexMc.roadsArray.length; ir++)
					{
						if (globalParams.indexMc.roadsArray[ir].i == globalParams.indexMc.roadPlaceObject.i && globalParams.indexMc.roadsArray[ir].j == globalParams.indexMc.roadPlaceObject.j) {
							globalParams.indexMc.delete_Place (globalParams.indexMc.roadsArray[ir].i,globalParams.indexMc.roadsArray[ir].j,1);
							
							
							globalParams.indexMc.roadsArray.splice (ir, 1)
							globalParams.indexMc._soundProcessor.playSnd ("sellObject")
						}
					}
					return false
				}
			
			return true;
		}
		//снос объектов
		public function removeObjectFromItself (_inc:Object) {
			
			
			// снос объектов
			var possibleTrigger	:Boolean = true;
				var i				:Number;
								globalParams.indexMc.roadPlaceObject_set(_inc.i,_inc.j)
			
			trace();
			trace(" ________ %%5 снос объектов %%%___________",_inc.i,_inc.j,"   possibleTrigger",possibleTrigger,"   cellType = ",globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType);
			globalParams.indexMc._soundProcessor.playSnd ("sellObject");
			
			// ---------------снос при продаже-- Условия про лавку ------------
			
			if (possibleTrigger)
			{
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType == "lavka")
				{
					
					//продажа старых зданий
					
					//remove_lavka
					possibleTrigger =globalParams.indexMc.remove_lavka(globalParams.indexMc.roadPlaceObject);
					
				}
			}
			trace(" ________ %%5 снос объектов %%%___________",_inc.i,_inc.j,"   possibleTrigger",possibleTrigger,"id",globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id,"     ");
			trace(" ________ %%5 снос объектов %%%|||||||||||",globalParams.indexMc.objectsButtonArray.length,globalParams.indexMc.objectsArray.length,"     ");
			// --------------снос  при продаже--- Условия про декорации ------------
			if (possibleTrigger) {
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType == "decoration") {
					/*
					for (i = 0; i < globalParams.indexMc.objectsButtonArray.length; i++) {
						
						if (globalParams.indexMc.objectsButtonArray[i].id == globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id) {
							
							remove_splice (i)
						}
					}
					*/
					button_search_remove (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j);
					
					globalParams.indexMc.SaleOldBuilding (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType,_inc.productType);
					
					//globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].type = "deleted"
					remove_bottom_building (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j)
					globalParams.indexMc.delete_Place (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,1);
					
					
					//globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
					//globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
					
					
					possibleTrigger = false
				}
			}
			
			//снос здания  при продаже
			
			if (possibleTrigger) {
				var targetType:String = ""
				var tmpParams:Object = attractionClass.getAttracctionParams (globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id])
				
				
				if (tmpParams.Delete) {
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].worker != undefined) {
						
						globalParams.indexMc.systemMessage ("Вы не можете снести здание пока на нем ктото работает, сначала снимите сотрудника.")
					} else {
						
						/*
						for (i = 0; i < globalParams.indexMc.objectsButtonArray.length; i++) {
							if (globalParams.indexMc.objectsButtonArray[i].id == globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id) {
								
								remove_splice (i)
							}
						}
						*/
						button_search_remove (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j);
						
						globalParams.indexMc.Remove_Svetofor(globalParams.indexMc.objectsButtonLayer,globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id);
						
						if (tmpParams.cPl == 1||tmpParams.cPl == 4||tmpParams.cPl == 9) 
						{
							
							//продажа старых зданий
							globalParams.indexMc.SaleOldBuilding (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType,"");
							//globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id].type = "deleted"
							
							//globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
							//globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
							remove_bottom_building (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j)
							
							globalParams.indexMc.delete_Place (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,tmpParams.cPl);
						}
						
						
					}
				}
			}
			
			globalParams.indexMc._lands_Roads.pereborRoads (globalParams.indexMc.roadPlaceObject,globalParams.indexMc.roadsArray,globalParams.indexMc.objectsArray);
		trace();
		trace("objectsButtonArray=",globalParams.indexMc.objectsButtonArray.length,"objectsArray=",globalParams.indexMc.objectsArray.length," ________ %%5 REMOVE   ",globalParams.indexMc.objectsArray);
		get_trace();
		}
		public function remove_bottom_building (i_:int,j_:int):void {
			trace(" 0000________ %%5 снос объектов remove_bottom_building__   id=",globalParams.indexMc.lanscapeArray[i_][j_].id);
			globalParams.indexMc.objectsArray[globalParams.indexMc.lanscapeArray[i_][j_].id].type = "deleted"
			globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[i_][j_].object_mc)
			globalParams.indexMc.lanscapeArray[i_][j_].gr.removeChild (globalParams.indexMc.lanscapeArray[i_][j_].objectBottom_mc)
			
		
		}
		public function button_search_remove (i_:int,j_:int):void {
			for (var i:int = 0; i < globalParams.indexMc.objectsButtonArray.length; i++) {
				if (globalParams.indexMc.objectsButtonArray[i].id == globalParams.indexMc.lanscapeArray[i_][j_].id) {
								
					remove_splice (i)
				}
			}
			
		}
		public function get_trace():void {
			for (var i:int = 0; i < globalParams.indexMc.objectsArray.length; i++) {
				trace(i,"   objectsArray =  ",globalParams.indexMc.objectsArray[i].type,"     ----- ")
			}
		}
		public function remove_splice (num:int):void {
			
			globalParams.indexMc.objectsButtonLayer.removeChild (globalParams.indexMc.objectsButtonArray[num].button)
			globalParams.indexMc.objectsButtonArray.splice (num, 1)
		//globalParams.indexMc.objectsArray[num]="deleted"
		}
	}

}