package tools
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	import flash.events.Event;


	public class table_worker extends MovieClip
	{
		public var id:int;
		
		
		public function Launch(_id:int,actionButtonVis:Boolean,targetObject:Object)
		{
			attachButton.label = "Назначить";
			actionButton.label = "Уволить";
			botIcos.visible = true;

			actionButton.visible = actionButtonVis;
			
			workerName.text=targetObject.workerName
			levelExp.text 	= "" + targetObject.lvl;
					//exp_.text 	= "   Exp: " + targetObject.exp
					coockId.text 	= targetObject.coock
					techId.text 	= targetObject.tech
					cleanId.text 	= targetObject.clean
					artId.text 	= targetObject.art
			
			id = _id;
		attachButton.addEventListener (MouseEvent.CLICK, _attach_Button)
		actionButton.addEventListener (MouseEvent.CLICK, _fire_Worker)
		
		}
		public function _attach_Button(e:MouseEvent)
		{
			dispatchEvent(new Event("confirm"));
			
		}
		public function _fire_Worker(e:MouseEvent)
		{
			dispatchEvent(new Event("repeal"));
			
		}
		public function attach_Button(vis:Boolean,attachButtonStr:String,actionButtonStr:String)
		{
			attachButton.visible = vis;
		attachButton.label = attachButtonStr;
			actionButton.label = actionButtonStr;
		
		}
	}

}