package tools.controllers 
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mutagen
	 */
	public class arroundPark extends MovieClip
	{
		
		
		public var arroundIslands:Array
		public var threes:Array
		public function init (landWidth:int,landHeight:int) {
			 
			arroundIslands = new Array ()
			var n:int
			var ii:int
			var jj:int
			
			var i:int;
			var rnd:Number = 0
			//пятно в котором располагается парк (поле, посреди тумана войны)
			for (i = 0; i < 16; i ++) {
				n = arroundIslands.length
				ii = Math.ceil (landWidth / 2);
				arroundIslands.push (new arroundParkGrass_mc ())
				rnd = Math.ceil (Math.random()*2)
				arroundIslands[n].gotoAndStop (rnd)
				rnd = Math.ceil (Math.random() * 8)
				if (rnd < 6) {
					rnd = 0
				}
				
				var i_x:int=(ii - (8 * 3) + (i * 3));
				// return (i - 1) * 76 + (j - 1) * 76 - (_landWidth) * 76 + 76;
				//arroundIslands[n].x = globalParams.indexMc.offRoadArray[(ii - (8 * 3) + (i * 3))].x + 76 * 13 + 76*rnd
				//arroundIslands[n].y = globalParams.indexMc.offRoadArray[(ii - (8 * 3) + (i * 3))].y - 38 * 13 - 38*rnd
				arroundIslands[n].x = globalParams.get_x (i_x,25+1,25) + 76 * 13 + 76*rnd;
				arroundIslands[n].y = globalParams.get_y (i_x,25+1) - 38 * 13 - 38*rnd;
				//trace(arroundIslands[n].x,globalParams.indexMc.offRoadArray[(ii - (8 * 3) + (i * 3))].x + 76 * 13 + 76*rnd,"###############arroundPark",i,ii,"  arroundIslands x = "+(ii - (8 * 3) + (i * 3)))
				//trace(arroundIslands[n].y,globalParams.indexMc.offRoadArray[(ii - (8 * 3) + (i * 3))].y  - 38 * 13 - 38*rnd,"###############arroundPark",i,ii,"  arroundIslands y = "+(ii - (8 * 3) + (i * 3)))
				globalParams.indexMc.landscape.addChild (arroundIslands[n])
			}
			//пятно в котором располагается парк (поле, посреди тумана войны)
			for (i = 0; i < 10; i ++) {
				n = arroundIslands.length
				ii = Math.ceil (landWidth)
				jj = 1//Math.ceil (globalParams.indexMc.landHeight / 2)
				arroundIslands.push (new arroundParkGrass_mc ())
				rnd = Math.ceil (Math.random()*2)
				arroundIslands[n].gotoAndStop (rnd)
				rnd = -4 + Math.ceil (Math.random() * 10)
								
				arroundIslands[n].x = globalParams.indexMc.lanscapeArray[ii][jj].x + 76 * 15 -76*6*i + 76*rnd;
				arroundIslands[n].y = globalParams.indexMc.lanscapeArray[ii][jj].y + 38 * 9 + 38 * 6 * i + 38 * rnd;
				
				globalParams.indexMc.landscape.addChild (arroundIslands[n])
			}
			//пятно в котором располагается парк (поле, посреди тумана войны)
			for (i = 0; i < 10; i ++) {
				n = arroundIslands.length
				ii = Math.ceil (landWidth)
				jj = 1//Math.ceil (globalParams.indexMc.landHeight / 2)
				arroundIslands.push (new arroundParkGrass_mc ())
				rnd = Math.ceil (Math.random()*2)
				arroundIslands[n].gotoAndStop (rnd)
				
				rnd = 16 + Math.ceil (Math.random()*10)
				arroundIslands[n].x = globalParams.indexMc.lanscapeArray[ii][jj].x + 76 * 15 -76*6*i + 76*rnd
				arroundIslands[n].y = globalParams.indexMc.lanscapeArray[ii][jj].y + 38 * 9 + 38*6*i + 38*rnd
				globalParams.indexMc.landscape.addChild (arroundIslands[n])
			}
			//пятно в котором располагается парк (поле, посреди тумана войны)
			for (i = 0; i < 10; i ++) {
				n = arroundIslands.length;
				ii = Math.ceil (landWidth);
				jj = Math.ceil (1);
				arroundIslands.push (new arroundParkGrass_mc ());
				rnd = Math.ceil (Math.random()*2);
				arroundIslands[n].gotoAndStop (rnd);
				rnd = Math.ceil (Math.random()*25)+3;
				arroundIslands[n].x = globalParams.indexMc.lanscapeArray[ii][jj].x + 76 * 8 -76*5*i - 76*rnd;
				arroundIslands[n].y = globalParams.indexMc.lanscapeArray[ii][jj].y + 38 * 13 - 38*5*i + 38*rnd;
				globalParams.indexMc.landscape.addChild (arroundIslands[n]);
			}
			//пятно в котором располагается парк (поле, посреди тумана войны)
			for (i = 0; i < 5; i ++) {
				n = arroundIslands.length;
				ii = Math.ceil (1);
				jj = Math.ceil (landHeight / 2);
				arroundIslands.push (new arroundParkGrass_mc ());
				rnd = Math.ceil (Math.random()*2);
				arroundIslands[n].gotoAndStop (rnd);
				rnd = Math.ceil (Math.random()*5);
				arroundIslands[n].x = globalParams.indexMc.lanscapeArray[ii][jj].x - 76 * 9 -76*4*i - 76*rnd;
				arroundIslands[n].y = globalParams.indexMc.lanscapeArray[ii][jj].y - 38 * 10 - 38*4*i + 38*rnd;
				globalParams.indexMc.landscape.addChild (arroundIslands[n]);
			}
			threes = new Array ();
			//var tmpMc:MovieClip
			//var j:Number
			//цветы
			for (i = 0; i < arroundIslands.length; i++) {
				setupObjects (arroundIslands[i], "flowers");
				setupObjects (arroundIslands[i], "three");
			}
			sortObjectsButtonsFn ();
		}
		public function setupObjects (_inIsland:MovieClip, _inString:String) {
			//добавить цветы и деревья
			var n:int
			//var i:Number
			//var j:Number
			var rnd:Number
			var rndX:Number
			var rndY:Number
			var horAdd:Number = 0
			//var maxThreeRnd:Number = Math.ceil (Math.random() * 3)
			var tmpMc:MovieClip
			horAdd ++;
			for (var i:int = 0; i < 5; i++) {
				//if (horAdd < maxThreeRnd) {
					tmpMc = getMovieFromString (_inString)
					rnd = Math.ceil (Math.random ()*10-5)
					n = threes.length
					threes.push (tmpMc)
					
					rndX = Math.ceil (Math.random()*16) - 8
					rndY = Math.ceil (Math.random()*16) - 8
					threes[n].x = _inIsland.x + 78 * rndX
					threes[n].y = _inIsland.y + 38 * rndY
					
					globalParams.indexMc.landscape.addChild (threes[n])
				//}
			}
			
		}
		//раставляет рандомно деревья и цветы
		public function getMovieFromString (_inString:String):MovieClip {
			var req:MovieClip
			var rnd:Number = Math.ceil (Math.random() * 4)
			if (_inString == "three") {
				rnd = Math.ceil (Math.random() * 4)
				if (rnd == 1) {
					req = new three_5_mc ()
				}
				if (rnd == 2) {
					req = new three_1_mc ()
				}
				if (rnd == 3) {
					req = new elka_1 ()
				}
				if (rnd == 4) {
					req = new elka_2 ()
				}
			}
			if (_inString == "flowers") {
				rnd = Math.ceil (Math.random() * 4)
				if (rnd == 1) {
					req = new grass_3 ()
				}
				if (rnd == 2) {
					req = new grass_6 ()
					rnd = Math.ceil (Math.random() * 3)
					req.gotoAndStop (rnd)
				}
				if (rnd == 3) {
					req = new flowers_mc ()
					rnd = Math.ceil (Math.random() * 8)
					req.gotoAndStop (rnd)
				}
				if (rnd == 4) {
					req = new rocks_mc ()
					rnd = Math.ceil (Math.random() * 9)
					req.gotoAndStop (rnd)
				}
			}
			return req
		}
		//сортировать по глубине
		public function sortObjectsButtonsFn ():void {
			var tmpPoint:Point = new Point(0, 0)
			var i:int;
			//var k:Number
			var tmpPoint1:Point;
			
			var objArr:Array = new Array ();
			for (i = 0; i < threes.length; i++) {
				objArr[i] = new Object ()
				objArr[i].idn = i
				objArr[i].yp = threes[i].y
			}
				
				var tmpMc:Object
				
				for (i = 0; i < objArr.length; i++) {
					for (var j = 0; j < objArr.length-1; j++) {
						if (objArr[j].yp > objArr[j+1].yp) {
							tmpMc = objArr[j]
							objArr[j] = objArr[j + 1]
							objArr[j+1] = tmpMc
						}
					}
				}
				var topPosition:uint = globalParams.indexMc.landscape.numChildren - 1;
				
				for (i = 0; i < objArr.length; i++) {
					globalParams.indexMc.landscape.setChildIndex(threes[objArr[i].idn], topPosition);
				}
		}
		
	}

}