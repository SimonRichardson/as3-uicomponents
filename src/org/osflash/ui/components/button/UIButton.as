package org.osflash.ui.components.button
{
	import org.osflash.ui.components.component.IUIComponentModel;
	import org.osflash.ui.components.component.UIComponent;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIButton extends UIComponent
	{

		/**
		 * @private
		 */
		private var _model : UIButtonModel;
		
		public function UIButton(view : IUIButtonView)
		{
			super(view, new UIButtonModel());
		}
				
		/**
		 * @inheritDoc
		 */	
		override public function set model(value : IUIComponentModel) : void
		{
			_model = UIButtonModel(value);
			super.model = value;
		}
				
		/**
		 * delegate method to relay the text getter and setter to the IUIButtonModel
		 * 
		 * @param value String to set on the button
		 * @return String to return for the button text
		 */
		public function get text() : String { return _model.text; }
		public function set text(value : String) : void { _model.text = value; }
	}
}
