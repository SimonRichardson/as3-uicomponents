package org.osflash.ui.components.text.renderers
{
	import org.osflash.ui.errors.AbstractMethodError;
	import org.osflash.ui.geom.UIRectangle;
	import org.osflash.ui.utils.rint;

	import flash.display.Sprite;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	import flash.text.engine.LineJustification;
	import flash.text.engine.SpaceJustifier;
	import flash.text.engine.TextBlock;
	import flash.text.engine.TextElement;
	import flash.text.engine.TextLine;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAbstractTextRenderer extends Sprite 
	{

		protected const AUTOSIZE_WIDTH : Number = 10000;

		protected const AUTOSIZE_HEIGHT : Number = 10000;

		/**
		 * @private
		 */
		private var _boundsMeasured : UIRectangle;

		/**
		 * @private
		 */
		private var _boundsMax : UIRectangle;

		/**
		 * @private
		 */
		private var _boundsText : UIRectangle;

		/**
		 * @private
		 */
		private var _textLines : Vector.<TextLine>;

		/**
		 * @private
		 */
		private var _textBlock : TextBlock;

		/**
		 * @private
		 */
		private var _textElement : TextElement;

		/**
		 * @private
		 */
		private var _spaceJustifier : SpaceJustifier;

		/**
		 * @private
		 */
		private var _lineSpacing : int;

		/**
		 * @private
		 */
		private var _ascent : int;

		/**
		 * @private
		 */
		private var _descent : int;

		/**
		 * @private
		 */
		private var _autoUpdate : Boolean;

		/**
		 * @private
		 */
		private var _text : String;

		/**
		 * @private
		 */
		private var _lineHeight : Number;

		public function UIAbstractTextRenderer(format : ElementFormat) 
		{
			_text = "";
			
			_textElement = new TextElement(_text, format);
			
			_spaceJustifier = new SpaceJustifier("en", LineJustification.UNJUSTIFIED);
			
			_textLines = new Vector.<TextLine>();
			_textBlock = new TextBlock(_textElement);
			_textBlock.textJustifier = _spaceJustifier;
			
			_boundsMeasured = new UIRectangle();
			_boundsMax = new UIRectangle();
			_boundsText = new UIRectangle();
			
			_lineHeight = 0;
			_autoUpdate = true;
		}

		/**
		 * @private
		 */
		protected function internalUpdate() : void 
		{
			if (_autoUpdate) update();
		}

		/**
		 * @private
		 */
		protected function render(text : String) : void 
		{
			throw new AbstractMethodError("render");
		}

		/**
		 * @private
		 */
		protected function measure(text : String) : void 
		{
			_boundsMeasured.resizeTo(0, 0);
			
			clearTextLines();
			
			if (text == null || text == "") return;
			
			_textElement.text = text;
			_textBlock.content = _textElement;
			_textBlock.textJustifier = _spaceJustifier;
			
			var textLine : TextLine = _textBlock.createTextLine(null, AUTOSIZE_WIDTH);
			if (textLine == null) return;
			
			_ascent = textLine.ascent;
			_descent = textLine.descent;
			_lineHeight = textLine.textHeight;
			
			var h : Number = textLine.textHeight + _lineSpacing;
			while(textLine)
			{
				_boundsMeasured.height = _boundsMeasured.height + h;
				if (_boundsMeasured.width < textLine.width)
					_boundsMeasured.width = textLine.width;
				textLine = _textBlock.createTextLine(textLine, AUTOSIZE_WIDTH);
			}
			
			_boundsMeasured.height = _boundsMeasured.height - _lineSpacing;
			_boundsMeasured.width = Math.ceil(_boundsMeasured.width);
			_boundsMeasured.height = Math.ceil(_boundsMeasured.height);
		}

		/**
		 * @private
		 */
		protected function clearTextLines() : void 
		{
			if (_textBlock.firstLine && _textBlock.lastLine)
				_textBlock.releaseLines(_textBlock.firstLine, _textBlock.lastLine);
			
			var total : int = _textLines.length;
			while (--total > -1)
			{
				removeChild(_textLines.pop());
			}
		}
		
		/**
		 * Update the text renderer using the measure phase and then the rendering phase.
		 */
		public function update() : void 
		{
			measure(_text);
			render(_text);
		}
		
		/**
		 * Move to a given x and y position
		 */
		public function moveTo(x : Number, y : Number) : void 
		{
			this.x = rint(x);
			this.y = rint(y);
		}
		
		/**
		 * Get and set the current text of the renderer
		 */
		public function get text() : String { return _text;	}
		public function set text(value : String) : void 
		{
			if (_text != value)
			{
				_text = value;
				internalUpdate();
			}
		}
		
		/**
		 * Get and set the current elementFormat of the renderer 
		 */
		public function get elementFormat() : ElementFormat { return _textElement.elementFormat; }
		public function set elementFormat(value : ElementFormat) : void 
		{
			_textElement.elementFormat = value;
			internalUpdate();
		}
		
		/**
		 * Get and set the current fontDescription of the renderer 
		 */
		public function get fontDescription() : FontDescription 
		{
			return _textElement.elementFormat.fontDescription;
		}
		public function set fontDescription(value : FontDescription) : void 
		{
			var format : ElementFormat = elementFormat;
			format.fontDescription = value;
			elementFormat = format;
		}
		
		/**
		 * Get and set the current SpaceJustifier of the renderer
		 */	
		public function get spaceJustifier() : SpaceJustifier { return _spaceJustifier; }
		public function set spaceJustifier(value : SpaceJustifier) : void 
		{
			if (_spaceJustifier != value)
			{
				_spaceJustifier = value;
				internalUpdate();
			}
		}
		
		/**
		 * Get and set the current lineSpacing of the renderer 
		 */
		public function get lineSpacing() : int { return _lineSpacing; }
		public function set lineSpacing(value : int) : void 
		{
			if (_lineSpacing != value)
			{
				_lineSpacing = value;
				internalUpdate();
			}
		}

		/**
		 * 
		 */
		public function get breakOpportunity() : String { return elementFormat.breakOpportunity; }
		public function set breakOpportunity(value : String) : void 
		{
			const format : ElementFormat = elementFormat;
			format.breakOpportunity = value;
			elementFormat = format;
		}

		/**
		 * 
		 */
		public function get autoUpdate() : Boolean { return _autoUpdate; }
		public function set autoUpdate(value : Boolean) : void 
		{
			if (value != _autoUpdate) _autoUpdate = value;
		}
		
		/**
		 * 
		 */
		public function get measuredWidth() : Number { return _boundsMeasured.width; }

		/**
		 * 
		 */
		public function get measuredHeight() : Number { return _boundsMeasured.height; }

		/**
		 * 
		 */
		public function get textWidth() : Number { return _boundsText.width; }

		/**
		 * 
		 */
		public function get textHeight() : Number { return _boundsText.height; }

		/**
		 * 
		 */
		public function get ascent() : int { return _ascent; }

		/**
		 * 
		 */
		public function get descent() : int { return _descent; }

		/**
		 * 
		 */
		public function get lineHeight() : Number { return _lineHeight; }

		/**
		 * 
		 */
		public function get boundsMeasured() : UIRectangle { return _boundsMeasured; }

		/**
		 * 
		 */
		public function get boundsMax() : UIRectangle { return _boundsMax; }

		/**
		 * 
		 */
		public function get boundsText() : UIRectangle { return _boundsText; }

		/**
		 * 
		 */
		public function get textLines() : Vector.<TextLine> { return _textLines; }

		/**
		 * 
		 */
		public function get textBlock() : TextBlock { return _textBlock; }
		
		/**
		 * 
		 */
		public function get textElement() : TextElement { return _textElement; }

		public function dispose() : void 
		{
			clearTextLines();
			
			_textLines = null;
			_textElement = null;
			_textBlock = null;
			
			_spaceJustifier = null;
			
			_boundsMax = null;
			_boundsMeasured = null;
			_boundsText = null;
		}

		override public function toString() : String 
		{
			return "[UIAbstractTextRenderer, text: " + text + 
										", textWidth: " + textWidth + 
										", textHeight: " + textHeight + 
										", mesuredWidth: " + measuredWidth + 
										", mesuredHeight: " + measuredHeight + 
										"]";
		}
	}
}
