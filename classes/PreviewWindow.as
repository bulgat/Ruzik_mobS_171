package classes {
	import fl.containers.UILoader;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class PreviewWindow extends Sprite {	
		
		public var imgLdr:UILoader = new UILoader();
		public var descTxt:TextField = new TextField();
		public var _root:Sprite = new Sprite();
		public var closeBtn:Sprite = new Sprite();
		public var created:Boolean = false;
		public function PreviewWindow(par:Sprite,text:String,url:String) {
			super();
			created = true;
			_root = par;
			_root.addChild(this);
			addChild(descTxt);
			descTxt.x = 150;
			descTxt.y = 359;
			descTxt.width = 320;
			descTxt.height = 59;
			descTxt.defaultTextFormat = new TextFormat("Verdana",13,0);
			descTxt.multiline = true;
			if (url!='') imgLdr.load(new URLRequest(url)); else imgLdr.visible = false;
			trace(url);
			descTxt.text = text;
			closeBtn.addEventListener(MouseEvent.CLICK,function():void {destruct();});
			//stage.addEventListener(MouseEvent.CLICK,checkPreviewClick);
		}
		
		private function destruct():void {
			_root.removeChild(this);
			created = false;
			(_root as Shop).mm.alpha = 1;
		}
	}
}