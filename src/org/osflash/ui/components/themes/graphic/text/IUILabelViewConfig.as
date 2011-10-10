package org.osflash.ui.components.themes.graphic.text
{
	import org.osflash.ui.components.text.UITextFormat;
	import org.osflash.ui.components.themes.graphic.component.IUIComponentViewConfig;

	import flash.text.engine.ElementFormat;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IUILabelViewConfig extends IUIComponentViewConfig 
	{

		function get textFormat() : UITextFormat;

		function set textFormat(value : UITextFormat) : void;

		function get elementFormat() : ElementFormat;
	}
}
