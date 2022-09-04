package tools
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author ...
	 */
	public class parkBorderProcessor extends MovieClip
	{

		private var landscape:MovieClip;
		private var lanscapeArray:Array;
		private var borderArray:Array;
		//если вход в парк, то сделать там забор невидиммым
		public function update_enterBoth()
		{
			var i:Number = 0;
			for (i = 0; i < borderArray.length; i++)
			{
				var cellType:String = lanscapeArray[borderArray[i].i][borderArray[i].j].cellType;
				if (cellType == "enterBoth_box" || cellType == "enterBoth")
				{
					borderArray[i].m1.visible = false;
					borderArray[i].m2.visible = false;
					borderArray[i].m3.visible = false;
					borderArray[i].m4.visible = false;
				}
			}
		}
		//добавить забор вокруг парка
		public function init(landWidth:int,landHeight:int,startPoint:int,shiftLeft:int)
		{

			landscape = globalParams.indexMc.landscape;
			lanscapeArray = globalParams.indexMc.lanscapeArray
			;
			var i:int = 0;

			var topPosition:uint;
			borderArray = new Array ();
			//забор вокруг парка
			//забор слева - вверх
			for (i = startPoint; i < landHeight; i++)
			{

				borderVis(lanscapeArray,false,true,false,false,startPoint+1-shiftLeft,i+1,"left");
				//
				topPosition = landscape.getChildIndex(lanscapeArray[1][landHeight]);


				if (topPosition-2>=0)
				{
					landscape.setChildIndex(borderArray[borderArray.length-1], topPosition-2);
				}
				else
				{
					landscape.setChildIndex(borderArray[borderArray.length-1], 0);
					trace("ERROR   забор",borderArray[borderArray.length-1], topPosition-2);
				}

			}
			// забор сверху (где вход)
			for (i = startPoint-shiftLeft; i < landWidth-shiftLeft; i++)
			{

				borderVis(lanscapeArray,false,false,true,false,(i+1),landHeight,"up");

				topPosition = landscape.getChildIndex(lanscapeArray[1][landHeight]);
				landscape.setChildIndex(borderArray[borderArray.length-1], topPosition-1);
			}
			//забор снизу, противоположный входу
			for (i = startPoint-shiftLeft; i < landWidth-shiftLeft; i++)
			{

				borderVis(lanscapeArray,true,false,false,false,(i+1),startPoint+1,"down");
			}
			//забор справа
			for (i = startPoint; i < landHeight; i++)
			{

				borderVis(lanscapeArray,false,false,false,true,landWidth-shiftLeft,(i+1),"right");

			}
			update_enterBoth();
		}
		public function borderVis(lanscapeArray:Array,m1:Boolean,m2:Boolean,m3:Boolean,m4:Boolean,X_:int,Y_:int,side:String)
		{
			//trace("  borderVis",X_,Y_)
			var sideObj:Object ={
			left:{x_:-1,y_:-1},
			up:{x_:1,y_:-1},
			down:{x_:-1,y_:1},
			right:{x_:1,y_:1}
			};
			//var n:int = borderArray.length;
			borderArray.push(new borderMc());
			borderArray[borderArray.length-1].m1.visible = m1;
			borderArray[borderArray.length-1].m2.visible = m2;
			borderArray[borderArray.length-1].m3.visible = m3;
			borderArray[borderArray.length-1].m4.visible = m4;

			borderArray[borderArray.length-1].x = lanscapeArray[X_][Y_].x + 77 * sideObj[side].x_;
			borderArray[borderArray.length-1].y = lanscapeArray[X_][Y_].y + 39 * sideObj[side].y_;
			borderArray[borderArray.length-1].i = X_;
			borderArray[borderArray.length-1].j = Y_;
			landscape.addChild(borderArray[borderArray.length-1]);

		}

	}

}