package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Arrow extends MovieClip {
		
		
		public function Arrow() {
			arro.addEventListener(MouseEvent.MOUSE_OVER, over);
		
		}
		
		private function over(e:MouseEvent):void
		{
			MovieClip(parent).removeChild(this);
		}
	}
	
}
