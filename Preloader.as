package 
{
 
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.events.ProgressEvent;
 //mobile
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.StageAlign;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;
	///end  mobile
 
	public class Preloader extends MovieClip
	{
		var main:DisplayObject;

		public function Preloader()
		{
			
			///mobile
			// support autoOrients
			stage.align = StageAlign.TOP;
			//stage.fullScreenHeight;
			//stage.fullScreenWidth;
			//ВРЕМЕННО отключена для работы на swf
			stage.autoOrients = false;
			stage.setOrientation( StageOrientation.ROTATED_RIGHT );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			/// end mobile
			
			stop();
			loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
		}
 
		private function progressHandler(event:ProgressEvent):void
		{
			pre.preMask.scaleX = loaderInfo.bytesLoaded / loaderInfo.bytesTotal;
		}
 
		private function completeHandler(event:Event):void
		{
			
			gotoAndStop(4);
			//Priming.visible = false;
			//Priming.NextButton.visible = false;
			var mainClass:Class = getDefinitionByName("index_as") as Class;
			main = new mainClass();
			addChild(main);
		}
 		///mobile
		
		public function close_this():void
		{
		NativeApplication.nativeApplication.exit();
		}
		public function onKey(e:KeyboardEvent):void {
		if(e.keyCode == Keyboard.BACK) {
		NativeApplication.nativeApplication.exit();
		} 
		}
		/// end mobile
	}
 
}