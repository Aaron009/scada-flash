package utils 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	/**
	 * ...
	 * @author 
	 */
	public class TextLine extends Sprite
	{
		private var textfield:TextField;
		
		public function TextLine(name:String,text:String,wid:Number,hig:Number,hAlign:String = HAlign.LEFT,vAlign:String = VAlign.TOP):void
		{
			textfield = new TextField(wid,hig,text);
			textfield.text = text;
			textfield.name = name;
			textfield.vAlign = vAlign;
			textfield.hAlign = hAlign;
			addChild(textfield);
		}
		
	}

}