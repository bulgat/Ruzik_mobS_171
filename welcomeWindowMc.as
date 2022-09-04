package
{
	
	import flash.display.MovieClip;
	//import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.system.LoaderContext;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.events.TextEvent; 
	public class welcomeWindowMc extends MovieClip
	{
		//const loaderContext:LoaderContext = new LoaderContext(true);
		
		//var XMLLoader	:URLLoader = new URLLoader(),
			//XMLData		:XML,
			//XMLLocation	:String = 'http://www.vps14278.vps.tech-logol.ru/ruzikland_pre_release/welcome.xml',
			//XMLLocation	:String = globalParams.WelcomeLocation;
			//loader		:Loader = new Loader();
		//public var _batch:batch = new batch();
		//public var bmp:Bitmap = new Bitmap(_batch);
		
		public function welcomeWindowMc()
		{
			this.x = globalParams.stageMc.stage.stageWidth / 2;
			this.y = globalParams.stageMc.stage.stageHeight / 2;
			
			windowMc.okBtn.addEventListener (MouseEvent.CLICK, closeAndInitiate);	
			windowMc.crossBtn.addEventListener (MouseEvent.CLICK, closeAndInitiate);
			//windowMc.ruzikland.addEventListener (MouseEvent.CLICK, _ruzikland);
			//windowMc.ruzikland.buttonMode = true;
			//windowMc.ruzikland.useHandCursor = true;
			//addChild(friendsPanel);
			//friendsPanel.addEventListener('gotCells', gotCellsHandler);
			
			//addChild (messageMc);
			/*
			try {
				XMLLoader.load(new URLRequest(XMLLocation));
			} catch(e:Error) {
				trace("Error load welcomeWindowMc");
			}
			*/
			this.gotoAndPlay(1)
			//XMLLoader.addEventListener(Event.COMPLETE, infoLoaded);
		windowMc.ruzikland.htmlText = " <a href='event:http://vkontakte.ru/public34279239'>  www.vk.com/ruzikland</a> ";
		windowMc.ermine.htmlText = " <a href='event:http://erminerussia.ru'>  Команда разработчиков Ermine Digital Agency.</a> ";
		//http://erminerussia.ru/
		windowMc.ruzikland.addEventListener("link", clickHandler);
		windowMc.ermine.addEventListener("link", clickHandler);
		}
		private function clickHandler(e:TextEvent):void {
        	trace(e.type); // link
      	 	trace(e.text,"    "); // myEvent
		_ruzikland(e.text)
		}
		public function closeAndInitiate (e:MouseEvent) {
			parent.removeChild(this)
		}
		
		
		
		private function _ruzikland(adress:String):void
		{
			navigateToURL(new URLRequest(adress));
		}
		
		/*
		private function infoLoaded(e:Event):void
		{
			XMLLoader.removeEventListener(Event.COMPLETE, infoLoaded);
			XMLData = new XML(e.currentTarget.data);
			
			if(XMLData.title == '')
			{
				MovieClip(parent).removeChild(this);
				return;
			}
			//windowMc.title.text = XMLData.title;
			//windowMc.message.text = XMLData.message;
			
			//trace(globalParams.SERVER_shop,"  LOAD = ",XMLData.image);
			//bmp.x = windowMc.imageContainer.x;
			//bmp.y = windowMc.imageContainer.y;
			//windowMc.addChild(bmp);
			//loader.load(new URLRequest(String(globalParams.SERVER_shop+"/images/kukuruza.png")), loaderContext);
			//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
		
		}
		
		private function imageLoaded(e:Event):void
		{
			
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageLoaded);
			
			try {
				loader.x = windowMc.imageContainer.x;
				loader.y = windowMc.imageContainer.y;
			} catch(e:Error) {
				trace('картинка загрузилась ERROR');
			}
			
			bmp.x = windowMc.imageContainer.x;
				bmp.y = windowMc.imageContainer.y;
			windowMc.addChild(bmp);
			
			//windowMc.addChild(loader);
		}
	*/
	}
	
}
