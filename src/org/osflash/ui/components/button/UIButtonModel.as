package org.osflash.ui.components.button
{
	import org.osflash.ui.components.component.IUIComponent;
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
		
		/**
		 * @private
		 */
		private var _component : UIButton;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIButtonSignalProxy;
								
		public function UIButtonModel(text : String = "")
		{
			super();
			
			_text = text;
		}
		
		/**
		 * @inheritDoc
		 */		
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
						
			_component = UIButton(component);
			_signalProxy = UIButtonSignalProxy(_component.signalProxy);
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function unbind() : void
		{
			_component = null;
			_signalProxy = null;
			
			super.unbind();
		}
				
		public function get text() : String { return _text; }
		public function set text(value : String) : void
		{
			if(_text != value)
			{
				_text = value;
				_signalProxy.textChanged.dispatch(value);
			}
		}
	}
}
