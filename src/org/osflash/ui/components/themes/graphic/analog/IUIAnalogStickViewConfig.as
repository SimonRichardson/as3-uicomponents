package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.button.IUIButtonView;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIAnalogStickViewConfig extends IUIComponentViewConfig
	{
		
		function get buttonView() : IUIButtonView;
		
		function get colourScheme() : IUIAnalogStickColourScheme;
	}
}
