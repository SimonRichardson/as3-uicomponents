package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponentModel;
	import org.osflash.ui.components.component.UIComponent;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogSlider extends UIComponent
	{
				
		/**
		 * @private
		 */
		private var _model : UIAnalogSliderModel;
		
		public function UIAnalogSlider(view : IUIAnalogSliderView)
		{
			super(view);
		}
				
		/**
		 * @inheritDoc
		 */	
		override protected function initModel() : void
		{
			model = new UIAnalogSliderModel();
		}
		
		/**
		 * @inheritDoc
		 */	
		override protected function initProxy() : void
		{
			signalProxy = new UIAnalogSliderSignalProxy();
		}
						
		/**
		 * @inheritDoc
		 */	
		override public function set model(value : IUIComponentModel) : void
		{
			_model = UIAnalogSliderModel(value);
			super.model = value;
		}
		
		public function get position() : Number { return _model.position; }
		public function set position(value : Number) : void { _model.position = value; }
	}
}
