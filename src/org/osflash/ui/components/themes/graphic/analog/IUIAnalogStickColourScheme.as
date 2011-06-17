package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIAnalogStickColourScheme
	{
		
		function get up() : UIGraphicsData;
		
		function get over() : UIGraphicsData;
		
		function get down() : UIGraphicsData;
	}
}
