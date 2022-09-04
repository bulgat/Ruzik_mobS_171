package windows
{
	//import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.display.Sprite;
	import flash.events.*;
	import vk.APIConnection;
	import vk.events.*;
	public class vote extends Sprite
	{
		//Переменные 
		public var api_id:Number;
		public var viewer_id:Number;
		public var sid:String;
		public var secret:String;
		;

		public function vote()
		{
			// constructor code

			trace("contact_API");
			//vote_launch();
		}

		public function vote_launch():void
		{
			trace("vote_launch",this.loaderInfo.parameters);
			dispatchEvent(new Event("CorrectSave"));
			//Заполняем переменные данными 
			var flashVars:Object = this.loaderInfo.parameters as Object;
			trace("vote_launch");
			api_id = flashVars['api_id'];
			viewer_id = flashVars['viewer_id'];
			sid = flashVars['sid'];
			secret = flashVars['secret'];

			var VK:APIConnection = new APIConnection(flashVars);
			VK.api('getProfiles', { uids: flashVars['viewer_id']}, onProfileLoaded, onError);//Узнаем имя и фамилию пользователя
			//добавляем три слушателя событии
			VK.addEventListener('onOrderSuccess', onSuccess);//если все прошло удачно
			VK.addEventListener('onOrderCancel', onCanc);//если пользователь отменил передачу
			VK.addEventListener('onOrderFail', onError);//если произошла ошибка

			this.addEventListener(MouseEvent.CLICK, function(event:MouseEvent) { //надатие на кнопку
			VK.callMethod('showOrderBox', { type:'item',item:'item1'});//вызов окна перевода голосов ;type:'item' - окно покупки товара(возможно также окно вызова офферов или окно пополнения голосов),item:'item1'- номер товара
			});

		}




		public function onProfileLoaded(data: Object):void
		{
			//result_tf.text = 'Привет ' + data[0]['first_name'] + ' ' + data[0]['last_name'] + ' ,это тестовое приложение в котором показан пример работы с payments Api';
		}

		//три функции ,которые срабатывают при :;
		//удачнои покупки
		public function onSuccess(data: Object):void
		{
			//result_tf.text = "Голоса переведены";
		}
		//при отмене       
		public function onCanc(data: Object):void
		{
			//result_tf.text = "Вы отменили перевод";
		}
		//при ошибке
		public function onError(data: Object):void
		{
			//result_tf.text = data.error_msg;
		}





	}

}