/*

http://flapps.ru/forum/ - форум о создании приложений

*/
package 
{
	import flash.display.Sprite;
	import flash.text.*;
	import flash.events.*;

	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	public class panel_friend extends Sprite
	{
		public var my_box:presents = new presents  ;
		public var myTween:Tween;
		
		public var _id:String;
		public function Launch(data:Object):void
		{
			my_box.x=31;
			addChildAt(my_box,2);
			
			myTween = new Tween(my_box,"x",Strong.easeOut,40,300,5,true);
			myTween.stop();
			var frCount:int = data.length;
			for (var i = 0; i < frCount; i++)
			{
				//result_tf.appendText(data[i].uid + ' ' + data[i].first_name + ' ' + data[i].last_name + "   "+data[i].photo_medium_rec+"\n");

				var _table_friend:table_friend = new table_friend  ;
				_table_friend.y = 5;
				//_table_friend.y = _table_friend.height * i;
				_table_friend.x = _table_friend.width * i;
				my_box.addChild(_table_friend);
				//_table_friend.id=data[i].uid;
				
				_table_friend.Launch(data[i].uid,data[i].first_name,data[i].last_name,data[i].photo_medium_rec);
				_table_friend.addEventListener("id_clickFriend", id_Click);
			}
			lArrow.addEventListener(MouseEvent.CLICK, l_Click);
			rArrow.addEventListener(MouseEvent.CLICK, r_Click);
			lArrow.fast = "slow";
			rArrow.fast = "slow";
			l_fast.addEventListener(MouseEvent.CLICK, l_Click);
			r_fast.addEventListener(MouseEvent.CLICK, r_Click);
			l_fast.fast = "fast";
			r_fast.fast = "fast";
			l_supfast.addEventListener(MouseEvent.CLICK, l_Click);
			r_supfast.addEventListener(MouseEvent.CLICK, r_Click);
			l_supfast.fast = "supfast";
			r_supfast.fast = "supfast";
			downPanel.addEventListener(MouseEvent.CLICK, downPanel_Click);
		}
		var downPanel_ok:Boolean;
		public function downPanel_Click(e:MouseEvent)
		{
			if (downPanel_ok)
			{
				this.y -=  80;
				
				downPanel_ok = false;
			}
			else
			{
				this.y +=  80;
				downPanel_ok = true;
			}
		}
		public function id_Click(e:Event)
		{
			
			
			_id = (e.target).id;
			//this.visible=false;
			dispatchEvent(new Event("id_clickFriend"));
			
		}
		public function l_Click(e:Event)
		{
			//trace(my_box.x,"my_box.x",my_box.width,"    ",my_box.x-my_box.width,e.target.fast);
			var dislocate:int = 53;
			if (e.target.fast == "fast")
			{
				dislocate = 364;
			}
			if (e.target.fast == "supfast")
			{
				dislocate =  -  my_box.x + 52;
				//dislocate = my_box.width
			}
			if (my_box.x < 0)
			{
				myTween = new Tween(my_box,"x",Strong.easeOut,my_box.x,my_box.x + dislocate,5,true);
				myTween.start();
			}

		}
		public function r_Click(e:Event)
		{
			//trace("L ",my_box.x,"my_box.x",my_box.width,"    ",my_box.x-my_box.width,e.target.fast);
			//trace(" my_box.x+my_box.width ",my_box.x+my_box.width);
			var dislocate:int = 53;
			if (e.target.fast == "fast")
			{
				dislocate = 364;
			}
			if (e.target.fast == "supfast")
			{
				my_box.x = 31;
				dislocate = my_box.width - 364;
			}
			if (my_box.x + my_box.width - 364 * 2 > 0)
			{
				myTween = new Tween(my_box,"x",Strong.easeOut,my_box.x,my_box.x - dislocate,5,true);
				myTween.start();
			}

		}




	}
}