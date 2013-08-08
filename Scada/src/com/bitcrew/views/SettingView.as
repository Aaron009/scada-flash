package com.bitcrew.views
{
	import feathers.controls.Screen;

	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;

	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class SettingView extends Screen
	{
		public static const CHILD_NAME_STATION_LIST:String = "stationList";

		/* 构造函数
		public function StationScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}
		*/
		
		[PostConstruct]
		public function postConstruct():void
		{
			//this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			//this.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}

		
		[PreDestroy]
		public function preDestroy():void
		{ 
			// clean up 
			//background.dispose();
			//backgroundSprite.dispose();
			//birdButton.dispose();
		}
	}
}
