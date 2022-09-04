package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	import tools.*;
	public class lands_bot extends MovieClip
	{
		public function botAdding():void
		{
			++globalParams.indexMc.botAddingTimer;
			if (globalParams.indexMc.botAddingTimer > globalParams.indexMc.botAddingRnd)
			{
				globalParams.indexMc.botAddingTimer = 0;
				globalParams.indexMc.botAddingRnd = 100 + Math.ceil(Math.random() * 300);
				var n:int = globalParams.indexMc.botArray.length;
				globalParams.indexMc.botArray.push(new botEngine ());
				var rnd:Number = Math.random() * 50;
				var k:int = globalParams.indexMc.botButtonArray.length;
				globalParams.indexMc.botButtonArray.push(new Object ());
				globalParams.indexMc.botButtonArray[k].button = new botButton_mc ();
				globalParams.indexMc.botButtonArray[k].button.id = n;
				globalParams.indexMc.botButtonArray[k].button.idk = k;
				globalParams.indexMc.botButtonArray[k].id = n;
				globalParams.indexMc.botButtonArray[k].button.target = globalParams.indexMc.botArray[n];
				globalParams.indexMc.botButtonArray[k].button.addEventListener(MouseEvent.CLICK, showBotMenue);
				globalParams.indexMc.objectsButtonLayer.addChild(globalParams.indexMc.botButtonArray[k].button);
				if (globalParams.indexMc.enterPosition == "up")
				{
					if (rnd < 25)
					{
						globalParams.indexMc.botArray[n].initiateBot(globalParams.indexMc.newlandWidth+1, globalParams.indexMc.newlandWidth+1, "nw");
					}
					if (rnd >= 25)
					{
						globalParams.indexMc.botArray[n].initiateBot(0, globalParams.indexMc.newlandWidth+1, "se");
					}

					if (globalParams.indexMc.botArray[n].botName == "Хулиган")
					{
						globalParams.indexMc.botButtonArray[k].button.addEventListener(MouseEvent.MOUSE_OVER, Bot_Club);
						globalParams.indexMc.botButtonArray[k].button.addEventListener(MouseEvent.MOUSE_OUT, remove_Bot_Club);
					}

				}
			}
		}
		public function removeBot(mc:MovieClip):void
		{
			mc.removeListeners();
			for (var i = 0; i < globalParams.indexMc.botArray.length; i++)
			{
				if (globalParams.indexMc.botArray[i] == mc)
				{

					globalParams.indexMc.botArray.splice(i, 1);
				}
			}
		}

		public function showBotMenue(e:MouseEvent)
		{
			showPosetitelMenue(e.currentTarget.target);
		}
		var _Club:Club = new Club();
		var timerBot_Club:int;
		public function Bot_Club(e:MouseEvent)
		{
			_Club.x = mouseX + 5;
			_Club.y = mouseY - 30;
			_Club.scaleX = .7;
			_Club.scaleY = .7;
			e.currentTarget.scaleX = 3;
			e.currentTarget.scaleY = 3;
			Mouse.hide();
			globalParams.indexMc.addChild(_Club);
			timerBot_Club = 0;
		}

		public function remove_Bot_Club(e:MouseEvent)
		{

			globalParams.indexMc.removeChild(_Club);
			Mouse.show();
		}
		private var botMenueMc:MovieClip;
		public function showPosetitelMenue(_mc:botEngine)
		{
			if (_mc.botName != "Хулиган")
			{

				if (botMenueMc != null)
				{
					botMenueMc.mc.action = botMenueMc.prevAction;
					globalParams.indexMc.removeChild(botMenueMc);
					botMenueMc = null;
				}
				botMenueMc = new botMenue ();
				botMenueMc.init(_mc);
				botMenueMc.fon.addEventListener(MouseEvent.CLICK, closePosetitelMenue);
				botMenueMc.windowMc.okBtn.addEventListener(MouseEvent.CLICK, closePosetitelMenue);
				globalParams.indexMc.addChild(botMenueMc);
				globalParams.indexMc._lands_Sort.sortObjectsButtonsFn(globalParams.indexMc.objectsButtonArray,globalParams.indexMc.botButtonArray);
				//Пятый квест;
				//5;
				globalParams.indexMc._lands_Quest._Quest(4);
			}
			else
			{

				if (globalParams.indexMc._lands_Interface.user_energy(true))
				{
					userLevelsTable.addExperience(1);


					globalParams.indexMc._lands_bot.removeBot(_mc);
					globalParams.indexMc._soundProcessor.playSnd("kick");
				}
			}
		}
		public function closeOnAttractionWorkerMenue(e:MouseEvent)
		{
			if (botMenueMc != null)
			{
				globalParams.indexMc.removeChild(botMenueMc);
				botMenueMc = null
				;
			}
		}

		public function closePosetitelMenue(e:MouseEvent)
		{

			if (botMenueMc != null)
			{
				botMenueMc.mc.action = botMenueMc.prevAction;
				globalParams.indexMc.removeChild(botMenueMc);
				botMenueMc = null;
			}
		}

	}

}