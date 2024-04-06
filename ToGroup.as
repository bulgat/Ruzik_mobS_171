package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.Event;
	public class ToGroup extends MovieClip {
		
		var expand:Boolean;
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		
		public function ToGroup(Hight:int) {
			
			this.x = 194;
			this.y = Hight - 80;
			//this.y = 520;
			
			
			group.addEventListener(MouseEvent.CLICK, clickH);
			group.buttonMode = true;
			group.useHandCursor = true;
			//group.addEventListener(MouseEvent.MOUSE_OVER, Add_Help_Menu);
			//group.addEventListener(MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			//group.Help = "Группа в контакте";
			addEventListener(MouseEvent.MOUSE_OVER, over_button);
			addEventListener(MouseEvent.MOUSE_OUT, out_button);
			if (!globalParams.alone) {
				top10.addEventListener(MouseEvent.CLICK, click_top10);
				top10.addEventListener(MouseEvent.MOUSE_OVER, Add_Help_Menu);
				top10.addEventListener(MouseEvent.MOUSE_OUT, Remove_Help_Menu);
				top10.Help = "Top 10";
			} else {
				top10.visible = false;
			}
			quest.addEventListener(MouseEvent.CLICK, click_quest);
			quest.addEventListener(MouseEvent.MOUSE_OVER, Add_Help_Menu);
			quest.addEventListener(MouseEvent.MOUSE_OUT, Remove_Help_Menu);
			quest.Help = "Квесты игрока";
			
		
			
			addEventListener (Event.ENTER_FRAME, updateAll);
			//Space();
		}
		private function Space(){
			var fon = new fon_mc();
			addChild(fon);
				var space = new spaceShipTravel_mc();
				addChild(space);
			space.gotoAndStop(0);
			space.animation.gotoAndStop (45);
			trace("__________________________________________space");
		}
		public function updateAll(e:Event)
		{
			if (expand) {
				this.nextFrame ()
			} else {
				this.prevFrame ()
			}
		}
		private function over_button(e:MouseEvent):void
		{
			expand = true;
			
			//this.nextFrame ();
		}
		private function out_button(e:MouseEvent):void
		{
			expand = false;
			
			//this.prevFrame ()
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
		private function click_quest(e:MouseEvent):void
		{
			var _questMenu:questMenu = new questMenu()
			globalParams.indexMc.addChild(_questMenu);
			_questMenu.Launch();
			
		}
		private function click_top10(e:MouseEvent):void
		{
			
			var _top_10:top_10 = new top_10();
			globalParams.indexMc.addChild(_top_10);
		 _top_10.Launch()
		}
		private function clickH(e:MouseEvent):void
		{
			navigateToURL(new URLRequest('http://vkontakte.ru/public34279239'));
		}
	}
	
}
