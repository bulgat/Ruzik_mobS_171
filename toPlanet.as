package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.Event;
	public class toPlanet extends MovieClip {
		
		var expand:Boolean;
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		var Help:String;
		var Goto_planet:int
		public function Launch(groundSkin:String) {
			
			
			var namePlanet:String
			
				visible=globalParams.ironPlanet
			
			if (groundSkin=='metal') {
				visible=true
			}
			if (groundSkin=='green') {
				gotoAndStop(2);
				Goto_planet = 1
				namePlanet="Железяка"
				//var planet:int = G_planet =0
			} else {
				gotoAndStop(1);
				Goto_planet = 0;
				//var planet:int = G_planet =1
				namePlanet="Земля"
			}
			Bubble_Help_mc.gotoAndStop(2);
			
			//addEventListener(MouseEvent.CLICK, clickH);
			buttonMode = true;
			useHandCursor = true;
			
			addEventListener(MouseEvent.MOUSE_OVER, Add_Help_Menu);
			addEventListener(MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			addEventListener(MouseEvent.CLICK, planet_click);
			Help = "Переход на планету "+namePlanet;
			//trace("######################          planet =",globalParams.ironPlanet,"       groundSkin = ",groundSkin);
		}
		
		
		public function Add_Help_Menu (e:MouseEvent) {
			Bubble_Help_mc.x = mouseX+15;
			Bubble_Help_mc.y = mouseY-15;
			Bubble_Help_mc.helpText.text = " "+e.currentTarget.Help;
			addChild(Bubble_Help_mc);
			
		}
		public function Remove_Help_Menu (e:MouseEvent) {
			if (contains(Bubble_Help_mc)) {
				removeChild(Bubble_Help_mc);
			}
			
		}
		private function planet_click(e:MouseEvent):void
		{
			trace("   planet_click    ",globalParams.indexMc.groundSkin)
			globalParams.indexMc._soundProcessor.playSnd ("goToFriendPark")
			if (globalParams.indexMc.groundSkin=='green') {
				gotoAndStop(2);
				Goto_planet = 1
				//var planet:int = G_planet =0
			} else {
				gotoAndStop(1);
				Goto_planet = 0;
				//var planet:int = G_planet =1
			}
			
			
			//globalParams.indexMc.planet_shift(Goto_planet)
			globalParams.indexMc.RemovePark();
			//if (!globalParams.alone) {
				if (!globalParams.friendsParkTrigger) {
					//переход в свою планету
					globalParams.indexMc._getSavedGames.load_init(globalParams.UID,globalParams.GET_RATING,0,Goto_planet);
				} else {
					//переход на планету друга
					globalParams.indexMc._getSavedGames.load_init(globalParams.FRIEND_UID,globalParams.GET_RATING,0,Goto_planet);
				}
			//} else {
				
			//}
			
		}
		
	}
	
}
