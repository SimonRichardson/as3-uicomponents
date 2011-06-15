package org.osflash.ui.components.component
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIComponentState implements IUIComponentState
	{
		
		/**
		 * @private
		 */
		private var _enabled : Boolean;
		
		/**
		 * @private
		 */
		private var _hovered : Boolean;
		
		/**
		 * @private
		 */
		private var _focused : Boolean;
		
		/**
		 * @private
		 */
		private var _pressed :  Boolean;
		
		public function UIComponentState()
		{
			_enabled = true;
			_hovered = false;
			_focused = false;
			_pressed = false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get enabled() : Boolean { return _enabled; }
		public function set enabled(value : Boolean) : void
		{
			if (_enabled != value)
			{
				_enabled = value;
			}
		}

		/**
		 * @inheritDoc
		 */
		public function get hovered() : Boolean { return _hovered; }
		public function set hovered(value : Boolean) : void
		{
			if (_hovered != value)
			{
				_hovered = value;
			}
		}

		/**
		 * @inheritDoc
		 */
		public function get focused() : Boolean { return _focused; }
		public function set focused(value : Boolean) : void
		{
			if (_focused != value)
			{
				_focused = value;
			}
		}

		/**
		 * @inheritDoc
		 */
		public function get pressed() : Boolean { return _pressed; }
		public function set pressed(value : Boolean) : void
		{
			if(_pressed != value)
			{
				_pressed = value;
			}
		}
	}
}
