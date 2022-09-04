package tools 
{
	/**
	 * ...
	 * @author Mutagen
	 */
	public class dataObjectTranslator
	{
		
		public function dataObjectTranslator() 
		{
			
		}
		public static function returnObject (incomming:String) {
			var req:Object = new Object ()
			var tmpTrigger:String = "year"
			var tmpStr:String = ""
			for (var i = 0; i < incomming.length; i++) {
				if (incomming.substr (i, 1) != "," && incomming.substr (i, 1) != " ") {
					tmpStr = tmpStr + incomming.substr (i, 1)
				}
				if (tmpTrigger == "year") {
					if (incomming.substr (i, 1) == ",") {
						req.year = int (tmpStr)
						tmpStr = ""
						tmpTrigger = "day"
					}
				} else if (tmpTrigger == "day") {
					if (incomming.substr (i, 1) == ",") {
						req.day = int (tmpStr)
						tmpStr = ""
						tmpTrigger = "month"
					}
				} else if (tmpTrigger == "month") {
					if (incomming.substr (i, 1) == ",") {
						req.month = int (tmpStr)
						tmpStr = ""
						tmpTrigger = "hour"
					}
				} else if (tmpTrigger == "hour") {
					if (incomming.substr (i, 1) == ",") {
						req.hour = int (tmpStr)
						tmpStr = ""
						tmpTrigger = "minute"
					}
				} else if (tmpTrigger == "minute") {
					if (incomming.substr (i, 1) == ",") {
						req.minute = int (tmpStr)
						tmpStr = ""
						tmpTrigger = "second"
					}
				} else if (tmpTrigger == "second") {
					if (i == incomming.length-1) {
						req.second = int (tmpStr)
						tmpStr = ""
						tmpTrigger = "eof"
					}
				}
				
			}
			return req
		}
		
	}

}