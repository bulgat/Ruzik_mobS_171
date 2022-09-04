package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import tools.*;
	
	public class lands_GenerateLand extends MovieClip
	{
		//Генерация ландшафта
		public function generateLandscape (_landWidth:int, _landHeight:int, startPoint:int,shiftLeft:int):void
		{
			//Генерация чистого , абсолютно нового ландшафта 
			
			var fonGrass:MovieClip;
			
			globalParams.indexMc.landscape = new MovieClip();
			
			if(globalParams.indexMc.groundSkin == 'green')
			{
				fonGrass = new fonGrass_mc();
			}
			else
			{
				//планета железяка отключера
				fonGrass = new FonMetal();
			}
			
			
			globalParams.indexMc.landscape.addChild(fonGrass);
			globalParams.indexMc.lanscapeArray = new Array ();
			globalParams.indexMc.offRoadArray = new Array ();
			
			var i:int

			//формируем автостраду и автобусную остановку

			var hightway_ar:Array = add_hightway_bus (_landWidth);

			add_autobus(25)

			generate_tile_lands (_landWidth,_landHeight, startPoint,shiftLeft);
			
			//вешание поверх сгенерированного ячеистого ланшафта фона, которым и будет управлятся игра.
			//потом сверху будут поставлены еще и кнопки (здания)
			globalParams.indexMc.landscape.x = 400;
			globalParams.indexMc.landscape.y = 300;
			globalParams.indexMc.topBorder 	= 300  - (globalParams.indexMc.landHeight) * 38 - 38;
			globalParams.indexMc.leftBorder 	= 100;
			globalParams.indexMc.rightBorder = -(400 + (_landWidth) * 76);
			
			globalParams.indexMc.cursorMc = new cursor_mc ();
			globalParams.indexMc.addChild (globalParams.indexMc.landscape);
			
			
			globalParams.indexMc.cursorMc.visible = false
			globalParams.indexMc.cursorMc.gotoAndStop ("openFr");
			globalParams.indexMc.addChild (globalParams.indexMc.cursorMc);
			
			globalParams.indexMc.cursorPlaceBox_mc = new cursorPlaceBox ()
			globalParams.indexMc.cursorPlaceBox_mc.addEventListener (MouseEvent.MOUSE_OVER, globalParams.indexMc.showHandCursor)
			globalParams.indexMc.cursorPlaceBox_mc.addEventListener (MouseEvent.MOUSE_OUT, globalParams.indexMc.hideHandCursor)
			//перетаскивать землю
			globalParams.indexMc.cursorPlaceBox_mc.addEventListener (MouseEvent.MOUSE_DOWN, globalParams.indexMc.dragLand)
			globalParams.indexMc.cursorPlaceBox_mc.addEventListener (MouseEvent.MOUSE_UP, globalParams.indexMc.stopdragLand)
			globalParams.indexMc.stage.addEventListener (MouseEvent.MOUSE_UP, globalParams.indexMc.stopdragLand)
			globalParams.indexMc.addChild (globalParams.indexMc.cursorPlaceBox_mc)
			
			globalParams.indexMc.objectsButtonLayer = new MovieClip ()
			globalParams.indexMc.addChild (globalParams.indexMc.objectsButtonLayer)
			
			globalParams.indexMc.targetMc = new borderPointer ()
			
			var stageMc:MovieClip = this
			globalParams.indexMc.arrowPlace = new MovieClip ()
			globalParams.indexMc.addChild (globalParams.indexMc.arrowPlace)
			
			//globalParams.indexMc._parkBorderProcessor.init (_landWidth,_landHeight,2,2);
			globalParams.indexMc._parkBorderProcessor.init (_landWidth,_landHeight,startPoint,shiftLeft);
			globalParams.indexMc.setupInterface ()
			
			
			globalParams.indexMc._getPaymentData.init ()
		}
		
		public function generate_tile_lands (_landWidth:int,_landHeight:int, startPoint:int,shiftLeft:int):void
		{
			//формируем новый массив
			var _full:int=25;
			for (i = 1 ; i <= _full; i++)
			{
				globalParams.indexMc.lanscapeArray[i] = new Array();
			}
			// (+1 ) для края дороги
			for (var j:int = _full+1; j >= 1; j--)
			{
				for (var i:int = 1; i <= _full; i++)
				{
					globalParams.indexMc.lanscapeArray[i][j] = new MovieClip();
					var gr:MovieClip
					if(globalParams.indexMc.groundSkin == 'green')
					{
						gr = new grass_mc();
						gr.gotoAndStop (Math.ceil (Math.random()*17));
					}
					else
					{
						//планета железяка 
						var r:int = Math.random() * 100;
						gr = new GrassMetal();
												
						if(r < 70)
						{
							gr.gotoAndStop(9);
						}
						else
						{
							gr.gotoAndStop (Math.ceil (Math.random()*17));
						}
						
					}
					gr.nameFld.text = i+"_"+j
					globalParams.indexMc.lanscapeArray[i][j].addChild (gr);
					globalParams.indexMc.lanscapeArray[i][j].gr = gr;
					globalParams.indexMc._lands_Grass.generateGrass (globalParams.indexMc.lanscapeArray[i][j],globalParams.indexMc.groundSkin,globalParams.indexMc.lk);
					globalParams.indexMc.lanscapeArray[i][j]._x = globalParams.get_x (i,j,_landWidth);
					globalParams.indexMc.lanscapeArray[i][j]._y = globalParams.get_y (i,j);
					
					globalParams.indexMc.lanscapeArray[i][j].cellType = "grass";
					
					globalParams.indexMc.lanscapeArray[i][j].visibleTrigger = true;
					
					globalParams.indexMc.lanscapeArray[i][j].x = globalParams.get_x (i,j,_landWidth);
					globalParams.indexMc.lanscapeArray[i][j].y = globalParams.get_y (i,j);
					
					if (i>_landWidth-shiftLeft||j>_landWidth) {
						globalParams.indexMc.lanscapeArray[i][j].visible = false;
						globalParams.indexMc.lanscapeArray[i][j].removeChild (globalParams.indexMc.lanscapeArray[i][j].gr);
					}
					//trace(i,j,"         ",i,"<",startPoint,"||",j,"<",startPoint," = ",i<startPoint||j<startPoint)
					if (i<startPoint+1-shiftLeft||j<startPoint+1) {
						if (globalParams.indexMc.lanscapeArray[i][j].contains(globalParams.indexMc.lanscapeArray[i][j].gr)) {
							globalParams.indexMc.lanscapeArray[i][j].visible = false;
							globalParams.indexMc.lanscapeArray[i][j].removeChild (globalParams.indexMc.lanscapeArray[i][j].gr);
						}
					//
					//globalParams.indexMc.lanscapeArray[i][j].gr.nameFld.appendText("**");
					
					}
					//globalParams.indexMc.lanscapeArray[i][j].gr.nameFld.text ="ZZZ";
					globalParams.indexMc.lanscapeArray[i][j].gr.nameFld.visible = false;
					globalParams.indexMc.landscape.addChild (globalParams.indexMc.lanscapeArray[i][j]);
				}
			}
			
		}
		// Добавить дорогу
		public function add_hightway_bus (_landWidth:int):Array
		{
			var hightway_ar:Array = [];
				for (var i:int = - 45 ; i <= _landWidth + 45; i++)
				{
					globalParams.indexMc.offRoadArray[i] = new offRoad_mc_3();
					
					globalParams.indexMc.offRoadArray[i].id = i;
					globalParams.indexMc.offRoadArray[i].busStationCells.visible = false;
					globalParams.indexMc.offRoadArray[i].x = globalParams.get_x (i,_landWidth+1,_landWidth);
					globalParams.indexMc.offRoadArray[i].y = globalParams.get_y (i,_landWidth+1);
					globalParams.indexMc.offRoadArray[i].visibleTrigger = true;
					//globalParams.indexMc.offRoadArray[i].visible = false;
					
					globalParams.indexMc.landscape.addChild (globalParams.indexMc.offRoadArray[i]);
					//busStation
					if (i==Math.ceil(_landWidth / 2)-1) {
						globalParams.indexMc.offRoadArray[i].busStationCells.visible = true;
					}
					if (i==Math.ceil(_landWidth / 2)) {
						globalParams.indexMc.offRoadArray[i].busStationCells.visible = true;
						
					}
					if (i==Math.ceil(_landWidth / 2) + 1) {
						globalParams.indexMc.offRoadArray[i].busStationCells.visible = true;
					}
					// end busStation
					
					
					if (0<=i&&_landWidth>i) {
						//trace(hightway_ar.length,"======= i= ",i,"j=",_landWidth,"=============== L=",globalParams.indexMc.offRoadArray.length,"___",globalParams.indexMc.offRoadArray[i].x,globalParams.indexMc.offRoadArray[i].y);
						hightway_ar.push(globalParams.indexMc.offRoadArray[i]);
					}
				}
				
				//globalParams.indexMc.offRoadArray=[];
				
				return hightway_ar;
		}
		// Добавить дорогу
		public function add_hightway_bus_kol (_landWidth:int):Array
		{
			var hightway_ar:Array = [];
				for (var i:int = - 45 ; i <= _landWidth + 45; i++)
				{
					var _offRoad_mc_3 = new offRoad_mc_3();
					_offRoad_mc_3.id = i;
					_offRoad_mc_3.busStationCells.visible = false;
					_offRoad_mc_3.x = globalParams.get_x (i,_landWidth+1,_landWidth);
					_offRoad_mc_3.y = globalParams.get_y (i,_landWidth+1);
					_offRoad_mc_3.visibleTrigger = true;
					
					globalParams.indexMc.landscape.addChild (_offRoad_mc_3);
					/*
					if (0<=i&&_landWidth>i) {
						trace(hightway_ar.length,"======= i= ",i,"j=",_landWidth,"=============== L=",globalParams.indexMc.offRoadArray.length,"___",globalParams.indexMc.offRoadArray[i].x,globalParams.indexMc.offRoadArray[i].y);
						hightway_ar.push(globalParams.indexMc.offRoadArray[i]);
					}
					*/
				}
				
				
				//globalParams.indexMc.offRoadArray=[];
				
				return hightway_ar;
		}
		
		
		public function add_autobus(_landWidth:int):void
		{
			globalParams.indexMc._autobusClass = new autobusClass ();
			globalParams.indexMc._autobusClass.x = globalParams.get_x (Math.ceil (_landWidth / 2),_landWidth+1,_landWidth);
			globalParams.indexMc._autobusClass.y = globalParams.get_y (Math.ceil (_landWidth / 2),_landWidth+1);
			
			globalParams.indexMc.landscape.addChild(globalParams.indexMc._autobusClass);
		}
		
		public function transpositionPark (dataObject:Object,inUpper:int) {
			var inShift:int=inUpper/2;
			
			//передвинуть все дороги на inUpper величину
			for (var i:int = 0; i < dataObject.roadsArray.length; i++) {
				dataObject.roadsArray[i].i += inUpper-inShift
				dataObject.roadsArray[i].j +=  inUpper
			}
			
			//передвинуть все здания на inUpper величину
			for (var ii:int = 0; ii < dataObject.objectsArray.length; ii++) {
				trace(ii,"   ",dataObject.objectsArray.length," ",dataObject.objectsArray[ii]);
				if (dataObject.objectsArray[ii]!=null) {
				dataObject.objectsArray[ii].i += inUpper-inShift;
				dataObject.objectsArray[ii].j += inUpper;
				}
			}
			
		}
	}

}