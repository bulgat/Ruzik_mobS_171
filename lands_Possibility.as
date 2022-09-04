package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import flash.geom.Rectangle;
	import tools.*;
	/**
	 * ...
	// --------------------------------- отслеживалки возможности установки объектов ---------------------------------
	
	 */
	public class lands_Possibility extends MovieClip
	{
		//Генератор аттракционов

		// -------- Для стандарта 3х3 ------
		public function check3x3Possibility(ii, jj,lanscapeArray):Boolean
		{
			trace("check3x3Possibility_____________3x3_____________");

			var req:Boolean = true;

			var PossibleTrigger2x2:Boolean = true;
			var Place_x:Array = [0,-1,0,-1,-2,-2,-2,-1,0];
			var Place_y:Array = [0,0,1,1,2,0,1,2,2];
			if (globalParams.indexMc.enterPosition == "up")
			{
				if (jj >= globalParams.indexMc.landHeight-2)
				{
					PossibleTrigger2x2 = false;
				}
			}
			if (! PossibleTrigger2x2)
			{
				globalParams.indexMc.systemMessage("Нельзя строить рядом с оградой.");
				req = false;
			}
			if (req)
			{
				for (var i_:int = 0; i_ < Place_x.length; i_++)
				{
					if (lanscapeArray[ii + Place_x[i_]][jj + Place_y[i_]].cellType != "grass")
					{
						req = false;
						globalParams.indexMc.systemMessage("Можно строить только на чистой земле.");
						break;
					}

				}


			}
			if (! Road_Possibility(ii,jj,lanscapeArray,"3x3"))
			{
				globalParams.indexMc.systemMessage("Здание находится слишком далеко от дороги, посетители не смогут до него добратся.");
			}
			return req;
		}
		// -------- Для стандарта 2х2 ------
		public function check2x2Possibility(ii, jj,enterPosition,lanscapeArray):Boolean
		{
			trace("check2x2Possibility_____________2x2_____________");

			var req:Boolean = true;
			var PossibleTrigger2x2:Boolean = true;
			var Place_x:Array = [0,-1,0,-1];
			var Place_y:Array = [0,0,1,1];

			if (enterPosition == "left")
			{
				if (ii < 2)
				{
					PossibleTrigger2x2 = false;
				}
			}
			if (enterPosition == "right")
			{
				if (ii >= globalParams.indexMc.landWidth-1)
				{
					PossibleTrigger2x2 = false;
				}
			}
			if (enterPosition == "up")
			{
				if (jj >= globalParams.indexMc.landHeight-1)
				{
					PossibleTrigger2x2 = false;
				}
			}
			if (enterPosition == "down")
			{
				if (jj <= 2)
				{
					PossibleTrigger2x2 = false;
				}
			}
			if (! PossibleTrigger2x2)
			{
				globalParams.indexMc.systemMessage("Заведение стоит строить подальше от дороги.");
				req = false;
			}
			if (req)
			{
				for (var i_:int = 0; i_ < Place_x.length; i_++)
				{
					trace("   grass ",lanscapeArray[ii+Place_x[i_]][jj+Place_y[i_]].cellType);
					if (lanscapeArray[ii + Place_x[i_]][jj + Place_y[i_]].cellType != "grass")
					{

						req = false;
						globalParams.indexMc.systemMessage("Можно строить только на чистой земле.");
						break;
					}

				}


			}
			if (! Road_Possibility(ii,jj,lanscapeArray,"2x2"))
			{
				globalParams.indexMc.systemMessage("Здание находится слишком далеко от дороги, посетители не смогут до него добратся.");
			}

			return req;
		}

		// -------- Для кафешков -------
		public function check1x1Possibility(ii:int, jj:int,enterPosition:String,lanscapeArray):Boolean
		{
			trace("checkKafePossibility ________________________________ 1x1");
			var req:Boolean;

			var kafePossibleTrigger:Boolean = true;
			if (kafePossibleTrigger)
			{
				req = true
				;
				if (req)
				{

					if (lanscapeArray[ii][jj].cellType == "grass")
					{
					}
					else
					{
						req = false;
						globalParams.indexMc.systemMessage("Можно строить только на чистой земле.");
					}
				}
			}
			else
			{
			}
			if (! Road_Possibility(ii,jj,lanscapeArray,"1x1"))
			{
				globalParams.indexMc.systemMessage("Здание находится слишком далеко от дороги, посетители не смогут до него добратся.");
			}


			return req;
		}
		// -------- Для lavka -------


		public function Road_Possibility(ii:int, jj:int,lanscapeArray,Size:String):Boolean
		{

			if (Size == "1x1")
			{
				var Place_X_Road0:Array = [1,0,0,-1];
				var Place_Y_Road0:Array = [0,-1,1,0];

				return Size_Near_Road_(ii, jj,Place_X_Road0,Place_Y_Road0,lanscapeArray);

			}
			if (Size == "2x2")
			{
				//var Place_X_Road2:Array = [0 ,-1,1,-2,1,-2,0,-1];
				//var Place_Y_Road2:Array = [-1,-1,0, 0,1, 1,2, 2];
				var Place_X_Road2:Array = [1,1,0,0,-1,-1,-2,-2];
				var Place_Y_Road2:Array = [1,0,2,-1,2,-1,1,0];

				return Size_Near_Road_(ii, jj,Place_X_Road2,Place_Y_Road2,lanscapeArray);

			}
			if (Size == "3x3")
			{
				//var Place_X_Road3:Array = [ 0,-1,-2,1,-3,1,-3,1,-3,0,-1,-2];
				//var Place_Y_Road3:Array = [-1,-1,-1,0, 0,1, 1,2, 2,3, 3, 3];
				var Place_X_Road3:Array = [1,1,1,0,0,-1,-1,-2,-2,-3,-3,-3];
				var Place_Y_Road3:Array = [2,1,0,3,-1,3,-1,3,-1,2,1,0];
				return Size_Near_Road_(ii, jj,Place_X_Road3,Place_Y_Road3,lanscapeArray);

			}
			return true;

		}

		public function Size_Near_Road_(ii:int, jj:int,Place_X_Road_:Array,Place_Y_Road_:Array,lanscapeArray):Boolean
		{
			var Near_Road:Boolean;
			

			for (var i_:int = 0; i_ < Place_X_Road_.length; i_++)
			{
				
				if (Allow_Number_Map(ii+Place_X_Road_[i_], jj+Place_Y_Road_[i_])==true)
				{
					
					if (lanscapeArray[ii + Place_X_Road_[i_]][jj + Place_Y_Road_[i_]].cellType == "road")
					{

						return true;
					}
					else
					{


					}

				}
			}

			return false;
		}

		public function Allow_Number_Map(ii:int, jj:int):Boolean
		{
			if (ii>0&&jj>0)
			{
				if (ii <= globalParams.indexMc.landHeight && jj <= globalParams.indexMc.landHeight)
				{
					return true;
				}

			}

			return false;
		}

		public function checkLavkaPossibility(ii, jj,enterPosition:String,lanscapeArray):Boolean
		{
			trace(ii,"_", jj,"______________________________   checkLavkaPossibility  __________________________________");

			//throw Error("99999");


			if (lanscapeArray[ii][jj].cellType == "road")
			{
				return true;
			}
			else
			{
				globalParams.indexMc.systemMessage("Можно строить только на тропинке.");
				return false;
			}

		}


		// -------- Для декоративных элементов -------
		public function checkDecoPossibility(ii, jj,lanscapeArray):Boolean
		{
			var req:Boolean;
			req = true;
			var kafePossibleTrigger:Boolean = true;
			if (req)
			{

				if (lanscapeArray[ii][jj].cellType == "grass")
				{
					//req = true
				}
				else
				{
					req = false;
					globalParams.indexMc.systemMessage("Можно строить только на чистой земле.");
				}
			}

			return req;
		}

		// -------- Для входной будки -------

		// -------- Для дорожков -------
		public function checkRoadPlacePossibility(enterPosition,roadPlaceObject,lanscapeArray)
		{
			var req:Boolean = true;
			if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j].cellType == "grass")
			{
				//req = true
			}
			else
			{
				req = false;
				globalParams.indexMc.systemMessage("Можно строить только на чистой земле.");
			}
			if (req)
			{
				var tmpTrigger:Boolean = false;
				if (roadPlaceObject.i < globalParams.indexMc.landWidth && roadPlaceObject.i > 1)
				{
					if (enterPosition == "right")
					{
						if (lanscapeArray[roadPlaceObject.i + 1][roadPlaceObject.j].cellType == "enterBoth")
						{
							tmpTrigger = true;
						}
					}
					if (enterPosition == "left")
					{
						if (lanscapeArray[roadPlaceObject.i - 1][roadPlaceObject.j].cellType == "enterBoth")
						{
							tmpTrigger = true;
						}
					}
				}
				if (roadPlaceObject.j < globalParams.indexMc.landHeight && roadPlaceObject.j > 1)
				{
					if (enterPosition == "up")
					{
						if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j + 1].cellType == "enterBoth")
						{
							tmpTrigger = true;
						}
					}
					if (enterPosition == "down")
					{
						if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j - 1].cellType == "enterBoth")
						{
							tmpTrigger = true;
						}
					}
				}
				//----------------------------------------------
				if (roadPlaceObject.j < globalParams.indexMc.landHeight)
				{
					if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j + 1].cellType == "road")
					{
						tmpTrigger = true;
					}
					if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j + 1].cellType == "lavka")
					{
						tmpTrigger = true;
					}
				}
				if (roadPlaceObject.i < globalParams.indexMc.landWidth)
				{
					if (lanscapeArray[roadPlaceObject.i + 1][roadPlaceObject.j].cellType == "road")
					{
						tmpTrigger = true;
					}
					if (lanscapeArray[roadPlaceObject.i + 1][roadPlaceObject.j].cellType == "lavka")
					{
						tmpTrigger = true;
					}
				}
				if (roadPlaceObject.i > 1)
				{
					if (lanscapeArray[roadPlaceObject.i - 1][roadPlaceObject.j].cellType == "road")
					{
						tmpTrigger = true;
					}
					if (lanscapeArray[roadPlaceObject.i - 1][roadPlaceObject.j].cellType == "lavka")
					{
						tmpTrigger = true;
					}
				}
				if (roadPlaceObject.j > 1)
				{
					if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j - 1].cellType == "road")
					{
						tmpTrigger = true;
					}
					if (lanscapeArray[roadPlaceObject.i][roadPlaceObject.j - 1].cellType == "lavka")
					{
						tmpTrigger = true;
					}
				}
				//----------------------------------------------
				if (! tmpTrigger)
				{
					req = false;
					if (globalParams.indexMc.roadsArray.length == 0)
					{
						globalParams.indexMc.systemMessage("Тропинку должна начинаться напротив входа в парк.");
					}
					else
					{
						globalParams.indexMc.systemMessage("Тропинка должна быть непрерывной.");
					}
				}
			}

			return req;
		}

	}

}