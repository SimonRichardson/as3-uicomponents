package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponentModel;
	import org.osflash.ui.components.component.UIComponent;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogRotaryKnob extends UIComponent
	{
				
		/**
		 * @private
		 */
		private var _model : UIAnalogRotaryKnobModel;
		
		public function UIAnalogRotaryKnob(view : IUIAnalogRotaryKnobView)
		{
			super(view);
		}
				
		/**
		 * @inheritDoc
		 */	
		override protected function initModel() : void
		{
			model = new UIAnalogRotaryKnobModel();
		}
		
		/**
		 * @inheritDoc
		 */	
		override protected function initProxy() : void
		{
			signalProxy = new UIAnalogRotaryKnobSignalProxy();
		}
						
		/**
		 * @inheritDoc
		 */	
		override public function set model(value : IUIComponentModel) : void
		{
			_model = UIAnalogRotaryKnobModel(value);
			super.model = value;
		}
	}
}
