package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentModel;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogSliderModel extends UIComponentModel
	{
				
		/**
		 * @private
		 */
		private var _component : UIAnalogSlider;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIAnalogSliderSignalProxy;
		
		/**
		 * @private
		 */
		private var _position : Number;
								
		public function UIAnalogSliderModel()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */		
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
						
			_component = UIAnalogSlider(component);
			_signalProxy = UIAnalogSliderSignalProxy(_component.signalProxy);
			
			_position = 0; 
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
		
		public function get position() : Number { return _position; }
		public function set position(value : Number) : void
		{
			if(_position != value)
			{
				if(value < 0) value = 0;
				else if(value > 1) value = 1;
				
				_position = value;
				 
				_signalProxy.position.dispatch(_position);
			}
		}
	}
}
