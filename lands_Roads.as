package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	import tools.*
	/**
	 * ...
	 * @author Mutagen
	 */
	public class lands_Roads extends MovieClip
	{
		//Генератор аттракционов
				// attractionGenerator:attractionClass	 = new attractionClass ();
		
		public function pereborRoads (roadPlaceObject,roadsArray,objectsArray) {
			var tmpObject:Object = new Object ()
			var j:int;
			var k:int;
			var attractionsParams:Object;
			for (j = 0; j < objectsArray.length; j ++) {
				attractionsParams = attractionClass.getAttracctionParams (objectsArray[j])
					
				tmpObject.i = objectsArray[j].i 
				tmpObject.j = objectsArray[j].j 
				tmpObject.objectBottom_mc = objectsArray[j].objectBottom_mc
					
				if (attractionsParams.attractionTrigger) {
					if (attractionsParams.cPl == 4) {
							if (attractionsParams.et_1) {
								tmpObject.id = 1
								setupAttraction2x2 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_2) {
								tmpObject.id = 2
								tmpObject.j = tmpObject.j + 1
								setupAttraction2x2 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_3) {
								tmpObject.id = 3
								tmpObject.i = tmpObject.i - 1
								tmpObject.j = tmpObject.j + 1
								setupAttraction2x2 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_4) {
								tmpObject.id = 4
								tmpObject.i = tmpObject.i - 1
								tmpObject.j = tmpObject.j
								setupAttraction2x2 (objectsArray[j], tmpObject,roadsArray)
							}
					}
					if (attractionsParams.cPl == 9) {
							if (attractionsParams.et_1) {
								tmpObject.id = 1
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_2) {
								tmpObject.id = 2
								tmpObject.j = tmpObject.j + 1
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_3) {
								tmpObject.id = 3
								tmpObject.j = tmpObject.j + 2
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							
							if (attractionsParams.et_4) {
								tmpObject.id = 4
								tmpObject.i = tmpObject.i - 1
								tmpObject.j = tmpObject.j
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							
							if (attractionsParams.et_5) {
								tmpObject.id = 5
								tmpObject.i = tmpObject.i - 1
								tmpObject.j = tmpObject.j + 1
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_6) {
								tmpObject.id = 6
								tmpObject.i = tmpObject.i - 1
								tmpObject.j = tmpObject.j + 2
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_7) {
								tmpObject.id = 7
								tmpObject.i = tmpObject.i - 2
								tmpObject.j = tmpObject.j
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_8) {
								tmpObject.id = 8
								tmpObject.i = tmpObject.i - 2
								tmpObject.j = tmpObject.j + 1
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
							if (attractionsParams.et_9) {
								tmpObject.id = 9
								tmpObject.i = tmpObject.i - 2
								tmpObject.j = tmpObject.j + 2
								setupAttraction3x3 (objectsArray[j], tmpObject,roadsArray)
							}
					}
				}
			}
			
			for (var i = 0; i < roadsArray.length; i++) {
				//globalParams.indexMc._lands_UpdateRoads.updateRoads (roadsArray[i].i, roadsArray[i].j)
				
				for (j = 0; j < objectsArray.length; j++) {
						//только лавка
						if (objectsArray[j].type == "lavka") {
							if (objectsArray[j].i >= roadPlaceObject.i -1 && objectsArray[j].i <= roadPlaceObject.i + 1 && objectsArray[j].j == roadPlaceObject.j) {
								if (objectsArray[j].i == roadsArray[i].i && objectsArray[j].j == roadsArray[i].j) {
									
									setupLavka (objectsArray[j], objectsArray[j],roadPlaceObject)
								}
							}
							if (objectsArray[j].j >= roadPlaceObject.j -1 && objectsArray[j].j <= roadPlaceObject.j + 1 && objectsArray[j].i == roadPlaceObject.i) {
								if (objectsArray[j].i == roadsArray[i].i && objectsArray[j].j == roadsArray[i].j) {
									setupLavka (objectsArray[j], objectsArray[j],roadPlaceObject)
								}
							}
						}
					
				}
			}
		}
		public function setupAttraction2x2 (_obj:Object, _obj2:Object,roadsArray) {
			var attractionParams:Object = attractionClass.getAttracctionParams (_obj)
			var i:int = 0
			
			_obj.objectBottom_mc["border_"+_obj2.id].visible = true
			_obj.objectBottom_mc["panel_" + _obj2.id].visible = false
			for (i = 0; i < roadsArray.length; i++) {
				if (roadsArray[i].i == _obj2.i + 1 && roadsArray[i].j == _obj2.j || roadsArray[i].i == _obj2.i - 1 && roadsArray[i].j == _obj2.j) {
					_obj.objectBottom_mc["border_" + _obj2.id].visible = false
					_obj.objectBottom_mc["panel_" + _obj2.id].visible = true
				}
				if (roadsArray[i].j == _obj2.j + 1  && roadsArray[i].i == _obj2.i || roadsArray[i].j == _obj2.j - 1  && roadsArray[i].i == _obj2.i) {
					_obj.objectBottom_mc["border_" + _obj2.id].visible = false
					_obj.objectBottom_mc["panel_" + _obj2.id].visible = true
				}
			}
		}
		
		public function setupAttraction3x3 (_obj:Object, _obj2:Object,roadsArray) {
			var attractionParams:Object = attractionClass.getAttracctionParams (_obj)
			var i:int = 0
			
			_obj.objectBottom_mc["border_"+_obj2.id].visible = true
			_obj.objectBottom_mc["panel_" + _obj2.id].visible = false
			for (i = 0; i < roadsArray.length; i++) {
				if (roadsArray[i].i == _obj2.i + 1 && roadsArray[i].j == _obj2.j || roadsArray[i].i == _obj2.i - 1 && roadsArray[i].j == _obj2.j) {
					_obj.objectBottom_mc["border_" + _obj2.id].visible = false
					_obj.objectBottom_mc["panel_" + _obj2.id].visible = true
				}
				if (roadsArray[i].j == _obj2.j + 1  && roadsArray[i].i == _obj2.i || roadsArray[i].j == _obj2.j - 1  && roadsArray[i].i == _obj2.i) {
					_obj.objectBottom_mc["border_" + _obj2.id].visible = false
					_obj.objectBottom_mc["panel_" + _obj2.id].visible = true
				}
			}
		}
		//Настройка лавки
		public function setupLavka (_obj:Object, _obj2:Object,roadPlaceObject_:Object)
		{
			for (var i3:int = 1; i3 < 9; i3++)
			{
				_obj.objectBottom_mc["m_"+i3].visible = false
			}
				
				
			//_obj.objectBottom_mc.m_1.visible = false
			//_obj.objectBottom_mc.m_2.visible = false
			//_obj.objectBottom_mc.m_3.visible = false
			//_obj.objectBottom_mc.m_4.visible = false
			//_obj.objectBottom_mc.m_5.visible = false
			//_obj.objectBottom_mc.m_6.visible = false
			//_obj.objectBottom_mc.m_7.visible = false
			//_obj.objectBottom_mc.m_8.visible = false
			
			//орпеделяет видимость лавок на дороге (в зависимости с какой стороны подходит дорога)
			if (_obj2.i < globalParams.indexMc.landWidth) 
			{
				if (globalParams.indexMc.lanscapeArray[_obj2.i + 1][_obj2.j].cellType == "grass" || globalParams.indexMc.lanscapeArray[_obj2.i + 1][_obj2.j].cellType == "decoration")
				{
					_obj.objectBottom_mc.lRdn.visible = true
					_obj.objectBottom_mc.lRup.visible = true
					_obj.m_5 = false
					_obj.m_6 = false
				}
				else
				{
					_obj.objectBottom_mc.lRdn.visible = false
					_obj.objectBottom_mc.lRup.visible = false
					_obj.m_5 = true
					_obj.m_6 = true
				}
			}
			
			if (_obj2.i > 1) {
				if (globalParams.indexMc.lanscapeArray[_obj2.i - 1][_obj2.j].cellType == "grass" || globalParams.indexMc.lanscapeArray[_obj2.i - 1][_obj2.j].cellType == "decoration") {
					_obj.objectBottom_mc.lLdn.visible = true
					_obj.m_2 = false
					_obj.m_1 = false
				} else {
					_obj.objectBottom_mc.lLdn.visible = false
					_obj.m_2 = true
					_obj.m_1 = true
				}
			}
			if (_obj2.j < globalParams.indexMc.landHeight) {
				if (globalParams.indexMc.lanscapeArray[_obj2.i][_obj2.j+1].cellType == "grass" || globalParams.indexMc.lanscapeArray[_obj2.i][_obj2.j+1].cellType == "decoration") {
					_obj.objectBottom_mc.lUdn.visible = true
					_obj.m_3 = false
					_obj.m_4 = false
				} else {
					_obj.objectBottom_mc.lUdn.visible = false
					_obj.m_3 = true
					_obj.m_4 = true
				}
			}
			
			if (_obj2.j > 1) {
				if (globalParams.indexMc.lanscapeArray[_obj2.i][_obj2.j - 1] != undefined) {
					if (globalParams.indexMc.lanscapeArray[_obj2.i][_obj2.j - 1].cellType == "grass" || globalParams.indexMc.lanscapeArray[_obj2.i][_obj2.j - 1].cellType == "decoration") {
						_obj.objectBottom_mc.lDdn.visible = true
						_obj.objectBottom_mc.LDup.visible = true
						_obj.m_7 = false
						_obj.m_8 = false
					} else {
						_obj.objectBottom_mc.lDdn.visible = false
						_obj.objectBottom_mc.LDup.visible = false
						_obj.m_7 = true
						_obj.m_8 = true
					}
				}
			}
			//Делать невидимыми лавки на перекрестке, если лавка находится со стороны входа дороги (лавки нет)
			
			for (var i = 0 ; i < globalParams.indexMc.objectsButtonArray.length; i++) {
				
				if (globalParams.indexMc.objectsButtonArray[i].id == _obj.objectBottom_mc.id) {
					//trace("    lands_Roads __i=",i,"_",globalParams.indexMc.objectsButtonArray.length);
					//trace("    lands_Roads __i=",globalParams.indexMc.objectsButtonArray[i].button,"_");
					if (globalParams.indexMc.objectsButtonArray[i].button.button!=undefined) {
					
					//trace("    lands_Roads __i=",globalParams.indexMc.objectsButtonArray[i].button.button,"_");
					//trace("    lands_Roads __i=",globalParams.indexMc.objectsButtonArray[i].button.button.lRdn,"_");
						globalParams.indexMc.objectsButtonArray[i].button.button.lRdn.visible = _obj.objectBottom_mc.lRdn.visible
					
						globalParams.indexMc.objectsButtonArray[i].button.button.lDdn.visible = _obj.objectBottom_mc.lDdn.visible
						
						globalParams.indexMc.objectsButtonArray[i].button.button.lLdn.visible = _obj.objectBottom_mc.lLdn.visible
					
						globalParams.indexMc.objectsButtonArray[i].button.button.lUdn.visible = _obj.objectBottom_mc.lUdn.visible
					}
				
				}
			}
		
		//костыль
		
		for (var i2 = 0 ; i2 < globalParams.indexMc.objectsButtonArray.length; i2++) {
			if (globalParams.indexMc.objectsButtonArray[i2].id == _obj.objectBottom_mc.id) {
				//trace("    lands_Roads __костыль i=",globalParams.indexMc.objectsButtonArray[i2].button,"_");
				if (globalParams.indexMc.objectsButtonArray[i2].button.button!=undefined) {
				if (globalParams.indexMc.objectsButtonArray[i2].button.button.lRdn.visible ==false&&globalParams.indexMc.objectsButtonArray[i2].button.button.lDdn.visible==false&&globalParams.indexMc.objectsButtonArray[i2].button.button.lLdn.visible==false&&globalParams.indexMc.objectsButtonArray[i2].button.button.lUdn.visible==false) {
					trace("_костыль сработал_");
					
					//здесь должна быть команда по уничтожению лавки и начислению денег, вернусь в свободное время
					//удалить лавку
					//globalParams.indexMc.remove_lavka (roadPlaceObject_);
				}
				}
			}
		
		}
		
		}
	}

}