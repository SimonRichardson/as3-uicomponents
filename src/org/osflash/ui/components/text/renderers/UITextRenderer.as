package org.osflash.ui.components.text.renderers
{
	import flash.text.engine.ElementFormat;
	import flash.text.engine.TextLine;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UITextRenderer extends UIAbstractTextRenderer 
	{

		public static const ALIGN_LEFT : int = 1;

		public static const ALIGN_RIGHT : int = 2;

		public static const ALIGN_CENTER : int = 3;

		/**
		 * @private
		 */
		private var _autoSize : Boolean;

		/**
		 * @private
		 */
		private var _autoEllipsis : Boolean;

		/**
		 * @private
		 */
		private var _textAlign : int;

		/**
		 * @private
		 */
		private var _textIsDisplayedPartially : Boolean;
		
		/**
		 * @private
		 */
		private var _shortend : Boolean;

		public function UITextRenderer(format : ElementFormat) 
		{
			super(format);
			
			_textIsDisplayedPartially = false;
			_shortend = false;
			
			autoSize = true;
			autoEllipsis = true;
		}

		/**
		 * @inheritDoc
		 */
		override protected function render(text : String) : void 
		{
			_textIsDisplayedPartially = false;
			
			boundsText.resizeTo(0, 0);
			
			clearTextLines();
			
			if (text == null || text == "" || boundsMax.width <= 0 || boundsMax.height <= 0)
				return;
			
			textElement.text = text;
			textBlock.content = textElement;
			textBlock.textJustifier = spaceJustifier;
			
			var textLine : TextLine = textBlock.createTextLine(null, boundsMax.width);
			if (textLine == null) return;
			
			const textHeight : Number = textLine.textHeight;
			const textHeightAndSpacing : Number = textHeight + lineSpacing;
			var lineHeight : Number = textHeight - textLine.descent + 1;
			
			var index : int = 0;
			while (textLine)
			{
				if (boundsText.height + textHeight > boundsMax.height)
				{
					if (_autoEllipsis && !_shortend)
					{
						_shortend = true;
						textLines.splice(0, textLines.length);
						
						applyEllipsis(index);
						return;
					}
					
					_shortend = true;
					break;
				}
				
				index += textLine.atomCount;
				boundsText.height = boundsText.height + textHeightAndSpacing;
				
				if (boundsText.width < textLine.width) boundsText.width = textLine.width;
				
				textLines.push(textLine);
				
				textLine = textBlock.createTextLine(textLine, boundsMax.width);
			}
			
			boundsText.height = boundsText.height - lineSpacing;
			
			var n : int = 0;
			while (n < textLines.length)
			{   
				textLine = textLines[n];
				
				if (ALIGN_CENTER == _textAlign)
					textLine.x = (boundsText.width - textLine.width) * 0.5;
                else if (ALIGN_RIGHT == _textAlign)
					textLine.x = boundsText.width - textLine.width;
				
				textLine.y = textLine.y + lineHeight;
				
				addChild(textLine);
				
				lineHeight += textHeightAndSpacing;
				
				n++;
			}
			_textIsDisplayedPartially = _shortend;
			_shortend = false;
		}

		/**
		 * 
		 */
		protected function applyEllipsis(index : int) : void 
		{
			if (index > 2) render(text.substring(0, index - 2) + "...");
			else render("...".substring(0, index + 1));
		}

		/**
		 * 
		 */
		public function setMaxTextBlockSize(width : Number, height : Number) : void 
		{
			if (boundsMax.width != width || boundsMax.height != height)
			{
				boundsMax.width = width > 0 ? width : 0;
				boundsMax.height = height > 0 ? height : 0;
				
				_autoSize = false;
				
				internalUpdate();
			}
		}

		/**
		 * 
		 */
		public function textIsDisplayedPartially() : Boolean { return _textIsDisplayedPartially; }

		/**
		 * 
		 */
		public function get autoSize() : Boolean { return _autoSize; }

		/**
		 * 
		 */
		public function set autoSize(value : Boolean) : void 
		{
			if (_autoSize != value)
			{
				_autoSize = value;
				if (_autoSize)
				{
					_textAlign = ALIGN_LEFT;
					
					boundsMax.width = AUTOSIZE_WIDTH;
					boundsMax.height = AUTOSIZE_HEIGHT;
				}
				internalUpdate();
			}
		}

		/**
		 * 
		 */
		public function get autoEllipsis() : Boolean { return _autoEllipsis; }
		public function set autoEllipsis(value : Boolean) : void 
		{
			if (_autoEllipsis != value)
			{
				_autoEllipsis = value;
				internalUpdate();
			}
		}
		
		/**
		 * 
		 */
		public function get textAlign() : int { return _textAlign; }
		public function set textAlign(value : int) : void 
		{
			if (_textAlign != value)
			{
				_textAlign = value;
				internalUpdate();
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override public function dispose() : void 
		{
			_textAlign = NaN;
			
			super.dispose();
		}

		override public function toString() : String 
		{
			return "[UIBasicTextRenderer, text: " + text + 
									", textWidth: " + textWidth + 
									", textHeight: " + textHeight + 
									", mesuredWidth: " + measuredWidth + 
									", mesuredHeight: " + measuredHeight + 
									"]";
		}
	}
}
