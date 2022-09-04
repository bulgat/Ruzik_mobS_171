package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import tools.*;
	public class top_10 extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		public function Launch()
		{
			if (globalParams.alone) {
				//this.visible = false;
			}
			//this.x = (globalParams.indexMc.stage.stageWidth-700)/2 + 355;
			//this.y = (globalParams.indexMc.stage.stageHeight)/2;
			this.x = (globalParams.indexMc.stage.stageWidth)/2-(globalParams.indexMc.stage.stageWidth-800)/2;
			this.y = (globalParams.indexMc.stage.stageHeight)/2-(globalParams.indexMc.stage.stageHeight-600)/2;
			
			close.addEventListener(MouseEvent.CLICK, close_click);
			closeBtn.addEventListener(MouseEvent.CLICK, close_click);
			load_init();
			
		}
		public function close_click(event:MouseEvent)
		{
			parent.removeChild(this);
		}
		public function take_place_user():void
		{
			var _ADRESS:String = globalParams.SERVER + "top10user.php";
			_serverProvider.init("cmd=getRating&uid="+globalParams.UID+"&rand=" + Math.ceil (Math.random() * 10000), _ADRESS);
			_serverProvider.addEventListener(ServerProvider.COMPLETE, take_place_COMPLETE);
		}
		private function take_place_COMPLETE(e:Event):void
		{
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, take_place_COMPLETE);
			trace("************GET__decode___",e.target.responseObj,"  L = ",e.target.responseObj.length);
			var result_user:Object = JSON.parse(e.target.responseObj);
			//var result_user:Object = JSON.decode(e.target.responseObj);
			for (var detailN:* in  result_user) {
			trace(" хрень = ",detailN);
			}
			trace("TOP 10  result_user = ",result_user["1"],"   []");
		listPlayer.text =" Вы занимаете "+result_user["1"]+" место в рейтинге игроков.";
		}
		
		public function load_init():void
		{
			//trace(" '''''''''''''''  |||||  adress = ");
			var GET_ADRESS = globalParams.SERVER + "top10.php";

			//получит данные с  сервера php  classes.ServerProvider.init
			//globalParams.UID
			_serverProvider.init("cmd=getRating&rand=" + Math.ceil (Math.random() * 10000), GET_ADRESS);
			//_serverProvider.init("cmd=getRating&rand=" + Math.ceil (Math.random() * 10000), GET_RATING);

			_serverProvider.addEventListener(ServerProvider.COMPLETE, onGet_COMPLETE);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);


		}
		var result:Object = {};
		private function onGet_COMPLETE(e:Event):void
		{
			//trace("_______COMPLETE_________");
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onGet_COMPLETE);

			//создается result, куда сбрасываются загруженные данные с сервера, посредством ServerProvider;
			

			//trace("GET__decode___",e.target.responseObj,"  L = ",e.target.responseObj.length);
result = JSON.parse(e.target.responseObj);
			//result = JSON.decode(e.target.responseObj);
			listPlayer.text = "";

make_table()
			
take_place_user();

		}
		var count_make_table:int
		private function make_table():void
		{
			if (count_make_table<10) {
				//trace(count_make_table,"  id ",result[count_make_table+1])
				globalParams.global_Log.push('\n id    ',result[count_make_table+1],"   ",count_make_table+1);
				globalParams.indexMc._lands_Interface._Friend_API.addEventListener("top_10", top_10_COMPLETE);
				globalParams.indexMc._lands_Interface._Friend_API.get_image_name(result[count_make_table+1]);
				
			}
			
			
		}
		private function top_10_COMPLETE(e:Event):void
		{
			globalParams.indexMc._lands_Interface._Friend_API.removeEventListener("top_10", top_10_COMPLETE);
			var _table_top10:table_top10 = new table_top10();
				_table_top10.x = -256+(_table_top10.width+6)*int(count_make_table/5);
				_table_top10.y = -180+(_table_top10.height+2)*count_make_table-(((_table_top10.height+2)*5)*int(count_make_table/5));
				addChild(_table_top10);
				_table_top10.Launch(globalParams.indexMc._lands_Interface._Friend_API.data_top_10,count_make_table);
				count_make_table++;
			make_table()
		}
		private function onServerProviderError(e:Event):void
		{
			trace("______ERROR_COMPLETE_________");

		}


	}

}