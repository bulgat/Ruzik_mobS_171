package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.Event;
	public class ToGroup extends MovieClip {
		
		var expand:Boolean;
		var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		var hight:int=0;
		public function ToGroup(Hight:int) {
			
			this.x = 194;
			this.y = Hight - 80;
			//this.y = 520;
			hight = Hight;
			
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
		var count:int=1;
		var fonMc = new fon_mc();
		var space = new spaceShipTravel_mc();
		private function Space(){
			//fonMc 
			//quest.visible = false;
			fonMc.kol.text="qqqqqqqqqqqqqqяяяяяяяяяяяяяяяяя";
			
			addChild(fonMc);
			fonMc.goto.addEventListener(MouseEvent.CLICK, clickSpace);
			space.x = -50;
			//space.y=-30;
			space.y=-hight+261+230;
			addChild(space);
			space.gotoAndStop(0);
			space.animation.gotoAndStop(1);
			var count = space.numChildren;
			var countText ="";
			for (var i:uint = 0; i < space.numChildren; i++){
				countText+="|"+space.getChildAt(i).name+"("+space.getChildAt(i).parent+")";
				if (space.getChildAt(i).name!="animation"){
					space.getChildAt(i).visible =false;
				}
			}
			countText+="### w="+space.width+" h="+space.height;
			
			space.m_1.visible =false; 
			space.m_2.visible =false; 
			space.m_3.visible =false;
			space.m_4.visible =false; 
			space.m_5.enabled =false; 
			space.m_6.enabled =false;
			space.m_7.enabled =false; 
			space.m_8.enabled =false;
			
			space.border_1.visible =false; 
			space.border_2.visible =false; 
			
			space.panel_1.visible =false; 
			space.panel_2.visible =false; 
			
			//space.instance4765.visible =false; 
			space.object_mc.visible =false; 
			fonMc.kol.text="count = "+count+" | "+countText;
			trace("__________________________________________space");
		}
		private function clickSpace(e:MouseEvent):void{
			count++;
			space.animation.gotoAndStop (count);
			
			fonMc.kol.text="frame=" +count;
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
