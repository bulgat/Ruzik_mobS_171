package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class CloseB extends MovieClip {
		
		
		public function CloseB() {
			addEventListener(MouseEvent.CLICK, CLOSE);
			this.buttonMode = true;
			this.useHandCursor = true;
		}
		private function CLOSE(e:MouseEvent):void
		{
			MovieClip(parent.parent).removeChild(MovieClip(parent));
		}
	}
	
}
