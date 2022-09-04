package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	import flash.events.Event;


	public class button_cross extends MovieClip
	{
		
		public function button_cross()
		{
			
			gotoAndStop(1);
			addEventListener(MouseEvent.MOUSE_DOWN, _yes);
			addEventListener(MouseEvent.MOUSE_OUT, out_yes);
			useHandCursor = true;
			buttonMode = true;
		}
	
		public function out_yes(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click");
			gotoAndStop(1);

		}
		public function _yes(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			gotoAndStop(2);

		}


	}

}