package com.bitcrew.views
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	import starling.text.TextField;
	import starling.utils.HAlign;
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
		
		[Inject]
		public var viewManager:ViewManager;
		
		[Dispatcher]
		public var dispatcher:EventDispatcher;
		
		[PostConstruct]
		
		public function postConstruct():void
		{
			// add content here
			trace('31231231231');
			// 左边
			workCellName = new TextLine("WorkCellName", "Workcell#1", 200, 20, HAlign.CENTER);
			addChild(workCellName);
			
			startTimeText = new TextLine("startTimeText", "Actual start time:", 100, 20);
			startTimeText.y = workCellName.y + workCellName.height;
			addChild(startTimeText);
			
			startTime = new TextLine("startTime", "18:30", 100, 20, HAlign.RIGHT);
			startTime.x = startTimeText.width;
			startTime.y = workCellName.y + workCellName.height;
			addChild(startTime);
			
			endTimeText = new TextLine("endTimeText", "Standard Order End Time:", 100, 20);
			endTimeText.y = startTime.y + endTimeText.height;
			addChild(endTimeText);
			
			endTime = new TextLine("endTime", "15:20:00", 100, 20, HAlign.RIGHT);
			endTime.x = endTime.width + endTimeText.x;
			endTime.y = endTimeText.y;
			addChild(endTime);
			
			pEndTimeText = new TextLine("pEndTimeText", "Actual Projected End Time:", 100, 20);
			pEndTimeText.y = endTimeText.y + pEndTimeText.height;
			addChild(pEndTimeText);
			
			pEndTime = new TextLine("pEndTime", "15:29:06", 100, 20, HAlign.RIGHT);
			pEndTime.x = pEndTime.width + pEndTimeText.x;
			pEndTime.y = pEndTimeText.y;
			addChild(pEndTime);
			
			sUphText = new TextLine("sUphText", "Standard UPH:", 100, 20);
			sUphText.y = pEndTime.y + sUphText.height + sUphText.height;
			addChild(sUphText);
			
			sUph = new TextLine("pEndTime", "1800", 100, 20, HAlign.RIGHT);
			sUph.x = sUph.width + sUphText.x;
			sUph.y = sUphText.y;
			addChild(sUph);
			
			aUphText = new TextLine("aUphText", "Actual UPH:", 100, 20);
			aUphText.y = sUphText.y + aUphText.height;
			addChild(aUphText);
			
			aUph = new TextLine("aUph", "1562", 100, 20, HAlign.RIGHT);
			aUph.x = aUph.width + aUphText.x;
			aUph.y = aUphText.y;
			addChild(aUph);
			
			// 右边
			pOrderText = new TextLine('pOrderText', 'Production Order #', 100, 20);
			pOrderText.x = workCellName.width+40;
			addChild(pOrderText);
			pOrder = new TextLine('pOrder', 'pOrder', 100, 20, HAlign.RIGHT);
			pOrder.x = pOrder.width + pOrderText.x;
			pOrder.y = pOrderText.y;
			addChild(pOrder);
			
			lotText = new TextLine('lotText', 'lotText', 100, 20);
			lotText.x = pOrderText.x;
			lotText.y = pOrder.y + lotText.height;
			addChild(lotText);
			lot = new TextLine('lot', 'lot', 100, 20, HAlign.RIGHT);
			lot.x = lotText.x+pOrderText.width;
			lot.y = lotText.y;
			addChild(lot);
			
			skuNumerText = new TextLine('skuNumerText', 'skuNumerText', 100, 20);
			skuNumerText.x = pOrderText.x;
			skuNumerText.y = lot.y + skuNumerText.height;
			addChild(skuNumerText);
			skuNumer = new TextLine('skuNumer', 'skuNumer', 100, 20, HAlign.RIGHT);
			skuNumer.x = skuNumerText.x+pOrderText.width;
			skuNumer.y = skuNumerText.y ;
			addChild(skuNumer);
			
			qtyText = new TextLine('qtyText', 'qtyText', 100, 20);
			qtyText.x = pOrderText.x;
			qtyText.y = skuNumer.y + qtyText.height;
			addChild(qtyText);
			qty = new TextLine('qty', 'qty', 100, 20, HAlign.RIGHT);
			qty.x = qtyText.x+pOrderText.width;
			qty.y = qtyText.y ;
			addChild(qty);
			
			cQtyText = new TextLine('cQtyText', 'cQtyText', 100, 20);
			cQtyText.x = pOrderText.x;
			cQtyText.y = qty.y + cQtyText.height;
			addChild(cQtyText);
			cQty = new TextLine('cQty', 'cQty', 100, 20, HAlign.RIGHT);
			cQty.x = cQtyText.x+pOrderText.width;
			cQty.y = cQtyText.y ;
			addChild(cQty);
			
			oQtyText = new TextLine('oQtyText', 'oQtyText', 100, 20);
			oQtyText.x = pOrderText.x;
			oQtyText.y = cQty.y + oQtyText.height;
			addChild(oQtyText);
			oQty = new TextLine('oQty', 'oQty', 100, 20, HAlign.RIGHT);
			oQty.x = oQtyText.x+pOrderText.width;
			oQty.y = oQtyText.y ;
			addChild(oQty);
			
			oCellText = new TextLine('oCellText', 'oCellText', 100, 20);
			oCellText.x = pOrderText.x;
			oCellText.y = oQty.y + oCellText.height;
			addChild(oCellText);
			oCell = new TextLine('oCell', 'oCell', 100, 20, HAlign.RIGHT);
			oCell.x = oCellText.x+pOrderText.width;
			oCell.y = oCellText.y ;
			addChild(oCell);
			
			mCellText = new TextLine('mCellText', 'mCellText', 100, 20);
			mCellText.x = pOrderText.x;
			mCellText.y = oCell.y + mCellText.height;
			addChild(mCellText);
			mCell = new TextLine('mCell', 'mCell', 100, 20, HAlign.RIGHT);
			mCell.x = mCellText.x+pOrderText.width;
			mCell.y = mCellText.y ;
			addChild(mCell);
			
			mNumberText = new TextLine('mNumberText', 'mNumberText', 100, 20);
			mNumberText.x = pOrderText.x;
			mNumberText.y = mCell.y + mNumberText.height;
			addChild(mNumberText);
			mNumber = new TextLine('mNumber', 'mNumber', 100, 20, HAlign.RIGHT);
			mNumber.x = mNumberText.x+pOrderText.width;
			mNumber.y = mNumberText.y ;
			addChild(mNumber);
			
			mToolingText = new TextLine('mToolingText', 'mToolingText', 100, 20);
			mToolingText.x = pOrderText.x;
			mToolingText.y = mNumber.y + mToolingText.height;
			addChild(mToolingText);
			mTool = new TextLine('mTool', 'mTool', 100, 20, HAlign.RIGHT);
			mTool.x = mToolingText.x+pOrderText.width;
			mTool.y = mToolingText.y ;
			addChild(mTool);
			
			yieldText = new TextLine('yieldText', 'yieldText', 100, 20);
			yieldText.x = pOrderText.x;
			yieldText.y = mTool.y + yieldText.height;
			addChild(yieldText);
			yield = new TextLine('yield', 'yield', 100, 20, HAlign.RIGHT);
			yield.x = yieldText.x+pOrderText.width;
			yield.y = yieldText.y ;
			addChild(yield);
			
			keyCompnentsText = new TextLine('keyCompnentsText', 'keyCompnentsText', 100, 20);
			keyCompnentsText.x = pOrderText.x;
			keyCompnentsText.y = yield.y + keyCompnentsText.height;
			addChild(keyCompnentsText);
			
			hVText = new TextLine('hVText', 'hVText', 100, 20);
			hVText.x = pOrderText.x;
			hVText.y = keyCompnentsText.y + hVText.height;
			addChild(hVText);
			hv = new TextLine('hv', 'hv', 100, 20, HAlign.RIGHT);
			hv.x = hVText.x+pOrderText.width;
			hv.y = hVText.y ;
			addChild(hv);
			
			lvText = new TextLine('lvText', 'lvText', 100, 20);
			lvText.x = pOrderText.x;
			lvText.y = hv.y + lvText.height;
			addChild(lvText);
			lv = new TextLine('lv', 'lv', 100, 20, HAlign.RIGHT);
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