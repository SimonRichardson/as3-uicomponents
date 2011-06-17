package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.themes.graphic.analog.colours.UIAnalogStickButtonDefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.button.IUIButtonColourScheme;
	import org.osflash.ui.components.themes.graphic.button.IUIButtonViewConfig;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicAnalogStickButtonConfig extends UIGraphicComponentConfig 
													implements IUIButtonViewConfig
	{
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIButtonColourScheme;
		
		public function UIGraphicAnalogStickButtonConfig(colourScheme : IUIButtonColourScheme = null)
		{
			_colourScheme = colourScheme || new UIAnalogStickButtonDefaultColourScheme();
		}
		
		/**
		 * @inheritDoc
		 */
		public function get colourScheme() : IUIButtonColourScheme
		{
			return _colourScheme;
		}
	}
}
