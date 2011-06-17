package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.themes.graphic.analog.colours.UIAnalogStickDefaultColourScheme;
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicAnalogStickConfig extends UIGraphicComponentConfig 
												implements IUIAnalogStickViewConfig
	{
		/**
		 * @private
		 */
		private var _buttonView : IUIButtonView;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogStickColourScheme;
		
		public function UIGraphicAnalogStickConfig(
													buttonView : IUIButtonView = null,
													colourScheme : IUIAnalogStickColourScheme = null
													)
		{
			_buttonView = buttonView || new UIGraphicAnalogStickButtonView(
														new UIGraphicAnalogStickButtonConfig()
														);
			_colourScheme = colourScheme || new UIAnalogStickDefaultColourScheme();
		}

		public function get buttonView() : IUIButtonView
		{
			return _buttonView;
		}
		
		public function get colourScheme() : IUIAnalogStickColourScheme
		{
			return _colourScheme;
		}
	}
}
