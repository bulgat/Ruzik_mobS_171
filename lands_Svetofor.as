package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	import tools.*
	
	public class lands_Svetofor extends MovieClip
	{
		////////////////////////////Таймер построек/////////////////////////////////////////
		public function if_MenueShowedUpdater (objectsArray:Array)
		{
			//Если существует ОбджектМеню
			if (globalParams.indexMc._objectMenue != null)
			{
				//Если видим лейбл у его виндова
				if (globalParams.indexMc._objectMenue.windowMc.ccLable.visible)
				{
					//Если статус «Есть работник»
					if (objectsArray[globalParams.indexMc._objectMenue.id].statusObject && 
						objectsArray[globalParams.indexMc._objectMenue.id].statusObject.status != "noWorker")
					{
						//Параметры аттракциона
						var attractionParams:Object = attractionClass.getAttracctionParams(objectsArray[globalParams.indexMc._objectMenue.id]);
						
						//Присвоить текст
						//Это сейчас не важно
						globalParams.indexMc._objectMenue.windowMc.ccLable.ccText.text = objectsArray[globalParams.indexMc._objectMenue.id].cc + "/" + attractionParams.maxProfit;
																				
						//текс вребя до прибыли, сколько осталось
						
						globalParams.indexMc._objectMenue.windowMc.ptLable.ptText.text =globalParams._handle_time.sek_timer(int(attractionParams.profitTime-earningBuild(objectsArray[globalParams.indexMc._objectMenue.id].statusObject)))
						
						
						//текст прочность здания
						
						if (objectsArray[globalParams.indexMc._objectMenue.id].statusObject.status == "repair") {
							globalParams.indexMc._objectMenue.windowMc.dmgLable.ptText.text = "-ремонт-"
						} else {
							globalParams.indexMc._objectMenue.windowMc.dmgLable.ptText.text = strengthBuild(objectsArray[globalParams.indexMc._objectMenue.id].statusObject)+" ед."
						}
						globalParams.indexMc._objectMenue.windowMc.dmgLable.strength.preMask.scaleX = strengthBuild(objectsArray[globalParams.indexMc._objectMenue.id].statusObject)/objectsArray[globalParams.indexMc._objectMenue.id].statusObject.repairInterval;
					}
				}
				///////////////////////////////////////Конец функции///////////////////////////////
				
				//globalParams.indexMc._objectMenue.windowMc.headerText.text = attractionClass.getName (objectsArray[globalParams.indexMc._objectMenue.id].type, objectsArray[globalParams.indexMc._objectMenue.id].productType) + " - " +  ".   - " + globalParams.getFreePlaces_obj (objectsArray[globalParams.indexMc._objectMenue.id]) + "h"
			
			var dmg:int=mendingBuild(objectsArray[globalParams.indexMc._objectMenue.id].statusObject)
			//trace( " rrd ",dmg,"____",objectsArray[globalParams.indexMc._objectMenue.id].statusObject.repairtime,"/20=",objectsArray[globalParams.indexMc._objectMenue.id].statusObject.repairtime / 20,"    streng",strengthBuild(objectsArray[globalParams.indexMc._objectMenue.id].statusObject),"/",objectsArray[globalParams.indexMc._objectMenue.id].statusObject.repairInterval,"    table= ",globalParams.onGetAdminTableArray[objectsArray[globalParams.indexMc._objectMenue.id].type].repairtime)
			}
		}
		public function earningBuild(statusObject:Object):Number {
			if (statusObject.sst is Number==false) {
				statusObject.sst = globalParams.UnixTime_Global;
			}
			var ret_sst:Number=globalParams.UnixTime_Global-statusObject.sst
			return ret_sst;
		}
		public function strengthBuild(statusObject:Object):Number {
			if (statusObject.lrd is Number==false) {
				
				statusObject.lrd = globalParams.UnixTime_Global;
			
			}
			var ret_lrd:Number=globalParams.UnixTime_Global-statusObject.lrd
			var strength:Number = statusObject.repairInterval-ret_lrd
			//if (statusObject.repairtime<=0) {
				//statusObject.repairtime=1800
			//}
			if (strength<0) {
				strength = 0;
			}
			
			return strength;
		}
		public function mendingBuild(statusObject:Object):Number {
			//trace("/--",statusObject)
			var ret_rrd:Number;
			if (statusObject!=null) {
				if (statusObject.rrd is Number==false) {
					statusObject.rrd = globalParams.UnixTime_Global;
				
				}
				if (statusObject.repairtime==undefined) {
					statusObject.repairtime=180
				}
				ret_rrd=globalParams.UnixTime_Global-statusObject.rrd
			}
			
			
			return ret_rrd;
		}
		
		public function updateSvetofors ():void
		{
				
				for (var k:int = 0; k < globalParams.indexMc.svetoforArray.length; k++) {
					//trace("  updateSvetofors  ",k,"  id ",svetoforArray[k].id,"  l= ",objectsArray.length);
					//var attractionParams:Object = attractionClass.getAttracctionParams (objectsArray[svetoforArray[k].id])
					//trace("  updateSvetofors  щио ",objectsArray[svetoforArray[k].id].statusObject);
					attractionClass.getAttracctionParams (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id])
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "noWorker") {
						globalParams.indexMc.svetoforArray[k].gotoAndStop ("noWorker")
						globalParams.indexMc.svetoforArray[k].visible = true
					}
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "cashCollected") {
						
						globalParams.indexMc.svetoforArray[k].gotoAndStop ("cashCollected")
						globalParams.indexMc.svetoforArray[k].visible = true
						if (!globalParams.indexMc._lands_Possibility.Road_Possibility(globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].i, globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].j,globalParams.indexMc.lanscapeArray,globalParams.Building_Basa_Params[globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].type].Size))
						{
							
							globalParams.indexMc.svetoforArray[k].visible = false;
							globalParams.indexMc.ResetCashCollect(globalParams.indexMc.svetoforArray[k].id);
						}
					
					}
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "broken") {
						globalParams.indexMc.svetoforArray[k].gotoAndStop ("broken")
						globalParams.indexMc.svetoforArray[k].visible = true
					}
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "repair") {
						globalParams.indexMc.svetoforArray[k].gotoAndStop ("repair")
						globalParams.indexMc.svetoforArray[k].visible = true
					}
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "game") {
						globalParams.indexMc.svetoforArray[k].visible = true
						globalParams.indexMc.svetoforArray[k].gotoAndStop ("game")
					}
					
					//светофор должен стать невидимым
					if (globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "open"||globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status == "") {
						
						//svetoforArray[k].gotoAndStop ("open")
						globalParams.indexMc.svetoforArray[k].visible = false
						
					}
					
					//trace("status =",globalParams.indexMc.objectsArray[globalParams.indexMc.svetoforArray[k].id].statusObject.status)
					if (globalParams.friendsParkTrigger) {
						globalParams.indexMc.svetoforArray[k].visible = false
					}
					
				}
		
		}
		public function inspectAttractions ():void {
			//просмотр всех атракционов и добавление значка прибыли если время пришло
			for (var i = 0; i < globalParams.indexMc.objectsArray.length; i ++) {
				var attractionParams:Object = attractionClass.getAttracctionParams (globalParams.indexMc.objectsArray[i])
				if (attractionParams.attractionTrigger) {
					attractionClass.calculateProfit (globalParams.indexMc.objectsArray[i], attractionParams)
				}
			}
		}
	
	
	}

}