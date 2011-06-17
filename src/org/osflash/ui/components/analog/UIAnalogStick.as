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
	}
}
