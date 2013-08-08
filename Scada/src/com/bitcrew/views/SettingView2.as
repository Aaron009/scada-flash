package com.bitcrew.views
{	
	import com.bitcrew.models.GameModel;
	import feathers.controls.TextInput;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;

	
	
	public class SettingView2 extends Sprite
	{
		private var workCellText:TextField;
		public var enterButton:Button;
		public var setWorkCellText:TextInput;
		//public var birdButton:Button;
		
		[Inject]
		public var gameModel:GameModel;
			
		[PostConstruct]
		public function postConstruct():void
		{
			trace('模型',gameModel.accuracy,gameModel.bindings);
			
			workCellText = new TextField(102, 15, 'setWorkCellText');
			workCellText.x = workCellText.y = 0;
			//workCellText.x = 470;
			workCellText.vAlign = VAlign.TOP;
			workCellText.hAlign = HAlign.LEFT;
			trace(workCellText.fontSize)
			addChild(workCellText);
			trace('settingView显示页面执行！');
			
			setWorkCellText = new TextInput();
			setWorkCellText.width = 100;
			setWorkCellText.height = 15;
			setWorkCellText.x = workCellText.x + workCellText.width;
			setWorkCellText.y = workCellText.y;
			//setWorkCellText.vAlign = VAlign.TOP;
			//setWorkCellText.hAlign = HAlign.LEFT;
			setWorkCellText.setFocus();
			addChild(setWorkCellText);
			

			enterButton = new Button( Game.assetManager.getTexture("button-up-skin"),'enterButton' );
			enterButton.x = workCellText.x;
			enterButton.y = workCellText.height;
			addChild(enterButton);
			
			//var offset:int = 10;
            //var ttFont:String = "Ubuntu";
            //var ttFontSize:int = 19; 
            //
            //var colorTF:TextField = new TextField(300, 80, 
                //"TextFields can have a border and a color. They can be aligned in different ways, ...", 
                //ttFont, ttFontSize);
            //colorTF.x = colorTF.y = offset;
            //colorTF.border = true;
            //colorTF.color = 0x333399;
            //addChild(colorTF);
			
			/*// add some content
			backgroundSprite = new Sprite();
			backgroundSprite.blendMode = BlendMode.NONE;
			background = new Quad(480, 320, 0xeeeeee);
			backgroundSprite.addChild(background);
			addChild(backgroundSprite);
			
			
			birdButton = new Button( Game.assetManager.getTexture("starling_round") );
			birdButton.x = (Constants.stageWidth * 0.5) - birdButton.width * 0.5;
			birdButton.y = (Constants.stageHeight * 0.5) - birdButton.height * 0.5;
			addChild(birdButton);*/
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
