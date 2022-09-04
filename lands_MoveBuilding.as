package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	import tools.*
	
	public class lands_MoveBuilding extends MovieClip
	{
		//Генератор аттракционов
		public var attractionGenerator:attractionClass	 = new attractionClass ();
		public var _obBtnMc		:MovieClip;
		
		public function MoveBuildiing (attractionParams:Object):void
		{
			
			globalParams.indexMc.objectsButtonArray[globalParams.indexMc.targetObject.id].button.x = - 600;
			var possibleTrigger:Boolean = false;
			
			for (var i = 1 ; i <= globalParams.indexMc.landWidth; i++)
			{
				for (var j = globalParams.indexMc.landHeight; j >= 1; j--)
				{
					var tmpPoint:Point = new Point(0, 0);
					var tmpPoint1:Point;
					tmpPoint1 = globalParams.indexMc.lanscapeArray[i][j].localToGlobal(tmpPoint);
					
					if (!possibleTrigger)
					{
						if (Math.abs (mouseX - tmpPoint1.x) < 50)
						{
							if (Math.abs (mouseY - tmpPoint1.y) < 25)
							{
								globalParams.indexMc.roadPlaceObject = new Object();
								globalParams.indexMc.roadPlaceObject.i = i;
								globalParams.indexMc.roadPlaceObject.j = j;
								possibleTrigger = true;
							}
						}
					}
				}
			}
			
			//var attractionParams = globalParams.indexMc.attractionClass.getAttracctionParams (globalParams.indexMc.targetObject);
			//var attractionParams = attractionGenerator.getAttracctionParams (globalParams.indexMc.targetObject);
			
			if (globalParams.indexMc.prevI == globalParams.indexMc.roadPlaceObject.i && globalParams.indexMc.prevJ == globalParams.indexMc.roadPlaceObject.j)
			{
				possibleTrigger = false;
			}
			
			if (attractionParams.cPl == 1)
			{
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType != "grass")
				{
					possibleTrigger = false
				}
			}
			if (attractionParams.cPl == 4)
			{
				if (possibleTrigger)
				{
					possibleTrigger = false
						if (_et_Fn(0,1,3)) {
							if (_et_Fn(-1,1,3)) {
									if (_et_Fn(-1,0,3)) {
									possibleTrigger = true
								}
							}
						}
				}
			}
			
			if (attractionParams.cPl == 9) {
				if (possibleTrigger) {
					possibleTrigger = false
						trace("_et_",_et_Fn(0,1,8));
						if (_et_Fn(0,1,8)) {
							if (_et_Fn(0,2,8)) {
								if (_et_Fn(-1,0,8)) {
									if (_et_Fn(-1,1,8)) {
										if (_et_Fn(-1,2,8)) {
											if (_et_Fn(-2,0,8)) {
												if (_et_Fn(-2,1,8)) {
													if (_et_Fn(-2,2,8)) {
														possibleTrigger = true
													}
												}
											}
										}
									}
								}
							}
						}
				}
			}
			
			if (globalParams.indexMc.prevI == -500003) {
				possibleTrigger = false
			}
			
			var tmpObjectMc:MovieClip
			var tmpObject_bottomMc:MovieClip 
			tmpPoint1 = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].localToGlobal (tmpPoint)
			_obBtnMc.x = tmpPoint1.x
			_obBtnMc.y = tmpPoint1.y
			
			// ----------------- Условия про cPl == 1 ------------
			if (possibleTrigger) {
				
				if (attractionParams.cPl == 1)
				{
					tmpObjectMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc
					tmpObject_bottomMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc
				
					
					globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc)
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].gr.removeChild(globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc)
					
					
					globalParams.indexMc.delete_Place (globalParams.indexMc.prevI,globalParams.indexMc.prevJ,1);
					// ВОсстановление визуала
					globalParams.indexMc.targetObject.i = globalParams.indexMc.roadPlaceObject.i
					globalParams.indexMc.targetObject.j = globalParams.indexMc.roadPlaceObject.j
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType = globalParams.indexMc.targetObject.type
					
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc = tmpObjectMc
					globalParams.indexMc.landscape.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc = tmpObject_bottomMc
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
					
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].decoMc.visible = false
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.gotoAndStop (1)
					
					
					
					globalParams.indexMc.prevI = globalParams.indexMc.roadPlaceObject.i
					globalParams.indexMc.prevJ = globalParams.indexMc.roadPlaceObject.j
					
					tmpPoint1 = globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].localToGlobal (tmpPoint)
					_obBtnMc.x = tmpPoint1.x
					_obBtnMc.y = tmpPoint1.y
					possibleTrigger = false
				}
				
				if (attractionParams.cPl == 4) {
					
					
					tmpObjectMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc
					tmpObject_bottomMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc
				
					
					globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc)
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc)
					globalParams.indexMc.delete_Place (globalParams.indexMc.prevI,globalParams.indexMc.prevJ,4);
					
					// ВОсстановление визуала
					globalParams.indexMc.targetObject.i = globalParams.indexMc.roadPlaceObject.i
					globalParams.indexMc.targetObject.j = globalParams.indexMc.roadPlaceObject.j
										
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc = tmpObjectMc
					globalParams.indexMc.landscape.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc = tmpObject_bottomMc
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].decoMc.visible = false
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.gotoAndStop ("singleBoxFoundament")
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType = globalParams.indexMc.targetObject.type
															
					delete_Foundament (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,3);
					
					globalParams.indexMc.prevI = globalParams.indexMc.roadPlaceObject.i
					globalParams.indexMc.prevJ = globalParams.indexMc.roadPlaceObject.j
					
					possibleTrigger = false
				}
				if (attractionParams.cPl == 9) {
					
					
					tmpObjectMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc
					tmpObject_bottomMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc
				
					if (globalParams.indexMc.landscape.contains(globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc)) {
						
						globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc);
						globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc)
						
					}
					
					
					
					
					globalParams.indexMc.delete_Place (globalParams.indexMc.prevI,globalParams.indexMc.prevJ,9);
					
					
					
					// ВОсстановление визуала
					globalParams.indexMc.targetObject.i = globalParams.indexMc.roadPlaceObject.i
					globalParams.indexMc.targetObject.j = globalParams.indexMc.roadPlaceObject.j
					
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc = tmpObjectMc
					globalParams.indexMc.landscape.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].object_mc)
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc = tmpObject_bottomMc
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].objectBottom_mc)
					
					
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].cellType = globalParams.indexMc.targetObject.type
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].decoMc.visible = false
					globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].gr.gotoAndStop ("singleBoxFoundament")
					
					delete_Foundament (globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,globalParams.indexMc.roadPlaceObject.i,globalParams.indexMc.roadPlaceObject.j,9);
					
					globalParams.indexMc.prevI = globalParams.indexMc.roadPlaceObject.i
					globalParams.indexMc.prevJ = globalParams.indexMc.roadPlaceObject.j
					
					possibleTrigger = false
				}
				globalParams.indexMc.targetObject.i = globalParams.indexMc.roadPlaceObject.i
				globalParams.indexMc.targetObject.j = globalParams.indexMc.roadPlaceObject.j
				globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i][globalParams.indexMc.roadPlaceObject.j].id = globalParams.indexMc.targetObject.id
			}
		}
		public function killMovementAndCancel (e:MouseEvent)
		{
			var tmpObjectMc:MovieClip
			var tmpObject_bottomMc:MovieClip 
			var attractionParams = attractionClass.getAttracctionParams (globalParams.indexMc.targetObject)
			
			tmpObjectMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc
			tmpObject_bottomMc = globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc
			
			
			globalParams.indexMc.landscape.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].object_mc)
					
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].gr.removeChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevI][globalParams.indexMc.prevJ].objectBottom_mc)
			
			
			
			globalParams.indexMc.delete_Place (globalParams.indexMc.prevI,globalParams.indexMc.prevJ,attractionParams.cPl);
			
			// ВОсстановление визуала
			
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].object_mc = tmpObjectMc
			globalParams.indexMc.landscape.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].object_mc)
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].objectBottom_mc = tmpObject_bottomMc
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].gr.addChild (globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].objectBottom_mc)
			
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].cellType = globalParams.indexMc.targetObject.type
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].decoMc.visible = false
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].gr.gotoAndStop (1)
			
			if (attractionParams.cPl == 1) {
			
			}
			if (attractionParams.cPl == 4) {
				delete_Foundament (globalParams.indexMc.prevI,globalParams.indexMc.prevJ,globalParams.indexMc.prevSI,globalParams.indexMc.prevSJ,3)
				
			}
			if (attractionParams.cPl == 9) {
				delete_Foundament (globalParams.indexMc.prevI,globalParams.indexMc.prevJ,globalParams.indexMc.prevSI,globalParams.indexMc.prevSJ,9);
					
			}
			globalParams.indexMc.lanscapeArray[globalParams.indexMc.prevSI][globalParams.indexMc.prevSJ].id = globalParams.indexMc.targetObject.id
			
			globalParams.indexMc.targetObject.i = globalParams.indexMc.prevSI
			globalParams.indexMc.targetObject.j =globalParams.indexMc. prevSJ
			
			globalParams.indexMc.landscape.x++
			globalParams.indexMc._lands_Sort.sortObjectsButtonsFn (globalParams.indexMc.objectsButtonArray,globalParams.indexMc.botButtonArray)
			globalParams.indexMc.removeChild (_obBtnMc)
			globalParams.indexMc.removeEventListener (Event.ENTER_FRAME, globalParams.indexMc.OEFMoveBuildiing)
		}
		public function killMovement (e:MouseEvent)
		{
			globalParams.indexMc.landscape.x++
			globalParams.indexMc._lands_Sort.sortObjectsButtonsFn (globalParams.indexMc.objectsButtonArray,globalParams.indexMc.botButtonArray)
			globalParams.indexMc.removeChild (_obBtnMc)
			globalParams.indexMc.removeEventListener (Event.ENTER_FRAME, globalParams.indexMc.OEFMoveBuildiing)
			globalParams.indexMc._soundProcessor.playSnd ("buildingPlace")
		}
		
		public function obm_moveObjectFunction (_incTargetObject:Object)
		{
			var possibleTrigger:Boolean = false;
			var tmpPoint:Point = new Point(0, 0);
			var tmpPoint1:Point;
			globalParams.indexMc.targetObject = _incTargetObject;
			
			tmpPoint1 = globalParams.indexMc.lanscapeArray[globalParams.indexMc.targetObject.i][globalParams.indexMc.targetObject.j].localToGlobal(tmpPoint);
			
			globalParams.indexMc.prevI = globalParams.indexMc.targetObject.i;
			globalParams.indexMc.prevJ = globalParams.indexMc.targetObject.j;
			
			globalParams.indexMc.prevSI = globalParams.indexMc.targetObject.i;
			globalParams.indexMc.prevSJ = globalParams.indexMc.targetObject.j;
			globalParams.indexMc.moveTrigger = true;
			
			_obBtnMc = new obBtnMc();
			//_obBtnMc.scaleX = .5;
			//_obBtnMc.scaleY = .5;
			_obBtnMc.x = tmpPoint1.x;
			_obBtnMc.y = tmpPoint1.y;
			_obBtnMc.okBtn.addEventListener (MouseEvent.CLICK, killMovement);
			_obBtnMc.cancelBtn.addEventListener (MouseEvent.CLICK, killMovementAndCancel);
			globalParams.indexMc.addChild (_obBtnMc);
			globalParams.indexMc.addEventListener (Event.ENTER_FRAME, globalParams.indexMc.OEFMoveBuildiing);
		}
		public function delete_Foundament (_prevI:int,_prevJ:int,_prevSI:int,_prevSJ:int,Num:int):void
		{
			var X_Place:Array =[0,-1,-1,0,0,-1,-2,-2,-2];
			var Y_Place:Array =[1,1,0,0,2,2,0,1,2];
			
			for (var i_:int = 0; i_ < Num; i_++) {
				trace("i_",i_);
				var Num_str:int = 2+i_;
				globalParams.indexMc.lanscapeArray[_prevI+X_Place[i_]][_prevJ+Y_Place[i_]].cellType = globalParams.indexMc.targetObject.type + "_et_"+Num_str;
				globalParams.indexMc.lanscapeArray[_prevSI+X_Place[i_]][_prevSJ+Y_Place[i_]].decoMc.visible = false
				globalParams.indexMc.lanscapeArray[_prevSI+X_Place[i_]][_prevSJ+Y_Place[i_]].gr.gotoAndStop ("singleBoxFoundament")
			}
					
		}
		
		public function _et_Fn (X_Num:int,Y_Num:int,CycleL:int):Boolean
		{
			
			//var X_tile:Array =[0,-1,-1];
			//var Y_tile:Array =[1, 1 ,0];
			
			if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i+X_Num][globalParams.indexMc.roadPlaceObject.j + Y_Num].cellType == "grass") {
				return true;
			}
			if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i+X_Num][globalParams.indexMc.roadPlaceObject.j + Y_Num].cellType == globalParams.indexMc.targetObject.type) {
				return true;
			}
			
			for (var i_ = 0; i_ < CycleL; i_++) {
				var koef_2:int=2+i_
				if (globalParams.indexMc.lanscapeArray[globalParams.indexMc.roadPlaceObject.i+X_Num][globalParams.indexMc.roadPlaceObject.j + Y_Num].cellType==globalParams.indexMc.targetObject.type + "_et_"+koef_2) 
				{
					return true;
				}
			}
			
			return false;
		}
		
	}

}