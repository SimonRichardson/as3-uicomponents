package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIButtonViewConfig extends IUIComponentViewConfig
	{
		
		function get colourScheme() : IUIButtonColourScheme;	
	}
}
