package classes {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class PresCell extends Sprite {
		
		public var isNew:Sprite = new Sprite();
		public var invis:Sprite = new Sprite();
		public var picLdr:Loader = new Loader();
		//public var chooseBtn:SelectBtn = new SelectBtn();
		public var priceTxt:TextField = new TextField();
		public var inGamePriceTxt:TextField = new TextField();
		public var container:MovieClip;// = new MovieClip();
		public var imgUrl:String = new String();
		
		
		public function PresCell(url:String,price:String,isNewFlag:Boolean,name:String,igPrice:String) {
			super();
			super.name = name;
			if (url!='') picLdr.load(new URLRequest(url));// else picLdr.visible = false;
			trace("_url=",url);
			picLdr.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
			//picLdr.name = name;
			//picLdr.cacheAsBitmap = true;
			this.cacheAsBitmap = true;
			imgUrl = url;
			priceTxt.text = price;
			inGamePriceTxt.text = igPrice;
			if (isNewFlag) isNew.visible = true; else isNew.visible = false;
			this.buttonMode = true;
			this.useHandCursor = true;
			chooseBtn.label="заказать"
			//this.addChild(container);
			//picLdr.addEventListener(MouseEvent.CLICK,imgClickHandler);
		}
		public function loadCompleteHandler(e:Event):void {
			//trace("Beggining scaling image");
			picLdr.removeEventListener(Event.COMPLETE, loadCompleteHandler);
			var bmp:Bitmap = Bitmap(picLdr.content);
			var scrBD:BitmapData = bmp.bitmapData;
			var scaleModifier:Number = 110/Math.max(bmp.width, bmp.height);
			var newBD:BitmapData = scaleBitmapData(scrBD, scaleModifier);
			var imgResult:Bitmap = new Bitmap(newBD);
			
			container.addChild(imgResult);
			imgResult.x = (110 - imgResult.width)/2;
			imgResult.y = (110 - imgResult.height)/2;
			//trace("Complete");
		}
		public function scaleBitmapData(bitmapData:BitmapData, scale:Number):BitmapData {
			scale = Math.abs(scale);
			var width:int = (bitmapData.width * scale) || 1;
			var height:int = (bitmapData.height * scale) || 1;
			var transparent:Boolean = bitmapData.transparent;
			var result:BitmapData = new BitmapData(width, height, transparent);
			var matrix:Matrix = new Matrix();
			matrix.scale(scale, scale);
			result.draw(bitmapData, matrix, null, null, null, true);
			return result;
		}
	}
}