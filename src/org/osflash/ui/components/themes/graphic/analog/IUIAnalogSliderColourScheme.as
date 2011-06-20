package org.osflash.ui.components.themes.graphic.analog
{
	import org.osflash.ui.components.themes.graphic.component.UIGraphicsData;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIAnalogSliderColourScheme
	{

		function get backgroundUp() : UIGraphicsData;

		function get backgroundOver() : UIGraphicsData;

		function get backgroundDown() : UIGraphicsData;
	}
}
