package 
{
	
	public class AStar
	{

		var openArray	:Array,
			closedArray	:Array,
			path		:Array,
			grid		:Scape,
			startNode	:Ground,
			endNode		:Ground,
			cost		:int 	= 1;

		public function AStar()
		{
		}
		
		public function diagonal(node:Ground):Number
		{
			var dx		:Number = Math.abs(node.jPos - endNode.jPos),
            	dy		:Number = Math.abs(node.iPos - endNode.iPos),
            	diag	:Number = Math.min(dx, dy),
            	straight:Number = dx + dy;
				
            return Math.SQRT2 * diag + cost * (straight - 2 * diag);
		}
		
		public function findPath(_grid:Scape, _startNode:Ground, _endNode:Ground):Boolean
		{
			grid = _grid;
			openArray = new Array();
			closedArray = new Array();
			
			startNode = _startNode;
			endNode = _endNode;
			
			startNode.g = 0;
			startNode.h = diagonal(startNode);
			startNode.f = startNode.g + startNode.h;
			
			return search();
		}
		
		public function search():Boolean
		{
			var node:Ground = startNode;
			
			while (node != endNode)
			{
				var onLeft	:int = Math.max(0, node.jPos - 1),
					onRight	:int = Math.min(grid.widthInBlocks - 1, node.jPos + 1),
					onTop	:int = Math.max(0, node.iPos - 1),
					onBottom:int = Math.min(grid.heightInBlocks - 1, node.iPos + 1),
					centerX	:int = node.jPos,
					centerY	:int = node.iPos;
				
				handleNode(onLeft, centerY, node);
				handleNode(onRight, centerY, node);
				handleNode(centerX, onTop, node);
				handleNode(centerX, onBottom, node);
				
				closedArray.push(node);
				
				if(openArray.length == 0)
				{
					trace("путь не найден");
					return false;
				}
				
				openArray.sortOn("f", Array.NUMERIC);
				node = openArray.shift() as Ground;
			}
			
			buildPath();
			return true;
		}
		
		public function handleNode(jPos:int, iPos:int, currentNode:Ground):void
		{
			var test:Ground = grid.groundArray[iPos][jPos];
			
			if(test == currentNode || /*test.status != 'free'*/test.structure != 'Stepway')
			{
				return;
			}
			
			var g:Number = currentNode.g + cost,
				h:Number = diagonal(test),
				f:Number = g + h;
				
			if (isOpen(test) || isClosed(test))
			{
				if (test.f > f)
				{
					test.g = g;
					test.h = h;
					test.f = f;
					test.parentNode = currentNode;
				}
			}
			else
			{
				test.g = g;
				test.h = h;
				test.f = f;
				test.parentNode = currentNode;
				openArray.push(test);
			}
			
		}
		
		private function buildPath():void
		{
			path = new Array();
			var node:Ground = endNode;
			path.push(node);
			
			while (node != startNode)
			{
				node = node.parentNode;
				path.unshift(node);
			}
		}
		
		private function isOpen(node:Ground):Boolean
		{
			for (var i = 0; i < openArray.length; i++)
			{
				if (openArray[i] == node)
				{
					return true;
				}
			}
			
			return false;
		}
		
		private function isClosed(node:Ground):Boolean
		{
			for (var i = 0; i < closedArray.length; i++)
			{
				if (closedArray[i] == node)
				{
					return true;
				}
			}
			
			return false;
		}
	}
}
