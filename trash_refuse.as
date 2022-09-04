package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	import flash.geom.Point;

	import flash.filters.GradientGlowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.BlurFilter;
import flash.geom.Point;
	public class trash_refuse extends MovieClip
	{
		public var Basa_Button_Refuse:Array = [];
		//public var bf:BlurFilter = new BlurFilter(2, 2, 3);


		public function Add_Refuse(Num_Trash:int):void
		{

			trace("Add_Refuse    REFUSE = ",Num_Trash,"    globalParams.indexMc.roadsArray.length=",globalParams.indexMc.roadsArray.length);
			//анти завис, если дорог нет, то мусор не размещать
			if (globalParams.indexMc.roadsArray.length>0) {
				for (var i:int = 0; i < Num_Trash; i ++)
				{
					
					create_trash();
				
				}
			}

		}
		public function litter_Refuse():void
		{
			if (1==Math.ceil ((Math.random () * 5000)))
			{
				create_trash();
				globalParams.indexMc._soundProcessor.playSnd("showWindow");
			}

		}
		public function create_x_y():Point
		{
			
			var sel:int = Math.floor ((Math.random () * globalParams.indexMc.roadsArray.length));
			trace(" TRASH  create_x_y =",globalParams.indexMc.roadsArray.length,sel)
			trace(" TRASH  create_x_y =",globalParams.indexMc.roadsArray[sel].i,globalParams.indexMc.roadsArray[sel].j)
			var _x_y:Point = new Point(globalParams.indexMc.roadsArray[sel].i,globalParams.indexMc.roadsArray[sel].j)
			return _x_y;
		}
		
		public function prohibitionCell(mc_i:int,mc_j:int):Boolean
		{
			if (mc_i <= globalParams.indexMc.landWidth && mc_j <= globalParams.indexMc.landHeight)
			{
				if (mc_i > 0 && mc_j > 0)
				{
					return false
				}
			}
		return true
		}
		public function prohibit_trash_and_building(mc1:Object):Boolean
		{
			var mc_i:int=mc1.i+1
			var mc_j:int=mc1.j-1
			
			if (!prohibitionCell(mc_i,mc_j))
			{
				if (!prohibitionCell(mc_i+1,mc_j-1)) {
					var _nameObject:String = globalParams.indexMc.lanscapeArray[mc_i+1][mc_j-1].cellType
					_nameObject = _nameObject.slice(0,_nameObject.length-5)
					
					if (globalParams.Building_Basa_Params[_nameObject]!=undefined) {
						
						if (globalParams.Building_Basa_Params[_nameObject].skyscraper) {
							return true
						}
						
					}
					
				}
				if (!prohibitionCell(mc_i+2,mc_j-2)) {
					var _nameObject2:String = globalParams.indexMc.lanscapeArray[mc_i+2][mc_j-2].cellType
					_nameObject2 = _nameObject2.slice(0,_nameObject2.length-5)
					
					if (globalParams.Building_Basa_Params[_nameObject2]!=undefined) {
						
						if (globalParams.Building_Basa_Params[_nameObject2].skyscraper) {
							return true
						}
						
					}
					
				}
				
				if (globalParams.indexMc.lanscapeArray[mc_i][mc_j].cellType=="grass"||globalParams.indexMc.lanscapeArray[mc_i][mc_j].cellType=="road") {
					globalParams.indexMc.lanscapeArray[mc_i][mc_j].visible = false
					return false
				} else {
					return true
				}
				
			} else {
				return false
			}
			
			return false
		}
		
		public function create_trash():void
		{
			//road_freedom_building()
			if (globalParams.Interdict_Litter == false)
			{
				if (8>globalParams.indexMc.refuse_Array.length) {
			
				
				var _Refuse:Refuse = new Refuse ();
				var But_Refuse:Refuse = new Refuse ();
				get_coordinate(_Refuse,But_Refuse)
				

				But_Refuse.buttonMode = true;
				But_Refuse.useHandCursor = true;
				var Image:int = Math.ceil ((Math.random () * 3));
				var Image_Rotate:int = Math.ceil ((Math.random () * 360));
				_Refuse.gotoAndStop(Image);
				But_Refuse.gotoAndStop(Image);

				_Refuse.rotation = Image_Rotate;
				But_Refuse.rotation = Image_Rotate;
				But_Refuse.id = globalParams.indexMc.refuse_Array.length;
				But_Refuse.addEventListener(MouseEvent.CLICK, Sweeper_Refuse);
				But_Refuse.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
				But_Refuse.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
				But_Refuse.filters = [new BlurFilter( 2, 2, 3)];
				
				
				globalParams.indexMc.landscape.addChild(_Refuse);
				
				globalParams.indexMc.objectsButtonLayer.addChild(But_Refuse);
relocate_refuse(_Refuse,But_Refuse)

				globalParams.indexMc.refuse_Array.push(_Refuse);
				Basa_Button_Refuse.push(But_Refuse);

				transform_Refuse();
				}
			}
		}
		public function get_coordinate(_Refuse:Object,But_Refuse:Object):void
		{
			var new_x_y:Point = create_x_y();
				_Refuse.i = new_x_y.x;
				_Refuse.j = new_x_y.y;
				
				var Land:Point = globalParams.indexMc.Coordinate_landscape(_Refuse.i,_Refuse.j);

				_Refuse.land_x = Land.x;
				_Refuse.land_y = Land.y;
				But_Refuse.x = _Refuse.land_x + 100;
				But_Refuse.y = _Refuse.land_x + 100;
			
			
		}
		public function relocate_refuse(_Refuse:Object,But_Refuse:Object)
		{
			
			var i:int
			
			while (prohibit_trash_and_building(_Refuse)) {
				i++
				
				
				if (i>100) {
					break;
					}
				get_coordinate(_Refuse,But_Refuse)
				
			}
			

		}
		public function Sweeper_Refuse(e:MouseEvent)
		{
			
			
			if (globalParams.indexMc._lands_Interface.user_energy(true))
			{
				remove_Refuse(e.currentTarget.id);
				//var id_trash:int = e.currentTarget.id;
globalParams.indexMc._lands_Quest.checup_Quest("refuse")

				globalParams.indexMc.addExperience(1);
				globalParams.indexMc._soundProcessor.playSnd("showWindow");
			}
		}
		public function remove_Refuse(id_trash:int):void
		{
			globalParams.indexMc.landscape.removeChild(globalParams.indexMc.refuse_Array[id_trash]);
			globalParams.indexMc.objectsButtonLayer.removeChild(Basa_Button_Refuse[id_trash]);
			globalParams.indexMc.refuse_Array.splice(id_trash,1);

			Basa_Button_Refuse[id_trash].removeEventListener(MouseEvent.CLICK, Sweeper_Refuse);
			Basa_Button_Refuse[id_trash].removeEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
			Basa_Button_Refuse[id_trash].removeEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
			Basa_Button_Refuse.splice(id_trash,1);
			overhaul_Refuse();

		}
		public function reset_Refuse():void
		{
			
			for (var i:int = globalParams.indexMc.refuse_Array.length-1; i >= 0; i --)
			{
				remove_Refuse(i);

			}
			globalParams.indexMc.refuse_Array=[];
			Basa_Button_Refuse=[];
		}
		public function sort_Refuse():void
		{
			
			var topPosition:uint = globalParams.indexMc.objectsButtonLayer.numChildren - 1;
			for (var i:int = 0; i < Basa_Button_Refuse.length; i ++)
			{
				try {
				
				globalParams.indexMc.objectsButtonLayer.setChildIndex(Basa_Button_Refuse[i], topPosition);
				} catch (e:Error) {
					trace("ERROR TRASH");
				}
			}


		}
		public function mouseOverHandler(event:MouseEvent):void
		{
			event.target.filters=[
			  new GlowFilter( 0xFF0000, 1, 5, 5, 8, 3 )
			];
		}
		public function mouseOutHandler(event:MouseEvent):void
		{

			event.target.filters = [new BlurFilter(2,2,3)];
		}
		public function overhaul_Refuse():void
		{
			for (var i:int = 0; i < Basa_Button_Refuse.length; i ++)
			{
				//globalParams.indexMc.refuse_Array[i].id = i;
				Basa_Button_Refuse[i].id = i;
			}
		}
		public function scale_Zoom_x():int
		{

			var rider:int = -100 + (100 - (100 * globalParams.indexMc.zoomParam));
			return rider;
		}
		public function scale_Zoom_y():int
		{

			var rider:int = -100 + (100 - (100 * globalParams.indexMc.zoomParam));
			return rider;
		}

		public function transform_Refuse():void
		{


			for (var i:int = 0; i < globalParams.indexMc.refuse_Array.length; i ++)
			{

				//Чтобы узнать координаты внешней кнопки, мы должны узнать координаты внутренней кнопки - офигенно!
				var Land:Point = globalParams.indexMc.Coordinate_landscape(globalParams.indexMc.refuse_Array[i].i,globalParams.indexMc.refuse_Array[i].j);
				globalParams.indexMc.refuse_Array[i].x = Land.x;
				globalParams.indexMc.refuse_Array[i].y = Land.y;



				Basa_Button_Refuse[i].x = globalParams.indexMc.refuse_Array[i].x * globalParams.indexMc.zoomParam + globalParams.indexMc.landscape.x;
				Basa_Button_Refuse[i].y = globalParams.indexMc.refuse_Array[i].y * globalParams.indexMc.zoomParam + globalParams.indexMc.landscape.y;



				Basa_Button_Refuse[i].scaleX = globalParams.indexMc.zoomParam;
				Basa_Button_Refuse[i].scaleY = globalParams.indexMc.zoomParam;

			}
		}
	}

}