package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;	
	import flash.utils.ByteArray;
	import flash.net.FileReference;
	import flash.net.FileFilter; 
	import com.adobe.images.PNGEncoder;	
	import flash.display.Bitmap;
	
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
			fonMc.save.addEventListener(MouseEvent.CLICK, clickSave);
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
			
		}
		private function clickSpace(e:MouseEvent):void{
			count++;
			space.animation.gotoAndStop (count);
			
			fonMc.kol.text="frame=" +count;
		}
		private function clickSave(e:MouseEvent):void{
			trace("______________________ ______space");
			//var bitmap1 = new Bitmap(this.clone());
			//var bmd2:BitmapData = this.parent.clone();
			//var bmp:Bitmap = this as Bitmap;
			
			var bitmapData = new BitmapData(80, 30, true);
			//var mcExternal= this as Bitmap;
			
			var size_img_w =260;
			var size_img_h =430;
			var sizeImg_w =260;
			var sizeImg_h =330;
			var rect:Rectangle = new Rectangle(0, 180, sizeImg_w, sizeImg_h);
			var pt:Point = new Point(0, 0);
			var bmpCutData:BitmapData = new BitmapData(size_img_w, size_img_h);
			bmpCutData.draw(stage,null,null,null,rect);
			//bmpCutData.copyPixels(stage as BitmapData, rect, new Point());
			//var bmpData:BitmapData = mcExternal.bitmapData;
			//bmpCutData.copyPixels(this as BitmapData, rect, pt);
			//var ttt = (this.parent as MovieClip) as BitmapData;
			//bmpCutData.copyPixels(ttt, rect, pt);
			var bmpCutData0:BitmapData = new BitmapData(size_img_w, size_img_h-180);
			bmpCutData0.copyPixels(bmpCutData, rect, pt);
			
			save_deal (bmpCutData0);
		}
		public function save_deal (fon111_bmpData:BitmapData):void
		{
			
			var brr:ByteArray = PNGEncoder.encode(fon111_bmpData);
			var MyFile:FileReference = new FileReference();
			MyFile.save(brr, "space"+count+".png");
			
			
			
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
