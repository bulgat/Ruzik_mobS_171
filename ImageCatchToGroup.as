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
	
	public class ImageCatchToGroup extends MovieClip {

		var BuildingBasa:Array = [
								  spaceShipTravel_mc,
								  autobusMc,
								  //autobusStationZnak,
								  //autobusStationZnak2,
								  orbitalStation_mc,
								  ufo_mc,
								  teleport_mc,
								  submarine_mc,
								  saturn_mc,
								  batutTower_mc,
								  spaceInvanders_mc,
								  marsianCave_mc,
								  jumpIt_mc,
								  rocketAttraction_mc,
								  cinemaAttraction,
								  Magazin_mc,
								  firtree_mc,
								  lavki_mc,
								  aqua_attraction,
								  kafeshka_ruzik,
								  kafeshka_kresla,
								  enterBoot_mc
								  ];

		var expand:Boolean;
		var _visInfrastructure:Boolean = false;
		//var Bubble_Help_mc:Bubble_Help = new Bubble_Help();
		var hight:int=0;
		var count:int=1;
		var fonMc = new fon_mc();
		var space = new BuildingBasa[0]();
		var _numModelImage:int = 0;
		var _oldMovieClip;
		public function ImageCatchToGroup() {
			
			this.x = 0;

			addEventListener (Event.ENTER_FRAME, updateAll);
			Space(_numModelImage);
			
		}

		private function Space(numModelImage:int){
			var space = new BuildingBasa[numModelImage]();

					addChild(fonMc);
					_oldMovieClip =space;
					
			//fonMc 
			//quest.visible = false;
			fonMc.kol.text="launch";
			
			addChild(fonMc);
			fonMc.goto.addEventListener(MouseEvent.CLICK, clickSpace);
			fonMc.save.addEventListener(MouseEvent.CLICK, clickSave);
			
			fonMc.left.addEventListener(MouseEvent.CLICK, clickLeft);
			fonMc.right.addEventListener(MouseEvent.CLICK, clickRight);
			fonMc.playAnim.addEventListener(MouseEvent.CLICK, clickPlayAnim);
			fonMc.VisInfrastructure.addEventListener(MouseEvent.CLICK, VisInfrastructure);
			
			space.x = 160;
			space.y=-hight+261+230;
			addChild(space);
			space.gotoAndStop(0);
			//space.animation.gotoAndStop(1);
			var count = space.numChildren;
			var countText =SetVisibleChild(_visInfrastructure);
			
			countText+="### w="+space.width+" h="+space.height;
			SetVisible(_visInfrastructure);

			fonMc.kol.text="count = "+count+" | "+countText;
							trace("000 =  ",_visInfrastructure)
		}
		private function SetVisibleChild(vis:Boolean):String{
			var countText ="";
			for (var i:uint = 0; i < _oldMovieClip.numChildren; i++){
				countText+="|"+_oldMovieClip.getChildAt(i).name+"("+_oldMovieClip.getChildAt(i).parent+")";
				if (_oldMovieClip.getChildAt(i).name!="animation"){
					_oldMovieClip.getChildAt(i).visible =vis;
				}

			}
			return countText;
		}
		private function SetVisible(vis:Boolean):void{
			try {
				_oldMovieClip.m_1.visible =vis; 
				_oldMovieClip.m_2.visible =vis; 
				_oldMovieClip.m_3.visible =vis;
				_oldMovieClip.m_4.visible =vis; 
				_oldMovieClip.m_5.enabled =vis; 
				_oldMovieClip.m_6.enabled =vis;
				_oldMovieClip.m_7.enabled =vis; 
				_oldMovieClip.m_8.enabled =vis;
				
				_oldMovieClip.border_1.visible =vis; 
				_oldMovieClip.border_2.visible =vis; 
				
				_oldMovieClip.panel_1.visible =vis; 
				_oldMovieClip.panel_2.visible =vis; 
				
				//space.instance4765.visible =false; 
				_oldMovieClip.object_mc.visible =vis; 
			} catch (e){
				trace("ERROR "+e);
			}
		}
		
		private function clickSpace(e:MouseEvent):void{
								
			count++;
			_oldMovieClip.animation.gotoAndStop (count);
			
			fonMc.frame.text="frame=" +count;
		}
		private function clickSave(e:MouseEvent):void{
			trace("______________________ ______space");

			var bitmapData = new BitmapData(80, 30, true);
		
			var size_img_w =260;
			var size_img_h =430;
			var sizeImg_w =260;
			var sizeImg_h =330;
			var rect:Rectangle = new Rectangle(0, 180, sizeImg_w, sizeImg_h);
			var pt:Point = new Point(0, 0);
			var bmpCutData:BitmapData = new BitmapData(size_img_w, size_img_h);
			bmpCutData.draw(stage,null,null,null,rect);
			
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
		
		private function clickLeft(e:MouseEvent):void{
			count=0;
			_numModelImage-=1;
			removeChild(_oldMovieClip)
			Space(_numModelImage);
		}
		private function clickRight(e:MouseEvent):void{
			count=0;
			_numModelImage+=1;
			removeChild(_oldMovieClip)
			Space(_numModelImage);
		}
		private function clickPlayAnim(e:MouseEvent):void{
			
			space.animation.play();
		}
		private function VisInfrastructure(e:MouseEvent):void{
			
			_visInfrastructure = _visInfrastructure==false;
			trace("0005 play " +_visInfrastructure);
		}
	}
	
}
