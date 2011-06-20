package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentModel;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogRotaryKnobModel extends UIComponentModel
	{
				
		/**
		 * @private
		 */
		private var _component : UIAnalogRotaryKnob;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIAnalogRotaryKnobSignalProxy;
		
		/**
		 * @private
		 */
		private var _position : Number;
								
		public function UIAnalogRotaryKnobModel()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */		
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
						
			_component = UIAnalogRotaryKnob(component);
			_signalProxy = UIAnalogRotaryKnobSignalProxy(_component.signalProxy);
			
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
				 _position = value;
				 
				 _signalProxy.position.dispatch(_position);
			}
		}
	}
}
