package tools 
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*
	/**
	 * ...
	 * @author ...
	 */
	public class park_menue extends MovieClip 
	{
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		public function park_menue() 
		{
			this.addEventListener (MouseEvent.MOUSE_OVER, onMouseOverHandler)
			this.addEventListener (MouseEvent.MOUSE_OUT, onMouseOutHandler)
			this.addEventListener (MouseEvent.ROLL_OUT, onMouseOutHandler)
			//roadBtn.addEventListener (MouseEvent.CLICK, placeRoad)
			//buildingBtn.addEventListener (MouseEvent.CLICK, showBuildingSelectInterface)
			workerBtn.addEventListener (MouseEvent.CLICK, showWorkerInterface)
			workerBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			workerBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			workerBtn.Help = "Ваши сотрудники";
			
			marketBtn.addEventListener (MouseEvent.CLICK, showMarketInterface)
			marketBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			marketBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			marketBtn.Help = "Нанять сотрудников";
			
			
			attractionsBtn.addEventListener (MouseEvent.CLICK, showAttractionInterface)
			attractionsBtn.addEventListener (MouseEvent.MOUSE_OVER, Add_Help_Menu);
			attractionsBtn.addEventListener (MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			attractionsBtn.Help = "Ваши постройки";
		
		}
		public function Add_Help_Menu (event:MouseEvent) {
			Bubble_Help_mc.x = mouseX+15;
			Bubble_Help_mc.y = mouseY-15;
			Bubble_Help_mc.helpText.text = " "+event.currentTarget.Help;
			addChild(Bubble_Help_mc);
			
		}
		public function Remove_Help_Menu (e:MouseEvent) {
			if (contains(Bubble_Help_mc)) {
				removeChild(Bubble_Help_mc);
			}
			
		}
		
		//Ваши сотрудники
		public function showWorkerInterface (e:MouseEvent) {
			
			globalParams.indexMc._land_personalMenu.showPersonalMenue (e)
		}
		//Нанять сотрудников
		public function showMarketInterface (e:MouseEvent) {
			globalParams.indexMc._land_personalMenu.showWorkerMarketMenue (e)
		}
		//Ваши постройки
		public function showAttractionInterface (e:MouseEvent) {
			
			globalParams.indexMc._land_personalMenu.showAttractionListMenue (e)
		}
		// АНИМАЦИЯ
		private var wayTrigger:Boolean = false
		public function onMouseOverHandler (e:MouseEvent) {
			
			//var _HelpBubble:HelpBubble = new HelpBubble();
			//addChild(_HelpBubble);
			wayTrigger = true
			var topPosition:uint = globalParams.indexMc.numChildren - 1;
			//globalParams.indexMc.setChildIndex(globalParams.indexMc._park_menue, topPosition);
		globalParams.indexMc.setChildIndex(globalParams.indexMc._lands_Interface, topPosition);
		}
		public function onMouseOutHandler (e:MouseEvent) {
			
			wayTrigger = false
		}
		public function update () {
			if (wayTrigger) {
				this.nextFrame ()
			} else {
				this.prevFrame ()
			}
		}
	}

}