package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIButtonColourScheme
	{
		
		function get backgroundUp() : UIGraphicsData;
		
		function get backgroundOver() : UIGraphicsData;
		
		function get backgroundDown() : UIGraphicsData;
	}
}
