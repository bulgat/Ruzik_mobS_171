package classes {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class PopUpWin_ extends Sprite {
		public var statusTxt:TextField = new TextField();
		public var okBtn:Sprite = new Sprite();
		
		private var _root:Sprite = null;
		private var _isShown:Boolean = false;
		
		public function PopUpWin_() {
			super();
			this.y=100;
			okBtn.addEventListener(MouseEvent.CLICK, function():void {
				hide();
			});
		}
		public function showPopUp(par:Sprite,text:String,useControls:Boolean,...params):void {
			hide();
			//if (_isShown) _root.removeChild(this);
			_root = par;
			_root.addChild(this);
			//trace("root width:"+_root.width);
			this.statusTxt.htmlText = text;
			if (useControls) {
				//code for enabling needed
				enableControls(params);
			} else disableControls();
			_isShown = true;
		}
		public function enableControls(r:Array):void {
			for (var s:String in r) {
				trace("name:"+r[s]+"Btn");
				(this[r[s]+"Btn"] as Sprite).visible = true;
			}
		}
		public function disableControls():void {
			okBtn.visible = false;
		}
		/**
		 * hide() is used to hide the opened popup
		 * */
		public function hide():void {
			if (_isShown) if (_root.contains(this)) _root.removeChild(this);
		}
	}
}