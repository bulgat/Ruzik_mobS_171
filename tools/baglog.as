package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;

	import flash.events.MouseEvent;

	public class baglog extends MovieClip
	{
		public function baglog()
		{
			close.addEventListener(MouseEvent.CLICK, close_baglog);
			this.y = -500;
			this.log.text = globalParams.global_Log + "";

		}
		public function close_baglog(event:MouseEvent)
		{
			parent.removeChild(this);
		}


	}

}