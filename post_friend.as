package 
{
	//import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.display.Sprite;
	import flash.events.*;
	import vk.APIConnection;
	import vk.events.*;
	

	
	public class post_friend extends Sprite
	{
		//Переменные 
		//public var api_id:Number;
		public var viewer_id:Number;
		//public var sid:String;
		//public var secret:String;
		//public var basa_image:Object ={levelUp:'photo154412759_299949244',holiday:'photo154412759_276480868'};

		public var VK:APIConnection;
		
		public function post_launch():void
		{
			/*
			trace("________________________________post_API________________________________________");
			globalParams.global_Log.push(" existingAPI_ ",existingAPI);
			
			var flashVars:Object = {};
			
			if (globalParams.indexMc.stage && globalParams.indexMc.stage.loaderInfo) {
				flashVars = globalParams.indexMc.stage.loaderInfo.parameters;
				globalParams.global_Log.push("We got data from loaderInfo!");
			} else {
				globalParams.global_Log.push("We couldn't get data from loaderInfo!");
			}
			
			
			
			if (!existingAPI) {
				VK = new APIConnection(flashVars);
			} else {
				VK = existingAPI;
			}
			
			viewer_id = flashVars['viewer_id'];
			var receiverUID = viewer_id;
			
			globalParams.global_Log.push(" post_0 ")
			//VK.api('wall.post', {owner_id:receiverUID, message: post,attachments:basa_image[image]}, post_Loaded, post_Error);
			
			VK.callMethod("showInviteBox");
			//VK.api("getProfiles", {uids:receiverUID}, post_Loaded, post_Error);
			globalParams.global_Log.push(" ////////////////////////// ")
			*/
globalParams.indexMc._lands_Interface._Friend_API.post_friend();
		}
		/*
		public function post_Loaded(data: Object):void
		{
			trace("loader")
			globalParams.global_Log.push(" post_loader ")
			//result_tf.text = 'loader';
		}
		public function post_Error(data: Object):void
		{
			trace("error")
			globalParams.global_Log.push(" post_Error ")
			//result_tf.text = "error";
		}
*/
	}

}