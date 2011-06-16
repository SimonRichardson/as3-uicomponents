package org.osflash.ui.components.button
{
	import org.osflash.ui.components.component.IUIComponentViewConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIButtonViewConfig extends IUIComponentViewConfig
	{
		
		function get colourScheme() : IUIButtonColourScheme;	
	}
}
