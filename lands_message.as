package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	import tools.*
	/**
	 * ...
	 * @author Mutagen
	 */
	public class lands_message extends MovieClip
	{
		private var messageMc:MovieClip
		public function systemMessage (msg:String) {
			if (messageMc != null) {
				this.removeChild (messageMc)
				messageMc = null
			}
			globalParams.indexMc.pauseTrigger = true
			messageMc = new systemMessage_mc ()
			messageMc.x = 400
			messageMc.y = 300
			messageMc.windowMc.headerText.text = "Системное сообщение"
			messageMc.windowMc.messageText.text = "" + msg
			messageMc.fon.addEventListener (MouseEvent.CLICK, closeMessageFn)
			messageMc.windowMc.crossBtn.addEventListener (MouseEvent.CLICK, closeMessageFn)
			
			messageMc.windowMc.Yes.addEventListener (MouseEvent.CLICK, closeMessageFn)
			messageMc.windowMc.No.visible = false;
			addChild (messageMc);
		}
		public function closeMessageFn (e:MouseEvent) {
			globalParams.indexMc._soundProcessor.playSnd ("click")
			removeMessageFn ();
			
		}
		public function removeMessageFn () {
			if (messageMc != null) {
				this.removeChild (messageMc)
				messageMc = null
				globalParams.indexMc.pauseTrigger = false
			}
		}
	}

}