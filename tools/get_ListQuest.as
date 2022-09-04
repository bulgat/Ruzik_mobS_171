package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.utils.ByteArray;
	
	
	public class get_ListQuest extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider(),
		res;
		
		
		public function load_init(GET_RATING:String):void
		{
			//trace("              Load '''''''''  |||||  ",GET_RATING,"__ backup = ");
			//получит данные с  сервера php  classes.ServerProvider.init
			//globalParams.UID
			if (!globalParams.alone) {
				_serverProvider.init("cmd=getRating" + "&rand=" +Math.ceil (Math.random() * 10000), GET_RATING);
	
				_serverProvider.addEventListener(ServerProvider.COMPLETE, onGet_COMPLETE);
				_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			} else {
				
			}
			
		}
		
		private function onGet_COMPLETE(e:Event):void
		{

			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGet_COMPLETE);
			
			//создается result, куда сбрасываются загруженные данные с сервера, посредством ServerProvider;
			var result:Object = {};
			
			//trace("GET__decode___",e.target.responseObj,"  L = ",e.target.responseObj=='{"status":0,"error_code":704,"answer":[]}');
			
			result = JSON.parse(e.target.responseObj);
			//result = JSON.decode(e.target.responseObj);
			if (e.target.responseObj=='{"status":0,"error_code":704,"answer":[]}') {
				MovieClip(parent).mainT.text="ОШИБКА!!! Квест не найден и он возможно не существует!";
			}
			
			//trace("  result ",result[0],result[0].text);
			//trace("  result ",result[0],result[1].text);
			//trace("  L ",result.length);
			//
			var quest_MiniBasa:Array = [];
			for (var s:int=0; s < result.length; s++)
			{
				var dataObject = JSON.parse(unescape(result[s].build));
				//var dataObject = JSON.decode(unescape(result[s].build));
				globalParams.quest_MiniBasa.push({Build:dataObject,Pr_Money:int(result[s].pr_money),Pr_Exp:int(result[s].pr_exp),time:int(result[s].time),Text:result[s].text,task:result[s].task})
				trace(s,"  res = ", result[s].text);
			}
			
			

		//trace(" LLLLLLLL = ",globalParams.quest_MiniBasa.length);
		
		//trace("____",dataObject)
		//trace("____",dataObject[0])
		
		}
		
		//декодировать поступающию информацию
		function decode_string(n):String
		{
			var ba2:ByteArray = new ByteArray();
			
			ba2.writeUTFBytes(n);
			ba2.position = 0;
			trace("decoded :"+ ba2.readMultiByte(ba2.length, "windows-1251"));
			ba2.position = 0;
			trace("decoded2:"+ba2.readMultiByte(ba2.length,"utf-8"));
			ba2.position = 0;
			var res:String = ba2.readMultiByte(ba2.length,"windows-1251")
			return res;
		}
		private function onServerProviderError(e:Event):void
		{
			//Texter_mc.text = "ошибка загрузки данных и генерации ландшафта";
		}
	}

}