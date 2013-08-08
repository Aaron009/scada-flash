package com.bitcrew.views
{
	import com.bitcrew.utills.sqlliteConfig;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import feathers.controls.Screen;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.utils.formatString;
	
	import utils.ProgressBar;
	
	public class Test1View extends Screen
	{
		private var progressBar:ProgressBar;
		
		[Inject]
		public var viewManager:ViewManager;
		
		[Dispatcher]
		public var dispatcher:EventDispatcher;
			
		[PostConstruct]
		public function postConstruct():void
		{					
			// clear flash stage
			//Starling.current.nativeStage.removeChildren();
			
			progressBar = new ProgressBar(150,25);
			//progressBar.x = (Constants.stageWidth * 0.5) - 75;
			//progressBar.y = (Constants.stageHeight * 0.5) - 12.5;
			progressBar.x = (stage.stageWidth * 0.5) - 75;
			progressBar.y = (stage.stageHeight * 0.5) - 12.5;
			addChild(progressBar);
			
			//trace(this.actualWidth,s)
			
			// load in assets 加载资源
			Game.assetManager.enqueue( 
				Constants.appDir.resolvePath(formatString("assets/textures/{0}x", Constants.contentScaleFactor)),
				Constants.appDir.resolvePath(formatString("assets/fonts/{0}x", Constants.contentScaleFactor)),
				Constants.appDir.resolvePath("assets/audio")
				
			);
			trace(Constants.appDir.resolvePath);
			
			Game.assetManager.loadQueue(function onProgress(ratio:Number):void
			{
				progressBar.ratio = ratio;
				
				// a progress bar should always show the 100% for a while,
				// so we show the main menu only after a short delay. 
				
				if (ratio == 1)
					Starling.juggler.delayCall(function():void
					{
						progressBar.removeFromParent(true);
						//viewManager.setView(Test2View, true);
						sqlliteConfig.instance.initSqlite(receiptNullFunction, configWorkCell);
						
					}, 0.15);
			});
		}
		
		private function configWorkCell(s:String):void 
		{
			trace("读取数据库 工作机号", s);
			//viewManager.setView(settingView, true);
			viewManager.setView(WordCellView, true);
			
		}
		
		private function receiptNullFunction():void 
		{
			// 没有数据,显示到设置界面
			trace('没有数据,显示到设置界面');
			viewManager.setView(SettingView, true);
		}
		
		[PreDestroy]
		public function preDestroy():void
		{
			// clean up	
		}
	}
}
