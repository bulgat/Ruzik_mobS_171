package tools 
{
	//import com.carlcalderon.arthropod.Debug;
	
	import tools.*;

	/**
	 * ...
	 * @author Mutagen
	 */
	public class userLevelsTable
	{
		public static var 	koef		:int = 12,
							core		:Number = Math.sqrt(3);
		public static var _insertDataLog:insertDataLog = new insertDataLog();
		
		public function userLevelsTable() 
		{
			
		}
		public static var levelsArray:Array = new Array ()
		public static function getFromAdminPanelStatus (_type:String, _productType:String, lvl:int)
		{
			
			var lvl:int = lvl
			var req:Boolean = false
			var tmpObject:Object = new Object ()
			tmpObject.type = _type
			tmpObject.productType = _productType
			var attractionParams:Object = attractionClass.getAttracctionParams (tmpObject)
			
			if (attractionParams.level <= lvl) {
				req = true
			}
			return req
		}
		public static function getAttractionStatus (_inc:String,lvl:int) {
			
			//var req:Boolean = false
			
			if (globalParams.Building_Basa_Params[_inc]!= undefined) {
				if (lvl+1 >= globalParams.onGetAdminTableArray[_inc].level) {
					return true
				}
			}
			
			if (_inc == "size11x11") {
				if (globalParams.indexMc.ParkSize < 11) {
					return true
				}
			}
			if (_inc == "size13x13") {
				if (globalParams.indexMc.ParkSize == 11) {
					if (lvl+1 >= globalParams.onGetAdminTableArray["size13x13"].level) {
						return true
					}
				}
			}
			if (_inc == "size15x15") {
				if (globalParams.indexMc.ParkSize == 13) {
					if (lvl+1 >= globalParams.onGetAdminTableArray["size15x15"].level) {
						return true
					}
				}
			}
			if (_inc == "size17x17") {
				if (globalParams.indexMc.ParkSize == 15) {
					if (lvl+1 >= globalParams.onGetAdminTableArray["size17x17"].level) {
						return true
					}
				}
			}
			if (_inc == "size19x19") {
				if (globalParams.indexMc.ParkSize == 17) {
					if (lvl+1 >= globalParams.onGetAdminTableArray["size19x19"].level) {
						return true
					}
				}
			}
			if (_inc == "size21x21") {
				if (globalParams.indexMc.ParkSize == 19) {
					if (lvl+1 >= globalParams.onGetAdminTableArray["size21x21"].level) {
						return true
					}
				}
			}
			if (_inc == "size25x25") {
				if (globalParams.indexMc.ParkSize == 21) {
					if (lvl+1 >= globalParams.onGetAdminTableArray["size25x25"].level) {
						return true
					}
				}
			}
			if (_inc == "ironPlanet") {
				if (globalParams.ironPlanet==false) {
				if (lvl+1 >= globalParams.onGetAdminTableArray["ironPlanet"].level) {
						return true
				}
				}
			}
			
			
			if (_inc == "decoration") {
				return true
			}
			return false
		}
		public static function getNew (_inc:String) {
			
			
			if (userLevelsTable.getAttractionStatus (_inc,globalParams.user_lvl)) {
				if (!userLevelsTable.getAttractionStatus (_inc,globalParams.user_lvl-1)) {
					return true
				}
			}
			return false
		}
		
		public static function getExperiencePercent ():String {
			var req:String
			
			globalParams.Exp_MaxLv = Math.floor((Math.pow((1+core)/2, globalParams.user_lvl + 2) -  Math.pow((1-core)/2, globalParams.user_lvl))/core * 100);
			//trace("     requaredExp = ",globalParams.Exp_MaxLv," =",int(globalParams.Exp_MaxLv),"______   globalParams.user_exp=",globalParams.user_exp);
			
			req = exp_filter (globalParams.user_exp) + "/" + exp_filter (Math.floor(globalParams.Exp_MaxLv));
			globalParams.indexMc._lands_Interface.refresh_indicator()
			//globalParams.indexMc._lands_Interface.indicatorsMc.exp.preMask.scaleX = globalParams.user_exp / Math.floor(globalParams.Exp_MaxLv);
			return req
		}
		public static function exp_filter (exp:Number):String {
			if (exp>1000000) {
				exp/=1000000
				exp=Math.round(exp)
				return exp+"Kk"
			}
			if (exp>1000) {
				exp/=1000
				exp=Math.round(exp)
				return exp+"k"
			}
			return exp.toString();
		}
		public static function kukuSpending (inm:int,spend:String) {
			globalParams.indexMc.kukubaksi-=inm;
			_insertDataLog.insert_Data_Log ("spend");
			globalParams.indexMc._insertBillingInfo.init(inm, spend+'_'+globalParams.G_PLANET);
		}
		//добавить опыт
		public static function addExperience (inc:Number) {
			globalParams.indexMc.expPopup.gotoAndPlay (1)
			inc*=globalParams.buy_booster
			globalParams.indexMc.expPopup.textBaloon.textBaloon.textLable.text = "" + inc
			if (inc > 0) {
				globalParams.indexMc.expPopup.textBaloon.textBaloon.textLable.text = "+" + inc
			}
			globalParams.user_exp = globalParams.user_exp + inc
			trace(globalParams.user_lvl,"###   globalParams.user_exp = ",globalParams.user_exp,"   boost",globalParams.buy_booster);
			//если накоплено експа идет переход на новый уровень
			if (globalParams.user_exp >= globalParams.Exp_MaxLv)
			{
				//добавить уровень
				globalParams.needToUpdateLevel = true;
				//костыль может поможет прибавлять куку
				globalParams.indexMc.kukubaksi+=2;
				//globalParams.indexMc._lands_Interface.indicatorsMc.kukubaksLable.text = String(globalParams.indexMc.kukubaksi);
				globalParams.indexMc._lands_Interface.refresh_indicator();
				
				globalParams.user_exp = globalParams.user_exp - globalParams.Exp_MaxLv
				globalParams.user_lvl = globalParams.user_lvl + 1;
				
				globalParams.indexMc._insertBillingInfo.init(2, 'levelUp_'+globalParams.G_PLANET);
				//trace("###   globalParams.indexMc.kukubaksi = ",globalParams.indexMc.kukubaksi);
				
				globalParams.indexMc.systemMessage ("Поздравляем вы достигли " + globalParams.user_lvl + " уровня.");
				_insertDataLog.insert_Data_Log ("LevelUp");
				//еще запись данных о игре
				globalParams.indexMc._updateSavedGames.init_Save (globalParams.UPDATE_RATING,true);
			
				if (!globalParams.alone) {
					globalParams.indexMc._post_image.post_launch("взят новый уровень","levelUp");
				}
			}
		}
	}
}