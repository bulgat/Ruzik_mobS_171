package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import flash.events.Event;
	import tools.*;

	public class exp_table extends MovieClip
	{
		
		public function Launch()
		{
			this.x=25;
			this.x=15;
			close.addEventListener(MouseEvent.CLICK, _close);
			closeBtn.addEventListener(MouseEvent.CLICK, _close);
			levelLable.text = globalParams.user_lvl + ""
			exp.preMask.scaleX = globalParams.user_exp / Math.floor(globalParams.Exp_MaxLv);
			//userLevelsTable.getExperiencePercent()
			experienceMeterText.text = globalParams.user_exp+"/"+globalParams.Exp_MaxLv;
		var exp_rest:Number = globalParams.Exp_MaxLv-globalParams.user_exp;
		exp_Text.text = "до следущего уровня осталось: "+exp_rest+" exp.";
		globalParams.indexMc._soundProcessor.playSnd ("click");
		
		booster.label="ускорить"
		booster.addEventListener (MouseEvent.CLICK, booster_click)
		trace("  %%%%%%%%%%%%    exp_rest = ",exp_rest);
		}
		public function _close(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click");
			
			parent.removeChild(this);
		
		}
		public function booster_click(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd ("click");
		var _yesNoMessage:yesNoMessage = new yesNoMessage();
		_yesNoMessage.Message("Купить ускорение за 3 кукубакса? Опыт и прибыль удваивается в течение часа.");
		_yesNoMessage.button_text("Купить","Отмена","Купить ускорение?");
		_yesNoMessage.addEventListener ("confirm", addBooster)
				
		
		addChild(_yesNoMessage);
		}
		public function addBooster (e:Event)
		{
			
			
		
			globalParams.buy_time_booster=globalParams.UnixTime_Global
			globalParams.buy_booster=2
			userLevelsTable.kukuSpending (-3,"booster")
			
			parent.removeChild(this);
		}
	
	}

}