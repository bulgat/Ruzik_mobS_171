package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import tools.*;
	
	public class land_building_cancel extends MovieClip
	{
		
		public var _cancelButton:MovieClip
		public function cancelCheck():void
		{
			
			if (_cancelButton == null) {
				if (globalParams.indexMc.removeObjectTrigger || globalParams.indexMc.placeRoadTrigger || globalParams.indexMc.placeObjectTrigger) {
					_cancelButton = new button_red ()
					//_cancelButton.x = globalParams.indexMc._building_menue.x - 15
					//_cancelButton.y = globalParams.indexMc._building_menue.y - 44
					_cancelButton.addEventListener (MouseEvent.CLICK, killRemoveObjectAction)
					_cancelButton.label="отменить";
					addChild (_cancelButton)
				} else {
				}
			} else {
				if (globalParams.indexMc.removeObjectTrigger || globalParams.indexMc.placeRoadTrigger || globalParams.indexMc.placeObjectTrigger) {
				} else {
					this.removeChild (_cancelButton)
					_cancelButton = null
				}
			}
		
		}
		public function killRemoveObjectAction (e:MouseEvent) {
			
			globalParams.indexMc._soundProcessor.playSnd ("click")
			globalParams.indexMc.clearObjectPlacement ()
			globalParams.indexMc.removeObjectTrigger = false
			globalParams.indexMc.placeRoadTrigger = false
			globalParams.indexMc.placeObjectTrigger = false
			removeChild (_cancelButton)
			_cancelButton = null
		
		}
		


	}

}