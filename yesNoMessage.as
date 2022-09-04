package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import flash.events.Event;
	

	public class yesNoMessage extends MovieClip
	{
		public var money:int
		public function button_text(left:String,Right:String,header:String)
		{
			windowMc.headerText.text = header
			windowMc.Yes.label = left;
			windowMc.No.label = Right;
			windowMc.Yes.visible = true;
			windowMc.No.visible = true;
		
		}
		public function Message(report:String)
		{
			this.x = 400;
			this.y = 300;
			windowMc.messageText.text = report;
			windowMc.Yes.label = "ok";
			windowMc.No.label = "загруз.";
			windowMc.Yes.addEventListener(MouseEvent.CLICK, _yes);
			windowMc.No.addEventListener(MouseEvent.CLICK, _no);
			windowMc.crossBtn.addEventListener(MouseEvent.CLICK, _no);
		}
		public function correct_coordinat()
		{
			this.x = 0;
			this.y = 0;
		}
		public function _yes(e:MouseEvent)
		{
			dispatchEvent(new Event("confirm"));
			parent.removeChild(this);
		}
		public function _no(e:MouseEvent)
		{
			dispatchEvent(new Event("repeal"));
			parent.removeChild(this);
		
		}

	}

}