package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Mutagen
	 */
	public class lands_Grass extends MovieClip
	{
		
		
		public function generateGrass (mc:MovieClip,groundSkin,lk:int)
		{
			
			var rnd:Number = Math.ceil (Math.random() * 3)
			var i:Number
			
			var bigTrigger:Boolean = false
			var rockTrigger:Boolean = false
			var decoMc:MovieClip = new MovieClip ()
			mc.decoMc = decoMc
			mc.addChild (decoMc)
			
			mc.objectsArray = new Array () 
			rnd = Math.ceil (Math.random() * 100)
			if (rnd < 40) {
				rnd = 2
			} else {
				rnd = 1
			}
			
		if(groundSkin == 'grass')
		{
			for (i = 1; i < rnd; i++) {
				var rnd2:Number = Math.ceil (Math.random() * 9)
				var tmpMc:MovieClip
				if (rnd2 == 1) {
					tmpMc = new grass_4 ()
					
				}
				if (rnd2 == 2) {
					tmpMc = new grass_2 ()
				}
				if (rnd2 == 3) {
					if (!bigTrigger) {
						tmpMc = new grass_3 ()
					} else {
						tmpMc = new flowers_mc ()
						tmpMc.gotoAndStop (Math.ceil (Math.random() * 8))
					}
					bigTrigger = true
				}
				if (rnd2 == 4) {
					tmpMc = new grass_5 ()
				}
				if (rnd2 == 5)
				{
					if (lk < 3)
					{
						tmpMc = new grass_6 ()
						++ lk
						tmpMc.gotoAndStop (lk)
					}
					else
					{
						tmpMc = new grass_5 ()
					}
				}
				if (rnd2 == 6 || rnd2 == 7)
				{
					tmpMc = new flowers_mc ()
					tmpMc.gotoAndStop (Math.ceil (Math.random() * 8))
				}
				if (rnd2 == 8)
				{
					if (!rockTrigger)
					{
						tmpMc = new rocks_mc ()
						tmpMc.gotoAndStop (Math.ceil (Math.random() * 9))
						rockTrigger = true
					} 
					else
					{
						tmpMc = new grass_4 ()
						tmpMc.gotoAndStop (Math.ceil (Math.random() * 9))
					}
				}
				if (rnd2 == 9)
				{
					tmpMc = new flowers_mc ()
					tmpMc.gotoAndStop (Math.ceil (Math.random() * 4))
				}
				
				if (rnd2 == 8)
				{
					tmpMc.x = 0
					tmpMc.y = 0
				}
				tmpMc.x = 0
				tmpMc.y = 0
				mc.objectsArray.push (tmpMc)
			}
		}
		
			var objArr:Array = new Array ();
			for (i = 0; i < mc.objectsArray.length; i++) {
				mc.decoMc.addChild (mc.objectsArray[i])
				objArr[i] = new Object ()
				objArr[i].mc = mc.objectsArray[i]
				objArr[i].yp = mc.objectsArray[i].y
			}
			var sortArr:Array = new Array ()
			
			var tmpObj:Object
			for (i = 0; i < objArr.length; i++)
			{
				for (var j = 0; j < objArr.length-1; j++)
				{
					if (objArr[j].yp > objArr[j+1].yp)
					{
						tmpObj = objArr[j]
						objArr[j] = objArr[j + 1]
						objArr[j+1] = tmpObj
					}
				}
			}
			for (i = 0; i < objArr.length-1; i++)
			{
				var topPosition:uint = mc.decoMc.numChildren - 1;
				mc.decoMc.setChildIndex(objArr[i].mc, topPosition);
			}
		}
		
		
		
	}

}