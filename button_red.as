package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	import flash.events.Event;


	public class button_red extends MovieClip
	{
		
		public function button_red()
		{
			nameButton.mouseEnabled = false;
			gotoAndStop(1);
			addEventListener(MouseEvent.MOUSE_DOWN, _yes);
			addEventListener(MouseEvent.MOUSE_OUT, out_yes);
		useHandCursor = true;
			buttonMode = true;
		}
		public function set label(name_:String):void
		{
			nameButton.text = name_;
		}
		public function Launch()
		{

			//windowMc.Yes.signature.text = "ok";

			addEventListener(MouseEvent.MOUSE_DOWN, _yes);

		}
		public function out_yes(e:MouseEvent)
		{
			//globalParams.indexMc._soundProcessor.playSnd ("click");
			gotoAndStop(1);

		}
		public function _yes(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			gotoAndStop(2);

		}


	}

}