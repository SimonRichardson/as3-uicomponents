package org.osflash.ui.components.text
{
	import org.osflash.ui.components.component.IUIComponentModel;
	import org.osflash.ui.components.component.UIComponent;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UILabel extends UIComponent
	{
				
		/**
		 * @private
		 */
		private var _model : UILabelModel;
		
		public function UILabel(view : IUILabelView)
		{
			super(view);
		}
				
		/**
		 * @inheritDoc
		 */	
		override protected function initModel() : void
		{
			model = new UILabelModel();
		}
		
		/**
		 * @inheritDoc
		 */	
		override protected function initProxy() : void
		{
			signalProxy = new UILabelSignalProxy();
		}
						
		/**
		 * @inheritDoc
		 */	
		override public function set model(value : IUIComponentModel) : void
		{
			_model = UILabelModel(value);
			super.model = value;
		}
				
		/**
		 * delegate method to relay the text getter and setter to the IUILabelModel
		 * 
		 * @param value String to set on the label
		 * @return String to return for the label text
		 */
		public function get text() : String { return _model.text; }
		public function set text(value : String) : void { _model.text = value; }
	}
}
