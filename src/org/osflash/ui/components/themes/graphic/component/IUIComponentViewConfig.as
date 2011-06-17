package org.osflash.ui.components.themes.graphic.component
{
	import org.osflash.ui.geom.UIMargin;
	import org.osflash.ui.geom.UIPadding;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIComponentViewConfig
	{
		
		function get padding() : UIPadding;
		
		function get margin() : UIMargin;
	}
}
