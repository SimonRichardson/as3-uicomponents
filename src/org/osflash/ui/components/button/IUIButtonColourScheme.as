package org.osflash.ui.components.button
{
	import flash.display.IGraphicsFill;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIButtonColourScheme
	{
		
		function get up() : IGraphicsFill;
		
		function get over() : IGraphicsFill;
		
		function get down() : IGraphicsFill;
	}
}
