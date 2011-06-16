package org.osflash.ui.components.text
{
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentModel;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UILabelModel extends UIComponentModel
	{
		
		/**
		 * @private
		 */
		private var _text : String;
		
		/**
		 * @private
		 */
		private var _component : UILabel;
		
		/**
		 * @private
		 */
		private var _signalProxy : UILabelSignalProxy;
								
		public function UILabelModel(text : String = "")
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
						
			_component = UILabel(component);
			_signalProxy = UILabelSignalProxy(_component.signalProxy);
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
