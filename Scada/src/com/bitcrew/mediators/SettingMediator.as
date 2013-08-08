package com.bitcrew.mediators
{
	import com.bitcrew.events.GameEvent;
	import com.bitcrew.utills.sqlliteConfig;
	import com.bitcrew.views.*;
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class SettingMediator
	{
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		private var eventMap:EventMap = new EventMap();
		private var view:SettingView;
		private var nextView:Class;
		
		[ViewAdded]
		public function viewAdded(view:SettingView):void
		{
			this.view = view;
			trace("[settingMediator] settingView Added");
			
			nextView = WordCellView;
			//eventMap.addMap(view.enterButton, Event.TRIGGERED, birdClicked);
			//eventMap.addMap(view.enterButton, Event.TRIGGERED, enterClicked);
		}
		
		private function enterClicked(e:Event):void 
		{
			/*trace('检查输入内容:', view.setWorkCellText.text);
			trace('设置工作机号',view.setWorkCellText.text);
			sqlliteConfig.instance.addOrUpdate(view.setWorkCellText.text);
			trace("设置完成！");
			
			dispatcher.dispatchEventWith(GameEvent.CHANGEVIEW, false, nextView);*/
			
			
		}
		
		[ViewRemoved]
		public function viewRemoved(view:Test2View):void
		{	
			nextView = null;
			eventMap.removeAllMappedEvents();
			
			this.view = null;
			trace("[Test2Mediator] Test2View Removed");
		}
		
		private function birdClicked(e:Event):void
		{
			dispatcher.dispatchEventWith(GameEvent.CHANGEVIEW, false, nextView);
		}
	}
}
