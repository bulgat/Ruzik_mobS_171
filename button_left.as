package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	import flash.events.Event;


	public class button_left extends MovieClip
	{
		public var id:int;
		public var id_new:int;
		public var push:Boolean;
		public function button_left()
		{

			gotoAndStop(1);
			addEventListener(MouseEvent.MOUSE_DOWN, _yes);
			addEventListener(MouseEvent.MOUSE_OUT, out_yes);
			useHandCursor = true;
			buttonMode = true;
		}
		var visButLaunch:Boolean
		public function visBut(vis:Boolean)
		{
			if (vis)
			{
				gotoAndStop(1);
			}
			else
			{
				gotoAndStop(2);
			}
			push = vis;
		visButLaunch=true
		}
		public function out_yes(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			gotoAndStop(1);
			if (visButLaunch) {
				visBut(push);
			}
			
		}
		public function _yes(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			gotoAndStop(2);

		}


	}

}