package org.osflash.ui.components.text
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UITextFormat
	{

		/**
		 * @private
		 */
		private var _fontColor : int;

		/**
		 * @private
		 */
		private var _fontSize : int;

		/**
		 * @private
		 */
		private var _italic : Boolean;

		/**
		 * @private
		 */
		private var _bold : Boolean;

		/**
		 * @private
		 */
		private var _lineSpacing : int;

		public function UITextFormat(	fontColor : int = 0xffffff, 
										fontSize : int = 10, 
										italic : Boolean = false, 
										bold : Boolean = false, 
										lineSpacing : int = 3)
		{
			_fontColor = fontColor;
			_fontSize = fontSize;
			_italic = italic;
			_bold = bold;
			_lineSpacing = lineSpacing;
		}

		/**
		 * 
		 */
		public function get fontColor() : int {	return _fontColor; }
		public function set fontColor(value : int) : void {	_fontColor = value;	}

		/**
		 * 
		 */
		public function get fontSize() : int { return _fontSize; }
		public function set fontSize(value : int) : void { _fontSize = value; }

		/**
		 * 
		 */
		public function get italic() : Boolean { return _italic; }
		public function set italic(value : Boolean) : void { _italic = value; }

		/**
		 * 
		 */
		public function get bold() : Boolean { return _bold; }
		public function set bold(value : Boolean) : void { _bold = value; }

		/**
		 * 
		 */
		public function get lineSpacing() : int { return _lineSpacing; }
		public function set lineSpacing(value : int) : void { _lineSpacing = value; }

		public function dispose() : void
		{
			_fontColor = NaN;
			_fontSize = NaN;
			_lineSpacing = NaN;
		}

		public function toString() : String
		{
			return "[UITextFormat, fontColor:" + fontColor + 
								", fontSize: " + fontSize + 
								", italic: " + italic + 
								", bold: " + bold + 
								", lineSpacing: " + lineSpacing + 
								"]";
		}
	}
}
