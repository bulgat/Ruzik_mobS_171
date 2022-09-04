package tools
{

	import flash.display.MovieClip;

	import flash.events.*;

	import vk.APIConnection;
	import vk.events.*;

	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.containers.UILoader;
	public class table_top10 extends MovieClip
	{

		var myUILoader_00:UILoader = new UILoader();
		public var viewer_id:Number;
		public function Launch(data:Object,count_make_table:int)
		{
idName.text = data[0]['first_name'] + "  " + data[0]['last_name'];
			textSP.text = ' id: ' + "    " + data[0]['uid'];
			idName.appendText("    " + data[0]['photo_medium_rec']);
			
			var url:String = data[0]['photo_medium_rec'];
			var req:URLRequest = new URLRequest(url);
			myUILoader_00.load(req);
			myUILoader_00.addEventListener(Event.COMPLETE,Loader__Function);
			//this.addEventListener(MouseEvent.CLICK, down_Click);
count_make_table++;
levelExp.text = ""+count_make_table;
		}
		public function Loader__Function(event:Event):void
		{
			myUILoader_00.removeEventListener(Event.COMPLETE,Loader__Function);
			
			var Board_Loss:UILoader = event.currentTarget as UILoader;
			Board_Loss.scaleX = .5;
			Board_Loss.scaleY=.5;
			Board_Loss.x=7;
			Board_Loss.y=7;
			addChildAt(Board_Loss,1);

		}


	}

}