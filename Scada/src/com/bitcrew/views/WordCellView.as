package com.bitcrew.views
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	import starling.display.Shape;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import utils.TextLine;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	
	public class WordCellView extends Sprite
	{
		private var workCellName:TextLine;
		private var startTime:TextLine;
		private var startTimeText:TextLine;
		private var endTimeText:TextLine;
		private var endTime:TextLine;
		private var pEndTimeText:TextLine;
		private var pEndTime:TextLine;
		private var sUphText:TextLine;
		private var sUph:TextLine;
		private var aUphText:TextLine;
		private var aUph:TextLine;
		private var pOrderText:TextLine;
		private var pOrder:TextLine;
		private var lotText:TextLine;
		private var lot:TextLine;
		private var skuNumerText:TextLine;
		private var skuNumer:TextLine;
		private var qtyText:TextLine;
		private var qty:TextLine;
		private var cQtyText:TextLine;
		private var cQty:TextLine;
		private var oQtyText:TextLine;
		private var oQty:TextLine;
		private var oCellText:TextLine;
		private var oCell:TextLine;
		private var mCellText:TextLine;
		private var mCell:TextLine;
		private var mNumberText:TextLine;
		private var mNumber:TextLine;
		private var mToolingText:TextLine;
		private var mTool:TextLine;
		private var yieldText:TextLine;
		private var yield:TextLine;
		private var keyCompnentsText:TextLine;
		private var hVText:TextLine;
		private var hv:TextLine;
		private var lvText:TextLine;
		private var lv:TextLine;
		
		private var textHeight:Number;
		private var textWidth:Number;
		private var btWidth:Number;
		private var btHeight:Number;
		private var space:int = 2;
		private var currentTime:TextLine;
		
		[Inject]
		public var viewManager:ViewManager;
		
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		[PostConstruct]
		
		public function postConstruct():void
		{
			// add content here
			calcBoundary();
			addText();
			addBackground();
		}
		
		private function addBackground():void
		{
			var shape:Shape = new Shape();
			addChildAt(shape, 0);
			shape.x = space;
			shape.y = space;
			
			// Rect drawn with drawRect()
			
			shape.graphics.beginFill(0x5082BA);
			var a:Number = stage.stageWidth - 2 * space;
			var b:Number = workCellName.height;
			shape.graphics.drawRect(0, 0, a, b);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x00FF00);
			shape.graphics.drawRect(startTimeText.x, startTimeText.y, startTimeText.width, startTimeText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(startTime.x, startTime.y, startTime.width, startTime.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x00FF00);
			shape.graphics.drawRect(endTimeText.x, endTimeText.y, endTimeText.width, endTimeText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(endTime.x, endTime.y, endTime.width, endTime.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0xFEC100);
			shape.graphics.drawRect(pEndTimeText.x, pEndTimeText.y, pEndTimeText.width, pEndTimeText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(pEndTime.x, pEndTime.y, pEndTime.width, pEndTime.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0xFEC100);
			shape.graphics.drawRect(sUphText.x, sUphText.y, sUphText.width, sUphText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(sUph.x, sUph.y, sUph.width, sUph.height);
			shape.graphics.endFill();
			
			
			shape.graphics.beginFill(0xFEC100);
			shape.graphics.drawRect(aUphText.x, aUphText.y, aUphText.width, aUphText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(aUph.x, aUph.y, aUph.width, aUph.height);
			shape.graphics.endFill();
			
			// 右边
			shape.graphics.beginFill(0x00B150);
			shape.graphics.drawRect(pOrderText.x, pOrderText.y, pOrderText.width, pOrderText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(pOrder.x, pOrder.y, pOrder.width, pOrder.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x00B150);
			shape.graphics.drawRect(lotText.x, lotText.y, lotText.width, lotText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(lot.x, lot.y, lot.width, lot.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x00B150);
			shape.graphics.drawRect(skuNumerText.x, skuNumerText.y, skuNumerText.width, skuNumerText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(skuNumer.x, skuNumer.y, skuNumer.width, skuNumer.height);
			shape.graphics.endFill();
			
			//-----------------------------------------------------------------------------------------------------
			shape.graphics.beginFill(0xB2A3C7);
			shape.graphics.drawRect(qtyText.x, qtyText.y, qtyText.width, qtyText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(qty.x, qty.y, qty.width, qty.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0xB2A3C7);
			shape.graphics.drawRect(cQtyText.x, cQtyText.y, cQtyText.width, cQtyText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(cQty.x, cQty.y, cQty.width, cQty.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0xB2A3C7);
			shape.graphics.drawRect(oQtyText.x, oQtyText.y, oQtyText.width, oQtyText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(oQty.x, oQty.y, oQty.width, oQty.height);
			shape.graphics.endFill();
			
			//-----------------------------------------------------------------------------------------------------
			shape.graphics.beginFill(0x31879D);
			shape.graphics.drawRect(oCellText.x, oCellText.y, oCellText.width, oCellText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(oCell.x, oCell.y, oCell.width, oCell.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x31879D);
			shape.graphics.drawRect(mCellText.x, mCellText.y, mCellText.width, mCellText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(mCell.x, mCell.y, mCell.width, mCell.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x31879D);
			shape.graphics.drawRect(mNumberText.x, mNumberText.y, mNumberText.width, mNumberText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(mNumber.x, mNumber.y, mNumber.width, mNumber.height);
			shape.graphics.endFill();
			
			//-----------------------------------------------------------------------------------------------------
			shape.graphics.beginFill(0x31879D);
			shape.graphics.drawRect(mToolingText.x, mToolingText.y, mToolingText.width, mToolingText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(mTool.x, mTool.y, mTool.width, mTool.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x31879D);
			shape.graphics.drawRect(yieldText.x, yieldText.y, yieldText.width, yieldText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(yield.x, yield.y, yield.width, yield.height);
			shape.graphics.endFill();
			
			
			//********************************************************************************
			shape.graphics.beginFill(0x00B1F0);
			shape.graphics.drawRect(keyCompnentsText.x, keyCompnentsText.y, keyCompnentsText.width, keyCompnentsText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x00B1F0);
			shape.graphics.drawRect(hVText.x, hVText.y, hVText.width, hVText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(hv.x, hv.y, hv.width, hv.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x00B1F0);
			shape.graphics.drawRect(lvText.x, lvText.y, lvText.width, lvText.height);
			shape.graphics.endFill();
			
			shape.graphics.beginFill(0x7F7F7F);
			shape.graphics.drawRect(lv.x, lv.y, lv.width, lv.height);
			shape.graphics.endFill();
		
		}
		
		private function calcBoundary():void
		{
			var stageH:Number = stage.stageHeight;
			var stageW:Number = stage.stageWidth;
			
			textHeight = Number(stageH / 15) - 2 * space;
			textWidth = Number(stageW / 4) - 3 * space;
			trace(textHeight, textWidth);
			btWidth = (stageW - 2 * space);
			btHeight = textHeight;
		}
		
		private function addText():void
		{
			// 左边 
			workCellName = new TextLine("WorkCellName", " Dashborad by Individual", 150, btHeight, HAlign.LEFT);
			trace(btWidth)
			workCellName.x = space;
			workCellName.y = space;
			addChild(workCellName);
			
			currentTime = new TextLine("CurrentTime", "2013.08.09 15:09", 120, btHeight, HAlign.LEFT, VAlign.BOTTOM);
			currentTime.x = workCellName.x + workCellName.width;
			currentTime.y = workCellName.y;
			currentTime.textfield.fontSize = 8;
			addChild(currentTime);
			
			startTimeText = new TextLine("startTimeText", " Actual start time:", textWidth, textHeight, HAlign.LEFT);
			startTimeText.x = workCellName.x;
			startTimeText.y = workCellName.y + workCellName.height + space;
			addChild(startTimeText);
			
			startTime = new TextLine("startTime", "18:30", textWidth, textHeight, HAlign.RIGHT);
			startTime.x = startTimeText.width + startTimeText.x;
			startTime.y = startTimeText.y;
			addChild(startTime);
			
			endTimeText = new TextLine("endTimeText", " Standard Order End Time:", textWidth, textHeight);
			endTimeText.x = startTimeText.x;
			endTimeText.y = startTime.y + endTimeText.height + space;
			addChild(endTimeText);
			
			endTime = new TextLine("endTime", "15:20:00", textWidth, textHeight, HAlign.RIGHT);
			endTime.x = startTime.x;
			endTime.y = endTimeText.y;
			addChild(endTime);
			
			// 这里要重新计算宽度
			pEndTimeText = new TextLine("pEndTimeText", " Actual Projected", textWidth, textHeight,HAlign.LEFT,VAlign.BOTTOM); // Actual Projected End Time:
			pEndTimeText.x = endTimeText.x;
			pEndTimeText.y = (endTime.y + endTime.height + space);
			addChild(pEndTimeText);
			
			pEndTime = new TextLine("pEndTime", "15:29:06", textWidth, textHeight, HAlign.RIGHT);
			pEndTime.x = pEndTimeText.width + pEndTimeText.x;
			pEndTime.y = pEndTimeText.y;
			addChild(pEndTime);
			
			sUphText = new TextLine("sUphText", " Standard UPH:", textWidth, textHeight);
			sUphText.x = pEndTimeText.x;
			sUphText.y = pEndTimeText.y + sUphText.height + space;
			addChild(sUphText);
			
			sUph = new TextLine("pEndTime", "1800", textWidth, textHeight, HAlign.RIGHT);
			sUph.x = sUph.width + sUphText.x;
			sUph.y = sUphText.y;
			addChild(sUph);
		
			aUphText = new TextLine("aUphText", " Actual UPH:", textWidth, textHeight);
			aUphText.x = sUphText.x;
			aUphText.y = sUphText.y + aUphText.height+space;
			addChild(aUphText);
			
			aUph = new TextLine("aUph", "1562", textWidth, textHeight, HAlign.RIGHT);
			aUph.x = aUph.width + aUphText.x;
			aUph.y = aUphText.y;
			addChild(aUph);
			
			 //右边
			pOrderText = new TextLine('pOrderText', ' Production Order #', textWidth, textHeight);
			pOrderText.x = startTime.width+startTime.x+space;
			pOrderText.y = startTimeText.y;
			addChild(pOrderText);
			pOrder = new TextLine('pOrder', 'pOrder', textWidth, textHeight, HAlign.RIGHT);
			pOrder.x = pOrder.width + pOrderText.x;
			pOrder.y = pOrderText.y;
			addChild(pOrder);
			
			lotText = new TextLine('lotText', ' lotText', textWidth, textHeight);
			lotText.x = pOrderText.x;
			lotText.y = pOrder.y + lotText.height+ space;
			addChild(lotText);
			lot = new TextLine('lot', 'lot', textWidth, textHeight, HAlign.RIGHT);
			lot.x = lotText.x+pOrderText.width;
			lot.y = lotText.y;
			addChild(lot);
			
			skuNumerText = new TextLine('skuNumerText', ' skuNumerText', textWidth, textHeight);
			skuNumerText.x = pOrderText.x;
			skuNumerText.y = lot.y + skuNumerText.height+ space;
			addChild(skuNumerText);
			skuNumer = new TextLine('skuNumer', 'skuNumer', textWidth, textHeight, HAlign.RIGHT);
			skuNumer.x = skuNumerText.x+pOrderText.width;
			skuNumer.y = skuNumerText.y ;
			addChild(skuNumer);
			
			qtyText = new TextLine('qtyText', ' qtyText', textWidth, textHeight);
			qtyText.x = pOrderText.x;
			qtyText.y = skuNumer.y + qtyText.height+ space;
			addChild(qtyText);
			qty = new TextLine('qty', 'qty', textWidth, textHeight, HAlign.RIGHT);
			qty.x = qtyText.x+pOrderText.width;
			qty.y = qtyText.y ;
			addChild(qty);
			
			cQtyText = new TextLine('cQtyText', ' cQtyText', textWidth, textHeight);
			cQtyText.x = pOrderText.x;
			cQtyText.y = qty.y + cQtyText.height+ space;
			addChild(cQtyText);
			cQty = new TextLine('cQty', 'cQty', textWidth, textHeight, HAlign.RIGHT);
			cQty.x = cQtyText.x+pOrderText.width;
			cQty.y = cQtyText.y ;
			addChild(cQty);
			
			oQtyText = new TextLine('oQtyText', ' oQtyText', textWidth, textHeight);
			oQtyText.x = pOrderText.x;
			oQtyText.y = cQty.y + oQtyText.height+ space;
			addChild(oQtyText);
			oQty = new TextLine('oQty', 'oQty', textWidth, textHeight, HAlign.RIGHT);
			oQty.x = oQtyText.x+pOrderText.width;
			oQty.y = oQtyText.y ;
			addChild(oQty);
			
			oCellText = new TextLine('oCellText', ' oCellText', textWidth, textHeight);
			oCellText.x = pOrderText.x;
			oCellText.y = oQty.y + oCellText.height+ space;
			addChild(oCellText);
			oCell = new TextLine('oCell', 'oCell', textWidth, textHeight, HAlign.RIGHT);
			oCell.x = oCellText.x+pOrderText.width;
			oCell.y = oCellText.y ;
			addChild(oCell);
			
			mCellText = new TextLine('mCellText', ' mCellText', textWidth, textHeight);
			mCellText.x = pOrderText.x;
			mCellText.y = oCell.y + mCellText.height+ space;
			addChild(mCellText);
			mCell = new TextLine('mCell', 'mCell', textWidth, textHeight, HAlign.RIGHT);
			mCell.x = mCellText.x+pOrderText.width;
			mCell.y = mCellText.y ;
			addChild(mCell);
			
			mNumberText = new TextLine('mNumberText', ' mNumberText', textWidth, textHeight);
			mNumberText.x = pOrderText.x;
			mNumberText.y = mCell.y + mNumberText.height+ space;
			addChild(mNumberText);
			mNumber = new TextLine('mNumber', 'mNumber', textWidth, textHeight, HAlign.RIGHT);
			mNumber.x = mNumberText.x+pOrderText.width;
			mNumber.y = mNumberText.y ;
			addChild(mNumber);
			
			mToolingText = new TextLine('mToolingText', ' mToolingText', textWidth, textHeight);
			mToolingText.x = pOrderText.x;
			mToolingText.y = mNumber.y + mToolingText.height+ space;
			addChild(mToolingText);
			mTool = new TextLine('mTool', 'mTool', textWidth, textHeight, HAlign.RIGHT);
			mTool.x = mToolingText.x+pOrderText.width;
			mTool.y = mToolingText.y ;
			addChild(mTool);
			
			yieldText = new TextLine('yieldText', ' yieldText', textWidth, textHeight);
			yieldText.x = pOrderText.x;
			yieldText.y = mTool.y + yieldText.height+ space;
			addChild(yieldText);
			yield = new TextLine('yield', 'yield', textWidth, textHeight, HAlign.RIGHT);
			yield.x = yieldText.x+pOrderText.width;
			yield.y = yieldText.y ;
			addChild(yield);
			
			keyCompnentsText = new TextLine('keyCompnentsText', ' keyCompnentsText', textWidth, textHeight);
			keyCompnentsText.x = pOrderText.x;
			keyCompnentsText.y = yield.y + keyCompnentsText.height+ space;
			addChild(keyCompnentsText);
			
			hVText = new TextLine('hVText', ' hVText', textWidth, textHeight);
			hVText.x = pOrderText.x;
			hVText.y = keyCompnentsText.y + hVText.height+ space;
			addChild(hVText);
			hv = new TextLine('hv', 'hv', textWidth, textHeight, HAlign.RIGHT);
			hv.x = hVText.x+pOrderText.width;
			hv.y = hVText.y ;
			addChild(hv);
			
			lvText = new TextLine('lvText', ' lvText', textWidth, textHeight);
			lvText.x = pOrderText.x;
			lvText.y = hv.y + lvText.height+ space;
			addChild(lvText);
			lv = new TextLine('lv', 'lv', textWidth, textHeight, HAlign.RIGHT);
			lv.x = lvText.x+pOrderText.width;
			lv.y = lvText.y ;
			addChild(lv);
		}
		
		[PreDestroy]
		
		public function preDestroy():void
		{
			// clean up
		}
	}
}