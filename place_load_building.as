package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;

	public class place_load_building extends MovieClip
	{
		public function NO_OUT_MAP(type_name_str:String,Width:int, Height:int):Boolean
		{

			if (no_out_sizeMap(Width,Height))
			{
				if (no_out_sizeMap_measure(type_name_str,Width,Height))
				{
					return true;
				}


			}

			return false;
		}
		public function no_out_sizeMap(Width:int, Height:int):Boolean
		{

			if (Width>globalParams.indexMc.landWidth || Height>globalParams.indexMc.landHeight)
			{

				return false;
			}

			return true;
		}
		public function no_out_sizeMap_measure(type_str:String,coordinat_i:int,coordinat_j:int):Boolean
		{

			//trace("  ",type_str,"    _____     coordinat_i = ",coordinat_i,coordinat_j," both",attractionClass.EnterBooth_x_y().x,attractionClass.EnterBooth_x_y().y);

			if (type_str!=null)
			{

				//защита места входа, от размещения зданий внутри его, потом ничем его от туда не извлечешь.
				if (coordinat_i==attractionClass.EnterBooth_x_y().x-1 && coordinat_j==attractionClass.EnterBooth_x_y().y)
				{

					return false;
				}

				if (globalParams.Building_Basa_Params[type_str].Size == "2x2")
				{
					trace("size BIG= ");
					return no_out_sizeMap(coordinat_i+1, coordinat_j+1);
				}
				if (globalParams.Building_Basa_Params[type_str].Size == "3x3")
				{
					trace("size VERY BIG= ");
					return no_out_sizeMap(coordinat_i+2, coordinat_j+2);
				}

			}
			return true;
		}
		public function Build_previously_arr(dataObject:Object,landWidth:int,landHeight:int):void
		{
			for (var i:int = 0; i < dataObject.objectsArray.length; i++)
			{
				if (permit_Building(dataObject.objectsArray[i],landWidth,landHeight))
				{


					globalParams.indexMc.objectsArray.push(globalParams.indexMc.attractionGenerator.get_loadParams(dataObject.objectsArray[i]));



				}

			}

		}
		public function permit_Building(Building_obj:Object,landWidth:int,landHeight:int):Boolean
		{
			if (Building_obj != null)
			{
				if (NO_OUT_MAP(Building_obj.type,Building_obj.i,Building_obj.j))
				{
					if (globalParams.Building_Basa[Building_obj.type] != undefined || Building_obj.type == "decoration")
					{

						return true;
					}
				}
			}

			return false;
		}

		public var verityCount:int;
		public function Place_Building(dataObject:Object,landWidth:int,landHeight:int):void
		{
			//данные по зданиям, находящиеся в массиве
			//хрень =  type
			//хрень =  j
			//хрень =  worker
			//хрень =  level
			//хрень =  TypeFood
			//хрень =  cc
			//хрень =  openTrigger
			//хрень =  statusObject  
			//хрень =  statusObject.rrd
			//хрень =  statusObject.sst
			//хрень =  statusObject.repairInterval
			//хрень =  statusObject.status
			//хрень =  statusObject.lrd
			// хрень =  i
			//хрень =  productType
			trace("0   ^^^^ #      Place_Building  # ^^^^",landWidth,landHeight,"        objectsArray = ",globalParams.indexMc.objectsArray);
			Build_previously_arr(dataObject,landWidth,landHeight);
			trace("1   ^^^^ #      Place_Building  # ^^^^",landWidth,landHeight,"        objectsArray = ",globalParams.indexMc.objectsArray);

			verityCount = 0;
			
			for (var i:int = 0; i < dataObject.objectsArray.length; i++)
			{
				if (i==0)
				{

					globalParams.indexMc.attractionGenerator.getEnterBoothObject();
					globalParams.indexMc.checkOpenFn(globalParams.indexMc.objectsArray[0]);
					verityCount++;
				}



				if (permit_Building(dataObject.objectsArray[i],landWidth,landHeight))
				{
					//если встретится неизвестная ошибка (кривые данные с сервера или ошибка флэш, неуловимая)
					//продолжить работать не взирая ни на что
					//try
					//{

						//защита от прихода кривых данных

						trace("i=",i,"button",globalParams.indexMc.objectsButtonArray.length,"    ver  = ",verityCount,"L=",globalParams.indexMc.objectsArray.length,"    #BUILDING# = ",dataObject.objectsArray[i].type, "Place_Building");
						if (dataObject.objectsArray[i].type != "decoration")
						{
							if (dataObject.objectsArray[i].type != "enterBoth")
							{
								/*
								if (i>3)
								{
								throw Error("XA-XA-XA-X   герцогиня!")
								}
								*/

								//globalParams.indexMc.objectsArray.push(globalParams.indexMc.attractionGenerator.getAttractionFromLoadData (dataObject.objectsArray[i]));
								globalParams.indexMc.objectsArray.splice(verityCount,1,globalParams.indexMc.attractionGenerator.getAttractionFromLoadData (dataObject.objectsArray[i],verityCount));
								verityCount++;
								//trace(i,"   id=",globalParams.indexMc.objectsButtonArray[i].id);
								if (dataObject.objectsArray[i].type != "lavka")
								{
									globalParams.indexMc.checkOpenFn(globalParams.indexMc.objectsArray[i]);
								}

							}
						}


						if (dataObject.objectsArray[i].type == "decoration")
						{

							//globalParams.indexMc.objectsArray.push(globalParams.indexMc.attractionGenerator.get_decoration (dataObject.objectsArray[i],n));
							globalParams.indexMc.objectsArray.splice(verityCount,1,globalParams.indexMc.attractionGenerator.get_decoration (dataObject.objectsArray[i],verityCount));
							//if (verityCount==59) {
								//throw Error("_opa_")
							//}
							trace(" PLACE BUILDING   decoration   ",globalParams.indexMc.objectsArray,"   ",globalParams.indexMc.objectsButtonArray[verityCount].id);
							verityCount++;
						}
					//}
					//catch (e:Error)
					//{
						//trace("BOT__$$$$$$$$$$$$$$$$    ERROR PLACE BUILDING");

					//}



					globalParams.indexMc.roadPlaceObject = new Object ();
					globalParams.indexMc.roadPlaceObject.i = dataObject.objectsArray[i].i;
					globalParams.indexMc.roadPlaceObject.j = dataObject.objectsArray[i].j;

					globalParams.indexMc._lands_Roads.pereborRoads(globalParams.indexMc.roadPlaceObject,globalParams.indexMc.roadsArray,globalParams.indexMc.objectsArray);


				}

			}
trace("place load ########################################   end   _place_load_building ")

		}


	}

}