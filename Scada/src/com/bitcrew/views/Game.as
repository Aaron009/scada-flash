package com.bitcrew.views
{	
	import com.bitcrew.providers.GameObjectProvider;
	import feathers.display.TiledImage;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import com.creativebottle.starlingmvc.StarlingMVC;
	import com.creativebottle.starlingmvc.config.StarlingMVCConfig;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import flash.system.Capabilities;
	import utils.AssetManager;
	
	public class Game extends Sprite
	{		
		[Embed(source="../../../../bin/assets/textures/2x/traintimes.png")]
		protected static const ATLAS_IMAGE:Class;

		[Embed(source = "../../../../bin/assets/textures/2x/traintimes.xml",mimeType="application/octet-stream")]
		protected static const ATLAS_XML:Class;
		
		///////////////////////////////////////////////////////////////////////
		// Private Properties
		
		public static var sAssets:AssetManager;
		private var config:StarlingMVCConfig;
		private var beans:Array;
		private var starlingMVC:StarlingMVC;
		
		///////////////////////////////////////////////////////////////////////
		// GameMain Constructor
		
		public function Game()
		{		
			addEventListener( Event.ADDED_TO_STAGE, init );
		}
		
		///////////////////////////////////////////////////////////////////////
		// Init GameMain
		
		private function init( event : Event ) : void
		{		
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			///////////////////////////////////////////////////////////////////
			// create the game with a fixed stage size only the viewPort is variable.
			///////////////////////////////////////////////////////////////////
			
			const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
			var atlas:TextureAtlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));
			
			//trace(Constants.stageWidth,Constants.stageHeight)
			
			// 还是会出现视图窗口白边
			//Starling.current.viewPort = new Rectangle(Constants._viewX, Constants._viewY, Constants.viewPortWidth, Constants.viewPortHeight);
			
			stage.stageWidth  = Constants.stageWidth;
			stage.stageHeight = Constants.stageHeight;
			
			///////////////////////////////////////////////////////////////////
			// the contentScaleFactor is calculated from stage size and viewport size
			///////////////////////////////////////////////////////////////////
			
			Constants.contentScaleFactor = Starling.current.contentScaleFactor;
			Constants.contentScaleFactor = Constants.normalizedContentScaleFactor = Starling.current.contentScaleFactor < 1.5 ? 1 : 2;
			
			
			trace("[Engine] Stage: " + stage.stageWidth + "x" + stage.stageHeight);
			trace("[Engine] Scale Factor: " + Starling.current.contentScaleFactor);
			
			///////////////////////////////////////////////////////////////////
			// Init the asset manager
			///////////////////////////////////////////////////////////////////
			
			sAssets = new AssetManager(Constants.contentScaleFactor, false);
			sAssets.verbose = Capabilities.isDebugger;				
			
			///////////////////////////////////////////////////////////////////
			// Starling MVC StartUp
			///////////////////////////////////////////////////////////////////
			
			config = new StarlingMVCConfig();
			config.eventPackages = ["com.bitcrew.events"];
			config.viewPackages = ["com.bitcrew.views"];
			
			///////////////////////////////////////////////////////////////////
			// GameObjectProvider defines the initial beans that are used
			///////////////////////////////////////////////////////////////////
			
			beans = [new GameObjectProvider(), new ViewManager(this)];
			starlingMVC = new StarlingMVC(this, config, beans);
			
			trace("[Engine] MVC Started...");
			
			Constants.calculateScale();
			
			// 测试自适应屏幕、铺满背景
			var primaryBackground:TiledImage = new TiledImage(atlas.getTexture("main-background")); 
			primaryBackground.width = root.stage.stageWidth;
			primaryBackground.height = root.stage.stageHeight;
			primaryBackground.textureScale = Constants.scale; //缩放纹理
			//addChildAt(primaryBackground, 0);
		}
		
		public static function get assetManager():AssetManager
		{
			return sAssets;
		}
	}
}
