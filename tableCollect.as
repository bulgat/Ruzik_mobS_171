package 
{
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import flash.events.MouseEvent;
import flash.events.*;
import flash.filters.ColorMatrixFilter;
import fl.motion.ColorMatrix;
	public class tableCollect extends MovieClip
	{
		public var collectionsArray:Array = [1,1,1,1,1,2,2,2,2,2];
		public var _presents:presents = new presents();
		public var PresCell:int = 5;
		public var _presNames:Object = [];
		public var helpCollection:Object = [{name:"коллекция эколога",effect:"Посетители 3 дня не будут мусорить в вашем парке.",help:"Время от времени на планету падает космический мусор. Да и сами лунатики порой вынуждены мусорить. Чтобы избежать этого, и собрать коллекцию, необходимо размещать урны, а также убирать накопившейся мусор в парках у себя и у друзей."},
											{name:"коллекция стража порядка",effect:"В парке появится Робокот, который будет 3 дня патрулировать ваш парк, уничтожая хулиганов.",help:"В парке время от времени появляются вандалы, которые ломают аттракционны и прочие объекты инфраструктуры. Также они отпугивают посетителей. Следи за порядком в своем парке, а также у друзей, чтобы собрать коллекцию."}];
		var offset:Number = 0.33;
		var cmf:ColorMatrixFilter = new ColorMatrixFilter ([offset, offset, offset, 0, 0,
                                                    offset,offset,offset,0,0,
                                                    offset,offset,offset,0,0,
                                                    0, 0, 0, 1, 0]);
		
		public function Anim()
		{
			// constructor code
			
			createPresents();
			
			enableSlideAnimation()
			collect_name.text="коллекция эколога"
		collect_help.text=""+helpCollection[0].help
		vis_shield(0)
		}
		public function close_click(e:MouseEvent):void
		{
			parent.removeChild(this);
		}
		public function createPresents():void
		{
			close.addEventListener(MouseEvent.CLICK,close_click);
			_shield.addEventListener(MouseEvent.CLICK,_shield_click);
			//globalParams.indexMc.collectionsArray =[1,0,2,0,1,2,2,2,2,2];
			
			
			mask_collect.addChildAt(_presents,1);
			_presents.scaleX=.6
			_presents.scaleY=.6
			//_presents.x = 60;
			//_presents.y = 140;
			
			//presents.
			for (var i:int = 0; i<10; ++i)
			{
				
				var _assemblage:assemblage=new assemblage();
				_assemblage.gotoAndStop(i+1);
				_assemblage.count.text="x"+globalParams.indexMc.collectionsArray[i];
				if (globalParams.indexMc.collectionsArray[i]==0) {
					_assemblage.filters=[cmf]
				}
				
				place(i,_assemblage);

				_assemblage.addEventListener(MouseEvent.CLICK,imgClickHandler);
				
				_presents.addChild(_assemblage);
				_presNames.push(_assemblage);



			}

		}
		var shield_collectNum:int
		public function vis_shield(num:int):void
		{
			_shield.visible = full_Collection(num,false)
			_shield.symbol.gotoAndStop(num+1)
			if (_shield.visible ==true) {
				collect_help.text="Поздравляю! вы собрали "+helpCollection[num].name+", вы можете ее потратить, включив спецдействие. "+helpCollection[num].effect
		
			}
			shield_collectNum=num
		}
		public function _shield_click(e:MouseEvent):void
		{
			
			collect_help.text="Предметы  "+helpCollection[shield_collectNum].name+" приведены в действие! ";
			if (shield_collectNum==0) {
				globalParams.indexMc.systemMessage ("Поздравляю! Теперь посетители не будут мусорить в парке 3 дня!");
				globalParams.Interdict_Litter = true;
				
				globalParams.Period_Interdict_Litter = globalParams.UnixTime_Global;
				
				full_Collection(0,true);
			globalParams.indexMc.collectionsHandler.setCollection();
			} else {
					globalParams.indexMc.systemMessage ("Поздравляю! Вы получаете в подарок Робокота!");
				globalParams.Allow_Robocat = true;
				
				globalParams.Period_Robocat = globalParams.UnixTime_Global;
				full_Collection(1,true);
				globalParams.indexMc.collectionsHandler.setCollection();
			}
		
			globalParams.indexMc._lands_Interface.refresh_menu()
		globalParams.indexMc._soundProcessor.playSnd("click");
		parent.removeChild(this)
		}
		
		//установка иконок
		public function place(num:int,e:Object):void
		{
			e.x = int(num/10)*510+(num%10)*130;
			e.y = (num%10<10)?0:170;
		}

		public function imgClickHandler(e:MouseEvent):void
		{
			trace("_imgClickHandler_ __zzzzzzzzzzzzzz = ");
		}

		public function slideLeft(e:MouseEvent):void
		{
			trace("left _img _presents.x",_presents.x);
			slide("left");
		collect_name.text="коллекция эколога"
		collect_help.text=""+helpCollection[0].help
		vis_shield(0)
		}
		public function slideRight(e:MouseEvent):void
		{
			trace("right _img _presents.x",_presents.x);
			slide("right");
		collect_name.text="коллекция стража порядка"
		collect_help.text=""+helpCollection[1].help
		vis_shield(1)
		}
		public function full_Collection(Type:int,Del:Boolean):Boolean
		{
			Type*=5;
			var Full_collect:int;
			for (var i:int = 0; i < 5; i++) {
				if (globalParams.indexMc.collectionsArray[Type+i]>0) {
					Full_collect++
					
					if (Del) {
						globalParams.indexMc.collectionsArray[Type+i]--;
					}
				
				}
			}
			
			if (Full_collect>=5) {
				return true
			} else {
				return false
			}
		}
		
		
		public function enableSlideAnimation():void
		{
			if (! backArrow.hasEventListener(MouseEvent.CLICK))
			{
				backArrow.addEventListener(MouseEvent.CLICK,slideLeft);
			}
			if (! forwArrow.hasEventListener(MouseEvent.CLICK))
			{
				forwArrow.addEventListener(MouseEvent.CLICK,slideRight);
			}
		}
		public function disableSlideAnimation():void
		{
			if (backArrow.hasEventListener(MouseEvent.CLICK))
			{
				backArrow.removeEventListener(MouseEvent.CLICK,slideLeft);
			}
			if (forwArrow.hasEventListener(MouseEvent.CLICK))
			{
				forwArrow.removeEventListener(MouseEvent.CLICK,slideRight);
			}
		}
		public function slide(direction:String):void
		{
			trace("0       ЫДШВУ ",_presents.x);
			
			trace("1       ЫДШВУ ",_presents.x);
			var a:Tween;
			if (direction=="right")
			{
				//a = new Tween(_presents,"x",Strong.easeOut,_presents.x,_presents.x - 640,60);
				a = new Tween(_presents,"x",Strong.easeOut,_presents.x,-390,60);
				a.start();
				a.addEventListener(TweenEvent.MOTION_FINISH,anim_obj);
			
			}
			if (direction=="left")
			{
				//a = new Tween(_presents,"x",Strong.easeOut,_presents.x,_presents.x + 640,60);
				a = new Tween(_presents,"x",Strong.easeOut,_presents.x,5,60);
				a.start();
				a.addEventListener(TweenEvent.MOTION_FINISH,anim_obj);
			
			}
		}
		public function anim_obj(e:TweenEvent):void
		{
			trace("stop");
		}

	}

}