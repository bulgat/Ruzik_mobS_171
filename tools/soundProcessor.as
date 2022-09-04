package tools 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	/**
	 * ...
	 * @author ...
	 */
	public class soundProcessor 
	{
		public var birds_fon_channel:SoundChannel
		public var _birds_fon:Sound = new birds_fon ()
		public var birds_fon_trigger:Boolean = false
		
		public var _cashCollectSnd:Sound = new cashCollectSnd ()
		public var _introWindowSnd:Sound = new introWindowSnd ()
		public var _buildingPlaceSnd:Sound = new buildingPlaceSnd ()
		public var _clickSnd:Sound = new clickSnd ()
		public var _repairSnd:Sound = new repairSnd ()
		public var _goToFriendParkSnd:Sound = new goToFriendParkSnd ()
		public var _sellObjectSnd:Sound = new sellObjectSnd ()
		public var _showWindowSnd:Sound = new showWindowSnd ()
		public var _kick:Sound = new kick ()
		public var _laugh:Sound = new laugh ();
		private var muteTrigger:Boolean = globalParams.stageMc.muteMusTrigger
		private var muteSndTrigger:Boolean = globalParams.stageMc.muteSndTrigger
		
		public function soundProcessor() 
		{
			
		}
		
		public function soundComplete(e:Event):void
		{
			birds_fon_channel.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
			birds_fon_channel = _birds_fon.play(0);
			birds_fon_channel.addEventListener(Event.SOUND_COMPLETE, soundComplete);
			trace('Доигрался фон с птичками');
		}
		
		public function update (muteMus:Boolean, muteSnd:Boolean) {
			muteTrigger = muteMus
			muteSndTrigger = muteSnd
			if (!muteMus) {
				if (!birds_fon_trigger) {
					trace('Фон с птичками был запущен');
					birds_fon_channel = _birds_fon.play(0);
					//birds_fon_channel.removeEventListener(Event.SOUND_COMPLETE, soundComplete);
					//birds_fon_channel.addEventListener(Event.SOUND_COMPLETE, soundComplete);
					
					birds_fon_trigger = true;
				}
				
			}
			if (muteMus) {
				if (birds_fon_trigger) {
					birds_fon_channel.stop ()
					birds_fon_trigger = false
				}
				
			}
		}
		public function playSnd (snd:String) {
			var rnd:Number
			
			if (!muteSndTrigger) {
				if (snd == "cashCollect") {
					_cashCollectSnd.play ()
				}
				if (snd == "introWindow") {
					_introWindowSnd.play ()
				}
				if (snd == "buildingPlace") {
					_buildingPlaceSnd.play ()
				}
				if (snd == "click") {
					_clickSnd.play ()
				}
				if (snd == "repair") {
					_repairSnd.play ()
				}
				if (snd == "goToFriendPark") {
					_goToFriendParkSnd.play ()
				}
				if (snd == "sellObject") {
					_sellObjectSnd.play ()
				}
				if (snd == "showWindow") {
					_showWindowSnd.play ()
				}
				if (snd == "kick") {
					_kick.play ()
				}
				if (snd == "laugh") {
					_laugh.play ()
				}
			
			}
		}
	}

}