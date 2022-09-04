package classes {
	import fl.containers.UILoader;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class PresViewField extends Sprite {
		
		public var nameTxt:TextField = new TextField();
		public var descTxt:TextField = new TextField();
		public var priceTxt:TextField = new TextField();
		public var dollarPriceTxt:TextField = new TextField();
		public var numTxt:TextField = new TextField();
		public var sumTxt:TextField = new TextField();
		
		public var imgLdr:Loader = new Loader();
		
		public var deleteBtn:Sprite = new Sprite();
		public var incBtn:Sprite = new Sprite();
		public var decBtn:Sprite = new Sprite();
		public var backBtn:Sprite = new Sprite();
		public var makeOrderBtn:Sprite = new Sprite();
		public var maskMc:MovieClip = new MovieClip();
		
		public function PresViewField(name:String,desc:String,price:String,url:String,spriteName:String,dollPrice:String) {
			super();
			super.name = spriteName;
			addChild(imgLdr);
			imgLdr.x = 11;
			imgLdr.y = 7;
			//imgLdr.width = imgLdr.height = 72;
			imgLdr.mask = maskMc;
			nameTxt.text = name;
			descTxt.text = desc;
			priceTxt.text = price;
			dollarPriceTxt.text = dollPrice;
			if (url!='') imgLdr.load(new URLRequest(url));
			imgLdr.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			numTxt.text = '0';
			//trace(super.name);
			deleteBtn.buttonMode = incBtn.buttonMode = decBtn.buttonMode = backBtn.buttonMode = makeOrderBtn.buttonMode = true;
			deleteBtn.useHandCursor = incBtn.useHandCursor = decBtn.useHandCursor = backBtn.useHandCursor = makeOrderBtn.useHandCursor = true;
		}
		public function loadComplete(e:Event):void {
			var target_mc:Loader = e.currentTarget.loader as Loader;
			var scaleModifier:Number = 72/Math.max(target_mc.width, target_mc.height);
			target_mc.width *= scaleModifier;
			target_mc.height *= scaleModifier;
			if (target_mc.width < 72) target_mc.x = (72-target_mc.width)/2;
			if (target_mc.height < 72) target_mc.y = (72-target_mc.height)/2;
		}
	}
}