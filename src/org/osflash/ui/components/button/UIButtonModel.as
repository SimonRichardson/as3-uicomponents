package org.osflash.ui.components.button
{
	import org.osflash.ui.components.component.UIComponentModel;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIButtonModel extends UIComponentModel
	{
		
		public static const TEXT : int = 0;
		
		/**
		 * @private
		 */
		private var _text : String;
								
		public function UIButtonModel(text : String = "")
		{
			super();
			
			_text = text;
		}
				
		public function get text() : String { return _text; }
		public function set text(value : String) : void
		{
			if(_text != value)
			{
				_text = value;
				
				
			}
		}
	}
}
