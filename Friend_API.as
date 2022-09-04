/*

http://flapps.ru/forum/ - форум о создании приложений

*/
package 
{
	import flash.display.Sprite;
	import flash.text.*;
	import flash.events.*;
	import vk.APIConnection;
	import vk.events.*;
	import vk.ui.VKButton;
	import vk.events.CustomEvent;
	import vk.*;
import flash.events.EventDispatcher;
	import flash.events.Event;
	import foto.*;
		import classes.json.JSON;
	
	public class Friend_API extends Sprite
	{
		public var api_id:Number;
		public var viewer_id:Number;
		public var sid:String;
		public var secret:String;
		public var frCount;// количество друзей
		public var friends = new Array  ;// массив id друзей

		public var VK:APIConnection;
		var flashVars:Object;
		public var _saveShot_API:saveShot_API = new saveShot_API();
		
		public function Main()
		{
			// получаем flashVars
			flashVars = stage.loaderInfo.parameters as Object;
			// присваиваем переменным значения из flashVars
			//api_id = flashVars['api_id'];
			//viewer_id = flashVars['viewer_id'];
			//sid = flashVars['sid'];
			//secret = flashVars['secret'];

			// инициализация
			//var VK:APIConnection = new APIConnection(flashVars);
			VK = new APIConnection(flashVars);

			// выполняем запрос получения списка друзей
			
			VK.api('friends.get',{fields:'first_name,last_name,photo_medium_rec',count:400},friends_Loaded,friends_Error);
			
			globalParams.global_Log.push(flashVars['api_id']," Friend_API  main __________  \n")
		}
		///////////
		public function makeScreenshot():void
		{
			
		VK.api("photos.getWallUploadServer", {}, Screenshot_response, Screenshot_Error);
		}
		//при отмене       
		public function Screenshot_response(data: Object):void
		{
			url_screenShot=data.upload_url;
			globalParams.global_Log.push("\n Screenshot_response_____  "+data+" L="+data.length)
			
			//var k:String='http://cs320731.vk.com/upload.php?act=do_add&mid=154412759&aid=-14&gid=0&hash=acdab02436847b9a6c96ce1866ba38b2&rhash=c69acff628ae775be16477b1f9ea99ef&swfupload=1&api=1&wallphoto=1';
				//globalParams.indexMc._saveShot_API.makeScreenshot(k);
			
			//globalParams.indexMc.make_shot()
			
			
		}
			var url_screenShot:String;
		public function Screenshot_click():void
		{
			if (contains(_panel_friend)) {
				globalParams.global_Log.push("\n removeChild  _panel_friend_____  ")
				removeChild(_panel_friend);
			}
			_saveShot_API.makeScreenshot(url_screenShot);
			_saveShot_API.addEventListener("save", url_Complete);
		
		}
		
		//при ошибке
		public function Screenshot_Error(data: Object):void
		{
			globalParams.global_Log.push("\n Screenshot_Error____  ")
		}
		private function url_Complete(e:Event):void
		{
			_saveShot_API.removeEventListener("save", url_Complete);
			globalParams.global_Log.push("\n  shot__   "+e.target.recordObj)
			var result:Object = {};
			result = JSON.parse(e.target.recordObj);
			//result = JSON.decode(e.target.recordObj);

			VK.api("photos.saveWallPhoto", {server:result.server, photo:result.photo, hash:result.hash }, SavePhoto_SavePhoto, SavePhoto_Error );
			
		}
		public function SavePhoto_SavePhoto(data: Object):void
		{
			globalParams.global_Log.push("\n  Saveshot_________  "+data+data[0].id)
			VK.api('wall.post', {owner_id:flashVars['viewer_id'], message: 'Фото из Луна-парка Рузик ',attachments:data[0].id});
			addChild(_panel_friend);
		}
		public function SavePhoto_Error(data: Object):void
		{
			
		}
		///////////////////////////////////////////////////////
		// данные получены
		private function friends_Loaded(data:Object):void
		{
			globalParams.global_Log.push(" L=",data.length," Friend_API  friends_loaded __________  \n")
			
				add_panel(data)
			

		}
		// если произошла ошибка
		private function friends_Error(data:Object):void
		{
			
			data=[{uid:"22222",first_name:"423432",last_name:"777777",photo_medium_rec:"http://cs308622.vk.me/v308622779/75cd/vr_z5hXL7wU.jpg"}]
			if (!globalParams.alone) {
				add_panel(data);
			}
		}
		public var _panel_friend:panel_friend = new panel_friend()  ;
		public function add_panel(data:Object):void
		{
			//globalParams.global_Log.push( " Friend_API  add_panel __________  \n")
			
			_panel_friend.x = 300;
			_panel_friend.y = 520;
			
			_panel_friend.addEventListener("id_clickFriend",_friend_Listern);
			addChild(_panel_friend);
			_panel_friend.Launch(data);
			
		}
		
		//////////////////////post image
		public function post_image(post:String,imageStr:String):void
		{
			//trace("     flashVars  = ",flashVars," id ",flashVars['api_id'])
			
			//flashVars = stage.loaderInfo.parameters as Object;
			//VK = new APIConnection(flashVars);
			//if (!globalParams.alone) {
				VK.api('wall.post', {owner_id:viewer_id, message: post,attachments:imageStr});
			//}
		}
		public function post_friend():void
		{
			//VK = new APIConnection(flashVars);
			VK.callMethod("showInviteBox");
			
		}
		/////////////////////// vote  ///////////////////////////
		var golosAdd:int
		public function add_Votes(golos:int):void {
			golosAdd=golos;
			VK.addEventListener('onOrderSuccess', Order_success);//если все прошло удачно
			VK.addEventListener('onOrderCancel', Order_Cancel);//если пользователь отменил передачу
			VK.addEventListener('onOrderFail', Order_Error);//если произошла ошибка
			//VK.callMethod("showOrderBox", {type:'votes', votes:1},Order_success,Order_Cancel,Order_Error);
				//VK.callMethod('showOrderBox', { type:'item',item:'item1'})
				//VK.callMethod("showOrderBox", {type:'offers', votes:1});
		
		
		
		////////////////////////// 
		VK.callMethod("showOrderBox", {type:'votes', votes:golos});
		}
		public function Order_success(data: Object):void
		{
			//globalParams.global_Log.push(" \n @@@@ ____vote success")
			
			globalParams.indexMc._insertBillingInfo.init(10*golosAdd, 'golos');
			globalParams.indexMc.add_log ("vote "+int(10*golosAdd))
			
		}
		public function Order_Cancel(data: Object):void
		{
			//globalParams.global_Log.push(" \n @@@@ ____vote cancel")
		}
		public function Order_Error(data: Object):void
		{
			//trace("  error votes");
			//globalParams.global_Log.push(" \n @@@@ ____vote error")
			//globalParams.global_Log.push(" \n ____vote data:",data);
			
		}
		//////////////////////  top10   //////////////////
		public function get_image_name(_uid:String):void
		{
			
			if (_uid==null) {
				_uid="154412759";
			}

			VK.api("users.get", {uids:_uid, fields: "photo_medium_rec"}, post_Loaded, post_Error);
			
		}
		var data_top_10:Object;
		public function post_Loaded(data: Object):void
		{
			//globalParams.global_Log.push(' get_image  loader    ' + data[0]['first_name'] + "  " + data[0]['last_name'] + "    " + data[0]['photo_medium_rec']);
			data_top_10=data;
			dispatchEvent(new Event("top_10"));
			//LoadImageRefuge(data[0]['photo_medium_rec']);

		}
		public function post_Error(data: Object):void
		{
			
			//globalParams.global_Log.push("post_Error____error");
			
			data_top_10=[{uid:"154412759",first_name:"ruzik",last_name:"luna-park",photo_medium_rec:"http://cs11152.vk.me/u154412759/d_e5f91821.jpg"}];
			dispatchEvent(new Event("top_10"));
			
		}
		
		public var uid:String;
		public function _friend_Listern(e:Event):void
		{
			uid=e.target._id
			//result_tf.text = "   id=?" ;
			//result_tf.text = "   id=" + e.target._id;
			//trace(uid,"_______________117111781____________ api  ",e.target._id)
			dispatchEvent(new Event("click_id_friend"));
		}
		
	}
}