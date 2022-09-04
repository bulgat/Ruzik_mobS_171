package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import tools.*;
	import flash.display.*;
	import fl.containers.UILoader;
	import flash.net.URLRequest;

	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.net.LocalConnection;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	public class table_game extends MovieClip
	{
		public var loader_:UILoader = new UILoader();
		var mcExternal:MovieClip;
		var loader:Loader = new Loader  ;
		var context:LoaderContext = new LoaderContext();

		var basaGame:Array = ["ruzik_card","Puzzle","ruzik_Air"];
		public function Launch()
		{
			trace("-------------------  Game_Btn   -------------------- ");
			globalParams.indexMc.systemMessage("Подождите, идет загрузка мини-игры.");
			var Ngame:int = Math.floor(Math.random() * basaGame.length);
			Loader_Aircraft(basaGame[Ngame]);
		}







		public function Loader_Aircraft(nameG:String):void
		{
			
				Security.allowDomain(globalParams.SERVERLocation);
				Security.allowInsecureDomain(globalParams.SERVERLocation);
	
				var loaderContext:LoaderContext = new LoaderContext();
				loaderContext.applicationDomain = ApplicationDomain.currentDomain;
				loaderContext.securityDomain = SecurityDomain.currentDomain;// Sets the security context to resolve Error # 2121 
				context.checkPolicyFile = false;
	
				globalParams.global_Log.push("\n ###### saveShot_API ######### "+new LocalConnection().domain);
				globalParams.indexMc.addChild(loader);
	
				loader.load(new URLRequest(globalParams.SERVERLocation+"mini/"+nameG+".swf"),loaderContext);
	
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE,swfIn_Aircraft);
				globalParams.global_Log.push("\n  s11  ");
			 
		}
		public function swfIn_Aircraft(e:Event):void
		{
			globalParams.global_Log.push("\n  saveShot_API_1 ");
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,swfIn_Aircraft);
			globalParams.global_Log.push("\n   222 loader.content as MovieClip");
			try
			{
				mcExternal = loader.content as MovieClip;
			}
			catch (e:Error)
			{

				trace(",________",e);
				globalParams.global_Log.push("\n   error="+e);
			}
			globalParams.global_Log.push("\n   A "+mcExternal.money);
			mcExternal.addEventListener("close",Unload_Close);

			globalParams.global_Log.push("\n  saveShot_API_11111111 ");
		}

		public function Unload_Close(e:Event):void
		{

			trace("!!!!!! Listener in container_1, user_cash=",globalParams.user_cash);
			globalParams.global_Log.push("\n money "+e.target.money);
			globalParams.user_cash +=  e.target.money;
			
			trace("review",mcExternal.money);
			trace("end  e.target.money",e.target.money);
			trace(" i= ",globalParams.user_cash);

			loader.unload();
			globalParams.indexMc.removeChild(loader);
			globalParams.indexMc._lands_message.removeMessageFn();
			if (e.target.money>0) {
				globalParams.indexMc.systemMessage("Игра прекращена. Вам на счет зачисленно "+e.target.money+" монет. +5 энергии.");
				globalParams.user_energy+=5
			} else {
				globalParams.indexMc.systemMessage("Игра прекращена. Вы ничего не выиграли.");
			}
			
		}



	}

}