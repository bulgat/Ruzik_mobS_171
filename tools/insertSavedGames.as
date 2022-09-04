package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	//import classes.json.JSON;
	import classes.ServerProvider;
	import flash.events.MouseEvent;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class insertSavedGames extends MovieClip
	{
		private var _serverProvider:ServerProvider = new ServerProvider();
		
		public function insertSavedGames () 
		{
			
		}
		public function init (INSERT_RATING:String) 
		{
			
			
			var variables:URLVariables = new URLVariables();
            variables.cmd = "insertRating"
            variables.uid = globalParams.UID
            variables.buildingData = getBuildingData ()
            variables.workerMarketData = getWorkerMarketData ()
            variables.rand = Math.ceil (Math.random()*10000)
			if (!globalParams.alone) {
			_serverProvider.initPost (variables, INSERT_RATING);
			_serverProvider.addEventListener(ServerProvider.COMPLETE, onInsertRating);
			_serverProvider.addEventListener(ServerProvider.ERROR, onServerProviderError);
			}
		}
		
		
		
		public function getBuildingData () {
			var req:Object = globalParams.indexMc._getBuildingData.buildingData (true)
			var saveLine:String
			saveLine = JSON.stringify (req);
			//saveLine = escape (JSON.encode(req))
			
			return saveLine
		}
		private function getWorkerMarketData () {
			trace("]]]]]getWorkerMarketData[[[[[[");
			//обнуляем персонал ? зачем 
			load_personalMenue.analyseWorkersMarket (null)
			var req:Object = new Object ()
			req.marketTime = globalParams.globalTime
			req.workersMarket = globalParams.workersMarket
			
			var saveLine:String
			saveLine = JSON.stringify(req);
			//saveLine = escape (JSON.encode(req))
			saveLine = "%7B%22landHeight%22%3A19%2C%22currentMoney%22%3A2412%2C%22objectsArray%22%3A%5B%7B%22goods%22%3Anull%2C%22j%22%3A19%2C%22level%22%3Anull%2C%22prevProfit%22%3A9%2C%22statusObject%22%3Anull%2C%22price%22%3A1%2C%22openTrigger%22%3Atrue%2C%22profit%22%3A1%2C%22type%22%3A%22enterBoth%22%2C%22worker%22%3Anull%2C%22i%22%3A9%2C%22productType%22%3A%22tickets%22%7D%2C%7B%22goods%22%3A0%2C%22j%22%3A17%2C%22level%22%3A1%2C%22prevProfit%22%3A0%2C%22statusObject%22%3A%7B%22time%22%3A0%2C%22startTime%22%3A%7B%22minute%22%3A51%2C%22hour%22%3A14%2C%22month%22%3A8%2C%22day%22%3A12%2C%22second%22%3A23%2C%22year%22%3A2011%7D%2C%22status%22%3A%22full_charge%22%7D%2C%22price%22%3A0%2C%22openTrigger%22%3Atrue%2C%22profit%22%3A0%2C%22type%22%3A%22lavka%22%2C%22worker%22%3Anull%2C%22i%22%3A6%2C%22productType%22%3A%22none%22%7D%2C%7B%22goods%22%3A0%2C%22j%22%3A17%2C%22level%22%3A1%2C%22prevProfit%22%3A0%2C%22statusObject%22%3A%7B%22time%22%3A0%2C%22startTime%22%3A%7B%22minute%22%3A51%2C%22hour%22%3A14%2C%22month%22%3A8%2C%22day%22%3A12%2C%22second%22%3A23%2C%22year%22%3A2011%7D%2C%22status%22%3A%22full_charge%22%7D%2C%22price%22%3A0%2C%22openTrigger%22%3Atrue%2C%22profit%22%3A0%2C%22type%22%3A%22lavka%22%2C%22worker%22%3Anull%2C%22i%22%3A12%2C%22productType%22%3A%22none%22%7D%2C%7B%22goods%22%3A0%2C%22j%22%3A14%2C%22level%22%3A1%2C%22prevProfit%22%3A0%2C%22statusObject%22%3A%7B%22time%22%3A0%2C%22startTime%22%3A%7B%22minute%22%3A51%2C%22hour%22%3A14%2C%22month%22%3A8%2C%22day%22%3A12%2C%22second%22%3A47%2C%22year%22%3A2011%7D%2C%22status%22%3A%22full_charge%22%7D%2C%22price%22%3A0%2C%22openTrigger%22%3Atrue%2C%22profit%22%3A0%2C%22type%22%3A%22lavka%22%2C%22worker%22%3Anull%2C%22i%22%3A12%2C%22productType%22%3A%22none%22%7D%2C%7B%22goods%22%3A0%2C%22j%22%3A14%2C%22level%22%3A1%2C%22prevProfit%22%3A0%2C%22statusObject%22%3A%7B%22time%22%3A0%2C%22startTime%22%3A%7B%22minute%22%3A51%2C%22hour%22%3A14%2C%22month%22%3A8%2C%22day%22%3A12%2C%22second%22%3A47%2C%22year%22%3A2011%7D%2C%22status%22%3A%22full_charge%22%7D%2C%22price%22%3A0%2C%22openTrigger%22%3Atrue%2C%22profit%22%3A0%2C%22type%22%3A%22lavka%22%2C%22worker%22%3Anull%2C%22i%22%3A6%2C%22productType%22%3A%22none%22%7D%5D%2C%22landWidth%22%3A19%2C%22random%22%3A64801%2C%22enterPosition%22%3A%22up%22%2C%22roadsArray%22%3A%5B%7B%22j%22%3A18%2C%22i%22%3A9%7D%2C%7B%22j%22%3A17%2C%22i%22%3A9%7D%2C%7B%22j%22%3A17%2C%22i%22%3A8%7D%2C%7B%22j%22%3A17%2C%22i%22%3A10%7D%2C%7B%22j%22%3A17%2C%22i%22%3A7%7D%2C%7B%22j%22%3A17%2C%22i%22%3A11%7D%2C%7B%22j%22%3A17%2C%22i%22%3A12%7D%2C%7B%22j%22%3A16%2C%22i%22%3A12%7D%2C%7B%22j%22%3A15%2C%22i%22%3A12%7D%2C%7B%22j%22%3A14%2C%22i%22%3A12%7D%2C%7B%22j%22%3A14%2C%22i%22%3A11%7D%2C%7B%22j%22%3A17%2C%22i%22%3A6%7D%2C%7B%22j%22%3A16%2C%22i%22%3A6%7D%2C%7B%22j%22%3A15%2C%22i%22%3A6%7D%2C%7B%22j%22%3A14%2C%22i%22%3A10%7D%2C%7B%22j%22%3A14%2C%22i%22%3A9%7D%2C%7B%22j%22%3A14%2C%22i%22%3A8%7D%2C%7B%22j%22%3A14%2C%22i%22%3A7%7D%2C%7B%22j%22%3A14%2C%22i%22%3A6%7D%5D%7D"
			
			return saveLine
		}
		private function onInsertRating(e:Event):void 
		{
			//globalParams.indexMc.systemMessage ("Получены данные с сервера - " + e.target.responseObj)
			_serverProvider.removeEventListener(ServerProvider.COMPLETE, onInsertRating);
			
			var result:Object = {}
			result = JSON.parse(e.target.responseObj);
			//result = JSON.decode(e.target.responseObj);
		}
		private function onServerProviderError(e:Event):void 
		{
			/*globalParams.indexMc.systemMessage ("onServerProviderError")
			_serverProvider.removeEventListener(ServerProvider.ERROR, onServerProviderError);*/
		}
	}

}