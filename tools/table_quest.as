package tools
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	import flash.events.Event;


	public class table_quest extends MovieClip
	{
		
		public function Launch(title:String,description:String)
		{
			questGreat.text=title;
			questName.text=" задание: "+description;
		}
		
	}

}