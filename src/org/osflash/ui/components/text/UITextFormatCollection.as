package org.osflash.ui.components.text
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class UITextFormatCollection
	{
		
		/**
		 * @private
		 */
		private var _enabled : UITextFormat;

		/**
		 * @private
		 */
		private var _hovered : UITextFormat;

		/**
		 * @private
		 */
		private var _pressed : UITextFormat;

		/**
		 * @private
		 */
		private var _focusEnabled : UITextFormat;

		/**
		 * @private
		 */
		private var _focusHovered : UITextFormat;

		/**
		 * @private
		 */
		private var _focusPressed : UITextFormat;
		
		/**
		 * @private
		 */
		private var _disabled : UITextFormat;

		public function UITextFormatCollection(	enabled : UITextFormat = null, 
												hovered : UITextFormat = null, 
												pressed : UITextFormat = null, 
												disabled : UITextFormat = null, 
												focusEnabled : UITextFormat = null, 
												focusHovered : UITextFormat = null, 
												focusPressed : UITextFormat = null) 
		{
			_enabled = enabled;
			_hovered = hovered;
			_pressed = pressed;
			_disabled = disabled;
			_focusEnabled = focusEnabled;
			_focusHovered = focusHovered;
			_focusPressed = focusPressed;
		}

		/**
		 * 
		 */
		public function get enabled() : UITextFormat { return _enabled; }
		public function set enabled(value : UITextFormat) : void { _enabled = value; }

		/**
		 * 
		 */
		public function get hovered() : UITextFormat { return _hovered ? _hovered : _enabled; }
		public function set hovered(value : UITextFormat) : void { _hovered = value; }

		/**
		 * 
		 */
		public function get pressed() : UITextFormat { return _pressed ? _pressed : _enabled; }
		public function set pressed(value : UITextFormat) : void { _pressed = value; }

		/**
		 * 
		 */
		public function get focusEnabled() : UITextFormat { return _focusEnabled ? _focusEnabled : _enabled; }
		public function set focusEnabled(value : UITextFormat) : void { _focusEnabled = value; }

		/**
		 * 
		 */
		public function get focusHovered() : UITextFormat {	return _focusHovered ? _focusHovered : hovered; }
		public function set focusHovered(value : UITextFormat) : void { _focusHovered = value; }
		
		/**
		 * 
		 */
		public function get focusPressed() : UITextFormat { return _focusPressed ? _focusPressed : pressed; }
		public function set focusPressed(value : UITextFormat) : void { _focusPressed = value; }
		
		/**
		 * 
		 */
		public function get disabled() : UITextFormat {	return _disabled ? _disabled : _enabled; }
		public function set disabled(value : UITextFormat) : void { _disabled = value; }

		public function dispose() : void 
		{
			_enabled = null;
			_hovered = null;
			_pressed = null;
			_focusEnabled = null;
			_focusHovered = null;
			_focusPressed = null;
			_disabled = null;
		}

		public function toString() : String 
		{
			return "[UITextFormatCollection, enabled: " + enabled + 
										", hovered: " + hovered + 
										", pressed:" + pressed + 
										", disabled: " + disabled + 
										"]";
		}
	}
}
