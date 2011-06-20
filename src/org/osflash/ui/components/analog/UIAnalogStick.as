package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponentModel;
	import org.osflash.ui.components.component.UIComponent;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogStick extends UIComponent
	{
				
		/**
		 * @private
		 */
		private var _model : UIAnalogStickModel;
		
		public function UIAnalogStick(view : IUIAnalogStickView)
		{
			super(view);
		}
				
		/**
		 * @inheritDoc
		 */	
		override protected function initModel() : void
		{
			model = new UIAnalogStickModel();
		}
		
		/**
		 * @inheritDoc
		 */	
		override protected function initProxy() : void
		{
			signalProxy = new UIAnalogStickSignalProxy();
		}
						
		/**
		 * @inheritDoc
		 */	
		override public function set model(value : IUIComponentModel) : void
		{
			_model = UIAnalogStickModel(value);
			super.model = value;
		}
		
		public function get angle() : Number { return _model.angle; }
		public function set angle(value : Number) : void { _model.angle = value; }
		
		public function get radius() : Number { return _model.radius; }
		public function set radius(value : Number) : void { _model.radius = value; }
	}
}
