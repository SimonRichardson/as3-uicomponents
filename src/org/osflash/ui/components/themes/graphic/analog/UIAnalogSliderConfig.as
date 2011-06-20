package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.themes.graphic.analog.colours.UIAnalogSliderDefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.button.IUIButtonViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIAnalogSliderConfig extends UIGraphicComponentConfig 
												implements IUIAnalogSliderViewConfig
	{
		/**
		 * @private
		 */
		private var _buttonView : IUIButtonView;
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogSliderColourScheme;
		
		public function UIAnalogSliderConfig(
												colourScheme : IUIAnalogSliderColourScheme = null,
												buttonView : IUIButtonView = null,
												buttonViewConfig : IUIButtonViewConfig = null
												)
		{
			_buttonView = buttonView || new UIAnalogSliderButtonView(
										buttonViewConfig || new UIAnalogSliderButtonConfig()
										);
										
			_colourScheme = colourScheme || new UIAnalogSliderDefaultColourScheme();
		}

		public function get buttonView() : IUIButtonView
		{
			return _buttonView;
		}
		
		public function get colourScheme() : IUIAnalogSliderColourScheme
		{
			return _colourScheme;
		}
	}
}
