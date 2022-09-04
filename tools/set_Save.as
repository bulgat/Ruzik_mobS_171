package tools
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;


	public class set_Save extends MovieClip
	{
		public var _serverProvider:ServerProvider = new ServerProvider();
		public var _Num_Cell:int;
		public var variables:URLVariables = new URLVariables();

public var Zed0:String = "Zed0 Zed0 zzzzzzzzzzzz zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz ";
public var Zed1:String = "Zed1 Zed1 zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
		public function Save_Cells(backup:int,planet:int,Num_Cell:int,BuildingData:String):void
		{
			
			_Num_Cell = Num_Cell;
			
				//trace(" № ",Num,"= ЯЧЕЙКА   Save_Cells,     __UID = ",globalParams.UID," скрипт: ",globalParams.new_insert_Data,",     Data = ",BuildingData);
				variables.cmd = "updateRating"
				variables.uid = globalParams.UID
				variables.cell = Num_Cell.toString();
				variables.planet = planet;
				variables.backup = backup;
				variables.data = BuildingData;
				variables.rand = Math.ceil (Math.random() * 10000)

				_serverProvider.initPost(variables,globalParams.new_insert_Data);

				_serverProvider.addEventListener(ServerProvider.COMPLETE, COMPLETE_Save);
				_serverProvider.addEventListener(ServerProvider.ERROR, UN_COMPLETE_Save);
			
		}
		private function COMPLETE_Save(e:Event):void
		{
			//trace("Save_Cells++++++++++++++++++++++++++        COMPLETE         № ",_Num_Cell);
			//запись прошла успешно
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, COMPLETE_Save);
		}
		private function UN_COMPLETE_Save(e:Event):void
		{
//trace("Save_Cells++UN COMPLETE          ++++++ № ",_Num_Cell);
		}

	}

}