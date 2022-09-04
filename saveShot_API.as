package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.display.Bitmap;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import foto.*;
	public class saveShot_API extends MovieClip
	{
		
		public var mpLoader:MultipartURLLoader;

		public function makeScreenshot(url:String):void
		{

			//dispatchEvent(new Event("save"));

			var raw:BitmapData;
			var brr:ByteArray;

			raw = new BitmapData(globalParams.indexMc.stage.stageWidth,globalParams.indexMc.stage.stageHeight);
			
			raw.draw(globalParams.indexMc.stage);
			//raw.draw(stage)
			
			//raw=globalParams.indexMc.draw_stage()
			
			brr = PNGEncoder.encode(raw);
			
			mpLoader = new MultipartURLLoader();
			
			mpLoader.addFile(brr, "screenshot.png", "photo", 'image/jpeg');
			
			mpLoader.addEventListener(Event.COMPLETE, WallSavePhotoPost);
			
			
			
			try {
				mpLoader.load(url);
			} catch (e:Error) {
	
				trace(",________",e)
				globalParams.global_Log.push("\n   error="+e)
			}
			
		}
		
		public var recordObj:Object = [];
		private function WallSavePhotoPost(e:Event):void
		{
			
			recordObj = mpLoader.loader.data;
			
			dispatchEvent(new Event("save"));

		}

	}

}