package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class QuestWindow extends MovieClip
	{
		public function QuestWindow()
		{
			addEventListener('closed', globalParams.stageMc.closed);
		}
	}
}
