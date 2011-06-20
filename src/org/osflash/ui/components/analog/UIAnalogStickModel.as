package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponent;
	import org.osflash.ui.components.component.UIComponentModel;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogStickModel extends UIComponentModel
	{
				
		/**
		 * @private
		 */
		private var _component : UIAnalogStick;
		
		/**
		 * @private
		 */
		private var _signalProxy : UIAnalogStickSignalProxy;
		
		/**
		 * @private
		 */
		private var _angle : Number;
		
		/**
		 * @private
		 */
		private var _radius : Number;
								
		public function UIAnalogStickModel()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */		
		override public function bind(component : IUIComponent) : void
		{
			super.bind(component);
						
			_component = UIAnalogStick(component);
			_signalProxy = UIAnalogStickSignalProxy(_component.signalProxy);
			
			_angle = 0;
			_radius = 0;
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
		
		public function get angle() : Number { return _angle; }
		public function set angle(value : Number) : void
		{
			if(_angle != value)
			{
				
				if(value < 0) value = 0;
				else if(value > 1) value = 1;
				_angle = value;
				 
				_signalProxy.angle.dispatch(_angle);
			}
		}
		
		public function get radius() : Number { return _radius; }
		public function set radius(value : Number) : void
		{
			if(_radius != value)
			{
				if(value < 0) value = 0;
				else if(value > 1) value = 1;
				
				_radius = value;
				 
				_signalProxy.radius.dispatch(_radius);
			}
		}
	}
}
