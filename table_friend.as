/*

http://flapps.ru/forum/ - форум о создании приложений

*/
package 
{
	import flash.display.Sprite;
	import flash.text.*;
	import flash.events.*;
	
import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.containers.UILoader;

	public class table_friend extends Sprite
	{
		var myUILoader_00:UILoader = new UILoader();
		public var id:String;
		public function Launch(_id,first_name,last_name,patchImage):void
		{
			id=_id+"";
			
			//nameF.text = first_name + ' ' + last_name;
			nameF.text = first_name + ' ';
			var url:String = patchImage;
			var req:URLRequest = new URLRequest(url);
			myUILoader_00.load(req);
			myUILoader_00.addEventListener(Event.COMPLETE,Loader__Function);
		this.addEventListener(MouseEvent.CLICK, down_Click);
		}
		public function down_Click(e:MouseEvent)
		{
			dispatchEvent(new Event("id_clickFriend"));
			trace("++++++++++++++");
		}
		public function Loader__Function(event:Event):void
		{
			myUILoader_00.removeEventListener(Event.COMPLETE,Loader__Function);
			//var NumLine:int = int(event.currentTarget.name);
			var Board_Loss:UILoader = event.currentTarget as UILoader;
			Board_Loss.scaleX=.5;
			Board_Loss.scaleY=.5
			
			//Board_Loss.mouseEnabled=false
			//myUILoader_00.mouseEnabled=false
			addChildAt(Board_Loss,2);

		}
	}
}