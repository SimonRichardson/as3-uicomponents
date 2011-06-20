package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.themes.graphic.analog.colours.UIAnalogRotaryKnobDefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIGraphicAnalogRotaryKnobConfig extends UIGraphicComponentConfig 
													implements IUIAnalogRotaryKnobViewConfig
	{
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIAnalogRotaryKnobColourScheme;
		
		public function UIGraphicAnalogRotaryKnobConfig(
											colourScheme : IUIAnalogRotaryKnobColourScheme = null
											)
		{
			_colourScheme = colourScheme || new UIAnalogRotaryKnobDefaultColourScheme();
		}
		
		public function get colourScheme() : IUIAnalogRotaryKnobColourScheme
		{
			return _colourScheme;
		}
	}
}
