package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;

	public class land_personalMenu extends MovieClip
	{
		public var _personalMenue:personalMenue;
		public function add_PersonalMenue()
		{
			//добавляет фон для персонал меню
			globalParams.indexMc._soundProcessor.playSnd("click");
			_personalMenue = new personalMenue ();

			//_personalMenue.x = 350;
			//_personalMenue.y = 300;
			_personalMenue.x = 420;
			_personalMenue.y = 325;
			_personalMenue.fon.addEventListener(MouseEvent.CLICK, killPersonalInterface);
			_personalMenue.windowMc.closeBtn.addEventListener(MouseEvent.CLICK, killPersonalInterface);
			addChild(_personalMenue);
		}
		public function showPersonalMenue(e:MouseEvent)
		{
			//добавляет фон для персонал меню
			add_PersonalMenue();
			_personalMenue.worker_PersonalMenueBtnFn(e);
		}

		public function showWorkerMarketMenue(e:MouseEvent)
		{
			add_PersonalMenue();
			_personalMenue.workerMarketBtnFn(e);
		}

		public function showAttractionListMenue(e:MouseEvent)
		{
			add_PersonalMenue();
			_personalMenue.buildingtBtnFn(e);
		}
		public function killPersonalInterface(e:MouseEvent)
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			this.removeChild(_personalMenue);
			_personalMenue = null;
		}
		public function killPersonalInterface_New()
		{
			globalParams.indexMc._soundProcessor.playSnd("click");
			this.removeChild(_personalMenue);
			_personalMenue = null;
		}
		public function addWorkerInterfaceFn(id:Number)
		{
			_personalMenue = new personalMenue ();
			_personalMenue.x = 420;
			_personalMenue.y = 325;
			
			_personalMenue.attachWorkerInit(id);
			_personalMenue.fon.addEventListener(MouseEvent.CLICK, killPersonalInterface);
			_personalMenue.windowMc.closeBtn.addEventListener(MouseEvent.CLICK, killPersonalInterface);
			addChild(_personalMenue);
		}
	}

}