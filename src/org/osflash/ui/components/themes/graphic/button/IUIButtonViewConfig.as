package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.text.IUILabelView;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUIButtonViewConfig extends IUIComponentViewConfig
	{
		
		function get colourScheme() : IUIButtonColourScheme;	
		
		function get labelView() : IUILabelView;

		function get autoEllipsis() : Boolean;
		
		function get bindIconToLabel() : Boolean;

		function get cornerTopLeft() : int;

		function get cornerTopRight() : int;

		function get cornerBottomLeft() : int;

		function get cornerBottomRight() : int;
	}
}
