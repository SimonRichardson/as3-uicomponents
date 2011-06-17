package org.osflash.ui.components.analog
{
	import org.osflash.ui.components.component.IUIComponentViewConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIAnalogStickViewConfig extends IUIComponentViewConfig
	{
		
		function get colourScheme() : IUIAnalogStickColourScheme;
	}
}
