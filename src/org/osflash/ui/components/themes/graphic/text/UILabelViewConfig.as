package org.osflash.ui.components.themes.graphic.text
{
	import org.osflash.ui.components.text.UITextFormat;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;

	import flash.text.engine.ElementFormat;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UILabelViewConfig extends UIGraphicComponentConfig implements IUILabelViewConfig
	{

		public function get textFormat() : UITextFormat
		{
			return null;
		}

		public function set textFormat(value : UITextFormat) : void
		{
		}

		public function get elementFormat() : ElementFormat
		{
			return null;
		}
	}
}
