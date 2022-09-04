package tools
{

	import flash.display.*;
	import flash.events.*;
	import classes.json.*;

	public class load_personalMenue extends MovieClip
	{
		
		public static function analyseWorkersArray (_inc:String) {
			globalParams.workersArray =[];
			
			if (_inc != null && _inc != "") {
				//что-то пришло, начинаем декодировать
				var jreq:Object = JSON.parse (_inc);
				//var jreq:Object = JSON.parse (unescape (_inc));
				//var jreq:Object = JSON.decode (unescape (_inc))
				globalParams.workersArray = jreq.workersArray
			}
			//Если зависнет прием данных от пользователя
			if (globalParams.workersArray == null) {
				globalParams.workersArray=[];
				personalMenue.Push_WorkersMarket();
			}
			//данные ботов (работников), содержащиеся в массиве
			// хрень =  color
// хрень =  exp
// хрень =  tech
// хрень =  lvl
// хрень =  botLastName
// хрень =  art
// хрень =  botName
// хрень =  clean
// хрень =  gender
// хрень =  work
// хрень =  coock
			
			
			
			trace("&&&&&&&&&&&&   load_personalMenue  TRACE = |",globalParams.workersArray,"|   _inc=",_inc,"## marketTime=",jreq.marketTime);
		}
		
		public static function analyseWorkersMarket(_inc:String)
		{
			//биржа труда, ее работники
			trace("&&&&&&&&&&&&   analyseWorkersMarket______________string_______________inc_|",_inc,"|_");
			//ничего не пришло
			if (_inc == null || _inc == "")
			{
				trace("analyseWorkersMarket___<<<<<<<<<<<<<<      ничего не пришло" );
				globalParams.workersMarket = new Array ();
				var rnd:Number = Math.ceil(Math.random() * 3) + 2;
				for (var i:int = 0; i < rnd; i++)
				{
					personalMenue.Push_WorkersMarket();
				}
			}
			else
			{
				trace(" <<<<<<<<<<<<<<   что-то пришло начинаем декодировать" );
				//что-то пришло начинаем декодировать
				if (_inc != "")
				{
					var req:Object = JSON.parse(_inc);
					
					//var req:Object = JSON.parse(unescape(_inc));
					//var req:Object = JSON.decode(unescape(_inc));
					
					if (req.marketTime == null)
					{
						req.marketTime = globalParams.globalTime;
					}
					trace(" <<<<<<<<<<<<<<   req.marketTime as Number" ,req.marketTime as Number);
					//введено 1 июля 2013
					req.marketTime=globalParams._handle_time.new_renderTime(req.marketTime)
					/*
					if (req.marketTime is Number == false) {
						
						req.marketTime=globalParams.UnixTime_Global
					}
					*/
var difference:Number = globalParams.UnixTime_Global-req.marketTime;
					//var difference:Number = globalParams._handle_time.returnTimeDifference(req.marketTime,globalParams.globalTime);
					trace("   difference",difference,"   req.workersMarket = ",req.workersMarket,"  req.marketTime=",req.marketTime);
					//difference = 3600
					if (difference > 1800)
					{
						//ОБНУЛЯЕМ
						analyseWorkersMarket(null);
					}
					else
					{
						trace("    ОБНУЛЯЕМ!!!  ")
						//присваиваем декодированные данные
						globalParams.workersMarket = req.workersMarket;
						//globalParams.workersMarket = [];
					}
					//данные безработных работников  содержащиеся в массиве
					//хрень =  color
// хрень =  art
// хрень =  exp
 //хрень =  tech
 //хрень =  botLastName
 //хрень =  botName
 //хрень =  clean
// хрень =  gender
 //хрень =  lvl
 //хрень =  coock
					
					
					trace("analyseWorkersMarket___globalParams.workersMarket||||||||||||||",globalParams.workersMarket);
				}
			}
		}
	}
}