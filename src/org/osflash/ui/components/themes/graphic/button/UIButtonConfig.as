package org.osflash.ui.components.themes.graphic.button
{
	import org.osflash.ui.components.themes.graphic.button.colours.UIButtonDefaultColourScheme;
	import org.osflash.ui.components.themes.graphic.component.UIGraphicComponentConfig;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class UIButtonConfig extends UIGraphicComponentConfig 
												implements IUIButtonViewConfig
	{
		
		/**
		 * @private
		 */
		private var _colourScheme : IUIButtonColourScheme;
		
		public function UIButtonConfig(colourScheme : IUIButtonColourScheme = null)
		{
			_colourScheme = colourScheme || new UIButtonDefaultColourScheme();
		}
		
		/**
		 * @inheritDoc
		 */
		public function get colourScheme() : IUIButtonColourScheme
		{
			return _colourScheme;
		}
	}
}
