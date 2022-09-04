package 
{

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.system.LoaderContext;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
import flash.events.IOErrorEvent;
	import classes.PopUpWindow;
	public class implementatorMail extends MovieClip
	{

		public function implementatorMail()
		{
			//this.x = -100 + globalParams.stageMc.stage.stageWidth / 2;
			this.x = -200 + globalParams.stageMc.stage.stageWidth / 2;
			this.y = -500 + globalParams.stageMc.stage.stageHeight / 2;
			okBtn.addEventListener(MouseEvent.CLICK, send_mail);
			okBtn.label="послать письмо";
			crossBtn.addEventListener(MouseEvent.CLICK, closeAndInitiate);
			closeBtn.addEventListener(MouseEvent.CLICK, closeAndInitiate);
closeBtn.label="закрыть";
		}
		var my_loader:URLLoader;
		var my_url:URLRequest;
		public var popUp:PopUpWindow = new PopUpWindow();
		public function send_mail(e:MouseEvent)
		{

			var adressMail:String = globalParams.SERVER + "implementatorMail.php";
			trace(adressMail,"_____||||||_____",statusTxt.text);
			/////////////
			var my_vars:URLVariables = new URLVariables();
			var req:URLRequest = new URLRequest(globalParams.SERVER + "implementatorMail.php");
			my_loader = new URLLoader();
			my_vars.senderName = "ТЕСТ_krikunov_";
			my_vars.senderEmail = "nikolay.krikunov@ermine-seo.ru";
			my_vars.senderMsg = "ТЕСТ:     Привет это Рузик пишет тебе письмо";
			my_vars.name = " Письмо от пользователя id: " + globalParams.UID;
			my_vars.message = "Пользователем id: " + globalParams.UID + " обнаружены следущие баги:  \n " + statusTxt.text;

			//my_url = adressMail;
			my_url = req;
			my_url.method = URLRequestMethod.POST;
			my_url.data = my_vars;

			
			my_loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			my_loader.load(my_url);
			my_loader.addEventListener(Event.COMPLETE, CheckAnswer);
			my_loader.addEventListener(IOErrorEvent.IO_ERROR, noAnswer);
			popUp.x-=300;
			popUp.y-=230;
			popUp.showPopUp(this,"Ваше письмо посылается",false);
trace("****************       end          ****************");
		}
		public function noAnswer(e:Event):void {
			trace("****************        no           ****************");
			parent.removeChild(this);
		}
		public function CheckAnswer(e:Event):void {
			trace("****************        ok           ****************");
			parent.removeChild(this);
		}
		public function closeAndInitiate(e:MouseEvent)
		{

			parent.removeChild(this);
		}

	}

}