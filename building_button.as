package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	import flash.events.Event;


	public class building_button extends MovieClip
	{
		public var id:int;
		public var idk:int;
		
		public var i:int;
		public var j:int;
		public function building_button()
		{
			
			gotoAndStop(1);
			addEventListener(MouseEvent.MOUSE_OVER, _yes);
			addEventListener(MouseEvent.MOUSE_OUT, _out);
			useHandCursor = true;
			buttonMode = true;
			
			this.alpha=0
		trace("________________________________________Button   ")
		}
		public function fr(frame:int)
		{
		gotoAndStop(frame);
		}
		public function _out(e:MouseEvent)
		{
			
		//this.alpha=0
		trace("_noe")
		globalParams.indexMc.Bright_Image(globalParams.indexMc.lanscapeArray[i][j],0);
		}
		public function _yes(e:MouseEvent)
		{
			trace("_yes",i,j)
			
			//this.alpha=1
			
globalParams.indexMc.Bright_Image(globalParams.indexMc.lanscapeArray[i][j],40);


		//globalParams.indexMc.lanscapeArray[i][j].object_mc.visible=false
		}


	}

}