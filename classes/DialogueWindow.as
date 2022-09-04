package classes {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class DialogueWindow extends Sprite {
		
		public var statusTxt:TextField = new TextField();
		public var okBtn:MovieClip = new MovieClip();
		
		private var _root:Sprite = new Sprite();
		
		public function DialogueWindow(text:String, par:Sprite) {
			super();
			statusTxt.appendText(text+"\n");
			okBtn.addEventListener(MouseEvent.CLICK, destruct);
			_root = par;
			_root.addChild(this);
		}
		public function destruct(e:MouseEvent = null):void {
			(_root as Shop).removeChild(this);
		}
	}
}