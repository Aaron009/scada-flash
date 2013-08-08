package com.bitcrew.views
{	
	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	// feather
	import feathers.display.TiledImage;
	
	public class Test2View extends Sprite
	{
		
		
		
		private var backgroundSprite:Sprite;
		private var background:Quad;
		public var birdButton:Button;
			
		[PostConstruct]
		public function postConstruct():void
		{
			// add some content
			backgroundSprite = new Sprite();
			backgroundSprite.blendMode = BlendMode.NONE;
			background = new Quad(480, 320, 0xeeeeee);
			backgroundSprite.addChild(background);
			//addChild(backgroundSprite);
			
			
			
			
			birdButton = new Button( Game.assetManager.getTexture("starling_round") );
			birdButton.x = (Constants.stageWidth * 0.5) - birdButton.width * 0.5;
			birdButton.y = (Constants.stageHeight * 0.5) - birdButton.height * 0.5;
			addChild(birdButton);
		}
				
		[PreDestroy]
		public function preDestroy():void
		{
			// clean up
			background.dispose();
			backgroundSprite.dispose();
			birdButton.dispose();
		}
	}
}
